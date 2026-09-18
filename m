Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB9BC982DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=; b=MpZ28foAMU5hprl8BtRWPFeKHP
	tyjmQfFj1MnFbUqQNoJhc+R4t6DtoKGwDyd5Z+2X2yj/gH0OE7TjKWKokUtOez+d0mvo4zfjvjaGc
	fN/HmW6x5HiaJTv/Xcq/1k/T2oJ0+V7qFpqfYK1l/nd2HnbKw7pVlZPeIhfHQzSrZju/838hfOvUZ
	bIvlsc/yCco19Kx+Uox4bh0tbprNOcy3pCeLkDVLitaMjwJerHtieLxY58Zw6EqKPMNokWwrt5bPt
	QOD2kLe626OlnY4vL7/ycxtlrt/s0nfINU6MnRjx2rbtN+dMnLDMKFlRdtxdNhL79/b1TEb8Xld2L
	o72rvnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpY-0000000EbB1-2Z7M;
	Fri, 18 Sep 2026 13:40:44 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpL-0000000EayG-0Blr
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:32 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398beb616f5so268428a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738830; x=1790343630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=H7r+VZMFfKrc0nGMZozPxAzU9lLo4n/Ld4W7WzcK34FIVc9lDQIi1I5WyA3836kNKm
         WeJcs3E4ff6p9/TNwCwr2oeZRVLbngefduantReq1TiDpZ7269GQF/kNqRDrWGI1XmTH
         pNkIRo1RTrgLW7o6yd0myxnTD/SsYoHa4+LhLdT7rwh8+Ackq9V7Etyw0J0ay/I7FhPI
         BjjGLZdxVRpCZDgnkFN0MDhmRP/uRh47XpNDKtdB+Xuw8hM10gz4yOWm+vWRWMGe7dqo
         JC2By8cDnByJWOPcTKAGFEtfAcXkfKEqrWjHKad2G5GPJcXcjkuyiJg9q+DbJW3xbX9j
         PQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738830; x=1790343630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=aqDF9wG3f2Hpa8DsFVYLAQxGSYG7KXFaYVQP/VG6UxsiwH2RqqgnPJeWufusfgyJjP
         4FNgbArbJDChkaxTRIHC9OmKl/K3fd7+PewijqarpjV+cByuca+pChkQWAY9sSzCD8fC
         bsjDJ9lsNC8A14qNwB/IL+46dEaqXwB5HQharKPjmzCGukf/yIJHg6/iifsAC52DzAoW
         me99XtQKPpx402Gp/6HBiMvFUfYLesm5cvJIGd1BbKaX9BBCUd5/mFLe5Z9kafclLyeE
         pu26gPxofhYRxXkJXEti5lpW+ioWN2WTcU6g1Hi3pvWnh9Q+dysBttuEAps81o9SX+u5
         yEbw==
X-Forwarded-Encrypted: i=1; AKwUvBwSeNHN/h2uSCvKzOTdkE2d1GZD9fYPV4/Z/rp26OCAcDsk7aCEfMgu8ijlF+hRE7IY0QDCZM7xN7Wf14iSlA==@lists.infradead.org
X-Gm-Message-State: AFuF++kI1XLY1mHc9ZZUQqyzX4aHfp35uxIH5N50rl6VieowbxpfUxTz
	5outWS0xRUrx5DyqlM1JFDYbcAkw6q6qttOPbYwf4syKikgmxynrOdFn
X-Gm-Gg: AYBFou0cGVVsRc8lU0umI/0M+84mXLz95Sx5SS2tPtFWVPXsWFg1EtnDICBe9Lo4NFs
	iin1hYqY7DQ71NKqPXm4lzvzBO+7F6leiSLD8k0ArRGfR9nvjmYWrlR1vKJj5D1dKSxILdx6uck
	g00Y4b6uDjkMI3nZQb0DjbCXEev0Ufj97S3vfNpaPzG29hv46GXxZifltwb+wGMKMN4wHd+WeTE
	5WnTCl5cIkBmMaZm7DimgHG+vECv4bsTYcGFu+KnLfp18H4XOEtr8n5KbS9wJmdCKE4Rk6SqjlV
	dETGKJXdE29VR/Pi03mPEEmbgOvC1Gfjvefl24l7CO2cl+cnQ7FV/1jrwegs8qE3It0EAQsIWGU
	kL3oNITwt1YzbbIGy5zEZDD4c8cfj8H8z3Xjd/tj/W9ffjxasw/K713hyTu47+HHyeC7AXl5KAd
	QLJUZOfI7iRgus9gxROD6TcJ/ET3SdCgtNXIHg2bROBHR2mc6htvfzYRgfh0WRUKbX6VmnQ2/72
	PtcEEcaRszcXtgZlAAoe4eFjXuX5AD/u/x2HoS8BTW0Buoxl2WoR3k6LQOr0RuSQYBpR9Valm07
	xem/2HukR8CmYg==
X-Received: by 2002:a17:90b:3e47:b0:39e:4c7e:bc7 with SMTP id 98e67ed59e1d1-39e55738568mr3739571a91.21.1789738830398;
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
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
Subject: [PATCH 10/15] ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime resume
Date: Fri, 18 Sep 2026 20:39:06 +0700
Message-ID: <20260918133912.133799-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064031_090732_5420033C 
X-CRM114-Status: GOOD (  11.09  )
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

Currently, the return value of regcache_sync() in
mt8192_afe_runtime_resume() is ignored. If regcache_sync() fails, the
function continues execution with clocks enabled and regcache out of sync.

Fix this by checking the return value of regcache_sync(). On failure,
restore regcache to cache-only mode and disable the clocks enabled
earlier in the function.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e4ecd23df180..5aaff5bebfb6 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2104,7 +2104,11 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		mt8192_afe_disable_clock(afe);
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg,
-- 
2.43.0


