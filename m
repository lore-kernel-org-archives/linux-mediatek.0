Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27F1C61DD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2ayKEtWylWEqAbqXks4/0qXdOEmw8tXU6KwY1JgJjU=; b=rlRknSeiCFu4x0EioEZYuRNsy+
	jWVXUux3GINOkZ6o2zKqssoDPn5Yi0Bb7u4ZKU3jYTrmyESYZ/0S/o3CSvU7GNXriytzkENIESjn7
	RDNIyKZfXU3DM8pRWfA462GV+xYv9T3J+AnUYsqRfBtCtCcBZbK6xGG0tjxLKVrOw5y6CkLh+G8mX
	Hz0g82U6ClBYVTBh6jgcSPBAxbBqmXO3deFgBdhrfIAtj+m6cnDJ3EOGucVPQPWzWNTNUTlNpNNB5
	VTQMhwHLiKKlXpk4z0rsHjODat2oHhWSzsn14knvKibiIBSG70l7m1oMTcRIE/5NiZbqBdywRJk+B
	ugEB4KOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzon0-000000057vB-2alT;
	Fri, 28 Aug 2026 05:06:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomy-000000057se-0pm7
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 05:06:05 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-39266382df6so761348a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893563; x=1788498363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2ayKEtWylWEqAbqXks4/0qXdOEmw8tXU6KwY1JgJjU=;
        b=cG521kU+iFg/6I8eEb6A1JS7cBCsnRh0oFdAQ/WrcEYMBGcvpiGc+uTD/kcqu+oZiP
         ImbkeqqcJFsv3mnqQdUJ5gUtIYEpF67rDheALDMpRkjSgwOe0Ft6I1gmXTu6n9ILgtxS
         YmddQd1o46Puq2NGlHMqkbK6ffCTU0R7dEPDySSgzCPe32H7mbTROxIx0+te4p/4iuQ8
         T08xGdeTy2iakYXQT3S1z/ZZMaAVQuI9NkpoHqez/tgF+MwFG6AduZ/TduqFYC9MFZUi
         8wRBYOJKMBfqhx2wn9whS8pKy0xzvK4dGgUAg8hIgjcGkPGzxfegbOFB2/Wu5aou5pfQ
         sTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893563; x=1788498363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2ayKEtWylWEqAbqXks4/0qXdOEmw8tXU6KwY1JgJjU=;
        b=PWk4IM23UqQHNLk148Igt1REhEGm1ePdSQqk2fRVDROoFa+IebytDJM4yb49oD/cmW
         bwqEiN/MjLwR7QTf3dbTqJs5vSWYPyat4cFL3XN2bV7PXDZJOHFtAug8Sgo9EoLRLvE7
         CpWGVyroBH6mnxDENp+EaG1dvGN7xZOWYM4+zJmvMviGF6ULaJiLe0iTNEusHSmP/OSC
         zA2WouPFq7GDn35Y7lzCdAH/1Ql4oItY4/fgKe8Ylvb6i739qtwMzPsg3DGxZEmRpg1B
         o3kAqSV1hIGPSY3NwpBZx+ymEAOLDI+B8ekiH+yyasxIkGt363VCrmlRPVhNhcVhVRLr
         er9A==
X-Forwarded-Encrypted: i=1; AHgh+RoiBcFQ0mlpcbVo1iMqeqnhXj0vPnSObmKB2+5lgXDO17Nu2t84L4RHJm3DSWw4zkMFy6jDCrPxnHTzBNXx2Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kNCby3KqsQC2/WUFoUrXnsxWQOpZ4uLdvVJ6HwVyCM5YV9if1D
	k73CYzI8xAC2XUA9GEjFdj8JPCRo43jR880RuTVNq3dOFbOKjg9Yo3yX
X-Gm-Gg: AR+sD10DWgttBgEHf8jaYhwu/m9wbxrKwT42kqD4yXwK90wSsyZjvGBY27g7SEULS/q
	yzfEW/eRXe6ScR86f/LPQ4Xlx4aMBO+l6z0XjUUWWyEmICDHRq77sk5Qk/dq5KsdON4vgFIFtB3
	/S1zauhHsUetyW7SA61NmelImywLhalWs7cPXO3IvZ4rSOK2oIdYo4wbanr1Y5gwEDOVrLJFu68
	1L7lWbatVXe5CuKd+k7gBoYHO5HXsdBrObMOQSJ5PQn4G4X15F61jFdON9dy2DOjOjSFPbFqd9B
	1PQo6qmhnHMEo18lF5IDolz2ZBMOMj+UBxCMx0434j6a9K0y8uAyYBH+2eP5nB51Y8Ea8a3hwX4
	pHfOhBceoyZQkoLFdCaf+wgyzlMFS5UH9p+0bEUIhFL34MzGCc/+edRwIfndx4K1df3j7AWm3wV
	tZPP6pQTrxgqybSd8GrES+tA9VSABSiIwBFnalp+Db+gjiknyPgz4rKMcJZyFw0g4PoIBsGmreb
	GXIP+tDOcxENl0rZegq/JYU2+O6kKPgpTkfERxz/d6giFWJcZG1K2gZXmQSrABhZmGUfP0e1vwh
	05UDQOmz0x/WgKM=
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-396d0f6cb36mr8700122a91.11.1787893563290;
        Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
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
Subject: [PATCH v3 3/5] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Fri, 28 Aug 2026 12:05:24 +0700
Message-ID: <20260828050526.590761-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220604_242554_701600D4 
X-CRM114-Status: GOOD (  11.84  )
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

Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8183_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8183_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8183_apll*_enable() fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 2dbe0b7f8bad..43d5898357dd 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -384,7 +384,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -413,6 +415,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -438,7 +442,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -467,6 +473,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0


