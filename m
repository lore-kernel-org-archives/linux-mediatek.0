Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CDFCA5FCE
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=; b=yKPJhp88o99r4lt7FOemFUIJ7h
	F1px21PyRoc40lSSPryw64WZYvbdY4Z5A49IkqCTCmPmkaq/bGlMK8RqcncOb1YqcAxoHxqEcGU+A
	1VVM+69Kn2faiElG4wNksj996hBxjis3BWT1KrPZmyba5kzvDX2DZaUGGAjySLzUj/lFZYGx0hJPf
	LAEkOQzv/kxxSFgisHPADK0ZsuhKggC8GDsmt5zEqt/A26l6z3P/yak6aPDF9oDUuxPPJ+mPkoHpz
	wFv+2dzK3HEn3BbO1Y3CSScDM9D+9AwCwM9MNQ1SKy+Y3XPL3MPNUp1Dh+2BDeHwoq8Ge5C4jcuEE
	InAbEJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLk-0000000ENdR-0mLj;
	Sun, 04 Oct 2026 06:05:28 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLg-0000000ENZD-2SRW
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:27 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so458831a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093923; x=1791698723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=;
        b=sfZ+gY7OMJFo4a6r+PCI+RBLZqwEhvSwDJHmAeOYQWN3Kiu3fXqBRnJvn5buamnYlA
         gcTlwWOIrFAFe43OPh6nAeRlfUtnO44/B8lPvoPIRed5SoL3K5XGW3hgSSe4+ZIeP8gx
         rdQ0WZ5lrqF1rmr6Y0iltbrLzENLQ59Dz48JOnMFX91pTC6WDm/lxsoAR5VlGF9Xb0qT
         w8FQVKisIlRSMwxuVnZdW2k7ULNMWYzEwchh51+9GsUtN4WPr0N1judQbXNz5Mjil3e0
         NQyAnwamnF2WGUuR/RnXVk9Nk/ihfIgi8+mEXtfiHn+XpgpbipQycTmC1FfrcRKS9c62
         74LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093923; x=1791698723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=;
        b=iOd2X3Rgk+Xh8OCrryPaj6cNP1lUS++zqLRBl0v62DCOnTunc9EI+L6FsdM+kJQ9to
         XQjz+e3KeyEOqk91zM4GnuWYudGg4yXqOrhnUv5zLuOjqwok6cOrkGMFteGgfOjbN68U
         astFX8r+5lkPmTN+wdB052UVMxxL2bqzOjWy3A/dKF4eIHaeouy4H2rz/iOuwdd/i8hd
         gcpmysFvzC0/C7f+wIguGCPliC5jpCgOqR4OByWc40kG45HxQuZYV7EU6mjrQilZ8yAm
         wnZcbfDaZ6hFafATe8tFFn5txc56yityVpnx7/qUKem8BdkSp2ApadFS3VBXVwHVyqZn
         WzAg==
X-Forwarded-Encrypted: i=1; AKwUvBxRkJQBnsLZuRszl2PaXxyLneDrSh7rDiBd3yTnjUmC9/Anguk1r1LJfislvtVRj5EBkzNOjqrJ7bmywia96Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYKUWCSEVhBa5KncFKySLqKOdbqKMlAbxMnYZKAHpYpyzDU5OqT2
	Fmbw0b9jamwNKhOFh9uaJ9VzQEctksrQiqNgjjww1PXLs8v0qedB1toNXPKCN7si
X-Gm-Gg: AYBFou2QDPUUbQOwokvrOMBh2pR8Fwh8wxKH7u05ZewEi7WeqtW215ptefzvBz2hFxk
	qgXiJnYPCNSJ8Bss0w5PTPrnMmS+VhRGZGTvTvUCA46QTw2Ehnn2bsqAPqwG52xABlrPeMFOAZz
	v4w/ML7Wg/Iz9e5qxKQAl7gn2m5E9/5J3rVx4l47UYaMCWUCeijY+eHSULi09qHKzDdrvjsBW25
	UXHc+Fcd0cvxItqZ783ajWjnpiMNsnSFNXoaeM2S34ZcU7wUSsNtuK282kYzFT6ylzM+O9cfKhP
	2w0i5iCmRN9YAPzYlFeN/IfupIqeNaBLDHaWHhiG/IKWm+eqdHFV/ES8sj4t1TlGxMbvd/JTExu
	381uNvZYIM8z/XewmmaPPfZ2rbFbEajq3q0yHuDLe7MlZPLZvV3KSkvQbOQpOfWeqD+g8Affp2L
	j+fD1dkMEgoY6cnsJo0etOaBn1nxKeP4/eGmI1oUL2LvkofNIkGC2eprvR4kLM/FwRfZ53FAGxd
	V/l28AsRZS2DpJB9QMzMDJge5kGXCkgTxnww7Wib/mLR4oHXV4TUWH1rCljWt7XfWbZqjaw+NSn
	CNhCB2arWd+IZXR44CaXbdVuTUA8IPhKofPg9uBNNMuN3rU=
X-Received: by 2002:a17:90b:518d:b0:3a4:c725:2870 with SMTP id 98e67ed59e1d1-3a6ce6cbcb4mr6425220a91.14.1791093923604;
        Sat, 03 Oct 2026 23:05:23 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:33 +1000
Subject: [PATCH v2 06/21] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6036NmB8QUKf+p136ljkCWVR3JbqpCuGrzZEQrA339g=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rwx8sz1m1usna3nfnR4tO0LfE+T0oVJfZP4egsK
 plgJ3GsYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVZkQz/C9fyLi3z/nX80mIZrmcW61+ws4sHvJp/fqnszFv3Z7lMWsLI0N6iMOd
 8mnDj5ZOMB45/1g3fI2oyhUO9dY6N7qZ99/vmcAMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230524_797918_43E36FF0 
X-CRM114-Status: GOOD (  13.80  )
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

The new function can be used to deactivate controls. It is something
a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 34 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..973ffaf6f060 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..4d799c5e44f1 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -471,6 +471,40 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_deactivate_kctl - Activate/deactivate control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @active: non-zero to activate, zero to deactivate
+ *
+ * Return 0 for success, else error.
+ */
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active)
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
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n",
+			name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0


