Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bD0PjaUWSQJQb67WKneQ8Yipbtv2RD4kalAG5D7qcD0=; b=fBZSvmll5ToVSHtedwi6PnO9zm
	HjjWFUn/LW4AOwLLiXANl2ZXz/YUeoXR5beEF4CHEuBHdb3AJGHphIbRzxncWFjbzWz8PFc7nyBRw
	NcnO5s7FEnC8RyT5PtwUMe9VbU+QHFhhztJ6hhwQU002AfZiTnBub6lG/B6zkGuau5yDQV1Pr7MPm
	VAVpTiWkR0KtX+67vT3uw0S5/izpX5QNM5ozaDMXdomnbjwg9Vt2HqbokV6wxZZ0YoxXXLVzaAGlC
	KgwYIIfdgq366wdUEpnjwHCPygSn3rJp+vKDvLTMYCu51eqQI/d/fcgBp0H/E3N5pIrLLx/HnqQ0C
	tuNf6cuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHIh-004r0E-UW; Tue, 11 Oct 2022 15:36:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiGdD-004Ysv-1j; Tue, 11 Oct 2022 14:53:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 849D2611DF;
	Tue, 11 Oct 2022 14:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E39C433C1;
	Tue, 11 Oct 2022 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665499998;
	bh=0T5thCeuAQBDjPgScIrhMjSebOMUUXWigAmKar+WvWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ejrji6uuTq2mMU8DbiX9ZRrYvEU5LOcuvQCkKXbokPFL/EoHHJO324gNm26IRnNJo
	 +LJ91CIi0nj/ry7O17oOIaU2KBhtv00WX67jIWul50AD6iNsQm0aA84naFQcW96Nt/
	 Ksw6wbAUkdvLy6uK+oBw0t1DwY34JLxGwTmrrIcuh7Hzb7S1mSqo0XYb6wWIkKtwr6
	 JtVJJt7w33mhWeVAdupgEwYQC6FBRbsSGWwVprFkm5+q6vgcjWg6+B44pa5UKNXPk+
	 q5RS/e/ZgzleCZTsUgyZ95k5+2l+JxRgtiKdj/d9Z0lf0gVAeKrevdsN7Om4bI1LVm
	 0Qho4Wj8J3k7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>,
	kernel test robot <lkp@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chenglin Xu <chenglin.xu@mediatek.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 03/17] soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF
Date: Tue, 11 Oct 2022 10:52:58 -0400
Message-Id: <20221011145312.1624341-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221011145312.1624341-1-sashal@kernel.org>
References: <20221011145312.1624341-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_075319_216987_A1BFD4B8 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jean Delvare <jdelvare@suse.de>

[ Upstream commit 2778caedb5667239823a29148dfc48b26a8b3c2a ]

With the following configuration options:
CONFIG_OF is not set
CONFIG_MTK_PMIC_WRAP=y
CONFIG_MTK_SCPSYS=y
we get the following build warnings:

  CC      drivers/soc/mediatek/mtk-pmic-wrap.o
drivers/soc/mediatek/mtk-pmic-wrap.c:2138:34: warning: ‘of_pwrap_match_tbl’ defined but not used [-Wunused-const-variable=]
drivers/soc/mediatek/mtk-pmic-wrap.c:1953:34: warning: ‘of_slave_match_tbl’ defined but not used [-Wunused-const-variable=]
  CC      drivers/soc/mediatek/mtk-scpsys.o
drivers/soc/mediatek/mtk-scpsys.c:1084:34: warning: ‘of_scpsys_match_tbl’ defined but not used [-Wunused-const-variable=]

Looking at the code, both drivers can only bind to OF-defined device
nodes, so these drivers are useless without OF and should therefore
depend on it.

Also drop of_match_ptr() from both drivers. We already know what it
will resolve to, so we might as well save cpp some work.

Developers or QA teams who wish to test-build the code can still do
so by enabling CONFIG_OF, which is available on all architectures and
has no dependencies.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202207240252.ZY5hSCNB-lkp@intel.com/
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chenglin Xu <chenglin.xu@mediatek.com>
Link: https://lore.kernel.org/r/20220730144833.0a0d9825@endymion.delvare
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/mediatek/Kconfig         | 2 ++
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 drivers/soc/mediatek/mtk-scpsys.c    | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 59a56cd790ec..9f1477712845 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -28,6 +28,7 @@ config MTK_INFRACFG
 config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on RESET_CONTROLLER
+	depends on OF
 	select REGMAP
 	help
 	  Say yes here to add support for MediaTek PMIC Wrapper found
@@ -37,6 +38,7 @@ config MTK_PMIC_WRAP
 config MTK_SCPSYS
 	bool "MediaTek SCPSYS Support"
 	default ARCH_MEDIATEK
+	depends on OF
 	select REGMAP
 	select MTK_INFRACFG
 	select PM_GENERIC_DOMAINS if PM
diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 5d34e8b9c988..af5ff9b030b2 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2174,7 +2174,7 @@ static int pwrap_probe(struct platform_device *pdev)
 static struct platform_driver pwrap_drv = {
 	.driver = {
 		.name = "mt-pmic-pwrap",
-		.of_match_table = of_match_ptr(of_pwrap_match_tbl),
+		.of_match_table = of_pwrap_match_tbl,
 	},
 	.probe = pwrap_probe,
 };
diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ca75b14931ec..7a668888111c 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -1141,7 +1141,7 @@ static struct platform_driver scpsys_drv = {
 		.name = "mtk-scpsys",
 		.suppress_bind_attrs = true,
 		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
+		.of_match_table = of_scpsys_match_tbl,
 	},
 };
 builtin_platform_driver(scpsys_drv);
-- 
2.35.1


