Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F547C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Mar 2022 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FSJV5rg5TwDCXTVqDGo9nEgOURG/boOsBIQ42cjEBAo=; b=C9bVz+pBHF3Q7h
	cKsUofi/cqq5iHXxKgk7WVsgdd98mO+FmRDP7vprgci3y1UjI1YnEkFjGeE8HnZA8sL4UyOy03du9
	R+78pL9ymHwxhaS28mtAs1tyDkBIEvSmX6NgTz5asDf3OIgtTU43FQdDkEebuCcuZIiyVgSas/AdD
	jzAnNgJzDpCJGYNFxwgT7cB3oLQjByA79ZGhp3OuqZJdZypoxvxgDSXK3saXQVxQxTOuNXKwrhyUS
	rA5ufxFxLz7OgGs9ePqSuqTU8n9eTGCxVvZasNOUFcnvCzwa1i9IDdfVnhOQMS8Kpkr222z7vEvYR
	Ga3BAHXRU3CcyBX8Mzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVXoD-003k9O-1X; Sat, 19 Mar 2022 12:03:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVXo0-003k71-Mh; Sat, 19 Mar 2022 12:03:38 +0000
X-UUID: 76562b84f6a6454db3784ea10f1e1b77-20220319
X-UUID: 76562b84f6a6454db3784ea10f1e1b77-20220319
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1911173870; Sat, 19 Mar 2022 05:03:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Mar 2022 05:03:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 19 Mar 2022 20:03:27 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 19 Mar 2022 20:03:26 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <angelogioacchino.delregno@collabora.com>, <trevor.wu@mediatek.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
Date: Sat, 19 Mar 2022 20:03:25 +0800
Message-ID: <20220319120325.11882-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_050336_768068_EC304429 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

Fixes the following build errors when mt6358 is configured as module:

>> ERROR: modpost: "mt6358_set_mtkaif_protocol"
>> [sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.ko] undefined!
>> ERROR: modpost: "mt6358_set_mtkaif_protocol"
>> [sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.ko] undefined!

Fixes: 6a8d4198ca80 ("ASoC: mediatek: mt6358: add codec driver")
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/codecs/mt6358.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 9b263a9a669d..4c7b5d940799 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -107,6 +107,7 @@ int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
 	priv->mtkaif_protocol = mtkaif_protocol;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_protocol);
 
 static void playback_gpio_set(struct mt6358_priv *priv)
 {
@@ -273,6 +274,7 @@ int mt6358_mtkaif_calibration_enable(struct snd_soc_component *cmpnt)
 			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_enable);
 
 int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
 {
@@ -296,6 +298,7 @@ int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
 	capture_gpio_reset(priv);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_disable);
 
 int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
 					int phase_1, int phase_2)
@@ -310,6 +313,7 @@ int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
 			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_calibration_phase);
 
 /* dl pga gain */
 enum {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
