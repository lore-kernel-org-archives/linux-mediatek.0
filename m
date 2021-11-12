Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 09:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 939CC60F4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 09:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 939CC60F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CY02ARrMcpk+EHrkuG4HDCmlNGbJ7hSqrGxG73+2Fys=; b=f91KdCVqFmPLcV
	8lt6kJ3worFkhTbSOiY2dIkTBi5afjwtvp3GNH/VcMqsx8ZIJBF4rormyqB3BhzOn7JXlu0mLO5M5
	ZX4cR68K5EkHFemafb8HWYYx5hnbaveKqVUSPE5uMVH34fkFb1PtqL9fHus3sKoK6dgZyX1dx2geX
	BKTVjhij/rX/GNamFAbsogc/swvkBgFfjCg9kdMtZK9EycJlEQUuVY/npGxRuBV7VoS3qIGJ8+MxI
	jD+Z/9k51aT3X3evU3s7UdDEa4xdXjrmmCYBN/O+7N/POdbaBfzVVBGvSJWRKki76dhpBDLuVqLNP
	TsEAzxNMkPn0W4PccXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlTBt-009tEX-3M; Fri, 12 Nov 2021 09:49:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlTBf-009tBM-Jb; Fri, 12 Nov 2021 09:49:37 +0000
X-UUID: 09b23a9e251d4d0f93fb5bd7c05e722a-20211112
X-UUID: 09b23a9e251d4d0f93fb5bd7c05e722a-20211112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2044826938; Fri, 12 Nov 2021 02:49:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 01:39:30 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 12 Nov 2021 17:39:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 17:39:27 +0800
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
Subject: [PATCH v3 1/7] net-next: stmmac: dwmac-mediatek: add platform level
 clocks management
Date: Fri, 12 Nov 2021 17:39:12 +0800
Message-ID: <20211112093918.11061-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112093918.11061-1-biao.huang@mediatek.com>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_014935_673848_EA97CA13 
X-CRM114-Status: GOOD (  14.21  )
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
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 58c0feaa8131..157ff655c85e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -359,9 +359,6 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 		return ret;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
-
 	return 0;
 }
 
@@ -370,11 +367,25 @@ static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
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
@@ -420,6 +431,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
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
