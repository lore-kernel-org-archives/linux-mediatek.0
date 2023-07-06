Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CD9EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 06:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=At6v0JUxdW/mbpvlVAB9IxicW+zOqiOwDYu6Cx8kM+g=; b=tlFiwQJHHJYqGNnm3ha4vuhEpX
	0HgN3bhzNgwpY6BdDtFYRUJA9Y7ReT6naVWeKnj96RNt7SPonA1xIorwqYbwPDzUA+XJTZIykUQfC
	1c+nc8rxDgjlUYeXVSXHdJCy8c63mQxMi4MsxT/2+QwrcRzKpzguU2DiClBvkeZs2rxIDMAbNZxQe
	wSvvmRw2o3oafhHloK8c4OGFfjsLF2BJ5nQwJy9B3nRtRLrcq8SZzbo9d4BrXgPBYiJ7eGbuPqQJm
	/I/64XZtdUG3awtyKv71tAGTxwKQ4poG8k+T1wTLIJRIZyuSb60E15ShU7PgTe70QQKOsDf+/6pfl
	iC5ImsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIqZ-000hj1-01;
	Thu, 06 Jul 2023 06:52:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIqW-000hhJ-1N;
	Thu, 06 Jul 2023 06:52:09 +0000
X-UUID: 9ad4d7e81bc911ee912e1518a6540028-20230705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=At6v0JUxdW/mbpvlVAB9IxicW+zOqiOwDYu6Cx8kM+g=;
	b=RW1HkGZXY/Ztro2DUnL2l8uaScZKyqWjs3/nLAMRVmtRt4c6d0g8e5LY0Ca3Qhy3d/DMfECKl/+y8vPxtKxwcwxNyTJL81KH7nwzHJnMaHSA7zf/xuegt7IiIczg9/QGXNQtxI8AUCB60VcA6AL/SCUdB4IFvo2CUyGNt06Iof4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:65da7263-df02-482b-85c1-376ae999c0f5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:beb6c282-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9ad4d7e81bc911ee912e1518a6540028-20230705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1521874672; Wed, 05 Jul 2023 23:51:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jul 2023 14:41:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jul 2023 14:41:25 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8188: DPCM used FE and BE merged parameters
Date: Thu, 6 Jul 2023 14:41:23 +0800
Message-ID: <20230706064123.29790-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_235208_470796_C60CD7FE 
X-CRM114-Status: GOOD (  10.36  )
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

To ensure that DPCM takes into account the backend hardware limitations
when user space queries the hw_params of a device, we need to add
dpcm_merged_format, dpcm_merged_chan, and dpcm_merged_rate to the FE
dai_links.

This patch includes only stereo FE dai_links, since multi-channel FEs
may be reserved for specific purposes. Therefore, it may not be
appropriate to consider BE conditions.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index ac69c23e0da1..7c9e08e6a4f5 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -723,6 +723,9 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_format = 1,
 		SND_SOC_DAILINK_REG(playback2),
 	},
 	[DAI_LINK_DL3_FE] = {
@@ -734,6 +737,9 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_format = 1,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	[DAI_LINK_DL6_FE] = {
@@ -745,6 +751,9 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_format = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	[DAI_LINK_DL7_FE] = {
@@ -833,6 +842,9 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_format = 1,
 		SND_SOC_DAILINK_REG(capture4),
 	},
 	[DAI_LINK_UL5_FE] = {
@@ -844,6 +856,9 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_format = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	[DAI_LINK_UL6_FE] = {
-- 
2.18.0


