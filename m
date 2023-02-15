Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B03C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q5UcyJ/aXUNEK20OKjGWiM1tft1sqvEVwCIYOxp3oRw=; b=RjHmqbLqtXfOl0relvLLvjtSA9
	4RYspSntACk2exgF5FfwgguphG54M149kdF4vFqLQhjmUTEKFDXC5VrNhVCXQadFT626vbD7t7ibO
	QDDdqzEGdoxIPKeRlq/3kuFTR2K4WS38jGfvHEzf73JTJhyvb3twTaUAziLgnTr0L4kxUP/wmgWdo
	JWyUbIXJbKGSgF5U6dcK5FHbRbehATW0T1DlDyRD+7jJ/izT6rmxAUpVBUVeP1RjQPwIYSM7VZIjo
	7FmoXjyPBe+9wqAfFXdIg/k9gYrP8x20EoV23yoIUVFiiMlZIcy/JV9fyznQvv8RzxwvaCSe0alxJ
	oEXkh32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHF8-005r1t-OX; Wed, 15 Feb 2023 12:50:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHEx-005qx2-BS; Wed, 15 Feb 2023 12:50:28 +0000
X-UUID: 4e8ef110ad2f11edbbe3f76fe852e059-20230215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=q5UcyJ/aXUNEK20OKjGWiM1tft1sqvEVwCIYOxp3oRw=;
	b=rfQBwC1FRAegN4TG9xZtstNkB0l1+3easYFx++ITMA7ob7OrTvQQJsOUw5pT05slWCBnk7G8/78QyO/E6Az5P2YIsGJamFXPV+JtjXr5kP3Ii8Fh4j8Oa15nUJ5TtOQ94LqsgQUbwOi0dclRsei/ptn7A2sPsAw7Hf5OOciAoTQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:e409c334-5985-47eb-a7d3-acdb6f280957,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:de74a925-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 4e8ef110ad2f11edbbe3f76fe852e059-20230215
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 974903921; Wed, 15 Feb 2023 05:50:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Feb 2023 20:50:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 15 Feb 2023 20:50:18 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8188: correct etdm control return value
Date: Wed, 15 Feb 2023 20:50:16 +0800
Message-ID: <20230215125017.16044-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_045027_420549_39D81B1B 
X-CRM114-Status: GOOD (  11.26  )
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

In mt8188_etdm_clk_src_sel_put() function, val retrieved by FIELD_PREP
is shifted to the corresponding bit filed, so it can compare with the
register value directly.

Originally, the redundant bit shift of the register value results in
the wrong comparison result, so we remove bit shift operation in the
patch.

Fixes: 2babb4777489 ("ASoC: mediatek: mt8188: support etdm in platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 071841903c62..1c53d4cb19bb 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -679,7 +679,6 @@ static int mt8188_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 	unsigned int old_val;
 	unsigned int mask;
 	unsigned int reg;
-	unsigned int shift;
 
 	if (source >= e->items)
 		return -EINVAL;
@@ -687,27 +686,22 @@ static int mt8188_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 	if (!strcmp(kcontrol->id.name, "ETDM_OUT1_Clock_Source")) {
 		reg = ETDM_OUT1_CON4;
 		mask = ETDM_OUT_CON4_CLOCK_MASK;
-		shift = ETDM_OUT_CON4_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_OUT_CON4_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_OUT2_Clock_Source")) {
 		reg = ETDM_OUT2_CON4;
 		mask = ETDM_OUT_CON4_CLOCK_MASK;
-		shift = ETDM_OUT_CON4_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_OUT_CON4_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_OUT3_Clock_Source")) {
 		reg = ETDM_OUT3_CON4;
 		mask = ETDM_OUT_CON4_CLOCK_MASK;
-		shift = ETDM_OUT_CON4_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_OUT_CON4_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_IN1_Clock_Source")) {
 		reg = ETDM_IN1_CON2;
 		mask = ETDM_IN_CON2_CLOCK_MASK;
-		shift = ETDM_IN_CON2_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_IN_CON2_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_IN2_Clock_Source")) {
 		reg = ETDM_IN2_CON2;
 		mask = ETDM_IN_CON2_CLOCK_MASK;
-		shift = ETDM_IN_CON2_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_IN_CON2_CLOCK_MASK, source);
 	} else {
 		return -EINVAL;
@@ -715,8 +709,6 @@ static int mt8188_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 
 	regmap_read(afe->regmap, reg, &old_val);
 	old_val &= mask;
-	old_val >>= shift;
-
 	if (old_val == val)
 		return 0;
 
-- 
2.18.0


