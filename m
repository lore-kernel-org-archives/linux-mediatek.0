Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F24CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=; b=nM1nbmZ1tNc/t23/zii13ccLU9
	qrzCKh4qmfnl5R1XiY5K4iEMONDzcvCiv5pOT58li7a4K582BKN3LnkKPsQClOeA+khb7G04yQiap
	/O9ZfH9RCNVs1thz/dZBEtT1rsjnHCWwjHenP6AyDWrFSbH3zuGFhKQ2UB9utfI0C1CcZFdh7iJmb
	kcg11iqeExo97whBka/7Ddb7sASt0VMtuPIFmNyf/5UcC6NDCZD2ZRgsS35fOD95rNEhwk0AeQCfb
	mCTlc0Dbz+SzD0rhbkfmM69pfRS2qrGbt4IsTIz7J2lRwcJU9nfJO7gP2UtGjFrY8A7dN+kTbcv2i
	4fb8rpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZni0-0000000HA68-2zS2;
	Wed, 17 Jun 2026 10:41:24 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhy-0000000HA3O-1Vp1
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:23 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-304f590dd91so6364043eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692882; x=1782297682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=ckoIiRtXOnd7Jy2wAFHaAJObzIlkOsAEtjQBcEvz2ddFP/f3Rro/JgQZBFhc/kHOBZ
         BYC+6ycKK2ra1aRQGa3c9+EhqxXAIsUXV8kSQdod7ZNF/sexIGxlRp2ULWGx1AJWB1QN
         hjbdOG5kxqNZV7M0dDAhx2Rc8ZmcFXDQVpOiUkie3DZp/J5GDdzMHGCUGnZkLZpLS3Gj
         04BaVHMVmM/1w/d8wQai+YdkS+DNC04Jya5G0UmlrbmezjNaSwN9sq1CAJwMxkk8uj7R
         J8Ewe4TSilfsI4qWWq+vasKCmbAUvLdZ4GqLNTY81vaVwlB/wGobxOiurxYUxLuXjwqJ
         LvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692882; x=1782297682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=TR1sTj9IPiXUkkeswywAfQNY88Vvr+h6XzaDl4Vk3kg6oJt3PQnT2H3zyq8WXak4G1
         5liPnf/iRUF+MZgUviMo66yfOpWqaHvrH5y9g/pIhBl5Qq63sqyg6J5QoHHWGygQBW2P
         n4FAhwyncpk1rl09lHJZ3BO+9g07I4DEUe0vgwgYDPKPMHN6/UPvIw0zmDN5Uy2X2WQx
         1Rc8G4co76KNQYVEAMT3g4nlSjWTAp0YSgVHNAQ+mY+TrUB0ZFIq3+T27Uq+lUGI2k7e
         3pZRrEtvFZB1U5v1DPV81mIaCBEWYWJpDw1mGV0rghcVwCYmhO7lEVbARfFU94IuRkxY
         t1Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZD5JdRZ5VakQqVRXCf9LDFno83am8cal+etMCVW2T7/3J9Nm4wvzAE2xu01oJKhN/GB4RcQAJorSATTQM1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDkRzKud2VMDfMOR2x2ijyUn777Vo+iFLwdaBupm607MdbQxv7
	0SxtKn+jk2r5Uv/RyB85nvlMjzCOP8Xj6POEBEVRnU2Nt8/kfxdWeYgO
X-Gm-Gg: AfdE7cm3P3l2Qz8U45iliAZufjFpegYDdemvQExAS1lJjiD54gafble+ul6DI1tUUNm
	81+rQfBU1WrqXC7dH6cMVkhY8AS8/iuWCkLLoHAuUYxtbCM1jAL4Fd1zP7P9T4Lkd5zGx+56Bl4
	k3/1zP99QBT6wOO9fjuuSiEJkv7mxBrqftFRU9BOQ+N7xZhEBDmbe6XznAwByHPvJND719Ltcsl
	SQiOvhoPuwOPxDX0qWf0xRUT1w028oTu/nb1QNe7xIlbgjngt7x7ijcow2EvnfaPy7AlFmTvB0L
	OScUySh3jC0cYXgG/HCoZva9w4rP28yho2eY2sPu7zWgz6FgGg0iQtj2qhS/C8GnJOoehddoEV7
	JoppyHUi6nBxXAjsg/deIeZ6Mpy05xBegFFsksinn7f0qDQLx5knBCMFuwDwC1oAOYk6y7VHdRg
	MVi3yMtlCSDUWS+cvxnfE/oDQMfC3l90tnLtXDbpx/aEF5NfY=
X-Received: by 2002:a05:693c:2d88:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-30bc9f57d3amr1910340eec.16.1781692881708;
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
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
Subject: [PATCH 54/78] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:11 +0700
Message-ID: <20260617103235.449609-55-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034122_402286_7D80563A 
X-CRM114-Status: GOOD (  12.04  )
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
 sound/soc/codecs/sta32x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e63..61703e6e0586 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -271,7 +271,7 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	unsigned int cfud, val;
 	int i, ret = 0;
 
-	mutex_lock(&sta32x->coeff_lock);
+	guard(mutex)(&sta32x->coeff_lock);
 
 	/* preserve reserved bits in STA32X_CFUD */
 	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
@@ -287,19 +287,15 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x04);
 	} else if (numcoef == 5) {
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	} else
+		return -EINVAL;
+
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta32x->regmap, STA32X_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta32x->coeff_lock);
-
 	return ret;
 }
 
-- 
2.43.0


