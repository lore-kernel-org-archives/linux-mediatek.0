Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B22C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceaIQPIOcwko5n9WHg3R7AZp5W3nMv2eecB7f/baU1k=; b=VmH6iFylYV1Cx/+0ZskMbL1gCd
	m0FwnZZu/3VoPpi9vtQ2KZFeG5kvmT56uGlnCvWPPFqm5TBHJJ/6jDm2ilxB6vj8dF6OKnxF/FcGR
	dLucyREBoCyTUIHG3oaDOakYC3UAuLhU5T39GGr8BUUpAkl6wgHGe8qr4Yb78qu14q7YyapgnQ5md
	jJruUDj27VZsa0OG96xj3n/s/nm1YC3rP2B5KB6GxkP/n03ZbTZrX5vNrJGKIc4X0UFYrsACoyUet
	pAS6LzyEbsNm577E3bXjegRFcU/abLnUAqKNuq/eHQ2dcrnSvvcqv3X9I5egabqZhtuJiC5g+5L8s
	8fo0MMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVrl-00A8os-RY; Wed, 11 Jan 2023 07:49:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoK-00A6cS-9l; Wed, 11 Jan 2023 07:46:15 +0000
X-UUID: 017e3f28918411eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ceaIQPIOcwko5n9WHg3R7AZp5W3nMv2eecB7f/baU1k=;
	b=TX8Vnh3hSMML86xc9CfeDijCZkW9MaY4jjTUK+sm6Gsk/f/mjduT7pIJW9yCiuzMPcYYuT1lKS2YeMsKnl0RJSeUn3tkX6gzr1YT5Az0AkCFzyx7jQcSlEo+nlRwmUy0oler9sV/4iCLMKCtJv8ugpLoSNOE7Ck43ymf45TNf2Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:69327958-e3f5-4829-98b2-1e823de13f03,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:fa9eee8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 017e3f28918411eda08d4d6090ec5a5c-20230111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1987133704; Wed, 11 Jan 2023 00:46:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 15:45:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 15:45:31 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 14/14] soc: mtk-svs: mt8183: refactor o_slope calculation
Date: Wed, 11 Jan 2023 15:45:28 +0800
Message-ID: <20230111074528.29354-15-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111074528.29354-1-roger.lu@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_234612_424259_B1332C02 
X-CRM114-Status: GOOD (  13.74  )
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

The o_slope value is dependent of the o_slope_sign, refactor code to get
rid of unnecessary if constructs.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 51 +++++++++++++++-------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 89117807e85d..8cfbf8ffb138 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1944,26 +1944,27 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 	o_slope_sign = (svsp->tefuse[0] >> 7) & BIT(0);
 
 	ts_id = (svsp->tefuse[1] >> 9) & BIT(0);
-	o_slope = (svsp->tefuse[0] >> 26) & GENMASK(5, 0);
-
-	if (adc_cali_en_t == 1) {
-		if (!ts_id)
-			o_slope = 0;
-
-		if (adc_ge_t < 265 || adc_ge_t > 758 ||
-		    adc_oe_t < 265 || adc_oe_t > 758 ||
-		    o_vtsmcu[0] < -8 || o_vtsmcu[0] > 484 ||
-		    o_vtsmcu[1] < -8 || o_vtsmcu[1] > 484 ||
-		    o_vtsmcu[2] < -8 || o_vtsmcu[2] > 484 ||
-		    o_vtsmcu[3] < -8 || o_vtsmcu[3] > 484 ||
-		    o_vtsmcu[4] < -8 || o_vtsmcu[4] > 484 ||
-		    o_vtsabb < -8 || o_vtsabb > 484 ||
-		    degc_cali < 1 || degc_cali > 63) {
-			dev_err(svsp->dev, "bad thermal efuse, no mon mode\n");
-			goto remove_mt8183_svsb_mon_mode;
-		}
+	if (!ts_id) {
+		o_slope = 1534;
 	} else {
-		dev_err(svsp->dev, "no thermal efuse, no mon mode\n");
+		o_slope = (svsp->tefuse[0] >> 26) & GENMASK(5, 0);
+		if (!o_slope_sign)
+			o_slope = 1534 + o_slope * 10;
+		else
+			o_slope = 1534 - o_slope * 10;
+	}
+
+	if (adc_cali_en_t == 0 ||
+	    adc_ge_t < 265 || adc_ge_t > 758 ||
+	    adc_oe_t < 265 || adc_oe_t > 758 ||
+	    o_vtsmcu[0] < -8 || o_vtsmcu[0] > 484 ||
+	    o_vtsmcu[1] < -8 || o_vtsmcu[1] > 484 ||
+	    o_vtsmcu[2] < -8 || o_vtsmcu[2] > 484 ||
+	    o_vtsmcu[3] < -8 || o_vtsmcu[3] > 484 ||
+	    o_vtsmcu[4] < -8 || o_vtsmcu[4] > 484 ||
+	    o_vtsabb < -8 || o_vtsabb > 484 ||
+	    degc_cali < 1 || degc_cali > 63) {
+		dev_err(svsp->dev, "bad thermal efuse, no mon mode\n");
 		goto remove_mt8183_svsb_mon_mode;
 	}
 
@@ -1982,11 +1983,7 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 		x_roomt[i] = (((format[i] * 10000) / 4096) * 10000) / gain;
 
 	temp0 = (10000 * 100000 / gain) * 15 / 18;
-
-	if (!o_slope_sign)
-		mts = (temp0 * 10) / (1534 + o_slope * 10);
-	else
-		mts = (temp0 * 10) / (1534 - o_slope * 10);
+	mts = (temp0 * 10) / o_slope;
 
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		svsb = &svsp->banks[idx];
@@ -2013,11 +2010,7 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 		temp0 = (degc_cali * 10 / 2);
 		temp1 = ((10000 * 100000 / 4096 / gain) *
 			 oe + tb_roomt * 10) * 15 / 18;
-
-		if (!o_slope_sign)
-			temp2 = temp1 * 100 / (1534 + o_slope * 10);
-		else
-			temp2 = temp1 * 100 / (1534 - o_slope * 10);
+		temp2 = temp1 * 100 / o_slope;
 
 		svsb->bts = (temp0 + temp2 - 250) * 4 / 10;
 	}
-- 
2.18.0


