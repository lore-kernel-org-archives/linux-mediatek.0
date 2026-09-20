Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436FDC982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=; b=gVJieQrPgKG0CBrib5BoczhtGD
	IYuf+godvoa5f3kHmo8orGZVEvkBhvn36Vo+3lj9i1Nd9VlWiqD/Lo07kQbxWUNnVM9tOpKkbE75k
	gLQHVZhm3PB/QJhnM7a6xKbYYt1JQ01RZzehuaen4+O9fUbV466T9t7y14oIkziPRbth/fX8NqBdp
	w+FEM5NovTk7tJOH7ZAOnRqGpgGS896GlkMJDJL8YCg18pJeX9FW+H8+g0AKKV6wskHWq/bVNBa4v
	VXJ5taDTI6GcQKMM0KdmJOdCyAimHEZ2ybm6d5uOzLRNGWvGIZiD7ytyMK/9SUtEgsoveKK6rInc0
	rmttlqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bP-0000000Gsgt-1GX5;
	Sun, 20 Sep 2026 04:56:35 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bM-0000000GseA-2EU8
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:33 +0000
Received: by mail-pj2-x2a.google.com with SMTP id d9443c01a7336-2d747ec6185so12088065ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880191; x=1790484991; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=OLtch25SxHK1IsI+46Ix/wRTP+wmnDabS7foDFqNcqW2MdID94yTVsk/vtyH8jpO7g
         7BTDqR+WNFVQlm7ki0y8EsmvIxkauQ8/8rNlLhfNGFsYuEfuSwdWX5xzifLTBJRuPien
         fYNdYWDuLSyEXuw/+7fCwL7fXgjLvWldiCSqQPe5T4AiU68Sv4BFu4ySCgWchmwMLLHz
         MJ+ueTfv4qFoPtebpfa1Yx1DipVQzGgD5Tmw0J0RjpUY7yggXzqPDiDGKOnLc1f4EQLT
         pbXc/QxtYVmo7jv1P6f6ziHV9uVkKX899yyHHwuSUmBM422Hsfi+8tRVcL+Sn4l1GMYx
         s4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880191; x=1790484991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=QA9zez0vXJk3SxZojM/xuBHAgr10tgu296hoOzZ/HCCCSZKqGe1Szvm0oOu67uIcmp
         AwBrsXEnbwV9oMep9i/ahSwIqbFBS/oEo/kUkkREwnD4zc6Z5v8nPbXGcoqc9GknFWVn
         0lYx0Y8kKDJ0rxQYeuyAPPEh4ScWF+Mvt7K+mUFq6Yg4XpIOIXwBOgiswmwmcHiAedkJ
         GZSYJtK1V1UoOFvQ7kyCc2FpKCCc0c40Eoky3WZefaLW+OW6Pp5y2V9xn9xX/srsR2kD
         dFuVRcNqWd6oxZuW/bn1CH8mncM/OajlFU8Kb3by6P8q1q0pCs7Lbz7SDGUee3Dun+LR
         Nlnw==
X-Forwarded-Encrypted: i=1; AKwUvBx15fVd8hbYyJSDX0/UTfRVyOFyxP1OAt08sMTsXSIH+f7mjPaFI32oivrN2irdgJoDLICC6s232teRNYbIXg==@lists.infradead.org
X-Gm-Message-State: AFuF++nd6kJS2Aq9LZVRMB2kKDoJxbgwYXQmp8cYS4WMKNFY0bh1HkNu
	GJx5NDdrDm9MnA3sUTP4fivnmr00+abLfjayOExU0kifTUuDQSAtNY9l
X-Gm-Gg: AYBFou3EHyr/T4Mj5v9G5WAdx6LAkpj5CjFmvILkyy5SPepY5xg/Cgog0bfmoEBfS9N
	Xslw6OuIyJawANoVbeNBm3C9PukHz2Y3+qEoaoUuvFWn9Yxa/IYJwlPyB7eyiCJ4hze6ott3G4M
	S+/qqXWqhlhTGMN8DaEdiamg4axjTUK0KJsvYhQXZ0mtfXTwr8oIHANtpr3JBI3jy+ZHnk9hTAQ
	08lUI88fMRAKnJN3TCQ/G/zkW2IxvQMaRVogeXpgftV3ut2LBVa/BZhLO9TmWIb/bbpnHuIz+K+
	mbrkg8k/qiFQsWUut0QHPbr7MfFDEX5MHHGew6riOlUYq7rpnoyCL85qZjYYIqXeGtdZ1ASwIW1
	RFPumZ1BQJSq5rbapJhuRwMgy2oZo0+mcwhPcGB+3vmCT39SGvcZzw3mr/kZPQ0rD4cvaiiyCa0
	LFPT3ecfN2dLMD8P2c1xC1Kz5mV2kOD3TguNJ0xIhr2XCn0gP+EZmGqoklNFUBeB/sOwVeJWDhJ
	iB2NCEma22oHzVEPvvNRddrrzeZcJxRSS2/5ktnIeFk7pmHhoVMstGKpMUv7/rodhixfHXQqFlH
	t7PHXUBhXSD9SQxFGvQXo5ba8B2+0CBEXZpdHTEyOVX2/gs=
X-Received: by 2002:a17:903:1446:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2ddb1add397mr117214805ad.7.1789880191567;
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:48 +1000
Subject: [PATCH 09/28] ASoC: ops: Move guts out of snd_soc_limit_volume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-9-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ofWNdRfEPmyBqzJBf/dI8RMLcLf8D6L0C2OlsVRutbo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXaG63U53++zvmJ51PEZI2s0OpTh2NTF/oY6Ww2/
 bGnqHRrx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqfhTH8z/nL9d9t399GmTaj31sO7E/klD6itHY9U2Sj2g7BxFc/MxkZ5q2a3aJ
 r5a1bdVfwxPWl+0T3vOXK2SNh4WS2vHdeF5scHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215632_569690_677B20FC 
X-CRM114-Status: GOOD (  14.08  )
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

In advance of other changes, move the modification of the control itself
into function of its own.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/soc-ops.c | 28 +++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..e572b05840b4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -434,6 +434,16 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 	return ret;
 }
 
+static int soc_limit_volume(struct snd_kcontrol *kctl, int max)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+
+	if (max <= 0 || max > mc->max - mc->min)
+		return -EINVAL;
+	mc->platform_max = max;
+	return snd_soc_clip_to_platform_max(kctl);
+}
+
 /**
  * snd_soc_limit_volume - Set new limit to an existing volume control.
  *
@@ -446,28 +456,20 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 {
 	struct snd_kcontrol *kctl;
-	int ret = -EINVAL;
 
-	/* Sanity check for name and max */
-	if (unlikely(!name || max <= 0))
+	/* Sanity check for name */
+	if (unlikely(!name))
 		return -EINVAL;
 
 	kctl = snd_soc_card_get_kcontrol(card, name);
-	if (kctl) {
-		struct soc_mixer_control *mc =
-			(struct soc_mixer_control *)kctl->private_value;
-
-		if (max <= mc->max - mc->min) {
-			mc->platform_max = max;
-			ret = snd_soc_clip_to_platform_max(kctl);
-		}
-	} else {
+	if (!kctl) {
 		/* Some cards blindly add limits for multiple variants. */
 		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
 			name);
+		return -EINVAL;
 	}
 
-	return ret;
+	return soc_limit_volume(kctl, max);
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 

-- 
2.55.0


