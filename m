Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE41CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrGTC5BuLCcleWlyDxhfzmeV1rXl6zWQpWVZTTauIJk=; b=a4n+fU3UK1dkTc7rNwd3uY73Vl
	59WI1B5UNPxfl2HrAAuWQ1JPvyWlcNRijH74MimtSbf0PioPjoJW9HO4rZCfX2fvn9XoOD/mYysAy
	9Hajmbff1N2YDeRM2GZuuq+Hvr2nfya8R5hq1Iq8Qd7JMPZlixnLr+xM4ZespTtrsWvOckC0jva1N
	IfLi9EaCyAMKe2ffcL0PlyuA4ok3iulmtSDSX0OWYJ0vrrTDsEtEThturTnzhxaD2CtP9TGBB6LK0
	twguAOzUfAcbqI5EoGE2GXh2cvHW6unvFeGuVOLLKjr89f/aHVkYmNgfPoOzE5WLUKfJ9AT1S54HI
	5R28QOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnay-0000000H4Et-1Iil;
	Wed, 17 Jun 2026 10:34:08 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnav-0000000H4CU-2pdV
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:07 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1370417c01cso7254006c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692445; x=1782297245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrGTC5BuLCcleWlyDxhfzmeV1rXl6zWQpWVZTTauIJk=;
        b=bzMhHCMd8W2gLgSEy88tZbEZSvfB6kKDW+wWI1blZtGBT+cghjoV2w7oHFYhBcty8l
         umAAkpF2QGDGm3V7ZHiYrtQxdG/3wme1P5Yq4ie+pR67LJOxb9Y92q+K0LIiaoiNGOr4
         32z0uh86td3dxqZ2VVsGaz9kFD/kOBJzRcjlyyrSPHSKyLknRsP/UHI3ntjMUdH0tTfY
         QtxAvG3rVeoCR2s/6AFx9cw/WASbyNF4kunQBnrGjeA68tlKlQucx5H6CpdHD6V2J3dN
         U7xa/7Ejz7T/WF4KPSyBTVG1wa9EWXrhnwfk4qTzhIgveUI64n8F5+rH9S5BN0JhytVd
         CSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692445; x=1782297245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrGTC5BuLCcleWlyDxhfzmeV1rXl6zWQpWVZTTauIJk=;
        b=Wll3pddzv33X7gG6B02dA1nEknWF3dSuTq4Nm+i19Z7vplTioN8TQ7lDEsogi9PV2Z
         jN1m3GQl/CElwQgivqKfEKlP7fqmSbUkK4GQdmxyrrcq6KhMwJabrB2uQrPT/3C9JwLh
         U3IJzMHJ4Ig2ipxdCM3wHHCCzIDLQB+XyEt0a6gvwCK0Q3MXSGrJfNFb644EK01GbjT+
         b3z1BOU7ql25aIgrvLlwtq1EQ/5ChxeQC4ASOuTnOOYNtyd02FKWrcet13pDQ69eOxm5
         ql+PpQUUGZXvvUHYETtV8JEi5BpfS5KlEaqFI206q6Fe4ybonwRlnt2eo3YRvWKfgBjJ
         NdDw==
X-Forwarded-Encrypted: i=1; AFNElJ+TR7JXbd0sErwZPIpV+u+0IKPuOBEjwhHN79AzOdhDTr6qE6jsxJrgec5+jYPuKxy83e0a47c3C/upN35d2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnPAbo9TZjWIpqFus37J6Dae5rrBHHKhNccycaJJIxNcMNfoff
	LHrIfJGdnGX0Kdgf8NTMFRubI9EkQ2rmzhp2/N6QWLb2QI4hlCbFNayy
X-Gm-Gg: AfdE7cn2Rlb2RUzfss42IWqzPyL4awGylB2QmS22Mv09/JND/4E5b1teE42ad0XcuOM
	147nGezlgvN7yxhfQSF9WHGewKL3Bkln4HsSiejUfv4za0dPFfu7t43MyxDLm6VKz8MquvpMOGe
	Vn40PQ6oqEEpPVYPTEsIslctDKuG/MaFKaGTjQnohgHcGG0z2F/ZbNJUylJWod1X43ruKwU41Im
	iCjCmsOqXus2TRLAdLgIxzinE5xI1NogFJa3q2JiHmNhy+agGJbkmhpqrNMa+jrmpIba1GpC3z2
	xk/hjDTP4vy573vBxfUr7Oji/FlBIeCX5sP9YMEn7w9XAv45TqDBftnQUDqxDt8DY/gBZM/fweZ
	R3R+5GB2Hba+oq1ExcMgiIg4AkxJfn1UU/bHKSfhNR3EDDhvZERqt6HIXTSrUWVrHhuU7fBNvNt
	2Fzn9AfSo4M8RbEtS8x9+iL201r2Pj4H1sKZPCJnyGDHSyNJE=
X-Received: by 2002:a05:7300:ad24:b0:30b:c502:23cc with SMTP id 5a478bee46e88-30bca07744bmr1769706eec.17.1781692444831;
        Wed, 17 Jun 2026 03:34:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:04 -0700 (PDT)
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
Subject: [PATCH 07/78] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:24 +0700
Message-ID: <20260617103235.449609-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033405_749915_9807E78A 
X-CRM114-Status: GOOD (  10.42  )
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
 sound/soc/codecs/aw88166.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..aa37d1a3d1fa 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1173,9 +1173,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1412,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1424,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1603,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1635,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1646,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0


