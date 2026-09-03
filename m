Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC9DC61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 04:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrPM2Xk8RwUrDDJTGII+4iO1GsIG/syrGzbLRZRG6MA=; b=ahTz8ivOtfpKwFU6oYyvmEbNJo
	68TTc8ndmYjtv4IXWtbMzLfdHN/dVPCij2/5mBp55Cu0lWGoEv2XUQuWConvIXF9Qy2rOlfL9TeIk
	cog6MPNp+PUVsIZIStGEK5f1A5AiQZU9uEB6DcGIC0hlmUAjee6cadC6pD5OlYSUbnYa02ZUsHwaj
	+GqKhTkidV/NLsmwE32uQoOm8eErOvcl4jnU2VSha2L2SAi9Jea0fEtNSioWXvTd0/IemSiqhRh5I
	r78Ahke6N01DA2tSDqMN4D+DKYfhW8Vh3e5QQtuI0nBWjw6ZPn6wm26flme5vjLAjpiaewTjSCznB
	83Cc68mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRe-0000000GLhl-25Qm;
	Thu, 03 Sep 2026 04:53:02 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRb-0000000GLfB-2Uak
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 04:53:01 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-395cf2535acso665200a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 21:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411179; x=1789015979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrPM2Xk8RwUrDDJTGII+4iO1GsIG/syrGzbLRZRG6MA=;
        b=m5BmjV9btIa+nrejSTJ4sormsKjIPsn7DxRvW6Bn8Kh8wJOmBsBICRwMgv2EuH1lts
         W6tij7pRxuZAWTJXULUrKRszF7sD+NMxm64J+yTunSz3rhsDNNFFlaQ5D1APwy6gNKBK
         SX6EW39hIZliR4ULSaVCiXpe0r2TksA4G9eWsYi/nbhFLLaNL3wr3MfeTNzyZithBUVR
         5e1XTWvLl2uGoJHOY8u5tdriXy1qwj2QqvLBlGDj5GP4BBsDf6IbuBrfFX2SYN3cTuQb
         OK2I7tg7GNwID101JMo7+s9EQyls0ThxQuDzw+Uok6cylGKcDRKg4z+KRyD3d0MKQ8zl
         HCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411179; x=1789015979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrPM2Xk8RwUrDDJTGII+4iO1GsIG/syrGzbLRZRG6MA=;
        b=nBG+0toVI1WsiZ4aPwZFknnhjc5AKeViwFjxpSlNFHcUGUgp13PpYJYTVVz2R1rr5t
         B2WkluSGF+93XxwoQZY2pOcP1LayP7vvEemiKAjCXctDtXb8aIcsan2EKw2O/CQUDUuB
         DVo+n1QF7rRjMCp6pgT4s3z7B+0lQ04hSQwMG2xIpGbm97LwSWo16+oVarzpJSogEDQ1
         WNYLwKBvGvgsxxEiD4OxAmAUGE6E3vy+RlPdo/QQ7//ItvwLwBe8lcmb1NeSeuhxoFe7
         JqT2rG6dHTIm0z7GIQqSeLUmMbOOkgQYm0KcdvFLUF/mbWtqnJDPi7ejC4yk+swBCg4J
         fEUA==
X-Forwarded-Encrypted: i=1; AKwUvBw8tAkQta/9K+x7fH3QTFSz+67AJ9vk4kWGoWiXHLNRciovZfKdXMwfJWtBEHqpzTdS39jZTRGQV/Hjua90LA==@lists.infradead.org
X-Gm-Message-State: AFuF++nUDxIpOYfs5u1jBK0+WYbDgKj549V2/h3NSnFOZHdpEX+hJB+e
	PTCkNW/iBQxyBvsAn3XqKx8DYs7OIje45mXDAfez/G73/XXlSI35G/BN
X-Gm-Gg: AYBFou2DwdftIaKxSwJ9Ng8zRCic2qEbvhHd4hOEd0L3R1qjt8SGFtMwMgJ5wIimG7X
	eIqFvkvWkR9TzhllvwFsJNvBCtn7HkY53qAlBDG+aKJPmmT/d1aL3rjk9CVcGlDXIs63p2q7ckl
	yfrUooDce2Q81osgnUI01sP0G7MKiT6VvPTGWeKkNPIXcNFxKuE9YL5JO0PVzwTMHqYPi5YTUDs
	bZS0x6jQ03NG5JT4YemA1cX2uJZYQ1uyTbCQSGy4iXPTbk5PaYk6U61YCT+UDDuS/LfxnR9PS3H
	iWj8WbFD6VsRDZtlWyDwFEvuFL5CoGDdN7AyDRqFi0ltlek/VXyisHepoRSpnY2E2S2r2wsAhEe
	UmUQESO0FzQky0z3iCRgRr4Jx4K+jLdHVAc18MRVjgBFrhJLO9ugeggHX4mluaF+T9tpT08s8nD
	kFshqJX1fpWmHYyxLFDmr2N48Iqo63O6ayn8AzIJsR9yeI8wFo5l8fPjF91lrdkuqJNCP2MxiE6
	9Xzx9qWYmPpwBhUBb8F3FOXUrjGfWazR30ZzF56bUzFRp3dESSTa2eWDFv9WaO8Rr67+4b8H5Nn
	88fL
X-Received: by 2002:a17:90b:2d84:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b132964ddmr1173209a91.11.1788411178721;
        Wed, 02 Sep 2026 21:52:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 3/5] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Thu,  3 Sep 2026 11:52:01 +0700
Message-ID: <20260903045203.175337-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215259_627936_43570787 
X-CRM114-Status: GOOD (  12.64  )
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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
Changes in v4:
 - Add a Reviewed-by tag from Cezary.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index dd1a5925af96..06556689976d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -376,7 +376,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -405,6 +407,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -430,7 +434,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -459,6 +465,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0


