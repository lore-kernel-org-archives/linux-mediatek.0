Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B560CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 06:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnavEgCRr5ohyuF+l1ncKJZ9+c8df4QLhDlwhISHV4o=; b=0GwH8VFxYJYZTIQfvcy4N7fj7z
	L/lPQ5Z0Ancs7Cd49eizM9rWn7400nXqDAE4PAOcRRtFamOG81GJRohiTb4lwCfcgWiTYvuxycDXT
	3XNLELVYae7jOvbUXTdSOsenuBoS/gLdFJtipawiNDgatbeT0FPteCi5RUhe6EokBP8993aj7Dy7p
	lyWdbY4jzrMlYXpskAfZXzJCbjrPMCGAFdLBKWQBe+cW1XrnVXIIENnYID/wAvH5ccSm2gDlgAoIr
	reA28PxwAky8sqohnKc9230HTUDoDnC7HZ8Wb7x4nu8J7GURcswZXwC8IDE/dKg0k0dQypiRw2Drs
	+KpyLjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBrun-00BG5F-8C; Thu, 14 Jul 2022 06:01:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBruG-00BFvB-TW; Thu, 14 Jul 2022 06:01:03 +0000
X-UUID: ebddd3e9611141bb80a96243c38768e4-20220713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6d3be174-c87b-48b7-873f-7465fa6f0998,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:0fa24364-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ebddd3e9611141bb80a96243c38768e4-20220713
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 796563376; Wed, 13 Jul 2022 23:00:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 14:00:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 14:00:19 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao
 Huang <biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>, Jisheng
 Zhang <jszhang@kernel.org>, Mohammad Athari Bin Ismail
	<mohammad.athari.ismail@intel.com>
Subject: [PATCH net v5 3/3] net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow
Date: Thu, 14 Jul 2022 14:00:14 +0800
Message-ID: <20220714060014.18958-4-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714060014.18958-1-biao.huang@mediatek.com>
References: <20220714060014.18958-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_230100_974361_34A39FEF 
X-CRM114-Status: GOOD (  13.40  )
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

Current stmmac driver will prepare/enable ptp_ref clock in
stmmac_init_tstamp_counter().

The stmmac_pltfr_noirq_suspend will disable it once in suspend flow.

But in resume flow,
	stmmac_pltfr_noirq_resume --> stmmac_init_tstamp_counter
	stmmac_resume --> stmmac_hw_setup --> stmmac_init_ptp --> stmmac_init_tstamp_counter
ptp_ref clock reference counter increases twice, which leads to unbalance
ptp clock when resume back.

Move ptp_ref clock prepare/enable out of stmmac_init_tstamp_counter to fix it.

Fixes: 0735e639f129d ("net: stmmac: skip only stmmac_ptp_register when resume from suspend")
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 ++++++++---------
 .../ethernet/stmicro/stmmac/stmmac_platform.c   |  8 +++++++-
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 197fac587ad5..c5f33630e771 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -834,19 +834,10 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	struct timespec64 now;
 	u32 sec_inc = 0;
 	u64 temp = 0;
-	int ret;
 
 	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
 		return -EOPNOTSUPP;
 
-	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-	if (ret < 0) {
-		netdev_warn(priv->dev,
-			    "failed to enable PTP reference clock: %pe\n",
-			    ERR_PTR(ret));
-		return ret;
-	}
-
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 	priv->systime_flags = systime_flags;
 
@@ -3270,6 +3261,14 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_mmc_setup(priv);
 
+	if (ptp_register) {
+		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
+		if (ret < 0)
+			netdev_warn(priv->dev,
+				    "failed to enable PTP reference clock: %pe\n",
+				    ERR_PTR(ret));
+	}
+
 	ret = stmmac_init_ptp(priv);
 	if (ret == -EOPNOTSUPP)
 		netdev_info(priv->dev, "PTP not supported by HW\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 11e1055e8260..9f5cac4000da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -815,7 +815,13 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
 		if (ret)
 			return ret;
 
-		stmmac_init_tstamp_counter(priv, priv->systime_flags);
+		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
+		if (ret < 0) {
+			netdev_warn(priv->dev,
+				    "failed to enable PTP reference clock: %pe\n",
+				    ERR_PTR(ret));
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.25.1


