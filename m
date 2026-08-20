Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA4BC5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=; b=fSJzARSKNWn6eUVbE1eZs7h5NP
	GRR/Fx2mAIqpahJdiWoJHApQiIEfB/A97MH0cgShhXVvFvHd5EjnLDuTs1KAOG8zkYW6XdzPrN7Jf
	bSHWmc3K+h2/7VYEfCA/v8DnaPOOOTKElG8k72RSDkO1loaoWa+4aXCS0FCU57SeIb1vuM1mCiSfk
	aCrUHfx3PRxDepfrHFxdaO73kMfIXP7xH2xynadoj8aFxnOtI98g0oOybXetTZgoitNXl7PCRRJLB
	9jLa5qGtisNEo4Sd/pt/8nqvCHuPK4y22p67rsNpyN6mtTYwevenn+Wo9svkVmclCZT8/Vo/hvj1i
	qQ+/nQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iN-0000000BQDy-05mA;
	Thu, 20 Aug 2026 11:13:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iK-0000000BQBf-39CN
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84867f07d63so2075342b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224420; x=1787829220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=;
        b=J/DBhLvqPF2ExzsYDP6hciLoii9UWNRgW2jJdJlHOAkytFC7lGIIBeynmU9oM9tvPE
         D7RYDbAp0bI4FifbCyWllXRY1kLtoPrYHFjJhlK+Tqae3RHXBbfqJ0oR9KB/03dQZ60I
         bMbP9NmhxXcz6MSr2KXfjfrZUWOxP1AKO2YsXJB78sjgsliygzoHAVfw1Wo0Y8fvI1vE
         DHK6crTFGTXERseTW2PUFPogQRBwaT3r4UsQG8bP1rXXH9d9cQnhoNPH+zBabSuYg6je
         zTztXO1Yi3qQWBUN0MQlQePGSk2G1dJB6F4izedx4iCtp/EatlP6yT9xeZ8T79QBdP2F
         b9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224420; x=1787829220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=;
        b=msvgYl3E4gVl3k8pH0/DF4+qCALSqpCYVPYC47xp8bDGBzsVBDs84Pfnza8ayy4hWM
         gUTTsTx1Ku1VCRpA7ul9OAlkmKIyLWp7vE+NdL5PqCQCu3iU9NqKDLaaEP7OnP2IG3Lf
         AwjV662EZhBetJQHXgXA6545Q4Z6rRF/dJ9CJKLNoqG4dDYUJ7LOEKWjXqsd4vlG+C4E
         KuyHKEdDLOEYs/5DN8r923SmT0S9u2lWBsR/MhOW96cKKGQsSuOZCazeKHc1Vk9NkUg1
         hLAi5u810MNDI2upHl7SLLWFtFjLqN5cfYmcRGEEZcp/nmVUyL02fcd2WeNaVPSYjsVF
         iSSw==
X-Forwarded-Encrypted: i=1; AHgh+Rru8Ym8RKv3DjmQEbNYJNQqnlEeNcPj2QYB2blQrEsPqBfo8yqECGYNcywGmqVbXAAzw4/pog3GVOfLPOXPHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwghV7Iys60qNOLwbwWf4G47XWvDZn9Ys7QTjZ2lTL5YR2DiqMz
	a32yoQHuMApK078iSlcUDt/enHx+Ta6BwdTVaFKEKzXmLQwpDx9/7522
X-Gm-Gg: AR+sD11p6PahugUA9+WTXj/8rM6Ug1OatJEp4JtXr1cSU+jvWMjkLUjGpJ+yI8i4QtH
	i+VPzJiFlGZ7YxgiaWICHSmh50dS33cQLeSvtlmTE3fwdYyWPlTKxMo0/QnVt7ldVJRNiWV6Ooh
	ALLs/qgy5DBzyvfKixkCtP0KBTapJCwijg9tNQaliuuU8/2HOGC99K42qibW/zz3duxFrEw1IO5
	mQXAEF0ITCUzC+fFK+4O27uMcxlXE8vGDhsDkADBBMWXYL5oNVcZfvEGDUaVGMulUrHzQf4eJiQ
	c3SxOqABgbfj6iuEjjxUslOveSXJfUUfg8Qs+HGD3hFY5e/D73m+4Oc9sKEFANnyaOtyuGvGL3e
	4yjwbDRdL3C0p8hYejo/at2zXi6jG2ISs0oRnZysCD6tQRIGquVq2esh/5BCq5GaSjc3qGzxrnZ
	NV0NfzeV6YPRccGcNKbeXKft5VMN4nBW2mSCRldgzRBauU4ik78Mbnc4q0xhqX4sA/otzl2b6oc
	1ZodOSUIXCM8dLWznGN7BSG99+ays3iVlFUHse4QcYftOh8We+MSoA21Iox6LPnscKdPLWzIJVd
	+jrb9QZbqMOCvGg=
X-Received: by 2002:a05:6a00:148a:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-851d3914f9bmr20061259b3a.11.1787224419796;
        Thu, 20 Aug 2026 04:13:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:39 -0700 (PDT)
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
Subject: [PATCH 3/5] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Thu, 20 Aug 2026 18:12:51 +0700
Message-ID: <20260820111253.97866-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041340_814391_254514F2 
X-CRM114-Status: GOOD (  10.95  )
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

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 94bcaf92e396..d6b0174e2655 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -359,7 +359,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto err_apll1_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -384,9 +386,10 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
+err_apll1_mux_setting:
 
 	return ret;
 }
@@ -412,7 +415,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto err_apll2_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -437,9 +442,10 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
+err_apll2_mux_setting:
 
 	return ret;
 }
-- 
2.43.0


