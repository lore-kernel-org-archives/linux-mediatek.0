Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30F6CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=; b=CpYW8sjcmn6fKveRKEbZgTWTcZ
	ZQ5hyKKbdLy3srYTW42utXa6nvHJTPoN6AngwOK+Hhx2v9HFAeEe1v2ZP95ZFgxTLe+2fe7RsulzP
	Vcfy3+ExUHNvOJyLEnrMMRlVEJ36eMatlIWfc9MwLZmGIQzxxzmH5YrgnzgNwnyBR1bG8cGSH6yxn
	zrrILoY7jG5LEcVy+A/nOgopyrpcOj6UHGe8kqp6+2pYds19UU5xcbbOR4QRSXj6ZV72GpNC33DxV
	szVExMN6s9a8P2+2SGcZLX0AZyvOpLh/tUCe/QrJO8aHM7hLHscHHuwfQYKNburFjx+0ds3cfxcCx
	N/tu0+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbi-0000000H4qE-0w2K;
	Wed, 17 Jun 2026 10:34:54 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbf-0000000H4nV-1YIR
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:52 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1622996eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692491; x=1782297291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=k3L4SzvCE9fv/ZLZ5ZRh6nEdkBtQEFg/bxbvyM7pEb716R2Saos2Kdvxnr7hpVRD9r
         6zgGUSMDktdmHrumOQg23hAKLwPvPFwWTw4KIiVFjNv32sr8qYNcbZp4hhSGuBNuULiq
         RR155uuKty+IKkhWZzzDZCVUrT0gpOwQ7lTV9+rhbhxhcbn7na6TkZIuweY2zqtLZupw
         lpIjU4VNs42A3/NtfAq6WCrpGiLd/FHegbgQ4amCxS33rnGF35ZFZS3NFyXAdckYrJA2
         jWIsgoAUE0hcknNTESVjM8E7UIH+kjYEv8TaM/KZqMtyPIV45ALpKXP7AoSWeMSDUukE
         QZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692491; x=1782297291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=E2dIiWlQPHYbFW88qdA/40u4thigIZGu+4wo267+Q43hQOHzBNsk8kgTMO84wcSELs
         /RN7+Hui9Dr5IrhGBSnbgqSXJ9/MQeqTNoFIQit6YuOgpOgqk+A3hQ02W/UsUsgtpFlS
         bZdGSraG59OT6yJIOEbAHXS6qCIlUVK5nphjVCvlJo6AJQYN3MoKfAdoFxG9f9Hdi2Lg
         mOxsgMpf00LfrfMju7wmvLXaiu4+bavc8Cz9kUjRTF57P33U0ec6cLbUCp8HAeP1xOfc
         b8n00JkJFJZC7NI6ELVAKw+CpPsoU9D/hETNb4SF3cx4sAeUX7yZ3kGQmWsvYLZLdVRy
         Y27w==
X-Forwarded-Encrypted: i=1; AFNElJ9Je+UaW0ghHlT673VPybbxcEAZaAyicYKMq2QVYnV8HZHGOfT9cXgg3SCNRGCSMFmXSZDBZ6a3S3V+AJq3XA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+EYVming7rFRW6mKPOLQpwiDltMdXL53Xvn3pXl+UO4ic8H1M
	3kaJHDPfXhamkW2/LiNo3dz0pznLGHUjBQimm6X/To88+gXnTEcM/qyP
X-Gm-Gg: AfdE7cnwInpU8exEdOx3/1lCdXJP4bOa8en/NVV4NpdLgONKh03dfeogOF+y28JwBnJ
	aIrc0jNkXwSd0a0olRXRCe0ZpfEh+YIP1iiZBglgD6Gd82tb0hz6BWI4Iv69eMJN5DLZjnF0ZX5
	o0zybWdjlMn1Xo9son5IpI+TXTuJGqLK6vnKyGY8UmiaUfqsozuKYet34NMO/OJpt7dFkAhkBpr
	gJyX+9DW+gnxPgBdM393StI/iH9qzfeUvxdVUlKp9vt3A3RWCmG4vgpJvEkG7io6DxbSjrNLKn/
	sQ1Kj3t+NOopBsdj7GkG44UvwyE2Li6bFSrxM7i5I7mG3eUvs84EwyLBj00kJSK+cGj37Zc0fb4
	bMk44jIPgOwrbHQmLJhfY7pMWoupp6R7r1Yqkx5HgLQ2rvHJXP23sD9NwZsIaMZkA6bv6tET+UT
	p1dyJN7EdKxSLqhm7B2qIHZeEsg/aIY67CHwk1KNDBIEULtBs=
X-Received: by 2002:a05:7300:230a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30bca0e33bfmr2065004eec.34.1781692490637;
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
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
Subject: [PATCH 12/78] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:29 +0700
Message-ID: <20260617103235.449609-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033451_415298_0BBA9446 
X-CRM114-Status: GOOD (  10.00  )
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
 sound/soc/codecs/cs-amp-lib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..36da474f4370 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -83,10 +83,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
 	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
 
 	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
-		mutex_lock(&dsp->pwr_lock);
-		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
-		mutex_unlock(&dsp->pwr_lock);
+		scoped_guard(mutex, &dsp->pwr_lock) {
+			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
+						controls->mem_region,
+						controls->alg_id);
+			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
+		}
 
 		if (ret < 0) {
 			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
-- 
2.43.0


