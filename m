Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E77EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 05:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8D11o8dH3Y+nECnexIdj9dNYP+hzWQI5z+VWAESK+g=; b=MObpm0gIpUjdHf
	CEpgAwlDwtQqt4+cbV1ae2xKFdHuW5uJwkZtv+rbR5jNtki8suy7ZzD8ZNk8D9gkqu4VY+h36DhTO
	rT1nrhDhHi+wSThc51KLd6kOr0cVbrtVduafin/RVp/mLikldaOUczSPBxMF/mGJ/I5zJ+bTx6ISE
	IoRjUfsMI6I+u1hpSqQzsEEmLv5d21+wtFgGrCw+3rSUEKbR67DGsrpGL4DZxNYY7Y3Gje3qYl6hq
	noIdE6Zg/7dVMn5p7frhsoNk0hP1F4xBtpZyqzBcPX42RmduSBcVtXoZb07EA9kBBjtYUO4IcOdUp
	1ByJzv4MY/rMxUzgXEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mupnx-00BLkn-DK; Wed, 08 Dec 2021 05:47:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mupnh-00BLYU-6b; Wed, 08 Dec 2021 05:47:34 +0000
X-UUID: 8f35783d5c064db9b71c0d057990d741-20211207
X-UUID: 8f35783d5c064db9b71c0d057990d741-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1104371370; Tue, 07 Dec 2021 22:47:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 21:47:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 8 Dec 2021 13:47:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 8 Dec 2021 13:47:26 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Subject: [PATCH net-next v7 1/6] stmmac: dwmac-mediatek: add platform level
 clocks management
Date: Wed, 8 Dec 2021 13:47:11 +0800
Message-ID: <20211208054716.603-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208054716.603-1-biao.huang@mediatek.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_214733_257544_B8F48055 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch implements clks_config callback for dwmac-mediatek platform,
which could support platform level clocks management.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 25 +++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 58c0feaa8131..0ff57c268dca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -9,7 +9,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_net.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/stmmac.h>
 
@@ -359,9 +358,6 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 		return ret;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
-
 	return 0;
 }
 
@@ -370,11 +366,25 @@ static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
 	struct mediatek_dwmac_plat_data *plat = priv;
 
 	clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
-
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 }
 
+static int mediatek_dwmac_clks_config(void *priv, bool enabled)
+{
+	struct mediatek_dwmac_plat_data *plat = priv;
+	int ret = 0;
+
+	if (enabled) {
+		ret = clk_bulk_prepare_enable(plat->num_clks_to_config, plat->clks);
+		if (ret) {
+			dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
+			return ret;
+		}
+	} else {
+		clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
+	}
+
+	return ret;
+}
 static int mediatek_dwmac_probe(struct platform_device *pdev)
 {
 	struct mediatek_dwmac_plat_data *priv_plat;
@@ -420,6 +430,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = priv_plat;
 	plat_dat->init = mediatek_dwmac_init;
 	plat_dat->exit = mediatek_dwmac_exit;
+	plat_dat->clks_config = mediatek_dwmac_clks_config;
 	mediatek_dwmac_init(pdev, priv_plat);
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
