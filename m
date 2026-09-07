Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE00BC79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=; b=REZiKNWd/Zt2RZaKPfRGZu4kXv
	jDhaMmkNq3BPgBMKGe0Ii8AVqEGvW6HkoqFTPoVCkxdwVEbtP1SQzWreOTqFblAV1if2dQQU0FPnH
	OLKA4JOcqfMS4mZCKr1dGOsNbJcbmtEr3sQuPqH7sp6ikaaZ/5gVcbJj7KxQduiYpdALeeQ+CnS9z
	JGb6J+su5qsYy7taBkaqVROYy5tNYRLEdgTqGGXa/tAc4DbCIlRnrSefvjG3opkqQfVjS2gg7JB/0
	Ibho8w7GGlWVhQHy4LXOL2+jQe8ON2TLLIy9gCYkGDp635GZqaAsiSzJDoG4DhrLBepJUIp0TZtVG
	pMGFJGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4q-00000006kOw-0ich;
	Mon, 07 Sep 2026 12:03:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4o-00000006kMW-14zj
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d9520b9155so29680265ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782633; x=1789387433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=eiBW48Wm75acKWoA3751DYFoVKM8fkO9JyiXccZNu2KqhhqbdXatha7mNgLafDgbPq
         N581CpqylsNhmpn5kY8Ww+tNPCK4Rp4y2LefdWWDbMSGFI9l1iFv/PEI/3xQ0AEsIX8z
         9mqvo16qXIn8nolJL5y+TyrDsoXhPc6o9mriQ5KlO05edvwkjYF4YmGcfFNUMuj5pBRr
         8WI1fb4HtbpNsWqRxPcuyDg64QYEv3bdG1DKCBpSW5CSgK4u6VakW8uHOba9QWZXEbLc
         y/VZRipJiFUMpHckA994GX+DC14TpnzDMWlKe8yESlOE8AWz/wzXDnLq1cJpETe1VxP3
         Q9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782633; x=1789387433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=NY3FeQ/oRWiGVtr3VwK1fCg/Gzv9nDTrEGn157p0iPWWd+BSbVPsOZsRQ4i65FWQFQ
         DVqmh6W1HGBpcEPG7NfEMZIHVowNTtCCA/lF73J0uEWF/H+n3/4WV8tX9der3CXdQLA3
         zn1sjFqMl/EjI9a0fwzDRUBtO4++fpmT0+rIc5IPC5TGYh0YIALOiSG7jWXPt/eB06AR
         OzWe7zODyrioov+66T4fzxDZVJG7UZeIf+eaFD5ogB5tx+6URa6GlOOKJYGIUdauEheO
         QPw0Fd5oDYLhi0f5PxfyPw8rYUh6elgqbJr7JV9pjanKeMzda1SV7Ka94Ua7u+lamvQI
         +pPg==
X-Forwarded-Encrypted: i=1; AKwUvBxwg7/G70ZgvdSIU9CsKBAPZ0vAGG8kLc77+IjW/THsaSg7txU33I82GpcNWS3hbELMIu3I5BbceN9ZZkE5pg==@lists.infradead.org
X-Gm-Message-State: AFuF++nAvz9F79U52lDq5L39DJpkRJGk07E/VfTMkpWaxlIKzepUvrT9
	Ymm1NUyilE1YZ5VjEbBJ7tm3fK+ugQZtWxeNn8DA2kFEgMIiah7mJbBa
X-Gm-Gg: AYBFou1Q6Y1xBsDRnE9H3xRfrd5uFYGz/xqOigkwgIDBYvycPM/UB+4biL7OwESpliz
	/IfF4yPauwZdStnwO9lIUFKQtFISxSdRSwQ58Hi78wa5rMK09O6srHgUA2CDRRaulj25VaiIoiV
	YLCeo7RX7x4V0jycqc9wbQYj3/QFK6nlMQ0sZX3yR5hMhSojT/tM8h4YWQxcHj64rqYLW6mOp8h
	sIjlfPBqaBqCbnTOyX9Bbu9bsYNOD5FzizcrYUodtU18+IWHAsW5udLd4NyRkmlHqsGD8OPk+oV
	uVgTkohLFU/mKYuw9im+nTCLW53KhraSILrh7ngZCaEfiFmiFXykzcARStkx6NYXl3s71KzqS5F
	z30zUkEJY+f11oiqSPg1w7BWHZ9ZXAvjUMN8kMb9xywbGFLPNbV1IfrftMhipiUupzGiIeCDcB5
	N99F0agpH+S1wO8pbXq8Ufv+ud+QlElGLv2fd7dg+KdFzZUOE542oh0GEyE1GxIurh8IBW8P4xj
	e8JZ1QUfnp0/GT317ghwtvUMwP9mkm8iaNh6y7km1eINQTX+K5Iy/zWBIZ6dPU1zb/4OG+A3t0+
	Szv0
X-Received: by 2002:a17:903:4501:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2db126679c3mr222996345ad.8.1788782633459;
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
Date: Mon,  7 Sep 2026 19:03:06 +0700
Message-ID: <20260907120310.135693-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050354_302423_D74986C4 
X-CRM114-Status: UNSURE (   9.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: bui duc phuc <phucduc.bui@gmail.com>

The return values from regmap_update_bits() are currently ignored
by the clock and AFE control functions.
Propagate the errors to allow callers to handle regmap update
failures.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index ecba13eda440..77511f6fba41 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -564,9 +564,7 @@ static int mt8188_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_on_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
@@ -575,9 +573,7 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_off_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
@@ -617,14 +613,12 @@ int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 static int mt8188_afe_enable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
 }
 
 static int mt8188_afe_disable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
 }
 
 static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)
-- 
2.43.0


