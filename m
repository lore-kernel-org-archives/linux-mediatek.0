Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF75CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=; b=s9IU5wJ+UKnThMTklw3o1ORSfH
	56JwJO31/WJ4FjJ/GqPj5MPXkQu1GWpBSA65NvoJzLw/lDNKxY1Hd7/PptVo2rd8Q4VEN5X0tVv6t
	NbSVKekYK8F82Yi/v1E/Z1iwniYh4F5RP9r660tCaaGtYXz5JIqVA33xAEI7cGXahAvtf+62tnzKA
	egL1n0bJzLS8p5dYHsW2Z4UMktcyUnHxfFUftvv6IUBinZgA8SLjBIuQvrF8UWSw0TzKSDQSJZdqV
	1t1wvY76R2J9bI1ZorZbEFztUoWlcCZuMyF7uAZBxvK0QHJVYhTt3DFuN2e+VAnT33+eCN7soiHOo
	nZ1/61LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLs-0000000ENjj-1UOj;
	Sun, 04 Oct 2026 06:05:36 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLn-0000000ENgT-1EaL
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:35 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso585960a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093931; x=1791698731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=pCs33lEG6DEv8CDj69pt3g9cCU1WsdlNOU2xXDTSsjozzXK4vwrRG/171uQDpTu54H
         jw9dOQrXzPp+pKvwgpYU3sJk0WoGmKwIn8hYCFIihL8VSFIQ7de9gwhiMfLVl/B559zr
         UMT3wpPwmFR34C8k4fK/2j2SShV1WFB5HPu50tAB9gHjPQcFZNBveKtNF6pnz1kFoRc7
         0utsN2kghbrOzihGF8xaVmHKwu21Z/uPxlFM5w/6N+04VmVhJMO6Xegy1OmyNtu0ERFv
         IWV+n7Pfg0wPsH3SJXRIMHhwXPrv0Xl/9xwzVW/+NZApP70GV3GYFuMmN5RKSjG9Eu/n
         J5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093931; x=1791698731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=rdk1dOgcqNaHwich0fdibf7/s4yjsXrgXju2DEih2l+cej9IZV9vRnf5QUl8MjLFMV
         mSSaj5D5Y8GuErzFKPr5eIKy6ACs+oTM/Vxp4Zamh43GShYVR+zvwxEGMw+wN4gZrcJF
         7q5bfGUhRE64doFEU96sk2RAzPwYTo5y+9uzwsYiesj19JbKhW+eGWN0nJ5izyFHMqdv
         ubFsqlYuKD1EWW9LEuXCwX9Qet4q4AkOZMd9ZHJBOEwaRrD7ddq82O0VTIWrs/iswzBb
         h27nO+dZ+hEYYEoeHxxm3QuCK7sNPuKCezOW9ggPvrQtHBIS5VOVY/rt3gflBiFURdLp
         cdTw==
X-Forwarded-Encrypted: i=1; AKwUvBwl2ZWMd0Ip2cT23gzb4yXBAW1HbduR9zvbb1allruEGZ2IRTKQCgPPXsCRZCN5osbMLuSLdsCzCShfJ5f1KA==@lists.infradead.org
X-Gm-Message-State: AFq9FYImUZmSXfoct9oMFSStGsxF4iQ64c2vv+WPuWwV80rAO9ZIOjuu
	oJl7zlFCXdInwGL4wLdwTg556mEbEmxbwQXxSYT4P3lH1lwHKN+Am1Cp
X-Gm-Gg: AYBFou3dQtxQYSUH7KbaDw0JF0luF90WJBX0LUs34fcDNOQ6pXcJ7yjieP/3m55XDaN
	LWCsVUdHJ0BTA5h+1muDLu2tSk8YTfjoqMxflQn8zXL1/Y5je7S9I/oIvPrKNDIoi9m+/ouqWLW
	4QA+JotOJ+9UXn9MSDjnXunsUsPkeuHRmjjrvKwcPFFk23gDcPZSL/ymnoAC5ihYno70TRH+Tz5
	ri2/hBltkOsOdaAwMn7raGOfeAjVjeAFx2MsQsC9PYse2YGAAYAKVMSjZxkRy7IvtXc4e/PM7JR
	ozhKJVkSljq9A0hl5PVcAdsWp0/l+RJS26DBFMAVa/92v9B6fPlD5xsKUPv3DYHHSdTcUvGTk70
	dalPDmY603o5iznbppq9UmxvuFcLZBlABWcYW/39dXvfV4bgb9Jjt8HnVGYsQbjpmfCAnRJ1jnb
	pFVdDKEkegckYIGX+q1TdgbkHlV3iRESu3U4G9feDISn27lArmEM+RGAgD1Mvvbtg5oGA96MLr5
	y83XgkE7FkUMA9ka0eXrQ7aVq+/SVbQvzaFhNLGgFUkKd0ttW42gU/oRk6ZZe7YIuk+xNk/PPQ7
	l0DrTITkmt6M4v21s/tNLE6CKPItjQw3RcWnLsQkqneoakk=
X-Received: by 2002:a17:90b:1c10:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a6ced24dffmr7196757a91.49.1791093930602;
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:34 +1000
Subject: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V04jnN0BX/eExW8BMvJ1EKB7GQ8dS9/fHjbsufpPsJ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SeP9XEmjx/guFTlbP/bIJ2rTjL/WTnSfEZCmw/P
 y19vanFrmMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVoe8Z/vuePN21q59JkvO12slnkrwfTh72P6jFlRZ0v4Vx55PDL4wZ/grlryn
 T7nH77WnauePd1ue/z2nyi7CuluJMFOmuXr8gghsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230531_347813_C1BFBB38 
X-CRM114-Status: GOOD (  16.72  )
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
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 69 +++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

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
index 4d799c5e44f1..b1eb74e24193 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	struct snd_ctl_elem_value evalue = { 0 };
+	struct snd_ctl_elem_info info = { 0 };
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
+		if (!strcmp(value, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		evalue.value.enumerated.item[i] = sel;
+
+	if (kctl->put)
+		return kctl->put(kctl, &evalue);
+	else
+		return -EINVAL;
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @value: string value to set the controls to
+ *
+ * Return 0 on success, else error.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
+			name, value);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0


