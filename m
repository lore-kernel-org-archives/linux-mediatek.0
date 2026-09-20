Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B17DC982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=; b=d+MehZEd7XvcXxvmIWuQPPflCX
	puHSO61v3DR2BQ39wyY1PY+AwAcIPJimYIf1Six+/O3wWOB61Ei9a/p2Nrn3g7//xBhsGWre7WkZM
	GSihI4NAzm4hkMBWtsOlSE8iBRfkRvGEXekR7HQ11eHN8pFcLwXWgzbqSfVBnlYZAcqfMo2vD4DMT
	mjK2W5FQWlgaOBBjHb5S5MEQeFwq9P+LhCnDasDs3cbLEMuNfS2an/QVaouqGgsDWQZtbTfetpoYg
	ikEZfrCdkayYVzX1wvJO0Wep8DOtbvJIktIYj1BXzBg/nHZdruu1BM6/EOpmLn87N6FzCKgAUy1Y3
	5zIc4E9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bZ-0000000Gsod-0f5N;
	Sun, 20 Sep 2026 04:56:45 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bV-0000000GsmE-2lta
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:42 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd4b43b20bso13300505ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880201; x=1790485001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=;
        b=MEOAppY9Fl2ZspcKgHK2+Sn2hmYzinW0n1wvqY6mr4xsA3ZfqMwlSBbPnoi4tXBPMZ
         t3Q5fpQtFQZwBpPCVnAUQP8KbKzwy9AaMHl3o7eesDAaJ5LwT96AzAtbVVaaL425433o
         mxPNokupZJ+nq/g6AyYy8Vx72sTpZvjyy7yHzQalnv4EvT7/MCEOSHsUUY5izHTmXg0s
         1kXJ5Q43Zq07fuqrSt7a22nrHPOdW6QTZ1tw3tL+OjiHMwSG/MVbdemZzYY/qcpGalq9
         nvMlQ4ZfQvYzgzbo0R5UYNckx27aQR0Of5ZszD59SRxoW+IPXaZ62LSWPHJ7z3mIeDH6
         wREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880201; x=1790485001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=;
        b=B/FeN5v2A6JL2Gyt8CCmrejPXt1/PZsXlW9XuU9eNF9Vt+zj8SQg48tUCl4bc5TYWy
         Q+fEF3GuhA9G7Sa1fo3HmbD/B3Kl/ZsW6PkVQCKVd5+7kHVuWdlf/mswoFcC8dbC6sDa
         G7fPM1HlQkIXhJIlhWtinufChIqXSsfYeg9zClqWC6pesQqcCQPXBOrUokz7gRtbeXeF
         FCE6m1choZsu6KcBp5lFF5KzXZqtIiaPBU+Q5J4b5Zj7VayAUABvmfzDvypoij6RKlVt
         nQsNlxuVaQGVzU1eLJg9KK3SmIIAGMf3XiS2q0Ir0C9fXWM1uuahlh5XJmMjILMXfJCE
         vqOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYmYRTihAxD6Is2ApfvuyJKmPuSYwsD9HKVK+328J6nF/jvHpXn49FQPscQSoTUSyGqh5nemXMyACCiWqgyw==@lists.infradead.org
X-Gm-Message-State: AFuF++n7QL143dLR0YwkUa+/dqxPOpbQEmXNYqzEWNFfS+JInmY//WYJ
	Ya7ZvWGQB04FQRkRhxsYP21Kyzt2SmWItKiHPvsetMjr2ns3L/17vHyJ
X-Gm-Gg: AYBFou1/vkxfeG4wcFxGqoppu+Y/o/hRYxIp++sSgFcgA3AyNDW2kafGIe7zZbjj8FK
	cdEItKSc+xM4ZfqqA1wLhF7wKDAv9XbQ0OfQ1ZPlkqxRxwrCQQILVzX1QlefOR8rwhF+wxLy4Yz
	cMfZLOYa2mV14O7n4U45CLqLUTCdUiaw49ssPj17HBA+GYdVqSvuHUTsOM/QAC/qgGhsI08h7b4
	OKQupf4tO6EUaVY1JoDfpdnWublvHdpA4ozNhyqKqrpL5+hDvlYk4Mm+1BuFgeZzrzkuLLJDnGn
	lefZQ4ExBr73vzEApkbJ0g+nVxwlExSBDEzJ3K8v1YmyhZ1fobAubDE7uk3shT22BLA/otcKN3/
	fBnDO6pzwEUr1P6eDCpiOOk+rVlK4UI8AmkXbwdGzWVMNI8zwek+2lQkxQ0vMQIfobS8afBDO/e
	58WDzGOSJ2d5ur1YMWaHKe4/BkN657pQ0nMmVkF4+wz7SWXyncloVCuDiXiY7P3FioDRprrjCWl
	B6c7469ERdwVGiz/s7/pOF5UQyBesgFWcelBt5x5YHo2rbcL+O4bHwZ8cTf1FwQqqa9CaOmu1Td
	9BxJ57Fs+z9nDLnNsuOuXhNZo310g6wzA6p1guhmCV03EZ4=
X-Received: by 2002:a17:902:e543:b0:2df:39bd:ace2 with SMTP id d9443c01a7336-2df39bdb0a4mr24798825ad.43.1789880201029;
        Sat, 19 Sep 2026 21:56:41 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:49 +1000
Subject: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=giyxcaB7oPKDW7kHY6FxQFJhi2IQzFYLV+w/nh4sO8E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xV+HF2p1seUK7lhz+75Sy6XKnK6zLlreVYmbF3Bm
 QOajkLxHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKleG8TI8CqdbbN2+S/VoCAT3nVMDvGZ86ZkRsz6OD1eZoq/ovrURYwMV95umc5
 m67PbWbG0nuv1Qp6aIJtzX5z1bYVeT724eGMZPwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215641_738287_425739A6 
X-CRM114-Status: GOOD (  17.10  )
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

From: Martin Povišer <povik+lin@cutebit.org>

In snd_soc_limit_volume, instead of looking up a single control by name,
also understand wildcard-starting patterns like '* Amp Gain Volume' to
touch many controls at one.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/soc-ops.c | 51 ++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index e572b05840b4..2f91ee7946bb 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -403,6 +403,29 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 
+static bool soc_control_matches(struct snd_kcontrol *kctl,
+	const char *pattern)
+{
+	const char *name = kctl->id.name;
+
+	if (pattern[0] == '*') {
+		int namelen;
+		int patternlen;
+
+		pattern++;
+		if (pattern[0] == ' ')
+			pattern++;
+
+		namelen = strlen(name);
+		patternlen = strlen(pattern);
+
+		if (namelen > patternlen)
+			name += namelen - patternlen;
+	}
+
+	return !strcmp(name, pattern);
+}
+
 static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
@@ -445,31 +468,47 @@ static int soc_limit_volume(struct snd_kcontrol *kctl, int max)
 }
 
 /**
- * snd_soc_limit_volume - Set new limit to an existing volume control.
+ * snd_soc_limit_volume - Set new limit to existing volume controls.
  *
  * @card: where to look for the control
- * @name: Name of the control
+ * @name: name pattern
  * @max: new maximum limit
  *
- * Return 0 for success, else error.
+ * Finds controls matching the given name (which can be either a name
+ * verbatim, or a pattern starting with the wildcard '*') and sets
+ * a platform volume limit on them.
+ *
+ * Return number of matching controls on success, else error. At least
+ * one control needs to match the pattern.
  */
 int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 {
 	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
 
 	/* Sanity check for name */
 	if (unlikely(!name))
 		return -EINVAL;
 
-	kctl = snd_soc_card_get_kcontrol(card, name);
-	if (!kctl) {
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_limit_volume(kctl, max);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits) {
 		/* Some cards blindly add limits for multiple variants. */
 		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
 			name);
 		return -EINVAL;
 	}
 
-	return soc_limit_volume(kctl, max);
+	return hits;
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 

-- 
2.55.0


