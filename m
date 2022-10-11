Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3495C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNf4JvIHAlOjdIpMpzRxbL9ioRlmBhsPX8Kp+fUKPvk=; b=JHIZE4kNpkJxovcFgjv+R2+h1D
	Xmj+9uoqcA3l+4gRXanOSR+Pvu7q97RtdEqIo9LvzMKHGbRma3qUUW9htN6I9Y0qM7QCFCawuCf/f
	cMYt1Pj40N9QKP4lhiUQTELhvEdvkzBevoP3sloR9kNlj7slED8Y++vWQihZv5rPi2NNjYR82ezp8
	CYFEqprIkm/6ahp6xnejVmycE692AFJe3Ip7EHVZ4gdfPAeoCH+lwtaGXwKTD0uZ+YFcYhvv2YwZs
	oJHP9oArKbXgv/NLl+2MNLqRAdY2EhWY2D1F4FCpawDVA4pIm0gpWes7otFjI/RwH7nfqbQz7l++W
	JeyiR4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHgu-0051O3-Nk; Tue, 11 Oct 2022 16:01:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiGeB-004ZT4-Hh; Tue, 11 Oct 2022 14:54:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E945611F1;
	Tue, 11 Oct 2022 14:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A54C43143;
	Tue, 11 Oct 2022 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665500058;
	bh=aBFm0/cqm5vLWBYOcDZTcVJZnHJU4j3uf2+fLeex4vI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QphfesAbXhKHTiPMPnWeaJkSTheCUfGGLL4S+40D3mohtMLZmkGRYYm4jycIKFnMK
	 nN17FAgTrzl779ggUOyDw4qEogvQZagFiWRhBSvUVZ9BKEWX6vti7gQBW7I4XhwETm
	 vh3NjUy5Z24+bs8F4IED/JkQ1gveSinzdZF6pzrN1buFpw46/5eklrWPNo5zzAYQBC
	 DaU7AskY9LQuatTistUDb+2XOsrNHua4LyRSTGpHInwqjvDKnit12OZGsY5jJyO52U
	 JeH4yvi4n9N5dQXNVm8AfnQ+MpQLhvovc6AiTJ2dPEPR/GP/KpXqRK3lQeImQuRVzl
	 Sdb1bkN7cwP3Q==
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
Subject: [PATCH AUTOSEL 4.14 2/7] soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF
Date: Tue, 11 Oct 2022 10:54:09 -0400
Message-Id: <20221011145414.1625237-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221011145414.1625237-1-sashal@kernel.org>
References: <20221011145414.1625237-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_075419_713736_32733BFA 
X-CRM114-Status: GOOD (  18.07  )
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
index 609bb3424c14..a7e99b98eb18 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -14,6 +14,7 @@ config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on ARCH_MEDIATEK
 	depends on RESET_CONTROLLER
+	depends on OF
 	select REGMAP
 	help
 	  Say yes here to add support for MediaTek PMIC Wrapper found
@@ -24,6 +25,7 @@ config MTK_SCPSYS
 	bool "MediaTek SCPSYS Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	default ARCH_MEDIATEK
+	depends on OF
 	select REGMAP
 	select MTK_INFRACFG
 	select PM_GENERIC_DOMAINS if PM
diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index d7a31bf3c9d6..3fb690e157a2 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1251,7 +1251,7 @@ static int pwrap_probe(struct platform_device *pdev)
 static struct platform_driver pwrap_drv = {
 	.driver = {
 		.name = "mt-pmic-pwrap",
-		.of_match_table = of_match_ptr(of_pwrap_match_tbl),
+		.of_match_table = of_pwrap_match_tbl,
 	},
 	.probe = pwrap_probe,
 };
diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index d0b18cc7e61b..6f247218a78d 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -910,7 +910,7 @@ static struct platform_driver scpsys_drv = {
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


