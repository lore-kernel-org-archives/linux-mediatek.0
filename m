Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024FCD98F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=; b=mVxA65nowp+1O0IyvFrX9HY55I
	0EIaZkR+d1FXhQiIWyf1jWBfHeeRz9MP9ynOu0MT8oW/E9ZA4Zxk1ScPjAHG+bI+Iwm1nf8yVrCcD
	el4jPBhrWEwhpoQjrc7WZLisDSWCt7xXVKhRGe3O+ZNruOY1pOEzqR9kiiGGoKXFMvjzjkhC478WU
	Xs4OAEoyJiNr0FTHXOOYR/LQ4HaU9jcTsNdYIyrbXNUB+Q8evqTdVh7nTXuJnZkeAZntc0JFMVsyN
	qmXq0svApwVPoCvdT43iZDEHYi0Rf28j/iPoy7G0dUSgJls5Ot9Fd7yY14Fmyjiqv97VauZVGiHUR
	6zzLsRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndU-0000000H6P9-3X5z;
	Wed, 17 Jun 2026 10:36:44 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndR-0000000H6MD-3Tk8
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:43 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-304f590dd91so6360193eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692601; x=1782297401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=gR25w47t4JEEw2uDJ2nu2p/eXkEp09wNa7vu/XI9brYs/qgI3AtiWEe4oBOMEP3/6u
         slbUpa6u2EG0CU1nHIJpM6QV5bCzMkeMMrgJ5cgqkRmqL2w1cUyod6yiL6VHYVlotOoY
         kMbgfdJGk+VjIuLP++3uf6FZJhtQjNq2VVJfwkrRR3NPCb9i72Uv+HuIlwp2SGpCOZZI
         oFEPVF4G4yZt0jLViplqT2vnHaTGcQQVAlKjaNAV+ex1uX1wR+zADOW9H77LYVkToDDj
         Pm2vnXtTQwi0fq4v+x1Np4KhZhPomBuUzqcco2kcsXpzSrE3ujhpYGNC/4yxZS6Q6T7f
         RaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692601; x=1782297401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=Jf4s14/qjfsvgIkwJ4w5k3KTn9V9Pk8vqGH3U2q4DXTlhxOGU5wKN7HluCwWYeYrpT
         qTsv20kVO7sbMxGWhEWv2xUoSuN9f1Rc6KZuUruJ09TE8LYST+1uPMdgCBJfiCluuuOI
         6uSZGx5bfbqjJCeAw2NS1MLT8zDVOrjn6IpQdnhEq51VFJnfyToml1QQ8apZQAkqgxHv
         48mYuvAb4RcsahUv83cn542mTE2XWw/U0HHkB9gc3klYWzJv31NS+mlx1XFPKHJGQqfS
         Xo2bHKaMyG0kQeBHkEAR0/xk5c0fCweTQReRd6ti0w2b9zb6yXH6ZLBc020G84BdDMxu
         RzyA==
X-Forwarded-Encrypted: i=1; AFNElJ9vFrEzQTjKUb9RxMXlk0viuoZ/7inle8Q78OYA/dRzy799qtvrWYhQdXjPRuNAj3hE2Rswo780Q5KHLHwhmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfZXwf3lnhG+AUVRbu9oIPGdfsCa6F2zjj7K1gyngEG5aC7Guq
	cRuK/dZ05kbQzT3pFwerboyDNm4xCB7U4v+jDFMZ68Vmb+6UVbPnRoLb
X-Gm-Gg: AfdE7clWY8jmm5yYfDHnvUCgHTQmZWGzIpbNRkIwK8EroQypqlBFaow5eDPoALM19+P
	u2mttlMyhgnRpQAxb1fVTcLmq/ZPiVP1CYcn96RK2IxJrK/VimT2vAN4r7yNZXwn3rY0hk+XCk1
	s2sxstsfotO5NulWrMn6k+KLewCSqfWBNriP7pyw1cMnWL0YSjL29QlrWy7hv7vFDSg8k5wuV7U
	JuktYvk7/b4vyR7ZO3CnfASiJQryaWvsRhnnYkmokh7sB48rA0PZZQGgCI/m13+ZX4edIrcFB4Y
	mIpNKHNUPHxpi7v48cuXJhKADe/G6LyV+aLJU2g3ZSG739pflbrDvz+jisJ2NzJagweB1ZAjvxi
	NjpIudqCTVfz0lhb1Goh0FoBe3tPSS4BxV4aTBAPj/iIDzKrd7WMC/EeO1Qh5XEdx5VCVlTcClT
	DZLCVe9egSrk950bgPu0j1pKIwIF6g8B2LQQd0BjOQE62ohng=
X-Received: by 2002:a05:7300:72d5:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-30bc992dbe8mr1692072eec.3.1781692601209;
        Wed, 17 Jun 2026 03:36:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 24/78] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:41 +0700
Message-ID: <20260617103235.449609-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033641_890121_DA25E36C 
X-CRM114-Status: UNSURE (   9.56  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cx2072x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..93fbd21dc51c 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1408,7 +1408,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1434,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0


