Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC40CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=; b=J4t9iRwABX+hyx4DU4xnzae2Rg
	XNOR3w3bkumlCvGTJu1lI+/Fhs6iq/irXxkY4HzWBMXqGtzW2enViblC6rNs59zBlIpnlsqYhKFmZ
	sQAnO2uTTunjTj9LVChSIgY/O2kYYiAxM676NSIwdSgdsG2vc/vnJ75JWBcaPu5c/w+PlmUgEq/WE
	yhJ1xgwHlohPhDvU3Tu7HHoJj7+KsZNyghixNnX1MNWnbhX2IE9TbIpmde78iaPqxBTTb86xTTbYt
	LdYB42yJXsbRQFNDYiJabODcVdOZIhE3I/s+vIMXMGwJKycFFe7qIL8VpvKL9TzBqlBcUYP13BJJh
	uHhlg2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhl-0000000H9rG-2lAu;
	Wed, 17 Jun 2026 10:41:09 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhh-0000000H9of-3UB2
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:08 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5794270eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692865; x=1782297665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=VF6waUukMALBWIigvLx00/g65C7WcdGSVor0Ppz3kG3k5LUHjMzTPwSVfzqcN0tTRR
         u+G49CNsJQFRx+UrCdnNbuKTkh+Ui0btiv/DzsjFUSplLGSmI93jSozAWU1EGyaobX+3
         G/Bj+Z5TqjfNUPoMgz8LD9vCJFgAyTPUqHvUqspCIuQw6PjFqfifiCXkGVqZXTIIduJB
         2ofizqADfwnZuY7+f/RLW/+Ura6tcEVUcybFvz6opsHZD20O1fy6Dn51lQnXT4wXRD1f
         AbDWMWl65TK8FH+CeMTh14nz5A4zrSgHYhdbGk7v4b1fgq0UFoWjoeZBZjdFNhp4+Uak
         903A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692865; x=1782297665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=CdWK4B54OWmDv4b5zU5up9aalbW3b7E9OMdPbdopMyrytMuHUbExGCnaL0qwUiOq3e
         ZGYNiOTVyZf3fDvBfGj2kL9ztqX8eNN3PtzBvpQ0c4eYJQtfp3edU8qPgDwkd7/Mg/GI
         QRQHIGMjZvV2BfB4TjRVY7IebioshQPJgS9o7APugJwEkXMgglX/z+KLr5s/x4bjXe5O
         4iUwo3u0vhLeNfFbfKg+VFLBvAhG78EMcqqx2XATzqa6hRV/u8zmT+KwVh+fMuk2+BUD
         MbwcT22nKIKLPRRHc8kEyyhpgmJtHDIzY+g8tXxwzVrGkN+ck9zLLZOUkoYbXwCdp+2P
         KXkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Uvr8R+TZwNNQuETCCnajaCn7qJUIZKgW/d1sZTM/aYgAnUTgfHrS8zacJDHRYmQyYZ+fp6MTgm/62QNlZGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzl0Pw8gzGoJ2/fvtBXgYulqIUoiNElkbr83nPiJc8WsGUH6Vp
	V2PxnWG0lIIrG9HNiGjxhgQKV4V2ISk1YR90BtwHztWYIzFgA7sTdZ0E
X-Gm-Gg: AfdE7ckr5HrTB8/S6J35Bj4y3trYDa0k3YJs/OGddb0c9w5dQ2kXvD5Ym5Ko2Mwn9ke
	PQCkNahqUkLf7AE+Imj8WxX0vF5ZcS/+yRpjgfattQ802h5pZ+v/9NWTnt4JcoFQOoeCgbYoZiB
	u3vfVrLYe+4d6i0xwSZNslkqvtPkuZYB4u7M1OKj4uKnfJlN48+b+WIEXfgO5rpePce/EVZa846
	L2s09VnavX4fMuzJ/V1DXizC5p8E+2I7QOe9pAP6SNZ11biGBidIR8UJC4oY0MnyEse4XM0BoX4
	TiGvBLgwpODHhS3C/mudMsv3i1y52cLrPA3JTGRnIBYmVMSD8Th6/9Tgr9pxQvW+n3yHQ1zFM2J
	t3krowXjSnOic5BInvMhWsvc7INXjWecj89jIS03xEsXlmLpP+eq6VAY81k9rL4AyKNCYn0hR/S
	ETmSLGlrU977wgZRMnf4jo3sJIY2GOWLmpsOT8fis1oshXLLL8nFiyGGgOtQ==
X-Received: by 2002:a05:7300:30c8:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30bc9df5a44mr2016767eec.11.1781692865129;
        Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 52/78] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:09 +0700
Message-ID: <20260617103235.449609-53-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034105_888198_3E01035D 
X-CRM114-Status: GOOD (  10.73  )
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
 sound/soc/codecs/sigmadsp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..592aba25de11 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -135,7 +135,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +148,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +158,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +172,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +673,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0


