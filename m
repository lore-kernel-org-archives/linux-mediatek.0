Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1F7CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=; b=Ee5UJTu+O9sfca3m373BsPRvgx
	1gBlfeLnU2C2SFUEQrsGILAs3KSc+dHRQXNcax3IETrm6RB9dvbVmaGwcMadzmwvzOpRDRzH3Z8jL
	J7R2NndEgVNUxRMz/fFRL7jONAZKNYM8nmUpXlHeXw9wdO2KlWUedQZhrFSmnmwOm2FPRK+N5NWBr
	6zcN5t53+vSJ5Y7q9eKSz1UkETLC6gP8hZaPP3MFNhhMO5hSJkof1lyVbxCSeiiF69/pIoe3CZe/Z
	9IpLDlXHJ8klhNVIeTrm2AkDje44JcZRM/bJWrR8jHsZoXTge5YwTKoxW5FYfNQ6heYfRQDvKdxlH
	czLcc5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeZ-00000001AgM-1DsH;
	Thu, 18 Jun 2026 11:11:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeW-00000001AeA-2Bl5
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c6d3851e09so4670985ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781080; x=1782385880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=DO/HgyDVLQg1hszxd2HclcUYSFLdCEYOIg7N5EFbIn+wHmsbLV46cTgxsy41sUmX4S
         uSgC9YcQzGDbRJT7tkLd0k5QkGd95dTHmh66eJAjrUJznXrAiXrU39Xbzr9E0PIMRDAL
         UL4S8LunHHMDzlbqeDiRExO+IysGo25NzfgEhsPceE3DgtaXyg1M2yjsarp1M1zssNS/
         mAHgm0jB9WOhUUQ/tO+/e48Hl5uwpW23hXcILLpVDgnBdzpXME+ek2TDqhDUAe71DYoN
         k4F5nwTOnbPEIjYc37cu2ItKaCM5DgLtzDIVx60+h1PthUlPTj2xSnkZcMfMu9hC8Cpd
         GO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781080; x=1782385880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=L9lKQHFoh0Npf6KAMJO0oY7yOjl+pIWrfseHfs9qQd7rapJBi7vbpEe+Y6TQQLI7hM
         gzkoUvVnpgLQNiTUERK2U8hVF6JWATp7Se5ev+6/1RpKn9PrGm4E8Kg9sw0dMnD1slEx
         4Zl5p5gcf0PPrU3P0YrwChMKbYP77zdx+OMLLDQkL1EBq8QWFAb1AFkXyvsiOpKSFAef
         Xgd9uQYlyBreDBcrah6HfV6RknX6fetR6UHyklr2Zs3FJhF1sl2q4z/UqACDmQLG9mPH
         WuyRpk4KkC92MDnG3j6mZCjCbAIKGJEKz4OCGGO2B1MLkY9+AdDOzygSZ64Au+mcRndi
         vXwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/E8FneqaRfUOpNmVyiOok6l2hyfFYmfWhjR+V1TSnXjcB44sSkyU6GVS0lUYQTD5FEHnebiJ2fiif2nJ+hHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU+8rV9LK8gRfrwX0lL3WLD3/30QmxL22UaZVYPBfqDAHRVeK6
	WztYQZEknABuumce/ujrfKM7QvWS/4saQPmCk8vJyJA4uE0y+lCNeN+1
X-Gm-Gg: AfdE7cls/vofE6r/WtswVutJlt28bO2gv198HEnkKT0hhzMZkv3rUvMbrlmE3rudh4u
	ITicvlmqupJGljqbcvAz2j3weIstBMR3+4JWrNAqnGOHPBt/JF8LTgZlLKnf0tSh/7OFr20Ma3S
	r4GurFVCgIZx+t9nQily1Saz/qbI1Atn66m25LxyrbOSA6zwXpcap8yVe0WqhNBaER67qCvG9w+
	aP0NX+iEPmk2gzoa4l1V5yptdsVFbzu32WPz8fSDJLqnWRCeGRaTYCoQgm9Wemv6q7g9KrAoNN9
	JSfs22p5hf951PYimMlquZ9TuwFzs8unBstut4WKagTyekAXK8kXjh7qNZudfJIwXsxJXWTIT7s
	9PAmWEkY5LNqzi4usIFeL9dRp2+WeVOFtWSaq7KGtDFMFtyz5VWsVoPW8PVm7bqjajPLtUgpQX5
	vWEGRO19G7M20wmc+O+j1RefMw3FovXGUJzLolOcw0efema3s=
X-Received: by 2002:a17:902:d4d1:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6bbf99280mr82302315ad.7.1781781079841;
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
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
Subject: [PATCH 74/78] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:23 +0700
Message-ID: <20260618110827.232983-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041120_564606_3408CDAB 
X-CRM114-Status: GOOD (  10.46  )
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
 sound/soc/codecs/wm8962.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index de18b1f85a32..6389990944ed 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1568,7 +1568,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,7 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
+		return ret;
 
 	ret = 1;
 
@@ -1587,9 +1587,6 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
 	return ret;
 }
 
-- 
2.43.0


