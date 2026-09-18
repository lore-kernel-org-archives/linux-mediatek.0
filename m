Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FDCC982E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=; b=uL0w0BwA65scNFQyvApZyvQyJd
	YGvDQsbGHmeY/5fIjiTu1D0AdIoXwjyu5R9rJOHz2sNygjC9Mw6YcAyNWYFz9vvAHA3xw8eOla6Vk
	c9bJkaBoLHFQErAWvvDo5KgMQCE1P16QF+qVbhF+mCOvO9ju3ZGud6XvfofaLbyxaRAziBOMre4no
	UNhdr+OmD49JAFno1165JpH4tsTu7yuaBwm3bMDo/U/EXF05SWu09nZxbzaQnaHnOLfY23RmFrmSC
	joFQCfY0E4MzmRyJPOIRFH9frwxcv2YNMzzF6U9P6toHPVD65wKR+5ixS+59n4oPBjbmLCQ+pvQ7y
	7SJ+IUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yor-0000000EaUS-0x6J;
	Fri, 18 Sep 2026 13:40:01 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yon-0000000EaQT-2s2J
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:39:59 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so432461a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738797; x=1790343597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=HTjnTRxGRlA54HsHxUr3OIlGE8b2eOXcsNA1W1kjQ1WnVzF3GSKXlKnhq7ohCj4cbN
         7ikgUNHVmNh5pJhEuXtkU2Zgdcl43+X2xrqrEhCycWdb0PoqgJauC5kvP8IBLEiki+Sz
         kMFWNc0no5dOmOagpMFxZEvUWHeMew3rM/AI+M3pfWm5IFyhUc23+tRRtuNm24t3ffcl
         f0n3r6IuToDkXyUAqBKpvoDtb08EPUg6c0V5q39RkDmzzPLXeGp27ZDRZAdp8Xw5aqaW
         E02dYi0V9Z89X/cj1Zw4wFPHFUFTIf3uATQAIOFUJcAC2yPxoWzBsDK1NhHKTwnyxqJR
         9b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738797; x=1790343597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=D60+AZq+WtgP2b7IB7CYZ6aLNWFVwotMOnr2nrh+CYRyvYG2rbUVxtAgMNHZAcLNlQ
         vYRkJQLPyOzNoIpJhh4M+nSx8tgaGqQnVno02wS2yqJd7W229g6EPmKOvjQr2ZtMjCsX
         jMHUzeTNdVtmalo1EyhN2WOoSXSylBnIIP8HQPEJhYOGzNHASmbQtuC0dTwn8iOKfn0n
         20VtCCwnpNf2+RxE2OxoVtYh1MA1LDvTXJ1f3qp8HVmS2ydgyvbDtqFkCJ89ruJ0+0zD
         qLfSOQyJPZJrfb0CUlKHNYy0VTOk+Gw2vjHZIF7oQz8dc6MmmQenGLBFH7h/Ed7gXHqX
         blUA==
X-Forwarded-Encrypted: i=1; AKwUvByoh3YLYPVOm8ghkvOA0Mf7JYHmXZ6wrE1H1nK7rGefImOSuGxmlN4IS1bmqrhBMVyhsx22PJO+7xWhnIkw8Q==@lists.infradead.org
X-Gm-Message-State: AFuF++lt5zP9ziP+exXzL9yfb2Xdfg9NN/xJw+BEHzxlmxsc2blkxS7J
	9c7KPayVxPxa7IpDX8VFSDqjC08t4PiL2zCn7Q/0rwL7/98hHSHiqwisHz2Hqw==
X-Gm-Gg: AYBFou0gwXWcidjWDKQXV7IKNCcuMh+m5yb0R2gifS7hRqLg3nnJKb5lw7ai1lWIaGK
	xk8gJl0RqQDYJXaRV064i/Qzubwi/caMx0gCF2xu2xAkRWpXpwtNKvIb3he03KT2qyZDy6CKex0
	DTyt0sgCss/KbsYie50U38O/nOsEZ4ZAc6iWmioEZQADHVmzQIrornxZ1pEq/PlsVWudO0M9S9B
	luxBO50TGQSzvF4xmrktu1M2Tr1+AoDv3+5Usjd3PD7khSYaAkW6V+eb+BjkgsJefLNS3ymp5z7
	hose9NyQwytnZdb446lqUVDT0xjfXjpkAL8QUEz6w+wUQQSD+KvV2gB3tHZ0m1pejvn9mk7KqBc
	q9nJjHUAlg7Gt03pQhEy+/1KF0vw5IdzMWVu/MqBVPFF5523QSZuQE9oJBfMwo+dC1zdHnzlL0m
	yhg02NlPecKNMNkqB4370EBclRlU7BSnOqF3H6RwbNP9T01j4GDXveC8ApKENSIH5qDGIo174w4
	7+1hyD6muQySEMUeTiFdgmhsI06Az6uK7PVhS+auulY104r84crpFatt9VB00k9OcqUc+DymTqA
	MWX+y7BZwEfsGw==
X-Received: by 2002:a17:90b:2d44:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e54ce36fdmr6605508a91.12.1789738796691;
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/15] ASoC: mediatek: mt8192: fix error handling in APLL enable functions
Date: Fri, 18 Sep 2026 20:38:59 +0700
Message-ID: <20260918133912.133799-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063957_724939_76E6FC25 
X-CRM114-Status: GOOD (  11.39  )
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

If a clock operation fails in mt8192_apll1_enable() or apll2_enable(),
the functions return without checking the return value of mux settings or
unwinding previously enabled clocks and MUX configurations.

Fix this by checking the return value of apll1_mux_setting() and
apll2_mux_setting(), and adding proper unwind handling on failure.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 32 ++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 7647bdd463d9..118dd4819682 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -308,20 +308,22 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL22M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL1_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll22m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -332,7 +334,13 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 			   AFE_22M_ON_MASK_SFT,
 			   0x1 << AFE_22M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll22m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+err_disable_mux_setting:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -358,20 +366,22 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL24M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL2_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll24m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -382,7 +392,13 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 			   AFE_24M_ON_MASK_SFT,
 			   0x1 << AFE_24M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll24m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+err_disable_mux_setting:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0


