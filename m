Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5FECD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=; b=CiRnGq31dc17h4BTTbvUMNrmIA
	bIjRUlSEuNWJsEMon3LoLjcWdgtppv7OEZpOxJB1uytqLTctTE8QjkLuXvPmKG6OTtIEE0GyezUMy
	UfLor1likaa+Obs5FRTLITnMJsb4ko2kD1KjkQb6OAVvHE0i1DxPUgipMNfMGVx4J1sLmAM3Q5lT8
	jD9PEGn19PpPbO9af/ZjPIbkgmHUA1f7FIwDVKNqOtrlcPMRTO74erFuaTi00SMyIYzqBnBpgx8qc
	Pef1C/UbvfFBS2r0B8hHflDcEUqHlmpmHdSciy8lQeznP/koE2C2MFvpBp7w8HqI9ltbRKZIDeIVi
	zTEYz9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncd-0000000H5cU-1m5G;
	Wed, 17 Jun 2026 10:35:51 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnca-0000000H5Z2-1pfO
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:49 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-137eb0d76beso577905c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692547; x=1782297347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=su25Y9RWcF22Clt59kiW03Ymx+pEHz/2Bic8cjKrZedXZkkmq/yEup45RxRJyNmE86
         cHhCHqPyIUCLrmVorOlVxHO58PtGJq2GZ7yLZihWMszCVzCYVpZYfJSYhTKndsS0Yye+
         xFPMAs6ZwT9t6uSJq3LSWFqjXLlqiZ+Hysm9iVU2ALpUvUevoe0kih15JAWDP/G9XMKj
         XnFPgKkM9IgW9LUK+gwmOZS+a+uh5uUSQ3HOH4yRTp9NQgTdv2oAL3pxF0lE3iURzG6C
         LZRTKx6RZYkipfCr+MyAsVEPl4dPeUM+MPFKZLakjU2R/zC1AmNoSpG+LKnLr3nvxi6O
         KLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692547; x=1782297347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=MbvK5JQ/0/4FgxW3KKVtBR2u1UvzbokQr4lzpxvvunjJRAr6pC0jXffCtyCvfnP3QO
         dkKqo1BgCueo/NENspjASEUFjGHYR+q8FGBn7k9BYoaTkDgTNpVrCiIOTFGKRRMEw7PA
         CMLiALOFB7SZhhqZGnFnyLMovsZ8PcAlwU3EpMnXZzPWZb0jheq5eu+nWIbQ2o+crrSi
         YUrwbDV5VbyT21SRKZpeFHBjFk5XCDBxC4DxzhjlfVM4fHFJVyrqhhckt4P97tNeHSqC
         jSuFKvOjZNDsLfDBKbGZsWusc6v0pi8AM8EDTLh5CXg/IpSeqUatBCyeyezOLyzA3Vhk
         YPxA==
X-Forwarded-Encrypted: i=1; AFNElJ+vxBxyeJAb4uipG6+X54kXRz8OljQp6lqUWWb1w9RwgPc8Eljaur+CqrAt0s+OTEnJA2ni9+LsGeehxq+VjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh4+XWHah/swul9gwPCmU8eAnCfeQPKFfbY5QNtKuk6Qmmh/i4
	0o5pLHv0hgb98i5dR4dDQx9wDllTE+9Acgbo/rm56PayxyMCHt8eltT1
X-Gm-Gg: AfdE7cmXJDv1fCQ8DSvFhVCgdN3DvPdVaIrC4Mm8z1wgr65IzplbNqMXcxBpPgFaOHh
	MR9Y0lfsTiw4fTF6wPePPkLrmkzBp/YK2FTPRm4NNW2o+ue1ieK/6VuVxLngC8dbvwScCmJHRLT
	IHcnVCHJwvexmnyhRUvk65UrahpmN/8DDvoTCSHo/t7khwCPJk/mF+2RX9JHVLAI0hNnWPxu0h+
	gFvS4k5odizlcqZiV8Yb7GqO2OlR7z5xP43iX0ZEPlu6gMulkBe0yeCqV2gPNvMDfhWkEhYL1oq
	aN7nAEFYBy8SINo1osPA/mIGzaTGQoBd2E8rew6drX1ENyNzqEf+h3O4WXRI3ENVrTtwISMqygG
	NSw17PmGLwrANC0bUHv3vlzlomBEhU3HSmsESvWKLnnQ5vzvgQOfu59njNlq6IlI1EzSMNdrP4i
	M9Js/5ks1v/iYsPB5yFmlTuNsrCbaM5e0dRAwkHpT9tgrbiZQ=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr689839eec.10.1781692547532;
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
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
Subject: [PATCH 18/78] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:35 +0700
Message-ID: <20260617103235.449609-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033548_476462_D4D89271 
X-CRM114-Status: GOOD (  10.23  )
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
 sound/soc/codecs/cs47l15.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..7a69f79fe496 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1285,9 +1285,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1316,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0


