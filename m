Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E75C79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=; b=qtIfghhywm8VmMbZLYwhPQ0BjN
	/B+aYONnTCKx7qKkr/5upLDEQl+E8jfIW7muKfNMNTl7q3Od93Kq/6ynPgMC5OXA1qyqKh3Y/7M4t
	nLMc/oAZn1IB51Qjbgx41HFk+RliKZP7actu2TTchvIC5RlDyYhhfm9SqvoxsDxph8UhsFtIsu6pV
	SKuE93e7jmJgObCHyMyZ6gJPfMB7Bogn0MRowKi0NxGawO9k/Zvg8qReo/p3XXaD9HPWf5c7pbgaJ
	6prw7DxSiH327Oglia6DeHPWqWRWiagkhtUd3AhLDKFinRcG++faREvtyPI/y+CXqq6nVy/6VQy7r
	ifd+qc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4v-00000006kU5-3UfN;
	Mon, 07 Sep 2026 12:04:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4t-00000006kQ9-0KJx
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d9db539a54so27289555ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782638; x=1789387438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=;
        b=EqRaaxx7PD5oLZrm9bD01bV/p9lneOtBIKf8Db06u/LIqUcZd4yPB6ca232F6ajsJe
         kvr17m6hJhyUtDcJK4XHc3DBA0gbI6p3ggn8Nn+gw2WD8kFiaJKsmKTJjlwyUZ3nB8ZM
         yc6csU620br/8evxf9wYgh9pju+0JEf7E2ZAfNMg6LQubF9TPIo4b6fhtd10krPTK+XN
         oVt2+2WpM1BrP1bt0MpSaZ0jhwkajY/isdRMLfEStd6Lf+3Erd+gpIm0t+B1o6mOWtz3
         p2Vg5CUHXio6pYIUwGRbqauHqdPkhWJNNv36zniq5b8ZFDfiLKPPzCDAfTO3WVH+jkLl
         9MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782638; x=1789387438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=;
        b=HF6M1JsTrqiEOQ6V0j1GyC6+u0NB3lwhvaI/UShDg3ksUvO46FFgPgBcknZyAmwao3
         KCrGY7tDwjnXny5skof1phdjfiqzhV8f1Ubz7FVGJiESSrtNDKUpNaanLF54H16ymBB2
         w0Yj0q0hhi7BeHlAoHXLqBPcY5epth1wBWxvMj6KOvsBpvW34F3EdA2zZyCytEXDCxHo
         WHoN/8eLg7iqqTwIil/triwKwZJBeWnpHnpwPm00Tzp8ZSiIZaqUW4KqxEe8EmNHQECw
         Z6dAX74VXpEYYTIz1aTb7zbDLL+29EZ50t9DrIMZXw8jHlypxNvR05XRNpls2KVNIvTA
         pudQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRMgxhccC5cFDT90PIEXeMtncRZWLdgG+e5gIfOYVA2h+u59knB9jaoOaDFvHcgcwsJ9OJFgtWp0OdBP88jQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lV2r+f1PbTJ5J8CbbqwQtHNWZhxNz8F7yjgVJQBHHs9QLeRU2D
	nFpoipa0AZjMoOrUi8NHCK78SPtpiR0CKEwgSjWEbvoSm81MkQ+LgAVWiOsg+Q==
X-Gm-Gg: AYBFou3veweNcjrsAzyRVz3HShEkTeBHrXXvybdXOz0k/93wSlST6xl1dUQsOCD7viO
	eiyE9c6PiBdx5L3uInA48LxY5BP4NuDhVEVKwJYYOJ3lb66MczNZVB16ZXl5l0JTjuImMdT80uc
	RyFmWK/sf8JfXfvpnlKJ+AnGeXPiBo3ph2D0ffKUamet3IfLY2Jz76KDdTIiEVJOZELVVroBxzM
	g4vZD4mXVc9TRLYGTYicRiFHFWVAyNAo2/rkGSRF4qAdGstYHhgpVqUo0IFxzrraWfQyR+UZCWS
	OyAtLdygLCUN6KQS9j1L8ZLFyXWXWfGxpUDTGIuTgn5uAnKSBmspSoOhctQdvg4zQ3gTWoFMHt7
	SFXbfHjS2s8oLxrDcTcKnU3qB7gm8Vy0eOK7R23rslWjBQktzzWfTeFjKI0/QkgEhGtqTtlLYhs
	5RigEHVfj+Kpx2sruqzZpVxjXHp3ETS8DfbpZfMW6ysoz3ex0MGrX0OCZ4DBTatS3E9i9Zy1j/t
	kJmuru1qitQdxa4OUiWERosn9o8oTm/fhxsZv64IAS0M2rmh5Zdtga0Z7VFW5LOW1yFBMRYkZaS
	Kz8O
X-Received: by 2002:a17:903:46cd:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2db125c332fmr382050405ad.12.1788782638093;
        Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:57 -0700 (PDT)
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
Subject: [PATCH 4/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
Date: Mon,  7 Sep 2026 19:03:07 +0700
Message-ID: <20260907120310.135693-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050359_130218_425F11FD 
X-CRM114-Status: GOOD (  12.74  )
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

Clock enable errors are currently ignored by several AFE clock
control functions.

Check the return values and roll back previously enabled clocks when
a subsequent clock enable fails.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Fixes: 9be0213a6858 ("ASoC: mediatek: mt8188: refine APLL control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 69 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 77511f6fba41..8b6dca22c8ed 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -579,22 +579,47 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
-
+	int ret;
 	/* bus clock for AFE external access, like DRAM */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+	if (ret)
+		goto err_local_bus;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+	if (ret)
+		goto err_intbus;
 
 	/* audio 26m clock source */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+	if (ret)
+		goto err_26m;
 
 	/* AFE hw clock */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+	if (ret)
+		goto err_afe;
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+	if (ret)
+		goto err_a1sys_hp;
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	if (ret)
+		goto err_a1sys;
 
 	return 0;
+
+err_a1sys:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+err_a1sys_hp:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+err_afe:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+err_26m:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+err_intbus:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+err_local_bus:
+	return ret;
 }
 
 int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
@@ -630,7 +655,13 @@ static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	return mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+	if (ret) {
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int mt8188_afe_disable_a1sys(struct mtk_base_afe *afe)
@@ -651,7 +682,13 @@ static int mt8188_afe_enable_a2sys(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	return mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	if (ret) {
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A2SYS]);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int mt8188_afe_disable_a2sys(struct mtk_base_afe *afe)
@@ -739,8 +776,18 @@ int mt8188_apll2_disable(struct mtk_base_afe *afe)
 
 int mt8188_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
-	mt8188_afe_enable_afe_on(afe);
+	int ret;
+
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+	if (ret)
+		return ret;
+
+	ret = mt8188_afe_enable_afe_on(afe);
+	if (ret) {
+		mt8188_afe_disable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


