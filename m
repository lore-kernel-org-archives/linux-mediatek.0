Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB0BCD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=; b=EMZq9dg9b8tnk/bLGFASjWR4Ql
	ZrW8o/HZCdN2z+U96vl6yXUjw2W8k1ZLVhhG+u/kn/tU7wTJLIN4xAj++k4pAvp5dn8H9+09MBH3H
	jf5YYdVUMMnVBXPCJU+h0swR5IU75B30f+tIRbfo+DRBWrDAzV3xLOwfeeZcZoJwQ28rr+doRa8P6
	Tt00qlPlHjZxF7aWeujlIoD09t5P7oVoHdOG3qxWH0VnVDRkL9WKkXBy9DV5EmW6yQGqGXuVylliF
	+xRKUHqAs/tipDiTwqNVoi8LpZl6pZTI/17nOtJBb7cD0y94Q7YuXMWk8guLcLoTG62hs7+MLwG13
	flWGZ/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbQ-0000000H4bh-2Fcc;
	Wed, 17 Jun 2026 10:34:36 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbN-0000000H4ZR-3d2t
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:35 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-30b6dad2382so6289689eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692473; x=1782297273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=o/ywFmy/dDbJuNXauAIMBcR7AY2/pX5wH/J9VFAthAcDQsd8hXiTm+DUCrhofV6hdc
         qsnPMTnaT8EwheWfaBD5IFlcVNh/aW2WgIevXNdLP932G3j2AMmmoixB97PRcZzhgY56
         JnEEHOawwtdmURvT9K3X42yiVXwSKPu6nwec6MgBLyEfi7a8y2J32ZBe3O6vbrTZ0AyZ
         eWq6DHKpT+B4aBz6VbAy2WGsj++sbZxLqJI7tJBQiEM9IbQdpyyWsPRQDCKxXsiBQDEu
         iY10q+KU8+quZ1LoooKhc4AAM6+i4T5bcSL3ezLdCkx+UoMLf8vR/EEnxsDQ1jgGfh6C
         nyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692473; x=1782297273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=d2jGIs7wkczx6NOBE3LcYn67QcVtZyBmPh8vV9ar3Tsx+b0skA2DJ4XrAjXQ+e41ZW
         Uod7YoFHzF1/dphYUlKO7wmGM/ZhzBVORDMNxkb+s4ZtDVXopiUYTOTVt9Bok7kffCU7
         RFVqGUmpYTGtVyLoOzIF/DgYTgWAnzPIlze33tWKH8rAipwrfI5I4ZqlL7LPLEzoaPP3
         UMGnh0fkYHKM6uubeRJH1s41yogO0EQjl+0gyaR6WeknzUyRtV1Ujka7Dgt8wjfg91kI
         QCeNfNVBPjQZS/UB5JTjiTSmOsMEbL2hMrlyDAja7fx5l5dlElG0yfqy9hxncpE2qkJc
         S+wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vG0GFIWe7ukZiXfVuuqlDYXVgXnG+Y/4SRcKEEDWmQuU5k5vmbRxRbYwE5vpE1EqYVTM0EROlkdw9kE+P+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2g2ND7SN9/Cx9xDISC6PFdDF8+xO8CQ0GNvqcC38yzXztOT1e
	GGIHC2mGnvkAUkq76wOBjcnhkVBYGTbPHQrRm6PpUIfWKBtBUu2HavH3
X-Gm-Gg: AfdE7cklNPHrOuMVom2P4gFj2Wv1shba4nXgqAWLJCNTxb+KrGMUXC4etp1KUka1I+L
	JZI2pZ5/A8U4+ujm0ZWL/xZ6IgtDzAhGu5f5Lg8/hZPUFztTtGhsln+9nrLNnnqEi+lOQ1zkdPc
	8UAOGnrfZ/q583buuH7JU4zDQsFb/12YwTbz1JvyqgGz+kbmwJDDwe1FYv4btObdEGFCDME7l93
	AWbpjf7wwCSwUbklStRSDhkjn4hF5vH7bnREkPQWE/WrSSMWkBRiimcpeRrF0WdDYrrKMORMiM2
	pKVKMyc2wPKzkftwynRgc2AsshUalYMEf0iKlLCmoll0grYG1Rx6eR9Txvwm3asKgFcHmfFgTIC
	SQmIBLdRZYFJvYwZMUEri802oUq4ZBCLXYdvzIEkqSVzJ6KAjAsNVDz3r3+2fmBaX/5+wzo/Ico
	6UTiCcfta9i3Vlc4IjfIcu8ZtES/rd/0KfvymVDF3yaWtW8yM=
X-Received: by 2002:a05:7300:2153:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30bcae21d20mr1485679eec.23.1781692472742;
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
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
Subject: [PATCH 10/78] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:27 +0700
Message-ID: <20260617103235.449609-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033433_907657_0776A59C 
X-CRM114-Status: UNSURE (   9.80  )
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
 sound/soc/codecs/aw88399.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..5691d3fd20b2 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1140,9 +1140,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1701,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1713,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1935,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1970,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1981,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0


