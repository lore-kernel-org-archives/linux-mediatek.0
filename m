Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C57FCCF2C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=; b=o5xcf4fjMEiL+YRSaXCIrdcAqH
	7DWC9nR4gQbFZoT1nbvjEoOv24Xeqpp30Pgo6t0PpKnPgXKfuKyHl+xPnSuPgaMoEzNqvkTClGWfW
	nOh+SDbBd0hZgthoaDBTIqB4gFcVl2kH9z5h2OulEGtcnysDBi6ztYhxlSpLHydRVbJweqkA2ZipF
	KO/oicW+1ZzCLQl94a1c9r5ntoNraHkr9iOokyb8ESJumGFI7o3eL0O2Ed/0rS5b/SfDQPmyf+nqI
	uyL/tQ2/UHydq10gIlSl9ULl1XpJGEasbScZepHvEVkOfsUGVPM8CI5v9V6qN5b2THSAUG8a6Gw+/
	ZfRciAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrY-00000005Zjd-0XBk;
	Sun, 18 Oct 2026 05:55:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrS-00000005ZgN-2bLe
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e987b4a710so9629605ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302910; x=1792907710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=V3seBbI5of/mGuYKlPlHt1hYLhUULvsIofYfJv6aQpgI8UPviV0R095uu97X0x1u05
         HjIxwzcsXO+PcsFyNoPvLDoS87sZaYNFgfTWc8Ium4PSFRsEwgFV+wLqUz4iP9hjhQQF
         QE2Zgtguxf/hRaM+riFKYKuBcElzpWMxJtz+5LyuOC1afUqB3+smd/2yLSfxlGaZsHp8
         YTbE6LnmjbNZgzHpX0UOqVAj/XAU5XUoStCO5qR5cJxBSsmLOaLKim04MLlYs8DjaVzv
         Nss+0YzMxWSFY1gsBv+videz8S0mZZ30OJglqo+yjfkwhZqxM+1PYJiz5GAXfqFDOz/g
         UpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302910; x=1792907710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=ZbAcnCY8aQkWQDl/jkVa9LWKQrIciBJZmIAKILEr90t3Rrozq+AHb6aENlf1n2LmZy
         uzPR3LCy64v3vhVtfNj/y2kCHwBscqTz7orNebuKM1lq3QWFSnmbHXjYBJaqMzy2f+u2
         nuMi1qb/X8AFhRkzEobMhVxDNNiLMA38mkEyU9Szcj72K8K8LoQq2rUcqrcRvB2ZKHpi
         /lkCw5Rafh5jC5OI9P85RHFiYVnUxno0twdKAaNGeEsX7qgPEUH/MSO8UuO+AqsQKCQA
         96biAr80GKskL1JkbTdHTo+FpUo2BYn9mh3Yk+JcT0EVBPW/5fPyHsgJIPHqaLqK03xj
         aBzA==
X-Forwarded-Encrypted: i=1; AKwUvBxKwnv9RJBc7oc5a+Fh8RbXyKTjb6KpcLXjBK/mWVyrIV5VK5NcwPNYew7wMD/iou1ABPA2+mxquUSl640JGA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKjIBV8arRIhR8jYV0E3wRyEluGvO41lAFL7pc2C+7zdcA1UQdu
	j1FD3z8DOTRwng75I2eu3etmTr5uAWG7GOL9C6a8NbJ6CmUK94pefVLD
X-Gm-Gg: AYBFou0sH2ilXUj62WbW7wT71dqqtqjqVuUewYr+hHKfDlcQYqNpO7FxKTewHRWr5HE
	+lZn3SmrA8hayPEGAy8aQuXzu2DxBr/QQzgQGOf9CXJNeQZ45WMlsoGkpp3flHusqsCw43LmAhA
	IivUbq0JyGZ+MyyEFb1bQyxtao/3v6ndUyPY8s7ph/1LhFMeURkvFSpacr/Dltzm4CKb4WqgqVA
	MXOIHcHjP/pC/lCE0La0SEBBid21L1ezTWTBhIxIZ5po5AW/J1Rk1I8Zwurp6AYQj9RGUu4ElKp
	37IYowMp4Hs0/8aV79j1Tjr6ABno2RGElLUNFVvWCkwBWYCZX2ZVOzrmZtkdvMT1nuMl8sxPyUC
	Yc+mw08ymXs8mtDp0vE6tRFuxMexUYvDX5YId8srrw9qMSN0yf2rkhNOQaYJYTbmKOcFocP2GK6
	ua+o5rocZOoumGdMv30j2SlGDX9ZNs0y2i+xGffluUh7apSsI/UcDz9g0lI5ldjMb0uRpbswlXM
	qTzgYybsUYPI35HDs1Rcok7DMv7mOa3CLI5/ZwfFqn1fRWD7SL5oHcQqPk6YVR74AU30y13gJua
	A1ILRQNNCxnm9VA/BHq/bhfbHwr9iS2P8d/Vl7rIxyHK4fs=
X-Received: by 2002:a17:90b:580c:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3acee2768cfmr2702377a91.6.1792302909929;
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:58 +1000
Subject: [PATCH v3 04/21] ASoC: ops: Introduce 'snd_soc_ctl_activate'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-4-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=eogWKeAPSgLXuvFuxBpm0mCMpQlIZe0f6Gyo195bzv4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nlMut3rN7jGTw++yar56Nujo3kPXr314b2V6G32L
 sVitc3hjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRzMTMyHGOoaN6st3+KE4v2kjMP89/dODOtQUhfq3/H9G9JAnm/7jEyfGvpbTO
 UNf+wb7uxRIrgSp3Pjs/Nzff/XjRR/I1lsJ4LEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225510_784663_0CA79EA2 
X-CRM114-Status: GOOD (  12.07  )
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

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..7509824a6b2e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..295056bcc081 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -471,6 +471,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_ctl_activate - Activate/deactivate a control matching a name
+ *
+ * @card: where to look for the control
+ * @name: name
+ * @active: zero to deactivate, nonzero to activate
+ *
+ * Return: 0 if unchanged, 1 if changed, or a negative error code on failure.
+ */
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+			 const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	if (!name)
+		return ret;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n", name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0


