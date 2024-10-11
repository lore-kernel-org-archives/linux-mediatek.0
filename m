Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9ECD24463
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 02:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di3M/fiBPVkpN21ApNW89b4arF3/fiEXNTGuEVnABgg=; b=VbfZukju18NA7NyjQwiubWaQ0v
	3StZK1JdhNbrfWLkV5NPBtVI/zl3wqX2VV7PP+eIyzMDlR1h3CMaGjCNPHpKXCIkwDMGOh7e0yqMO
	oPKVz4xAGu6fBdJRRl8u6rwYLtXtzGVCJkT1BkR+vEPPdooC02ODIR3e3D/VIQxlBIx+m4x8qMn9C
	ZGwqrtlo6ajRi61Fkpy0GwzezKMZT6MSrzE7w9jlzahv3sGfAzuUAWU2IKwM0y1vhek0gOWQAm4S/
	szTrekZBpPZjfoCLYrByrGlL9cfKMrA1AlU8/xPjuXEOr/4xnhb03lmNDrmmSr8Q8eT1zuBRCt99o
	yZ1WprWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5jl-0000000F5YU-275x;
	Fri, 11 Oct 2024 02:50:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5ij-0000000F5MB-3GGl;
	Fri, 11 Oct 2024 02:49:39 +0000
X-UUID: 711448fc877b11efb3adad29d29602c1-20241010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Di3M/fiBPVkpN21ApNW89b4arF3/fiEXNTGuEVnABgg=;
	b=QdvRP3YQ3721Sywx/gy9mDnmIxbGlqsJu0fQuEE4V7sOtdxNhvfxZnwMbtzCH6M3pwg8Qy2sa9R7pzhJ61p5Aju+DOlbTzMhuYMxF36DxK83AdpVlx9Rez287LyMuNxd3CsKmGjXw4shLfBZqyb9K9ruwPIBdTc+yV9pawZwi5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:cf13883f-218e-4b96-bd93-d42ecf5aefe0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:10991165-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 711448fc877b11efb3adad29d29602c1-20241010
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 476816427; Thu, 10 Oct 2024 19:49:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 10:49:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 10:49:27 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v4 1/3] mmc: mtk-sd: Add stop_dly_sel and pop_en_cnt to platform data
Date: Fri, 11 Oct 2024 10:48:34 +0800
Message-ID: <20241011024906.8173-2-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
References: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.274200-8.000000
X-TMASE-MatchedRID: 5O0gWNbQ5pcvjtMPTTOa8hz2MDiYujy5wjj8dZF/W2C67Q3uPo9KI5OD
	Y7BHORsiritsRfCiBtAZJsWyIj9CVAtrOhDKumbS9iItFUn3XkNb2iL0xnz/EiJlFuUUbH7w2d8
	mtRIRsUPv76y9IPqLHoiBweQjSMLbt/QS4egZHO6zI1v7J4hECu3+iQEtoSj4v8D7QPW2jo9ynC
	+RoYX/O+LzNWBegCW2wgn7iDBesS1YF3qW3Je6++Oasx+lgBcPNSjywSBJ1bhDiGqN3ff/MH3b8
	F0426My+1XPYVjt+4MgG8ax1DW8CGbPTa/KMJFosFpblkWFlyBSFieEA0DaroSVUZZHNLr+RgV6
	Hsqyx11QaONuZ6Jr4g9k3l8EaYIcovpDXVQHzIN+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.274200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A375087005CFD509030D9F91D2F76D335C76BE4B7F73CDFEAE2B4C9AA85B96802000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_194937_846771_FBB42B79 
X-CRM114-Status: GOOD (  13.57  )
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

There are modified register settings for STOP_DLY_SEL and POP_EN_CNT
from our next generation SoCs, due to the advanced chip manufacturing
process and the resulting changes in the internal signal timing.

Add two new fields to the compatibility structure to reflect the
modifications. For legacy SoCs, also add the original value of
'stop_dly_sel' to the platform data, for unified code setting.

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 1efe434391af..aef30bba00b9 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -248,6 +248,7 @@
 #define MSDC_PB2_SUPPORT_64G      BIT(1)    /* RW */
 #define MSDC_PB2_RESPWAIT         GENMASK(3, 2)   /* RW */
 #define MSDC_PB2_RESPSTSENSEL     GENMASK(18, 16) /* RW */
+#define MSDC_PB2_POP_EN_CNT       GENMASK(23, 20) /* RW */
 #define MSDC_PB2_CRCSTSENSEL      GENMASK(31, 29) /* RW */
 
 #define MSDC_PAD_TUNE_DATWRDLY	  GENMASK(4, 0)		/* RW */
@@ -403,6 +404,8 @@ struct mtk_mmc_compatible {
 	bool data_tune;
 	bool busy_check;
 	bool stop_clk_fix;
+	u8 stop_dly_sel;
+	u8 pop_en_cnt;
 	bool enhance_rx;
 	bool support_64g;
 	bool use_internal_cd;
@@ -504,6 +507,7 @@ static const struct mtk_mmc_compatible mt2712_compat = {
 	.data_tune = true,
 	.busy_check = true,
 	.stop_clk_fix = true,
+	.stop_dly_sel = 3,
 	.enhance_rx = true,
 	.support_64g = true,
 };
@@ -517,6 +521,7 @@ static const struct mtk_mmc_compatible mt6779_compat = {
 	.data_tune = true,
 	.busy_check = true,
 	.stop_clk_fix = true,
+	.stop_dly_sel = 3,
 	.enhance_rx = true,
 	.support_64g = true,
 };
@@ -556,6 +561,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
 	.data_tune = true,
 	.busy_check = true,
 	.stop_clk_fix = true,
+	.stop_dly_sel = 3,
 	.enhance_rx = true,
 	.support_64g = false,
 };
@@ -569,6 +575,7 @@ static const struct mtk_mmc_compatible mt7986_compat = {
 	.data_tune = true,
 	.busy_check = true,
 	.stop_clk_fix = true,
+	.stop_dly_sel = 3,
 	.enhance_rx = true,
 	.support_64g = true,
 };
@@ -608,6 +615,7 @@ static const struct mtk_mmc_compatible mt8183_compat = {
 	.data_tune = true,
 	.busy_check = true,
 	.stop_clk_fix = true,
+	.stop_dly_sel = 3,
 	.enhance_rx = true,
 	.support_64g = true,
 };
@@ -621,6 +629,7 @@ static const struct mtk_mmc_compatible mt8516_compat = {
 	.data_tune = true,
 	.busy_check = true,
 	.stop_clk_fix = true,
+	.stop_dly_sel = 3,
 };
 
 static const struct of_device_id msdc_of_ids[] = {
@@ -1767,8 +1776,16 @@ static void msdc_init_hw(struct msdc_host *host)
 	sdr_set_bits(host->base + EMMC50_CFG0, EMMC50_CFG_CFCSTS_SEL);
 
 	if (host->dev_comp->stop_clk_fix) {
-		sdr_set_field(host->base + MSDC_PATCH_BIT1,
-			      MSDC_PATCH_BIT1_STOP_DLY, 3);
+		if (host->dev_comp->stop_dly_sel)
+			sdr_set_field(host->base + MSDC_PATCH_BIT1,
+				      MSDC_PATCH_BIT1_STOP_DLY,
+				      host->dev_comp->stop_dly_sel);
+
+		if (host->dev_comp->pop_en_cnt)
+			sdr_set_field(host->base + MSDC_PATCH_BIT2,
+				      MSDC_PB2_POP_EN_CNT,
+				      host->dev_comp->pop_en_cnt);
+
 		sdr_clr_bits(host->base + SDC_FIFO_CFG,
 			     SDC_FIFO_CFG_WRVALIDSEL);
 		sdr_clr_bits(host->base + SDC_FIFO_CFG,
-- 
2.46.0


