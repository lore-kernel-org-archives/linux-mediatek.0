Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85912CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS4w4WHNmkcPtY5yr5niis0PAYXe1Ae3qWORsuW86iM=; b=mnhxJWjrbnrJWA4/WkSuTLeB8s
	98dQCy7HIdXrSdo4bHBP8OmJbbmmCmRaFYJrz3wMxYUfRb9o0BDIUBknlL3FRmustlQZeogE8o3x5
	4ERZa/bYD3kE902mm9TvZ07jqR8mNz26b9jKoCQ2/vcfHcZsJ3zk1FjmqSnSfh/NUMlherrYQLlXE
	d81F1IX9uAarYz1h3Q1PCqBAdRd+PJnn4UHNQFOvhpJHI4hwxIQh+ORXn7aWiNqN+Nq+/1LdbB7Xo
	9JRFgS19DlytRXjx4F9yfqp0tg//F9G9WP7q6VmvjppVlPXjAdOMW82sAOqVd7ubCHNS2mnNX+T91
	YoLC4Hqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnag-0000000H3yr-1fYj;
	Wed, 17 Jun 2026 10:33:50 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnad-0000000H3x2-3SgX
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:48 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-304f590dd91so6357455eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692427; x=1782297227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS4w4WHNmkcPtY5yr5niis0PAYXe1Ae3qWORsuW86iM=;
        b=hgzpWLS8Osau6YzGRJRGIElgWDCuC+0nVLXyt94hmEkFJfYgjEbqNTP1litlfug+Fm
         daAs1L8BCYGBrNyZAuO2kM56XmWD6XaGCsAaA2iY7wjZWfUJbEeg9ANCuYP7vKOGTGzT
         VTknht66eWh5RloNXmU7UfbY0BBBkgOewtrxQ0quvZ29KWa04Q+nUcuzpyE+H6tRLWu9
         haQbAvLgFFJU0oBT8pNeD17FKQjK4Ku+cIlmckw9DWyxOh9hJjTqQdsfFnBUug+8FRPM
         WHb1dfvHjdVpJO6riAbTAhgkpJn4DWlqQw8u1ASAm7S7Ygz33/LfD41ob0Tcs4c8l7Uz
         +Wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692427; x=1782297227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS4w4WHNmkcPtY5yr5niis0PAYXe1Ae3qWORsuW86iM=;
        b=XL2LwgZl+g0bi2VnpXd/GO/d2nzj6aoxcY7P6Hkc6Cp3DvH/oaJoAP3MV5HkXzagnV
         VRLpgGG5EqmVzoJYV5POHl8ExLr71+Yq3QioOhufQR8+uAGQMDcxgBaFKoc6POrhfOvr
         nFBhyXxaQshCLX0HeLcgOUYrZLqU3PCM30Gon4Njq5Bf92hdS3Uh/ZnkNY8wEkfeNoQj
         /twEStdNZmoJi5DY71kwWrA3rtTYcbe5vdSKMyTe2vfqJJRLWAjHUNYGuWMlhuYZfYVc
         7PpuB7/4WFf2IzHqKT7m56NAOMQ/4WO+T8P7Yht4ZXOTURX5LGNYC3+UdQtQJOw2/Kdm
         DHmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9a+1k46lkkgB1TbryPqOrDm/5yjU5EcgvfMLQFqqG6sp2caeySX4nvqm/vTQleX2kRjrgoAevRY45hanL3Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJM417O28Zf54W+L96sgTRuhWNY+MCqDP1qMM0RmeXX2PEcJVS
	52QEl+JJMNBeGmb6Lxevg7CJRJith+6K9mWeaRI5l0J492INNs6ZVzee
X-Gm-Gg: AfdE7ckiKa9tiCCvkeWVfIKPUHmhTxyTu2hVH0w0Hw1fAU6jGA0pujDOGB0jUSRLsTI
	iVMA2A07nSj/gboC4dV8nJYtjyEo1pQPVTwn8ISoKdqnqUKUqNtb/A8nDNC/rvoqUbJbfDus8+C
	XCjXZ2hCRM7U2aHA2hWbr5QeyrDoTbIvaVeAaEGzwWiIaeLhFvwwGWCL8D7NwC7bsaaTCGBwGpo
	Eu8Cs5fdw0WopzOR5j83/mfxuSANh1ZrEQI8A6ItDUQzt8WDuCjUvqu02Jt8OJ3A9BEIHWD+wdz
	GgBaouV/LPQcC70UIUAcMxZKA+mzsZgDiRfzeBxSAUwveVN4J2OkxlwhWil34Xm4gw4qqlRMtn6
	72iljYouLrB7MeFuyLIIL1Omd7az9r1SIsHbahA/jramEeQI5eKW5MMKNpv02PYvMnPR/iuUDu9
	VlLCt3bAFgPRUIC10wgiyeKNT8fiNxyBWeK5AAJstGt1LY1aU=
X-Received: by 2002:a05:7301:10c1:b0:304:de94:1c2c with SMTP id 5a478bee46e88-30bca0cfa9fmr1655914eec.34.1781692426567;
        Wed, 17 Jun 2026 03:33:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:46 -0700 (PDT)
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
Subject: [PATCH 05/78] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:22 +0700
Message-ID: <20260617103235.449609-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033347_868678_1CE137DB 
X-CRM114-Status: UNSURE (   9.06  )
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
 sound/soc/codecs/aw87390.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..88110e720f85 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -225,11 +225,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +237,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +277,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0


