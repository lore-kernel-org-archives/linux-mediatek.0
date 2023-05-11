Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E9AC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 16:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hMQTOddVJSa22SR6zcvBJmFXpgRZVXNpCl3DB1GYgq4=; b=Sg9ujD1ruBjP2dcRfiNpUwCiwb
	MelPMvx1OUIVd/QJ0Y/pJ5wsWJiSBebwnWGvOnJu5ItgJuXFNfZI7yXbEZPUFSv0jN+Kxfn0soRhs
	II5TLwdv03+a5zvV0endI2PaN7VIezxYXCFnHXqgTaw2QtFEDMEwzNoNuVkQjDfVyK46ma4NiMm+w
	mh96KJnWXr5mZmrnSG+k1w1McLIRkqwsIh0jCqzZjc4ZAUziZ5lLWD7Ew5uE2HhEjPeFVmWWS4wWm
	ic0R09zWfRoAZqnhXYa58WCNbtFZYRc8fX4tOteDM8bBB0ud8WnPGB9xUJoqJtX7vWy33gTWjB//a
	QXp2NV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px98S-009MBY-0y;
	Thu, 11 May 2023 16:27:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px98P-009MAI-0x
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:27:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64115eef620so59116971b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683822434; x=1686414434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMQTOddVJSa22SR6zcvBJmFXpgRZVXNpCl3DB1GYgq4=;
        b=PmisfVof65a4l9eAYcp8O+qzOBcGyWPCT4YUzP5gsLa3PQizXpgoIH+Sl0L2ly0Bvk
         Da1HdA2Z4zb7UsmM3Y8bBO8MaQpBSb+bgRmbew3sn8MgzDgcuNScF5MyME+mQ0GFhtsm
         ER5LtWKgDF+zGPeqEYWm1ufwRBywXWdJoU08w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822434; x=1686414434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMQTOddVJSa22SR6zcvBJmFXpgRZVXNpCl3DB1GYgq4=;
        b=ZBhQPG4ApMp2qpQT2GMs3TfJeqOpVPxsrFwCVkDtXpQVZnFcQX8m874WtWQHDniG5v
         2CXowjHFmyjYxoPdDlEkKx/Nb03mE2AV5pfZydhn4lLXRP70tI/g5bt0/KxvnP2vLCpU
         LZIBgciJ6tqIIxVk1mn0NhWdr3pWSU11MZSTJoRchSUbLVTXkb3U7Da061nHkVWrs983
         a9zPhWwWnQDso8uMA+DVTPM6ABObpEG1ZrA2BKJ8NjhYc95j4PvFlm99mhWXF+TX50O4
         BgJ8sqzpVKp5O57v/NjgTYCXQPD4mstcX8HBRzW189+4IMz3ieiUhDurrT75maCWLPNN
         j/fw==
X-Gm-Message-State: AC+VfDybRoejEq0FTQv9yYznxnVnf13pCSQ1+n16NAWarwYnsNQvi1Dd
	RJUTDp6SGSoqD7xNXPNveCMNzQ==
X-Google-Smtp-Source: ACHHUZ4Ihmqgqf0X43I7liRm06xU2X+VRF6LupG5hiM7Cu/k+aNUgx4MBE0VuGDKsTRGYo+uhIwwpw==
X-Received: by 2002:a05:6a20:4311:b0:104:2d89:8f89 with SMTP id h17-20020a056a20431100b001042d898f89mr1138807pzk.23.1683822434073;
        Thu, 11 May 2023 09:27:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9915:1a0e:d2b7:87ef])
        by smtp.gmail.com with ESMTPSA id g15-20020a63f40f000000b0053031f7a367sm5217008pgi.85.2023.05.11.09.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:27:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunxu Li <chunxu.li@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8186: Fix use-after-free in driver remove path
Date: Thu, 11 May 2023 09:25:12 -0700
Message-ID: <20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_092717_337647_BAA973BA 
X-CRM114-Status: GOOD (  21.57  )
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

When devm runs function in the "remove" path for a device it runs them
in the reverse order. That means that if you have parts of your driver
that aren't using devm or are using "roll your own" devm w/
devm_add_action_or_reset() you need to keep that in mind.

The mt8186 audio driver didn't quite get this right. Specifically, in
mt8186_init_clock() it called mt8186_audsys_clk_register() and then
went on to call a bunch of other devm function. The caller of
mt8186_init_clock() used devm_add_action_or_reset() to call
mt8186_deinit_clock() but, because of the intervening devm functions,
the order was wrong.

Specifically at probe time, the order was:
1. mt8186_audsys_clk_register()
2. afe_priv->clk = devm_kcalloc(...)
3. afe_priv->clk[i] = devm_clk_get(...)

At remove time, the order (which should have been 3, 2, 1) was:
1. mt8186_audsys_clk_unregister()
3. Free all of afe_priv->clk[i]
2. Free afe_priv->clk

The above seemed to be causing a use-after-free. Luckily, it's easy to
fix this by simply using devm more correctly. Let's move the
devm_add_action_or_reset() to the right place. In addition to fixing
the use-after-free, code inspection shows that this fixes a leak
(missing call to mt8186_audsys_clk_unregister()) that would have
happened if any of the syscon_regmap_lookup_by_phandle() calls in
mt8186_init_clock() had failed.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  6 ---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c | 46 ++++++++++---------
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |  1 -
 5 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index a6b4f29049bb..539e3a023bc4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -644,9 +644,3 @@ int mt8186_init_clock(struct mtk_base_afe *afe)
 
 	return 0;
 }
-
-void mt8186_deinit_clock(void *priv)
-{
-	struct mtk_base_afe *afe = priv;
-	mt8186_audsys_clk_unregister(afe);
-}
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
index d5988717d8f2..a9d59e506d9a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
@@ -81,7 +81,6 @@ enum {
 struct mtk_base_afe;
 int mt8186_set_audio_int_bus_parent(struct mtk_base_afe *afe, int clk_id);
 int mt8186_init_clock(struct mtk_base_afe *afe);
-void mt8186_deinit_clock(void *priv);
 int mt8186_afe_enable_cgs(struct mtk_base_afe *afe);
 void mt8186_afe_disable_cgs(struct mtk_base_afe *afe);
 int mt8186_afe_enable_clock(struct mtk_base_afe *afe);
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 41172a82103e..a868a04ed4e7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2848,10 +2848,6 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev, mt8186_deinit_clock, (void *)afe);
-	if (ret)
-		return ret;
-
 	/* init memif */
 	afe->memif_32bit_supported = 0;
 	afe->memif_size = MT8186_MEMIF_NUM;
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
index 578969ca91c8..5666be6b1bd2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
@@ -84,6 +84,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD2(CLK_AUD_ETDM_OUT1_BCLK, "aud_etdm_out1_bclk", "top_audio", 24),
 };
 
+static void mt8186_audsys_clk_unregister(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	if (!afe_priv)
+		return;
+
+	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
+		cl = afe_priv->lookup[i];
+		if (!cl)
+			continue;
+
+		clk = cl->clk;
+		clk_unregister_gate(clk);
+
+		clkdev_drop(cl);
+	}
+}
+
 int mt8186_audsys_clk_register(struct mtk_base_afe *afe)
 {
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
@@ -124,27 +147,6 @@ int mt8186_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(afe->dev, mt8186_audsys_clk_unregister, afe);
 }
 
-void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	struct clk *clk;
-	struct clk_lookup *cl;
-	int i;
-
-	if (!afe_priv)
-		return;
-
-	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
-		cl = afe_priv->lookup[i];
-		if (!cl)
-			continue;
-
-		clk = cl->clk;
-		clk_unregister_gate(clk);
-
-		clkdev_drop(cl);
-	}
-}
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
index b8d6a06e11e8..897a2914dc19 100644
--- a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
@@ -10,6 +10,5 @@
 #define _MT8186_AUDSYS_CLK_H_
 
 int mt8186_audsys_clk_register(struct mtk_base_afe *afe);
-void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe);
 
 #endif
-- 
2.40.1.606.ga4b1b128d6-goog


