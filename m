Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB28C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 03:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI8vc5HHHEzczfqD16t7nOkGfbMNwVJXLerS6sexQ5w=; b=cBge/t7f415bmruUiCuLJQvpoz
	VqjeOqsbwIZrZZVVPkPQTIa60/6NvJeoGX+oibInTkA4IEG66oCquOkxx/J7Op9T1WvspPvFmU8yd
	u9rpZA16LPAQzBBUtJdJ1FN5if6jPMFrqwt12BLBpcdO8eeGdSSS2FzgIEQDNKA7pbgkAszFDC9KC
	Twv3lb9/pSd8aSbXBdal3vzaQSzpeesWH73zzGIx8L5zJ6epT/xgr7p0jHIQsFmLxQngWFJaiwdSW
	tFwIaLCe6ee4LYsBNbYlwkTURSpL71XMZUTe8EKQdjgTjgPzso8MZyaAe40khRNSDH1G93QH9kKfq
	HaxapVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwavz-004xcm-2O;
	Wed, 10 May 2023 03:56:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwavw-004xZx-0Y;
	Wed, 10 May 2023 03:56:09 +0000
X-UUID: 95a204cceee611ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RI8vc5HHHEzczfqD16t7nOkGfbMNwVJXLerS6sexQ5w=;
	b=WP8p5lVHB2iRhsw3yWoULaQS3ZXl6lJItGTnJN+iS0kfpyDmHfWuDscRoqJs/+ZmfVB/El81tk2tvRs0ie3e02mQVwLioxF0QVUFDX10Iud6mqq5VtrqQgk17YW7fyqrBK5SUqoOFb593RlNbtwpkb0e0bv7HfeMXoKoU11h/DA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:e177fe6f-5afb-4429-9f08-ba4807a01686,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:178d4d4,CLOUDID:9622516b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 95a204cceee611ed83ed1395ce914268-20230509
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1174870040; Tue, 09 May 2023 20:56:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 11:55:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 11:55:29 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 7/9] ASoC: mediatek: mt8188: add required clocks
Date: Wed, 10 May 2023 11:55:24 +0800
Message-ID: <20230510035526.18137-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230510035526.18137-1-trevor.wu@mediatek.com>
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_205608_213808_84C8E8DB 
X-CRM114-Status: GOOD (  11.83  )
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

apll2_d4, apll12_div4, top_a2sys and top_aud_iec are possibly used in
the future. To prevent from breaking binding ABI after any mt8188 dts
upstream, add these clocks to clock list in advance.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 4 ++++
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 02411be93900..4c24d0b9e90d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -25,14 +25,18 @@ static const char *aud_clks[MT8188_CLK_NUM] = {
 
 	/* divider */
 	[MT8188_CLK_TOP_APLL1_D4] = "apll1_d4",
+	[MT8188_CLK_TOP_APLL2_D4] = "apll2_d4",
 	[MT8188_CLK_TOP_APLL12_DIV0] = "apll12_div0",
 	[MT8188_CLK_TOP_APLL12_DIV1] = "apll12_div1",
 	[MT8188_CLK_TOP_APLL12_DIV2] = "apll12_div2",
 	[MT8188_CLK_TOP_APLL12_DIV3] = "apll12_div3",
+	[MT8188_CLK_TOP_APLL12_DIV4] = "apll12_div4",
 	[MT8188_CLK_TOP_APLL12_DIV9] = "apll12_div9",
 
 	/* mux */
 	[MT8188_CLK_TOP_A1SYS_HP_SEL] = "top_a1sys_hp",
+	[MT8188_CLK_TOP_A2SYS_SEL] = "top_a2sys",
+	[MT8188_CLK_TOP_AUD_IEC_SEL] = "top_aud_iec",
 	[MT8188_CLK_TOP_AUD_INTBUS_SEL] = "top_aud_intbus",
 	[MT8188_CLK_TOP_AUDIO_H_SEL] = "top_audio_h",
 	[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL] = "top_audio_local_bus",
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
index 04cb476f0bcb..904505d10841 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
@@ -23,13 +23,17 @@ enum {
 	MT8188_CLK_APMIXED_APLL2,
 	/* divider */
 	MT8188_CLK_TOP_APLL1_D4,
+	MT8188_CLK_TOP_APLL2_D4,
 	MT8188_CLK_TOP_APLL12_DIV0,
 	MT8188_CLK_TOP_APLL12_DIV1,
 	MT8188_CLK_TOP_APLL12_DIV2,
 	MT8188_CLK_TOP_APLL12_DIV3,
+	MT8188_CLK_TOP_APLL12_DIV4,
 	MT8188_CLK_TOP_APLL12_DIV9,
 	/* mux */
 	MT8188_CLK_TOP_A1SYS_HP_SEL,
+	MT8188_CLK_TOP_A2SYS_SEL,
+	MT8188_CLK_TOP_AUD_IEC_SEL,
 	MT8188_CLK_TOP_AUD_INTBUS_SEL,
 	MT8188_CLK_TOP_AUDIO_H_SEL,
 	MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL,
-- 
2.18.0


