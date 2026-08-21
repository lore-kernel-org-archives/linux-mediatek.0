Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FBFC5DF89
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=; b=Z5P5b7pQdIu6t8dpQzt/dTqtfR
	m3H++j+uTirHggih2lGC03OVhcK/UQe/dr4J+KXCJHVzRO0rUDf/5fwRr4YyLdWuE7zyNd/2orIw8
	y/H19PJ41N3cORwMqqngcZQPW375yA90blhSwhRwKOWhAZY9IJv78v7Jd1HSRGLd9Ebl7fRBJqSB6
	qeJ1bmvVla2wzqFDpWDLZ2tG1IRp8HR6nrp2Jp34rqkj+mkQ/z4fT20Ew77kIWNAroSe1QD2vqi1H
	Zt5g+W6F5cFL75FzZ6hun4rbqYSPfyqRwJrItN0aJ/DDaPE0Yu8DKE+O1xxHgIQ6cxeogXg2Pcd+Z
	mOtwmaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOt-0000000DKGG-25Y2;
	Fri, 21 Aug 2026 12:31:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOo-0000000DKDK-2EED
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:31:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cf50c6f235so11620475ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315466; x=1787920266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=;
        b=DOMlp6oTxYQ3c+x0z+ZOio+CU5o0f3C2qjqpOCu6vnsyXvyXEHODTLppca49/XLcMo
         zHgbcwi71Hqcm9gLkmgiEni75SHOcB/hjcRcefKPhnQ37KyDpFncm3q3VUtxzGWZiCBr
         NH+6GogKhXEWHctyofF77tQcKNZPzscNG6+1dVt5nkhL9u7mLYJZq2yeuN5NmlfX3/E5
         7sk6xm/Q7/D8iVIhNu0zWXnHsMyNMAFyw/l7l+braMNk/uymH8Wp7zv+Wub5fk81XPtr
         pr0Om2zwNt05IJsP90Ox0MvgvrYRIPlAyRWmwqZ9nwNGKVqlP3dhQQa0nRKslGO0EQDA
         98vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315466; x=1787920266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=;
        b=gcZ0bU6lFtL0IkUPPg5OgoRCimyJgqVEP3xdKCxdZFank8hjg83596PJ1bHy4htVOo
         osWuS4mQL96EzDiDZS3DUEOQ5hnMbMUcB33Sj98KyOo2fmj7EBB5JUOwy5PH0vJiIa9c
         SAjvzu4O4zQQMak7zUcAM6YYznAQtlK/NxPKdVcD6Rjq0o7xOw1z6GxiztNWvVhCqaIg
         A4VsFoweViaDBUiYP/jROK+P+trbZBoq7C0BQ8RuEZN1m1Sf1lXffSQhAuY/jHiHtX11
         l/6T8xZw0jchO2vuzR/czVF5UGdrJLk8SgfJVEKKmlIPK3ulf/zNd8YS1nThLW28TE1X
         DTNw==
X-Forwarded-Encrypted: i=1; AHgh+RqlKUwhAIE8YJKSXcdyGKUGN+cR3xnffcTdBiLFVbGHAjsiogOs7M9adK66ENNLxrmiOIiRwIHyx621BXIo9A==@lists.infradead.org
X-Gm-Message-State: AFuF++kmoTG94j6A3OQ1ibRU0d+wH1Rq/7y9rbYt4eb7aOyTWdiduCT7
	penTXmgnE8g/VvBPOcgMQfIUQ5/y9Rx9BNOeCFh5ZMVt718JKM3TAjabK+6ctw==
X-Gm-Gg: AR+sD11nhbpnhNiLVzemdNhBBnKG3tKklv2bapvM+NokMxTCDLfbmM3elA+wj0Qu3IM
	gQHa9jwEMmAZLmRHpxvb+MMKwa9dXgNcET7yzOpfl1GWzZufaBLEc4eliVIYJx1jrJXKZiXgYKx
	2L8m4uGSy48u+8x3hz3gMpJEFTJG63Znfibp2U/BjUsMpXYV9BvOchdMXGaGzOQMtAO6OrHorPA
	NEkfmXoVK5PKVmKndHgMXTl5ezb1mBe10xI+Yg3jEwHz5DNtz3q4twMeNl0mxQM1fjg3UtxIxUm
	ncupkrjKnTPmz3k0dEqio6o2iaP5XBWf/dv/jl6GUq2CshfJdvXaO76cS2x7sXP89mGRd0Wkeqp
	1adIfUuYFd+aVZ3pk58kyUV/6jbxzAzaZoz4dbyr1k280PwIJ13HyuN8SS6gq44xaz3rjCiC83R
	sGv5TC0OdGUcHaegkZBNpP59N0NmTDHXEze8vvU9LyRVgTUfm809h4tGOYgfvMK9ZhfrDNb9/1E
	l42OPxADDP7KhskENorOzYO871NrzroIKWtgBCRcsBMhRGTRbVeBgl8grTRIUVZGCuRqWV089hS
	bfPs
X-Received: by 2002:a17:903:3546:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d64adf3b42mr124052375ad.4.1787315450332;
        Fri, 21 Aug 2026 05:30:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:50 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Fri, 21 Aug 2026 19:30:20 +0700
Message-ID: <20260821123021.41390-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123021.41390-1-phucduc.bui@gmail.com>
References: <20260821123021.41390-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053106_753396_10C1C07E 
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

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
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


