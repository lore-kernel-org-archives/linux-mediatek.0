Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B8CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=; b=optMbaXGRC6SJtKjd/8X2+QUa5
	mso/+Sk0LBvh3I+t1KeAjnSd2ihurlA0VAj11dLdtiRC0yyq2DVQF9QsE/WYzEIZAm5hrTc8bG2ph
	QNgaJQobspt1xpME5eZCGnmcB4mkoExM2QabeMAIoWJZrhy69Ulqn8sQVpKNmj8Dcnbq5yU4em3vx
	Xz6pqEaNmnohy8CwEXbFjzJJwPrwQxU+Z+u8GqmWD764jbsvbOjyipOV+LCCGd2PF4c8T/TIxpIX1
	T/gIBDUvEcGyVE46q9rhKdjWJy3WdrbSV1F7zmZdPcPPc2QAAJUvp/bvq+6sfx4F8+BZGFPe/VwqR
	2Q6JAAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeR-00000001Aan-2WWA;
	Thu, 18 Jun 2026 11:11:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeO-00000001AWx-0mfa
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c6ec0af575so3603895ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781071; x=1782385871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=ENNQaRNe+HZSVgM2hNptiufGSlYrxFZcpwJ4Wz0eGY8SW3BVVCVtomlP2/Axisrns2
         t2iTrv5wc8TtufEzPCDzKC+zeBwxHcBWz3XqzKO0rPo/npkgL3tH087FIyFXJwL+4XIC
         H2apNjmXTYya8Bispl7ENoNArazKcn5ftG/18gnBf0RhhkImBPGwcaTnidkGmw2GRwAk
         uGEqck5lhQAx7S+Ipt7Bojt3+815qHlQQGAylzGpTPOuztHeyRrsc9k2hSZytxbDh6CY
         7DRIg/Latq+/YlfMdLMDzt57cYndLExN1amH430AyrCZKbJt9deTi2mewfE+GQuNdApd
         1TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781071; x=1782385871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=UuQJVJh2oTwpYEzzaVAXX637pN8Dn4N7UdBGWTtRFjYmdt0EHPhCEngk/9Us9aQGak
         wnwK4/6jr3SrA+9GqQr/2ZnXMQ1a/jVvOuPm6TQaz60+CJxQ4AMc0Y7/s1LWJyNhk6xB
         9XS59k8gecHonq+0tDDEbO7xVgPQFfI57jQpXGSP+qcTjmRVfdhOxu0DknOl7060imH3
         LW0hl4QcFQhyHQDjqnJImEAXs/oZ8+VA63h1qJShO0wOWQ8giMGGHLo6AvgYo2mPb3Qt
         9ZfmkES/MpvmOFxVeNqZwZfdkde+xo2wbfXm8VZ1cYC+8p5DTJ2abK272+I1q1Z13kCM
         liiw==
X-Forwarded-Encrypted: i=1; AFNElJ+bHro8wxwCPFSRYQVbLFjtkFVJA6SFIrOsYbykwEvRnkZFFzBzozqP3EHmRxBt9SWutYjL/pAwzs/dY3EISQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWpVdyTV4IvyBZnlQm4c/gTd5qW1lqSdzAd7nStagjdlJ47H0I
	urwCvuuQj4E5qPjg/l8dnAV6+5P+vnxyvFKjW7kp/W1GpkNamdMrkf/D
X-Gm-Gg: AfdE7ckU6Y/48Z03is+Wt0Xeh79tciCEJw2yLx1w8fjsZfQqfIAgbwumTUkXbnSgGlJ
	6+iayGrS6NtL6DzUy2dfyxZajquHvquDyehCCOhws/8zNpnjMjdYAxDXEAPcC6Czm6zNxlgWIW9
	l50UqG+TXbDG8Pe9ytucaak6H5UEWvOErhLt5I5nOhyi+y5G9P4YO/tKw4+t4ItfY65OJ/ZL2gC
	demggbZBqJ14oATPeWNE633ARqCMR+9YiaejBiQhPl820OzY6W0hRcuRk6VksDiEww+EFPOErud
	CuBRB1VoI9bVdVdHP+2cmgPK8jSrZ+0+xUQcCvr9qv4ISBz2Pp1I3f14Z+q9DPfNnewzsvEX8lf
	O20nMTlp+eKrzqbUCh+uQ5VWyTIzqPuwaiDs0iiKNuIja7nALRhqYoJ+F1DAXlEd2nw98HEc9uw
	ZShQUim8IzxEkOL4V3KMZS6m18uB2OBYZ5qHiyoAUuRTp0V5M=
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr84967955ad.8.1781781071349;
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
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
Subject: [PATCH 73/78] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:22 +0700
Message-ID: <20260618110827.232983-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041112_269025_24D436E5 
X-CRM114-Status: GOOD (  10.02  )
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
 sound/soc/codecs/wm8958-dsp2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..b6e5f1beb2b4 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -864,9 +864,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +875,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +886,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0


