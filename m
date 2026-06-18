Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3177CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=; b=b79KJw2smp2LdCMgX+DGikHxlI
	o657D4QQe0SBFfvuB48OxuNUZYTy286kOXMpv7lthCjEsDvZJWy1trJVLvlMiHhCJWKHiPiRHcTbc
	IigRfYiuTDOc/PnxdXSU0yze4PlQRYcrW++/7BkXj9V9q/nTtIPDhpsLUlGn7Fh5wPHV2fLp+xJ+J
	CENKNxIY2ZXftCAmCU8ahoSUX/cWlqHyoDk5GrRSjMT9C1eRGC7+pl2KiT6JJShJ198VJM4rq5Uzx
	pTYwu69436crj8haqbrl08EjaGs+xYHR3di/rPQAmOsK7G9gJVlvU0lGYq2X4TrnEzCvdQjhKWRIK
	biXCepcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAfB-00000001B8M-3oaw;
	Thu, 18 Jun 2026 11:12:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAf6-00000001B5d-39n6
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bf1cda2b17so4854715ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781116; x=1782385916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=VoRq0oWW3KPAq3AG6Ea3MNgYmYv8wGcce6zKd/s4GM215HAVssImjgX0n9TSNk3WBR
         HO2qu0FbesICqy78nL5qbT+7P0KB70LB+VwrZqMloSzVtblksp8TuY0iZPYAUeWyjfOj
         BaN96xc9ILIqtysuZe7TFmzp85WThtw/o0az4LephpAv53+vomxrV+FXXlioLd3anm/I
         MuaIoYlVPMw7fiPO7hywS20Md6vZB3I0ybGH2FmhXX2Ho4YwuF2mpA3DJLMTDxs9x49v
         AgFv8J1prxz8ufuMBtLmUViKC4GA7UHpTpS/fgav0k/4IVNWrzezaH0Pyqo7nUjFImIN
         ynog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781116; x=1782385916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=I1VSopKZ28Br36PwCJGKm3Wm4fvj8UsfsZDoIYoR+tOl5VFHT3hAfkVi2bAcV/v8pk
         z/FkVIBaLcEwIsKxRaLBJkegpoDTrS/91VrZWzibhFZ8ofkdasghws0nvzhrWdrP9q02
         Dqy+BCVFYdbkeUQzFyRT4aHan6YCyXOMBiHZNMT0WOveOLD40QaB501RZ0c+lHxsB50m
         YnZlCi/fVDaH21VLWYFdeoWtUuipQhQ7ZjV6zZG6ogGmH+j/oL1mEe8St7yXPbN/kORO
         YBQJOdNcYhLHf4v6QBMi4sPspVIMmf53erHu+cPB8sQF3bEVTWyT1fZzBGPpUVDGLIHe
         eXDw==
X-Forwarded-Encrypted: i=1; AFNElJ9Qw3I5XnVMU4CoYT6mzv4tExwJxW9ZxeiZhSkTw6V0vmyCWGyxsyBBohE6yheGV0k3FTg6u0GqCaSuumtESg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwscGd/vl6YgXInGjIG+vyvQ+OHClKTPIMho1b+uKr5a0HNmSYr
	UCj+XUJr78KDRY5ta85w57/yHCFRhRCcW0DSmwRVTjK9g/+u0xJgQpTz
X-Gm-Gg: AfdE7clH86OLucZDGTRDcpgxy2g9xQObesPeCgW9M/qxqkUh3iZ2z/XYXpcDR177fPk
	beWzq/r+MPGt8ny01K18rZIIpaNgInMRoh0/sT86HZWufIBeZ7HUo0c33e+weVlfmsSAgek+Cab
	Q4fPlQ7jkBTiiIjLhrPxAcKtVz+bar9R6KrqpqN62+fpF4ZVvJhyS5UYbH4tfSVyKRtGb3evDLQ
	goIMBaILn4JAfRBGDpNU9xMEa43TDxSeQbu9SMcSKOPNvRRtDGYgz5Y2oly1lxJTFp6uO8kyXUS
	0Kbae3NGSjR7cwpqkELgHZGTLo8CYSCsZA3dgpdro+1Zj8IsmpSkMnB94jF4BHw5Gu07PYKRW3u
	seBveaN6Rc6GRKzKWVM4PRNlRRIkpvmLiKWp2STYBfx+JdYTprfaeZFXI6PkiUqjSuKXwpIkyg6
	jdDDZ/B/K5OeIB+j53plX7X6IPzjXRhqU03N0MJivhm2W+eBw=
X-Received: by 2002:a17:903:3510:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c6e00b0e69mr29505545ad.28.1781781115885;
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
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
Subject: [PATCH 78/78] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:27 +0700
Message-ID: <20260618110827.232983-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041156_804091_1A469584 
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
 sound/soc/codecs/wsa883x.c | 10 ++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 468d2b38a22a..7d9e0ceba461 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1237,9 +1237,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1289,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 6c6b497657d0..89c560428a9e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0


