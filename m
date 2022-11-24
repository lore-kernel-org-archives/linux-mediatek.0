Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B498DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 02:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V62CK7vIlndfUw1CoKmHyZxgPytNIVD7jU/ImKsOJCU=; b=sE7II2p+0JjsiIlkGGhocWqGTE
	OOaUFcQ7EL/NgRvv3ABeQs4UmsAu5PO1j/XvfHCNAuz/KbMmySgyjigbh5fJ5SvP/kfffDGGuneZv
	Qbjf6ea0TYMvsB33Tc5SISllV+dZblRPdLtIIChgPN7/Sqluw3AgG5MRQLzmO/w/Zi5Oxv2K+TrqE
	LgN9zUdSsLIP3n9Xs79b+mydHZDRweF1w1FLz+hRFGCBJzTL2U2CZeWiR+JGXy0FZDUz9czT9NCRR
	W4FsaEcbOYN36V7cs3ppdEGnbfiAP7/mbEoqzNmNsrOTnaX62sQ5jIOYAxngEGQJ7jgULmHL3UZR2
	VsoA24zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy2Qr-00442z-9Q; Thu, 24 Nov 2022 02:57:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy2Qo-00440a-QO; Thu, 24 Nov 2022 02:57:44 +0000
X-UUID: ae9413df77464af7845e6ca7637bed96-20221123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=V62CK7vIlndfUw1CoKmHyZxgPytNIVD7jU/ImKsOJCU=;
	b=nGjAb4g8RsuAKlHtObnIYRVBs6gEdgMcd0vbS7Ve4ih9MN0WSIlS9FqEnnCIKENzaxKUevM7NBMXP8HVlachk0LRPza9e2QMjEz6sDVC1rI6rscANSlOrfzvJ9J5xgGt/P8Nw6EX/w8yZRmVh65zyWGP1VeRAGbcql0Bp7h3oT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:30809105-7f73-4361-9e7e-147f7a6bb929,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:da6e15dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ae9413df77464af7845e6ca7637bed96-20221123
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 986421778; Wed, 23 Nov 2022 19:51:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 10:30:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 24 Nov 2022 10:30:54 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <angelogioacchino.delregno@collabora.com>,
	<nfraprado@collabora.com>
CC: <chunxu.li@mediatek.com>, <ajye_huang@compal.corp-partner.google.com>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [PATCH v2] ASoC: mediatek: mt8186: Correct I2S shared clocks
Date: Thu, 24 Nov 2022 10:30:50 +0800
Message-ID: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_185742_907538_F00139DD 
X-CRM114-Status: GOOD (  10.71  )
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

In mt8186 platform, I2S2 should be the main I2S port that provide
the clock, on the contrary I2S3 should be the second I2S port that
use this clock.

Fixes: 9986bdaee477 ("ASoC: mediatek: mt8186: Configure shared clocks")
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
Change since v1: Add Fixes tag.
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index d8c93d66b4e6..970b980a81e6 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -192,7 +192,7 @@ static int mt8186_mt6366_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *r
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
-	ret = mt8186_dai_i2s_set_share(afe, "I2S3", "I2S2");
+	ret = mt8186_dai_i2s_set_share(afe, "I2S2", "I2S3");
 	if (ret) {
 		dev_err(rtd->dev, "Failed to set up shared clocks\n");
 		return ret;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index e59d92e2afa3..8f77a0bc1dc8 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -260,7 +260,7 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
-	ret = mt8186_dai_i2s_set_share(afe, "I2S3", "I2S2");
+	ret = mt8186_dai_i2s_set_share(afe, "I2S2", "I2S3");
 	if (ret) {
 		dev_err(rtd->dev, "Failed to set up shared clocks\n");
 		return ret;
-- 
2.25.1


