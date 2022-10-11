Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88CBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw2npG3IwtEm/w8QXxOQSUwsleWjDKebVbGzc+CuTkQ=; b=N8rcBF0ZTZT3WcOwlaxM/mTtKo
	d5QM7yC27kBNoB3E6IFoiWRVn0a0G5GUaKatRZCCCEJX69xW869sEruAgVfq+NpNBmyyc5SkTNAMn
	FB2WI5wkKllk12TI3dsQ5qEigCuyQNSEwKvqTEcrohufhpPur33w4AAZeRZ1Bp9qkZeUDaHMXdN3o
	Mghu+JekWrQ2FEzB8d5uhrYkmusk396VDwwZR6qbhi6nMCebo3hkPpApnjtJ5w7xYJ/8ZTSY+gFLW
	XWXxeawnZc/cQ+EHlw99/YcD2S+ijVFi1bGQ8Q2Ktu60HqqaRNMn9LSHd9GWibWRE8rxhTZDa/L6T
	So7yVQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHZZ-004yLZ-UD; Tue, 11 Oct 2022 15:53:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiGdv-004ZIz-4B; Tue, 11 Oct 2022 14:54:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA853611E3;
	Tue, 11 Oct 2022 14:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862D9C43142;
	Tue, 11 Oct 2022 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665500042;
	bh=in2WENQ3DnZ5Wbx8A8rV5WBddompOUq8UbqsLWOkxjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxQyINalp3s14334abYuAms81/3/CdA3hpYU1lBX0zlWD9zgv5lujWqtGAtL3OEAq
	 PyS8fMZznuDkcLXWuo6BC56Wq/gJhsbA45nGqCmWTpys+Emh+W76/R4Uh8EEGXw9D0
	 apQ8GR5BYEu+7p+uyzLN5H9KDb1S6n4iMooSutPp71JYE2zxIo+ah5ciSnCFxgC0je
	 yFdW5A+a13HJau+HyWgustAiWpW4riotvEHf/o3A0/x0p3Q6iq3D45Wehmq8j1zePa
	 X5nkBsUZjfLk5b/Dms1zBD2bcUwLbNUkPkaSSdPr+tQwzXBopVEwnnz5hq00XtnAQc
	 evUaEwEduGvKw==
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
Subject: [PATCH AUTOSEL 4.19 02/11] soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF
Date: Tue, 11 Oct 2022 10:53:49 -0400
Message-Id: <20221011145358.1624959-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221011145358.1624959-1-sashal@kernel.org>
References: <20221011145358.1624959-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_075403_284788_058FD82D 
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
index a7d0667338f2..2bb92efd01a8 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -15,6 +15,7 @@ config MTK_INFRACFG
 config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on RESET_CONTROLLER
+	depends on OF
 	select REGMAP
 	help
 	  Say yes here to add support for MediaTek PMIC Wrapper found
@@ -24,6 +25,7 @@ config MTK_PMIC_WRAP
 config MTK_SCPSYS
 	bool "MediaTek SCPSYS Support"
 	default ARCH_MEDIATEK
+	depends on OF
 	select REGMAP
 	select MTK_INFRACFG
 	select PM_GENERIC_DOMAINS if PM
diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 011a40b5fb49..0e7dc2f01296 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1672,7 +1672,7 @@ static int pwrap_probe(struct platform_device *pdev)
 static struct platform_driver pwrap_drv = {
 	.driver = {
 		.name = "mt-pmic-pwrap",
-		.of_match_table = of_match_ptr(of_pwrap_match_tbl),
+		.of_match_table = of_pwrap_match_tbl,
 	},
 	.probe = pwrap_probe,
 };
diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ef54f1638d20..06543e41d015 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -1071,7 +1071,7 @@ static struct platform_driver scpsys_drv = {
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


