Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80469C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViGNiKiDlpdTwQms22X0e/YbhcaMRLoQ4ODpbxaV73U=; b=idoALd+xrDlylTbno3pkVch/JU
	Y5U+2e+rwRVyiuEjBI3ec1PouBDJPa3f6gqObFnpcSlQqZgrHi36O/szrLxi5wHZdq3QJ0MNC70wr
	w8dAJnl/HgTzvLWNHdL8QkSGlkk8wnvyOkBD9Et1XgUw5f0uJgiu4zhDfca+LBAs14MzIxjPrqzNd
	EyA33B1zI2uhcCuDds6PbM9pZysQGcNToGkTlGsltetTWuw9JbYPGkyHUFfb8BqLeoHPiInB7sfVh
	Y296Vt/KeNmKnEwqI2U4OZZ6pYrQ7QC7KVkhjqpQ8WJ2h4tIz3T/mk7FZDHlqm4ggXU/Om1jBM9Sb
	BkCMZI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy81C-006kjA-Cf; Thu, 24 Nov 2022 08:55:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy80x-006kdF-Fb; Thu, 24 Nov 2022 08:55:25 +0000
X-UUID: 7fc458ef29a14fda93da260c96d9b38d-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ViGNiKiDlpdTwQms22X0e/YbhcaMRLoQ4ODpbxaV73U=;
	b=c9YszU9huKp+SyvUw8kjCHgS2Lsb02TS8Peq257WeYi+i6yf5Mph7VqEabURiLNRmiu1w4HFLqWBGnL6ahRopPYzn6njB48NZN4NBnZUyCkUAGx4pNiN1CpefOa4sdsghYtdS4pJEx0vs4jJnUo7inVSlcgr2fd+AJiV+EnigG4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:9e3cd9ba-9af9-4b04-b70f-853a0a792eec,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:ddc8b52f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7fc458ef29a14fda93da260c96d9b38d-20221124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 77523679; Thu, 24 Nov 2022 01:55:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 16:54:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 24 Nov 2022 16:54:40 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
	<Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
	<angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
CC: <chunxu.li@mediatek.com>, <ajye_huang@compal.corp-partner.google.com>,
	<allen-kh.cheng@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Date: Thu, 24 Nov 2022 16:54:36 +0800
Message-ID: <20221124085436.24900-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
References: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_005523_559906_94186990 
X-CRM114-Status: GOOD (  10.21  )
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

Use SND_SOC_DAPM_LINE instead of SND_SOC_DAPM_OUTPUT to trigger
DAPM events to hdmi-codec when userspace control the DPAM pin.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index d8c93d66b4e6..f4960b0c8298 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -965,7 +965,7 @@ mt8186_mt6366_da7219_max98357_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_OUTPUT("HDMI1"),
+	SND_SOC_DAPM_LINE("HDMI1", NULL),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_UL1, SND_SOC_NOPM, 0, 0, NULL, 0),
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index e59d92e2afa3..c61e9bb419d4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -1033,7 +1033,7 @@ mt8186_mt6366_rt1019_rt5682s_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_OUTPUT("HDMI1"),
+	SND_SOC_DAPM_LINE("HDMI1", NULL),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_UL1, SND_SOC_NOPM, 0, 0, NULL, 0),
-- 
2.18.0


