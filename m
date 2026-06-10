Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C3CCD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=; b=ZhEVOrBEawgy+AgiH5hIttVyqF
	IU2zX3/nYYEmMiaZq03ESHiTf4cPeNCTK5xVp3pjcZJgITNaKi+8zrQUMSyIUQdOn/ad7llBhrHR+
	/E5eXI7T7hDOG26NG0d1Kz7mG6wRGMbAKt4zNR52j/CGlSdmQkT7DCzfXzDIiVhCNaZ09FRu46rKs
	zVlY6ZIo6W487GCzYhALAwesDL0SoOMR/kk1MWxX3SnQF8Nb1RtkTCx2X+Iea2ANT9ZgwC6v72N1d
	rk9Ze/laxiHT/EfHbxExKFtucmD+lI7L3wAKIyIHL7pvzJequc8DcIDRTa8SxBtDEpcmUMsdGm80z
	9t9MLrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3a-00000007NAr-25NU;
	Wed, 10 Jun 2026 10:21:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3W-00000007N6p-3Idi
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so55308225ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086866; x=1781691666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=r5xfFTTMMUZHxnHYq9/BAcnaE6TadVyzSVC08O7Q00fPzjWmupn05W8Wb9DHOwLF4r
         zt9pUNHee/seEK1UKnBjwXgbmm3vehMjANRPPf2GG0/FCNzSpwmumuM2+MGvyeHH419E
         vG4h2Yl+TpJNwaKJDtQ4StLb4O2HzZaPLzwFPqzBrtGj3rFrdpnm1tE4ZGwq0jpwY0xG
         4H+E9Zrzx/fV1kwusEujtnVRtEb3DgmgOJzVAPuxXIDtgFYxH46N+pChBbCPhoy9eo9B
         NlwoD9eXFmVLA2ErMUpyOG+sMfZpmDe6Jg1JUu7ipgp5QyMlpBUY/ERb80oc+0zyHS0G
         Tahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086866; x=1781691666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=jkZSvnaF+bQzIJGV4MCJX7wvoZR6T5kM5Ec46y5ufBXEhqRQecoDafd3zQJKeAmSuv
         OIVcs7O27jIjwjRabDR8ZAwlXmgVxAi8cvBkYK98t2tMqgoHcP29XXDxqJcUOau7YLIO
         P5gEZ50IiJEFIf2/Vc66cS0g/annOaa7lQ4utyvuNs1fki+88akwHnQAJiZ0tIOio7Rw
         a54WpcV3PltDdjf3fPWPTB0GN63y6a/gZJr61rxdKxvSYpH22ITh8dUPDjhruskw0NKr
         /UfZ9zkiXFrDyOG4/lpt5YzWeA5O8LUfSpTXcTTZ0lANgg7cby63d/4od/A1ic2QQX+Q
         a6KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BvcLDXraP/r1k6U+0NN5zbQR6EidYogTjtVgB0j72DY6BlyAUI2+fKSiZ8e28dtTLcbXa75mrbO16aWZ31g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxejEj+j4GaAXIjQvA+dp9glugXLUjnebsrcGqkQcHGccA3tBjV
	0f44hNGPowYSs5Iiz1eJbJwG+ET+i4NGqNMiesZPmMfgJMn0SokdYM92
X-Gm-Gg: Acq92OGqQiYnevucSEZc96yUUik3fMfGSCYSSu41oLuDYlrJosG8GOqzuuLnE4rkNO+
	mb1rRZ0qD5g1RigC1TLUKm7quyyHfXhjE4epvffti8FQQQ3OyKMOq+I0Ld+VSNrzTwkIYGScnYe
	BWS2wcjIeVxTMw8h3xGR1RNb2PpVe6OhOBbPLg4kk+hw4hTkUQSTDDU8D7ZWMOU8C7uKMFaktwO
	mSVOO4MWgPDRoXQdBo1gVtfly4f20f925a1pXGm+vYhY2UCys+raS43ETCKhyW37VSn87HcpPNv
	pFiwg8+Q9+qXLtv3v02KfJ/4fKGcMt7gico9lKECo1Wa4LSGbxivv0AMT5lkpQ14BxmOJrt7pUQ
	bqd1w8EoDSv4CR+zyrCHbcRxAl5Uo7tzYMDXHUKHpXi+jKtMT+wB8CpEI+Y4wL0oYpb6zJkOzSx
	TQ5VQR5+6Ij736BJ+EBWkEGtIucc/EtY9Yat4TptS/ZB21XDzL944Mev9uH1haLluqiQI81auQt
	Fhy3us=
X-Received: by 2002:a17:903:1209:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c1e810b983mr265633925ad.19.1781086866069;
        Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/10] ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:17 +0700
Message-ID: <20260610102021.83273-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032106_848861_DE7DF689 
X-CRM114-Status: GOOD (  11.91  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 42 ++++++++++------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index f35318ae0739..618d8400913a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -283,7 +283,6 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 					unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
@@ -297,16 +296,14 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt++;
-	if (cfg->ref_cnt == 1)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   1 << cfg->tuner_en_shift);
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt++;
+		if (cfg->ref_cnt == 1)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   1 << cfg->tuner_en_shift);
+	}
 
 	return 0;
 }
@@ -315,24 +312,21 @@ static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
 					 unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
 		return -EINVAL;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt--;
-	if (cfg->ref_cnt == 0)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   0 << cfg->tuner_en_shift);
-	else if (cfg->ref_cnt < 0)
-		cfg->ref_cnt = 0;
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt--;
+		if (cfg->ref_cnt == 0)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   0 << cfg->tuner_en_shift);
+		else if (cfg->ref_cnt < 0)
+			cfg->ref_cnt = 0;
+	}
 
 	ret = mt8195_afe_disable_tuner_clk(afe, id);
 	if (ret)
-- 
2.43.0


