Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D67C5DF8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=; b=vfqYItEBba+3obnMbnFXpJpHjz
	I1RWy/S9mZ4eYxFyDvEa2zUIWVrvl970lleaTvGJxYURkCK63cGLvf4AFi0UzWsYnK6LFwY7oJjfd
	2qsmOYGj5q+PG0Z3I/QG0608nT9yEB3mABtG8xiMCEUkNHsj4LvpsyJn+XOoqmicStcxCR/+meH8a
	5y6gzn4JvNUfYjhd3bhFjKFMk/K8ZZKGS6SbmSKeboIMpOVdQzOaCpr+tiIFuKV4jysmtA7HOf9kd
	0MDR6fWjjCev41JwZ2cEycJBWF8NwPQn/tz2ycQcpPukmrC0m01wR0BhAP+Unekz6TcaaciJo+M8n
	8eHdZzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMv-0000000DJ3a-0JcT;
	Fri, 21 Aug 2026 12:29:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMq-0000000DIzG-0q0x
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7236015ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315343; x=1787920143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=;
        b=HUV/txs3BatjONaCFPVUB0q4OnUvzkfG6w/dAQ/YKgX8IF4Q1YGHVEiDAz1eI7yYfZ
         SJ+prh3Rm2JBnaYeZNaGSwMz8J3Vm5bJo4AWUDQi8loJc+xU35G77zVO+LYec48vmwgy
         6Quq/fp3IYeQpQ/EJLVWvMe78MPR57IhAZtT0HdBF0xG37SVYRGCWwPMCWrexYaN/BhP
         4VCRfGkJhsDyE8p61F5UCydwZZP5EXs6hZTFMrXrIMPPBwHg3D8K1XWsyBVYZiuBTKPx
         6LdmRbRszOcl0/PI4noIsFylclu1MjBCQO15REx1NhVIQ58S1cHZdn0hcxX9w4h6+O/v
         mWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315343; x=1787920143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=;
        b=W7D2D4CnmqxK4rzNWqBLobnvlMedvaNwxJZOlijxBmo/DJbK0FZCS/O00Fx1e34c04
         R2YLet9iW4t2E7ChLrh8ojJeALODgSQc7xIppHF/CrVIh9CMf6aLTkKDPuAaZiOrT5tv
         35aDf2yctwMV53qblTQanxralxxXQlBkARhpNdXJ5XoBVlEkGtOmcTnmQhKV3J/5hy1x
         un7xACyZGKv62UjhyzGmpuGpxcX5bn6nSnAKcQW/S27n7MsjROVhIZYIZZSrQ4E+ZBP5
         ++2mriovVEyphJ02+pYEwpZMoDZMmJb4mTy2G+4kTDdqCaUVLqGCmvvtLDvQ9TflZrgW
         K62g==
X-Forwarded-Encrypted: i=1; AHgh+RqMfWlbRZEfuzLGJe4SbaYIiF2NpM54rZqq4JELBwtzVQxI2K86MIcgi+89UZTzG3dymVQfI05oqDSP9imZYg==@lists.infradead.org
X-Gm-Message-State: AFuF++kVh5e3R4IPw+NJIbbvAk8CmYZp5KxQ3ysLQpqPQKybJmy3aUqT
	d3J2cAKYhefLZ8oPfiNPR2w9EvJm2U5w14VKx98ZZFsSLM90MnaClir6
X-Gm-Gg: AR+sD13cOobPtisVOdJmJnWGWxGpjPiRsZjAxRsq2nx1enzPrYr/hAOo+PXncO4fzGw
	JnmGQkr+vorPLeLDshcsQ4TxB7sM8KTDyJXFhOEr9QegXVkJETsX4fAW4hcbQgJPu6R1RQ8KSa8
	MvnreoQ4G8phapBKt0cWJxuJdqWF6ndbygA58BMYYmfhe1OTyZvy6uqG4jO5P4d2045QKKfVvN1
	/eBIrVlzFLqqFW7V+QI/uFPQYvZYrmVoNtR58hqi7JMYBONEev36lULLPxEa0+CkIubMV0A+O0+
	cHHEqKBgeXVGj4BqH8Y28hEFhAP0qdLK3pslBsQ9S1aaZVFdBFv86cS/JaQo5Ezv0mdrdIJrRKp
	k9+C/boT31ury3X9PzP53gpIXTTB1Qg4ipFnk8pGagFyGv2HxI64WgoBj+j4exRuLUEnXAn9P73
	3za0UTh+3eb0OXwAjAFF4dE2feVz4hEFUNRH5SFVvv1jr1WwCnidcIqocMXTdpAqwl0/aj/ys1O
	X+UJ98C1XwjbGzkE7Lk9SsSzljucaOPVx/sf540hfOjv9TSddmZSSiXxdhpbl0OEWbqloM9z8jd
	VZZ5
X-Received: by 2002:a17:902:e790:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d64addf4a1mr124433205ad.8.1787315343392;
        Fri, 21 Aug 2026 05:29:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
Date: Fri, 21 Aug 2026 19:28:39 +0700
Message-ID: <20260821122840.41266-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052904_253770_603AD837 
X-CRM114-Status: GOOD (  10.82  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 0ac04d73b777..2326496f8b27 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -43,12 +43,9 @@ int mt6797_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


