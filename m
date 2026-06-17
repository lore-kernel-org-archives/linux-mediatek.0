Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E0BCD98F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=; b=zSN6/WH5GqVoF+NucyRlLM94Ky
	jKR+mbArngDCfPjyU+jedvDRzAnKohqN1N28d7d3NwPBsgEdRr8D7QWLS5WHT0ZIBnhDhULEKzCB/
	h6VXjg7DKtWpUJ/c/aDsXeBNm5SlBO9qcwWDcXBqMnSqFKEA8cdKbgnDKg4NkOveeO1FifqwJmgmt
	77TbPwRh1XUCqeFhgA+fVRq3tmralDnTUHBV451ZfbgN65rUIzo6cRDSrmWPqLdJOELTYiawlKpF+
	z8nrVi+Nr7kzRB4VFwqTrgzAcWokGgVzPixAxVrYHvfHxxXr8qObPQWJ02drlmOajFmteL0Vu38VO
	2Ovl/LDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnht-0000000H9zK-2fdr;
	Wed, 17 Jun 2026 10:41:17 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhq-0000000H9vt-11lE
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:16 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3042a388168so432209eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692873; x=1782297673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=SBCbQY1CCycF6C+MmQ+2h4zWzffx/sRTfJFal0QbYOO+nrCliIEcc3JIc9uDkRRdW7
         lsgoMdpfxHESJZi+X6X5FiILvGGEVLf2VUVwcko4ruLdOSm+26+eK09EuUWdFCdMA2ev
         fA0fQuiea+q79D3HQ3IUUNTVhhveu1L9o5GnOi5MF4QuksXqdJl7nWe9qPaE2UxxHcL8
         lcH/LQN0LVnfGjEAZ905oXTbaHzWUkUKiv78p0noLWzg1rECy0ITEfmlec/u/q/cb9EI
         bg4SvvfVGEZGs7HHC6pMDYFayf4a2SGYXcg2vrY7LH3PTPWiZO/ymXSJfGTinBAQAmAS
         4Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692873; x=1782297673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=HmUzPlu5tWy/6DPPzRzVUWHjhjsnGJI3nQvoTiiKeBkGP2XcNGfXrmSvQaecufHfWo
         bcwuCQdSv9C3SasPPcsa/QsawQSj0CrXkffeDzAQSKqIkM5kWx0uRbYOujVnrnW8gjwI
         618enhTzkg3YRlM4Iye+ZngTcZfm4UmwXBPsQ3hykT1jeQ9ZpgEs8EtaFOtJRmyxq5qW
         DD0FovCHoNSP6udb7XWKpYHyQ7Uk+/C69fPDvDamG+jOqG4FAS0YsChn4nDdsNR2OWcH
         NxjpN86YM8JbVOiXUrSYYxQr5Y2IKASPiUuMmvp4uanfwgyovc8kFy+EL1ZIXc0fDLuW
         r75A==
X-Forwarded-Encrypted: i=1; AFNElJ+VcsFBp3ivBtNcJ2PoYgnuWgzzAXtcYGT/IQtu/oSbfQCtLPLGEdzHZalgjI/wKqiZzeLuYAa0fvyNhYbb2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyktLfR5shhAx9r7WSnqSvY873/lsGv0e9b9g5godAzZx+Qox2+
	geDiiN3aNEsmM2JrcBOvDDpQHmvUb8H3CCQgdKXrtEXXEBzoiysZOTJK
X-Gm-Gg: AfdE7ckRjIH/mF0N7bdD+v8oR5/oKT/907MbqjTqVlTADr2+vIP4ZyMGDsvx7Cl6QiS
	nxYO/znT9sXdumqTb2g6pClfKDathCkvwHDRnzQRXurp9p/nu81RGlIeL/ksqD+yK5Vkx5P0fht
	VDI/u5ZqkgvKNeR/tHPiBTP60FSWJTVDiiYBgasfmifMHhliCaLYvzod4WLfSMIClWWYCJkMBmi
	oTHO4bpRRIqMRCZc20inLke2rzzu0C95/48PWj+uHY7UwxPKljf8MDSozHT98rmmjqu4o6bsoGF
	ZbzBBjTeBNJGNsAgDR7JJLYw77+f4+jROkRTDcKPe+PcmY4BCk9AxV4ya75GI6DJ5f15TtqFRGa
	nTINuu9xEL1ChYyyuBUQKsPG9KG1n3uLjgEtIgGtAdYVdr1h6mlW+c1jT6CMorki/fg9eGMPZya
	B9L9x69rE7oOgsQq3h5K8Wmct9JuArYlo5Ih5TI9wzcJvxP8s=
X-Received: by 2002:a05:7301:60d:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30bcf6002c1mr1306991eec.10.1781692873410;
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
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
Subject: [PATCH 53/78] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:10 +0700
Message-ID: <20260617103235.449609-54-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034114_281911_D2152786 
X-CRM114-Status: GOOD (  11.67  )
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
 sound/soc/codecs/sta350.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..b1e2f346c647 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -306,9 +306,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -325,8 +325,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	} else if (numcoef == 5) {
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
 	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < 3 * numcoef; i++) {
@@ -334,10 +333,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0


