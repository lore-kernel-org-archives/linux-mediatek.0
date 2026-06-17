Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF0DCD98F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=; b=x7FR1CvFk48BZ+am7IenxWQsEl
	k2M4J6Xyh6PUrttFXtI4D1a16GwHnjOB8YRTOzqdPA5s/47yXTrSZWqWDVecrU6NO36X2AVoXC4PY
	WIk7Xqf1T/JbWfwixAP6ccuI8Ir8anq4z98zhd+I9jKkXGt5j35yCt2V9YbZ3m19dU1xxTo9+myl0
	WmPmvihteB5LlZmF2KhT8TgGFzJAIBytrJnGjgXHJVbibIS9D9ShIXQa3M6I+mCQJF3gh83isSpST
	/FYBBLLNub0ORRufnKUqU1T6ySxrN155xCaQ+tzV+PObrI3BUdA4NcTd1ScOxEneCLfF0A6f98QF0
	F3qGSVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaq-0000000H480-11D4;
	Wed, 17 Jun 2026 10:34:00 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnam-0000000H441-3Zao
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:58 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-137eb0d76beso576743c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692436; x=1782297236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=lK0VQf98f5J41Lw9HM5XODlpWZxwXGKoqJw8J0rBeD42is7zxc0pRnZ0fa1XMAMtKL
         HqXnBL3j+Z6YZmoAw6FU1WumMDT+GRr/AbSiEjjz3VurZiBR3aq/BWMOruQkv32Trawj
         dKNj3whr2oWDdsdycsgGxZYlTdnOPymhD/Fzd1b0+bAciNTkliHjV6e8tSEBN7QHNaWK
         HCYtx2mPS4PpJGiPF3+KEsr09S6rDa5cbtG6/g4a6YTQBu0HjDkV54e/gmZrhy8hkjmW
         u4EVAnQxenMZFglj78pRiXfAT7AkQI1omqJUoqgTs79G73E/oiIEKcm1U+L7biZ0hCHr
         ikqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692436; x=1782297236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=INc03lhbbP+OhEX0hao27q3bRq8WZen3h5R2KG6x783rBgghdcqdGvEWHvO/hRhTVv
         6h99HIc0eheDIp/8z696z+HhjnVw/itcNQOlrrpdH7+fBt007oLMPiH/xfos2/Xadukm
         l6rI3gjjX9mUwFB/x7HKhp46l0ueWZNdSAV0GweqHfaIm8NK/EIJ4MwEIJhFhAWdOPme
         UxME9Pk5pfGSCTuFuCv9tNMHYuJQH6iUVFYkcWgHyfz5HEEG8sa3scUpQQulD5nU0AcR
         J7uDcIW7XM9cMcNmxU0KOPovclhmbsSRIfAODdWF39Id9pCTQPAxZbieUCmaNe+T4u1f
         iURQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SmqC3+M6AaKXIfw2VyJ92Z4Hn9UKfUigeDp5PusoG9MUqjnTqOWqZaq/C5JK95leMY9UWpIp9O9A6bGsNsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXK1b5J0Jw6ewicoIBxrxKJwMYmGRikyaQb41G9XgvHTaCc+EW
	6utG3lEBdsREwcNQ0SEwR40jRfOq8rSwdKbI8JnIFusVuLM1huLJQ3UK
X-Gm-Gg: AfdE7clg5SVxqcRN0VJkWozJ3h5UxrsstaY3V+5KAq/zHg4Ub2iLCHN8CiiWjQjcGaD
	/1atSkJHFU5UntINcJL085D3hu1BgSF5nbUCP6cy7IPAybbBTFe3+3f9d/zdP7thx6AXlIroa3Y
	uMwVmiifzQJ1Ks9lnbgXWnGP/QUSxLevpunesvf6HJ3yCaiyFYm2I5dmL/rZr1g/cGIygjWUw4F
	fvZ3JeMpAL5PrCEFeQV4s/y/YWpjnfev0xSTXlWVsISc3Aj/uU/UCQ7MqrUuolaiw5oTFCs1/fJ
	wJG2GFY4/qHMQCGgOhUZk6myrstL/tcKwMrtKXdypTJoYEiVkY59gf9B1yOzdXn0na2TGOkEOUX
	/I60v8P1HZt2fDyVkgA6MrqzT39n+DxpAFbrKWPeGx1lcSBJJiHba1lvDFNc/KalR01EQify5Oh
	sjCT1irEleRB6bsAlgLMrIS2Q+nM9lw9+q9R0ZJH08bTJz5tY=
X-Received: by 2002:a05:7300:da13:b0:304:56fc:775 with SMTP id 5a478bee46e88-30bcf567d78mr865158eec.21.1781692435786;
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
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
Subject: [PATCH 06/78] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:23 +0700
Message-ID: <20260617103235.449609-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033356_892013_DEA0A39C 
X-CRM114-Status: GOOD (  10.22  )
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
 sound/soc/codecs/aw88081.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..fce56a249a1f 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -763,9 +763,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +941,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +953,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1161,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1172,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1183,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0


