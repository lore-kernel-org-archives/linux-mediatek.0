Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48CECD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=; b=RNsXsVSoc78IyzCewserPd8x+b
	BE3H1uczQRRyiI1Yq/WjI5BckXpgKFv+WZrpyYmZzd74aMqtrHUDesQQ92127mFZkM/WLjyboSYgY
	dO7xzDWxGU0O8MYLJAy8Q91edCeLdJ8GP5T7qBDqIPBD/gh8KEoLBFbU0zOugicLUcppD0DGZeH+c
	oR4Ipc/S5541ZPr1ra/8TBPTR74Yn/cAoiHSLZDb1LbU6XSgvC+QRM6cFexInWnnyg/7CaLYQQy48
	plovC758DkkCFM3uBsB6CguyP/5hRV5cQuicXOCcb/rAO02OnGilyG6yNI3D8oCV+bTdXZLt+cQmK
	PmeEePLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAds-00000001A8f-3DIy;
	Thu, 18 Jun 2026 11:10:40 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdq-00000001A68-12zx
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bf22d29dabso5166865ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781037; x=1782385837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=G1Q71DFO6c8/PCHNsDPj4S+CL3RZtSSMy+rd7rIyO065MXw1g1dTFsAvzUhT2MRBWj
         TZ9hiq+MbDiRLhFQGiJpDGWKwphNy9zIDPSBcGPRJBy8zVylX3wxdgRyKLIF+xTX8cDW
         9Crmr+WUKju1BkdvhH3lfsZUgfi+zC2lBEJr7FDeAVIGiC8Pe2fU85LtOdVYOqCna9qi
         QyIh7twxIfqB0TaaxB/7dcuwlYOUsMNKKgb4g+YI99Tx3gNnnxHiC8NyeoWgmOWw0naB
         QQeZz5ALT0bf9hQbdKnKalamJctfzql40nIBfRMbL2OT3dJiYMsaGMP6mToHcAIl3f8m
         6trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781037; x=1782385837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=NClWlrDIdnpW9u6JMh0dldBixwcLJ3EvvQmBzc5ExQOLNTd7OWMR3hxbQn7xWCOu3r
         YG9xlXxo6/NGG9ohBQ3mUPbROvAjXWdAbdnD7jkGweMDXDYDl8uiADlQaVJ4rq4mbFC0
         uC504Qo7BkRwBXuleaDFqqDDeLT/AsiHsmamgHsomG+9L+sZNQn7vWWYpJHrCq9uRDDF
         lL+rOeiO4BsST/3i4xf+pDBOBj/nG3184jubriadygFXQtJOBC7e/DfpG7k0PnOpcwO2
         Ouztjo/HZrq9gES/TVJkS8SPwRR0vaJ/vR3fQIU1LML80mcdFaIDru6EYgoNXOKcylqf
         JsMw==
X-Forwarded-Encrypted: i=1; AFNElJ+7dwOKlkNvPYXJbRFglpWuwQZOYpW0atTDXFdttNCylbNA7Cj4Kjx6HE8f6JIZcYEqL1kR3ui3BqpTpYNbrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzSpabWuaM5jLpsbWVBr7L5OSpQzDeY7Cl/EkYNHrDnxyHFFze
	0TBVLMG8fXwllmo4wllDLiAJXlXHNob1ox8vU3satP1vUDVRs7tMVT5x
X-Gm-Gg: AfdE7cmtEBiS0SfJbvHb8LKWDGSwntBkopvNouLuukwjJ6fQAZvhSUad7+pE/PE64T5
	oew61yJEax+r+3mOgsxDFj49c4MXpaE9w+h51uG5oqKjk5o2XG9Q5rLIgL+Tv20N0azYercaWV5
	859mMn5Ver48qR5UTDlyvln8bciEy1OrQWZZ5fj6LgGcAnm/+nbpuCY3x7ilm2YiNujUHftUCrL
	eHpM3isJY2QLtAqkWR7/te5tYryYQXgdWGa5IrqxkR2n+AEtg/VyNMdMmmz1SkNspibf96YbfSs
	NNc9EI1VuXiyE6wf80UnUGjtGPFkuywKkmwqGSsTbSA4CmALkPt8sh7IeqeGNgk7RUT6gyHb7Nn
	t/rCVAjd5QH8CfDNe8uFb2TIXxOwFxQsuYKuHZnOTZfTgJ8m3ONetSLYxuzAbgejZ/7qgXPT9NS
	TLsA0HCRy//A9ou/OBaPpHZXxm0dyJCDYerIIOn+AztuF0jlQ=
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24378815ad.1.1781781037629;
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
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
Subject: [PATCH 69/78] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:18 +0700
Message-ID: <20260618110827.232983-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041038_290465_ECAB53BC 
X-CRM114-Status: GOOD (  11.46  )
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
 sound/soc/codecs/wm2000.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..775f138fdf3f 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -612,20 +612,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (anc_active > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->anc_active = anc_active;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
@@ -645,20 +640,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (val > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->spk_ena = val;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_kcontrol_new wm2000_controls[] = {
@@ -676,9 +666,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +675,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_OFF(event))
 		wm2000->anc_eng_ena = 0;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
-- 
2.43.0


