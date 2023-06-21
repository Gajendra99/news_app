import 'package:flutter_getx_template/app/data/apis/api_base.dart';
import 'package:flutter_getx_template/app/data/model/products.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class HomeController extends BaseController {
  final GithubRepository _repository =
      Get.find(tag: (GithubRepository).toString());

  List<String> banners = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSer9OiTkR_EADxxl2YlbRIKUs9YQUdUsv0-4toU5ap0G7nDr_W18RLVvlk6on6sr0Nsg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSETTyoM6DsQXBrDUwdcwiSlUHreUPl6_fDG1bzqqbmpU3N3LnV4ClTd4wdjZmbsCxN5A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9eLGQNCGqb4aUtprPMKHuTzeEivVTMpHoW4qpeunY02FHPVRkuWJk6rG-_0A_p3KRQA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUyuClzYtl_khd4T6y8OPlR0k95QnyGsZtxzbaMHlNCVptagBU3_p9LXHkoZU_PK0bwg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKLK7nDUm7xu3VrdLcvBzfg37N_v-Ry8sPDl_UWVCju3QKxIVsfblwbG302GfpZOVFlw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9-L3g5HJuA_773SpvMeYtb8Wu8p30iW35FubiD_Op6Pwmxdh065IOjCmSqp8gRprGdA&usqp=CAU"
  ];

  List<String> banners2 = [
    "https://tricksrecharge.com/wp-content/uploads/2020/10/Screenshot-2020-10-01-at-11.47.03-PM.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyEALtNnuJgY8Tc3eWf6GpDCPI9KL7PGDzfyLTTrWUEkkhiFFFVPSMJXqdU1nEkR2F5jU&usqp=CAU",
    "https://www.doctorofcredit.com/wp-content/uploads/2017/08/amazon-fresh-1024x361.png"
  ];

  List<Product> products = [];
  var isProductLoaded = false.obs;

  var activeTabIndex = 0.obs;

  APIBase apiBase = APIBase();

  final RxList<GithubProjectUiData> _githubProjectListController =
      RxList.empty();

  @override
  void onInit() async {
    super.onInit();
    String apiLink = apiBase.productsApi;
    List data = await apiBase.fetchData(apiLink);

    if (data[0]) {
      print('${data[2]}');
      for (int i = 0; i < data[2].length; i++) {
        products.add(Product.fromJson(data[2][i]));
      }
      isProductLoaded.value = true;
    }

    print('Product info :\n');
    print('${products[0].category.image}');
  }

  List<GithubProjectUiData> get projectList =>
      _githubProjectListController.toList();

  final pagingController = PagingController<GithubProjectUiData>();

  void getGithubGetxProjectList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    var queryParam = GithubSearchQueryParam(
      searchKeyWord: 'flutter getx template',
      pageNumber: pagingController.pageNumber,
    );

    var githubRepoSearchService = _repository.searchProject(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getGithubGetxProjectList();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getGithubGetxProjectList();
  }

  void _handleProjectListResponseSuccess(GithubProjectSearchResponse response) {
    List<GithubProjectUiData>? repoList = response.items
        ?.map((e) => GithubProjectUiData(
              repositoryName: e.name != null ? e.name! : "Null",
              ownerLoginName: e.owner != null ? e.owner!.login! : "Null",
              ownerAvatar: e.owner != null ? e.owner!.avatarUrl! : "",
              numberOfStar: e.stargazersCount ?? 0,
              numberOfFork: e.forks ?? 0,
              score: e.score ?? 0.0,
              watchers: e.watchers ?? 0,
              description: e.description ?? "",
            ))
        .toList();

    if (_isLastPage(repoList!.length, response.totalCount!)) {
      pagingController.appendLastPage(repoList);
    } else {
      pagingController.appendPage(repoList);
    }

    var newList = [...pagingController.listItems];

    _githubProjectListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (projectList.length + newListItemCount) >= totalCount;
  }
}
