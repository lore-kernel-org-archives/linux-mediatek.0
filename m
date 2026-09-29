Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942D2CA5FA7
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=; b=4EM9qhEYDqP1rsOFNBw3rmZKVZ
	K6NemNDyvhTZYKVjzWVv27eRmxLO2OyPHXudiX2/0Hht06BM7RLbwJddra/whyWvYicQ0SGLks3C5
	7Jycn7y8ZOZ+1VCLqh/3kJ1rpgMmQX1HLl8n/ZQcKbhCsZ0LLSgNt8wnCozBLRrpw5xuaZeK1H6J3
	BV9+SrXiD8oliwdvJMU2nP8oyXSKbjHJuXuyIuQ8P6mXjbtVepEnwmbcqJ6OWsXt1KrOT7F6sxi7d
	GrQAE35RUtmAf3iz7fiwqpLv/XLocfeS+8UAChJ+5rP34wM92DPTUibCiA9LXzjDY9Q/RAtM9G4Bk
	ZyQ60DHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4b-00000002PnQ-2E4Q;
	Tue, 29 Sep 2026 06:12:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4a-00000002PmR-0t8G
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=; b=hIhp6bBHn7T+Hbq21zzVnKl/to
	N/iAUGm+skvQ43TwYcsFpdVPd9bCXUJNFrTHl+5v9DutWI9uzqYN8YmSNoVxjYn4ltUDXmTDP00K6
	DTKTgFqdFR5jjruFLAdB95j2C76g8FXNivWPJbEVtinPFLS5eA4H/TNVdH/HRtuwidBml7nEP4h58
	CKkltCgQIXGvnngIg2J8RdSOcM6hCdcLDQtfRlx3BrmR00m7iluEWw6coo72AF8klYfe4lO9+PNyN
	tmY4o3PFDoB/38fP008w0sOP/CQP93MxWQpeMmbVgh1vERLQFwwIE0eAdrXPx5BvOzK3c93LgfLyE
	QSG4WGgA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4S-00000002EVc-2ZxW
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:12 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso2148901a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662326; x=1791267126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=Q/j/xyVF8CnZAbQ6VgO9f6o3TbAs7OA/xxc1bT2wnJqYjU0TsUxWoRQ5OeN1M+XtjZ
         fYSkV+1YudzIeF/enz4G8RfY/Move1Jf0hZRKdN4/d0peMY9pgIpBfMCVqyzMlhsMdtQ
         o14IKmSLbf4CrXJn8c4XtuzJb80YxjRPYXnST5iJ1JHAAFt7uAYOfevVEIK8tAozuJaI
         vHxmbt/7tm2G5Sg0WJ0jdK0/sqWm7KydP3Wrjd744RWpD4M/KUk24FrbcIkoU1ZiETqq
         TvEqUGrGZKsa3Vd4XSRa4RQB+qi5gI2RXvk2dOK3MYwi9Epz2zG3h0mhZAqvGYC7u8Ps
         tNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662326; x=1791267126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=v/gj5IVGhr3lvfUgepCxMZ5jBnxEiEsmOWkhD5SY7LrheSQ5gCh+WqzeF+/m6i/vqL
         rL55PNbyhnNk6NId3bK2Cdm77WAem9IqpKqvadhoH5N3uTiZWdKE+VJEW5Dq2nGDIatB
         L/rpQf5Ju4QCqMbhTqc2cWPBVE1r4NnhNpwsRCz0jQr3hmyxoTlxoAN9YUYRkhoST2pR
         WDAvDc+Mv5dE/4X9wZ8upz2yqoRlHB7UqfmwoYBegcTMAbn3iQBqTddzuQuWDJjwnb/G
         aRo364j8QsN7PfXYeK7SX0/Azm3ZoYx1aqV7ZmH3cQtZICPil6a68tSb7NWnP8Km3zL9
         dCNQ==
X-Forwarded-Encrypted: i=1; AKwUvByy732PREeksB/P+jWp7C4Y7PEzy35zKrlJ9mB+sqkmlXOEMcLb2wcT+lW9mVY5Sn19BGKRHioV8VrXH+5X/g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJfIprOM8dvPx2ZR+yipNFdDALZ/6Z3zDYxAWCl+a9ocUDBidKK
	KBOS5SUUrPky8uHBPaUyqY2Wgae0MLoGaSeTeGTB4qX7o0cP+oU0a/R+
X-Gm-Gg: AYBFou0BUFTynaIHBml45wpISb6C0CvAkecJu3fCdmGDsquPZbwiiY89VDY7QlaJaFN
	itJoHy5kg94kK27ARl9KpRE0mY0v/RO1ju7kZec3I3/WpljvJ60eaeWvVqyZVB0NUK2q8EIXe3u
	R31KLHyEOjWoDPvS50jY0M629YiPZYjQfj3VIWUjmCfnamH0jfrn9ozhRmByTx+RSuOgkLeP2/+
	+gkXjDezsbq1xlf5hd/W1sx4tVkPLHtHqFOR4ckR/W22BWvCWyWUsXqfzbf5yyFD9QvAd7o48Fg
	zZ5woVMpNA2N0HyfxqHtHe1i+7EBA7PMzCCOu2A/R9QfnkWN6K9PiCI2gmvzio9gw2UsbC0VOp3
	jxN9uu//XtrvbidQgYJMrY2NL+AxNln0o4SAbQtOEuRTioXA3nmYPJUCEq0TvBer8xaf0+Bxo5W
	W2zlUAsh4c/7sDEooP6bhX8JisbIS63Q1Wvj0Y4mOQHt4Ank3DBbUmfZfXirg3aHdd8KhOvr/l0
	00pf6RrCCoDvDNC1tVkf/Ge0PCCkQ3FHQ3Dg9d3rgxwptKGdo8w6Uqfludx5GqDN5ZDL6u8spu0
	kR+hxZSxrIn2vQ==
X-Received: by 2002:a17:90b:548c:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-3a0bb63224amr9430503a91.47.1790662325592;
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/10] ASoC: mediatek: mt8196: fix APLL enable error handling
Date: Tue, 29 Sep 2026 13:11:13 +0700
Message-ID: <20260929061121.124001-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071210_997584_7BE27C1D 
X-CRM114-Status: GOOD (  12.04  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from the APLL mux and clock enable operations instead of
ignoring them or returning success on failure.

Clean up previously enabled clocks and disable the APLL tuner when a
later clock operation fails, restoring the APLL mux state before
returning the error.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 47 ++++++++++++++++------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 91ae44024949..1dc4210e58c7 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -314,15 +314,17 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL1_CK);
 	if (ret)
-		goto err_clk_apll1;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
 	if (ret)
-		goto err_clk_apll1_tuner;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -336,14 +338,22 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll1 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	if (ret)
+		goto err_disable_tuner;
 
 	return 0;
 
-err_clk_apll1_tuner:
+err_disable_tuner:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
-err_clk_apll1:
+err_disable_apll1_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL1_CK);
+err_disable_mux:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -367,15 +377,17 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL2_CK);
 	if (ret)
-		goto err_clk_apll2;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
 	if (ret)
-		goto err_clk_apll2_tuner;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -389,14 +401,23 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll2 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	if (ret)
+		goto err_disable_tuner2;
+
 	return 0;
 
-err_clk_apll2_tuner:
+err_disable_tuner2:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
-err_clk_apll2:
+err_disable_apll2_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL2_CK);
-	return 0;
+err_disable_mux:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8196_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0


