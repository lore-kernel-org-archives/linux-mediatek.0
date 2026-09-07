Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5005C79F9E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=; b=tDd3/V44XOnotU2zfIo3whKPzf
	40pip62LNP4ioroWYrYWCtzkniZ687/rKWPlVVFkKj7e7L8bILQR3Y/gU6kH+EMF/Rga/5fNv9kHZ
	dVea8q0nCaE2sGduia3/zWxVnuq2iptn0tGk3t+Um1anoYeFXneDtKSdD2eGwUOfS9zZWHheJhdpO
	zZMlf1qnL7stg96v8Z0GVHSwr8RpjE8YWTnGM2FAFcW/E+nRtaBcH6F+PB7rmPexiVsEmS0pVFIh/
	++lR+3kXt6FIk6EHE5LyVGr/lt5UeEOmEKOzM3YCBIwpW8DfN+z0cG1Iek6H6LxCpp3/LA3TwoxR8
	hHKKNy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4g-00000006kHB-3FK9;
	Mon, 07 Sep 2026 12:03:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4e-00000006kG3-1Hns
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso3539119a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782623; x=1789387423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=gvrehwo05iVU/wi+ExU58fSZ9RDVVPHd4SkMix2K1tJV5/ju+iQ6UKk1mhncIkxbY9
         iKl7+RYfpieVTgGc9PcBC1cnXSG/DQKHrOUg3OHHWCdxlw3sNJzk2DCQAcVgWZgj7Uit
         XAoqyrX9YQlLwXlBM7T5bQWKQ6TQfrnI2LYWJximBfJfVDnKRAsiI2wxc/F66vGMOPow
         qlTARb3sMXBkcCJ1SaThkVqpImql1O8IIB2CSi3dJVz020r0ZCj1pUhk1ldPBETtWqf/
         R2YUuv7NAaBIpHDx2PkSl1/QMmWdyIHVCxa19Mp30FgoBnYTxEvnxGXq/ApTojtGA5yz
         XHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782623; x=1789387423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=r+BTLHNHyjIm7iWn4o8fqDQpvWGHB7ct4g9G1eQHRQGmRuZZmbvtrQyjfgxpuHEbdY
         kdeN8UYvHHdAh7u3B1icBmpMA/Rj2gLIxHwL1Tis0Z2Vfe4AESg/k9nxqa+MxcjTdY1+
         ff2HAYMTym1XYOm3JWI6UTGgXl0SnDdPIoM3WSwdqnQknjAlYnBiNwU7kR/fCUUZ0VUJ
         2PopcRJ1sHHx3BkFA8kIRVhHrAA0qJXs/wrG+xtcjUJ85qFxVqUEKaceEobnoC8B6nTe
         ZniRcu79VfgWN59OXzPf+plpJFaJqfedUe21lmpNZFFouywV4Stej/PDYr+avJCkfKEp
         APYg==
X-Forwarded-Encrypted: i=1; AKwUvBwU62dGOYYxmhj1ZrY3YRdFZy4itXjkh1e2SQyAbCXNfUGPeKiJhEKh0t17Lv/XnjvM7ikuBfidlTLDRWhOhA==@lists.infradead.org
X-Gm-Message-State: AFuF++lOMTD3yO4xAE6xkDpnID2MoEQHihU3+UYhF9s9Z9Yw+AOw8aZi
	iW8FuP/EYyUYEaMlCMTxw1qHRb+3VKpLZ3Z7tbRAWTtYFgDrSkES35XY
X-Gm-Gg: AYBFou3CNb6Jl3jtOgyPCBeJ8zRdkhmuQs6FR37nnhoWvwkurWS62mGaUlgG1Temnk3
	Ec1U88/7huM4TK3WFh1YPUV6CzM6FgA1zx1G1nBAJoS4YCmp/Znu5+XNKMkARJBHedlX78x2Kd6
	AZz+h3TYHq09uqXZ3SU43c1FyRCWqfAqAshMX+vhFqKjFBeKc2dPACC+Ar+9WQJwQFJqWnewrXk
	2SF2feNBwSQkSkalDms9IEz5DitACeQY6qlyUGYEDiQ8dKApSqfJGo4ISQdx7iyrO3MSWblytYi
	hPpBRvl0pFSzsFZjTEEeRE5ux+kdV1/t6Fg2jEOe5p+dfuR2AvcKAYTJrllJ/tn4AFBRwPMLvRB
	RcjNxua8tni7FszYJrbLaAu1JWryNIbnAHz8+3sZFbharZugSJir7jMbGgetao73zuftl07cuFk
	wI1zQQwLa1Yzl6wpFi/XR4wbm0/+YSeUy7Jmzka/K4AwTj3TU2EVLdIb8jzDvBVtqer/Ex+IpiB
	iKJn5UKzk6lXcR6rxyiXwP/TfVfoVB3HAG/WdBcyYalh9qkC+ahyXCD062HO6PRIoxPnEO/HL7H
	YoMw
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr34312637a91.10.1788782623126;
        Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:42 -0700 (PDT)
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
Subject: [PATCH 1/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization errors
Date: Mon,  7 Sep 2026 19:03:04 +0700
Message-ID: <20260907120310.135693-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050344_355290_217A1EEC 
X-CRM114-Status: GOOD (  10.55  )
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

Use dev_err_probe() to handle clock lookup errors without printing
redundant messages for deferred probe.
Propagate the original error from tuner initialization instead of
returning -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index fc6cb3f0469e..42878c8a6529 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -416,12 +416,9 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8188_CLK_NUM; i++) {
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
 
 	/* initial tuner */
@@ -430,7 +427,7 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 		if (ret) {
 			dev_info(afe->dev, "%s(), init apll_tuner%d failed",
 				 __func__, (i + 1));
-			return -EINVAL;
+			return ret;
 		}
 	}
 
-- 
2.43.0


