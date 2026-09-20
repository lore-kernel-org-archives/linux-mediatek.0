Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ECDC982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=; b=JHYSlJteKIz3Q36ssBAVD+q7Ct
	VyqKtvOjzg6ZWRerTfsPYpk8kIcPzM3IX4n/z35VzcrrNGRO44TARo83NRHQ1w5BK4jROI/mCTqlt
	IH9z+81ilbzBdL357DMoxYxs+fs1HB3IQYZp3mDqpeU71zlTzjmUS2WEDsF/2fHHfN87ZPKaNcOlx
	7JuYKgqkpiLZiHJMy+CriLL51yNQdTHUb4w/DH9xpu3RFGPxjL3fjIxI4+5Djo3q8+R+JCWBCmWja
	MbHcdZaliDLfKHFMACdCLHjKNx0pEc+QJVJohzt8H2oDzYYpO3yh9icQxKtDWdLQNeGhmVuXk9qhR
	kPoSS6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bp-0000000Gt31-49Qi;
	Sun, 20 Sep 2026 04:57:01 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bn-0000000Gt0d-1W9b
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:00 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ee1f38so19495845ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880219; x=1790485019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=aVTRkwnjZbsXPy3j+PAVxxVnuWxQI1WKUPJwwlr5MlAHh9CAvGmXvayvSeaTAbjpuf
         T/iUDOARU86wDzFByByuSkvVy3QBrzTkLh475WIPAvnjJnft5r1P20Lm4elQbYO4liTN
         ZMSMw0GOYF6FeGeCGGrj5wuORmQLcAXTmynWNh7vPpjh0sUGrEphNO815HzlTQLwmWMg
         37acDYxOjrDjZjrQ3q6GhcrSMxMId4r+K0o2OXEQAWUWlL7W+wEB36rQ8hvB+GkzavIX
         bZYcWTd5usGC4OHerxSnDrLavwrqTAWpck2ylpGCayRDclvxBNOiGt6yZAU0OWk8Qt/8
         bfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880219; x=1790485019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=slXamY3GJbxynVXkgXwo0Fem/P206rpJH/SsfDaiN06scqri1POwTzDTa2mDBNrPwB
         6l/XOTMis/qGjEoKcGKCbe5vpesy7zdVpoP8KOMty1H0Slq9pelN2tuBKoNCNeq+RlZo
         /p3i8bF9KffCwNbefE/tT6No24tP4+VgIQsM5B6tQ5/fH1fX6Y6fLUFnc4wYS61uv5zS
         gANKSYlt4+ajj3iy/t57KsdtqD9CaVhSED/1dvV9Mnlo876jCu1IFReQQwNl6YdvmVc7
         3FKQrymY0roQK8ZgXw6PISv4JMCgtnPPajbjsBwisSSGJ2JYuDGSZb21XLVLT/oty5DO
         EsaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE5pd/v4D5JuJ/v+ipUgMv1pLdsQDd9Z/Voa4XRHEPpvnG+6xDLLIUFZBimCfzskEJy/8kuwgyzLNS97WLJQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n8OIopicIGtzQQgv8JvlutQ2ZSSoVpBPczj0GR11EdkU/NZ8td
	BO8pMbryvmQvDe5X7WXgl2gpXcs2bX356CidMCJ9SHU1aseYMvwxaWqy
X-Gm-Gg: AYBFou2s8Mzniqf4a77z+MMwKaUwkcIIeFXEpv5PFfUks8BsbczLtRBa+9+AmNZlqAt
	+SOmMNED330uu7lznxVox4gW2+K7PcjLhFLbhYFiNJVVQ/RA8FrC1l/O/ouGyoTfYCuNKuIrNyE
	oiAawz3pQ3R9uHQM033umiHBQ4RT4FK/UzQHTNj0UzK8CM7lyq0KyHn7CzH81Ym9OjDx+BelCND
	n94iItYnbAB24K6kA7xg3cjDsv/EFBnUlK59UsqnLKtdEG3TNl5YQttfUjmYHU6myBCOjZ+Fz84
	7GwORausBCDEKFj8jgoc0IRWydRCmu3aSIBhb063Xq/veGQka99wVDc/QhRsmQ1ic5Lbf3Xhq0M
	SeLpFpwQNNSQLeVBUwUzFim4l9BqTJVPf1fSWoDFTDBNgS/JvhW4pB466pqcdohbBECEfzUBd1f
	seUewZ4HSV9HNl7zmoi8eSxXvVL5iXjkn6jJp7cW+XKCB2A+pC/a//PpJ7B69nG407nj4aE/XAf
	kaHmaEgceaxAb77yJsEPP6gknt3IP9g5sMcaL2OzeCLXDgBuEe3cNpelSTW9UjTaNGIr8iWxhR/
	/gwgOKgx3O7D9lJdzJFnpWRAWbWfG95+oC5xNTf+K1UlwmI=
X-Received: by 2002:a17:903:32d2:b0:2dd:7ab0:7313 with SMTP id d9443c01a7336-2ddb1c17059mr113999215ad.18.1789880218740;
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:51 +1000
Subject: [PATCH 12/28] ASoC: ops: Introduce 'soc_set_enum_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ALw7GM6BAIc0MHLkA2EcsPFMi9t4wRSGpPulB3kFXSk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWYKk3fyLwPOWP4bnLrx6JZ3MlXbuismZzzpHTX6
 3LxGCfTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTf7GBk2PQ34GexV8erhzy3oqqqFix1cXzjEnblC8NqE4dtJQfP9TH891WtZX0
 Tk7ag3Txt7df9e//ssZq+ujZri9HMeyxeITUFvAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215659_401431_94EF8F9E 
X-CRM114-Status: GOOD (  17.28  )
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

The new function is to be used to set enumerated controls to desired
values -- either a single control or many controls in bulk by pattern.
It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 70 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 973ffaf6f060..f356b553227d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index d35e24df891b..dc27d1c409ab 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -550,6 +550,76 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
+{
+	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info info;
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(strval, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		value.value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, &value);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @value: string value to set the controls to
+ *
+ * Return number of matching and set controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits)
+		return -EINVAL;
+
+	return hits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0


