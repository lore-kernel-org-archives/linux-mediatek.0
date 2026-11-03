Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D218606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g9vXY5dO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnN/tnWE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=; b=g9vXY5dOxGy8UJ
	7/1GqMCTpFYHjsEqFyC6uoklcl3HjlJf8Oh6timGLGiDwX2K0Dq+Xq70cRsAXWIM9m+4GtXfOmCaI
	Wg79+6e4omvSXRwZPbrH7UacZbJyb+GXycsM5Io1AgGnjRoX8GZMgXGewiUFtSbAVWHEF28nmpRqH
	QotCoAczsNWluX9n4vuc3QGMWyXqcGJ0GNbBwVQg0pVddh1NkNvTRw8+uVWW7bgKqzADYvdrkWnKT
	Is3d0E+sT12YHAmwaQCTbPCBN3HiSTmqHy5UgUX22h9T7xOwKBCKuuxwZrg2uRDo2+O9z4+XSDHDG
	8aB/6gADqLvayEgQjy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98c-00000001M20-0oFh;
	Tue, 03 Nov 2026 07:40:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98Y-00000001LxF-2tkT
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:56 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e95bd1c14cso35085325ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691654; x=1794296454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=jnN/tnWE4ES+wZQ0uDuwOr6WtCwzWhRE3lQhDU+1xQG4Am9wPbA4xB4rGS/XG4qPBw
         66MhTI9VD6r2SUvwggutG6hqM5hDln35kEwoExX1Fp8DK5c9mAUgEZHzrpRJdX7+fYRf
         wbj+hKDN19AUunDkSOgBEBEcwhfeF6mo5s+aaOThd6LHyjmhVlhT30xTmHoHTDvK8z70
         ip49yb6Va13LScP7emalEG5zyMaQTbkRQZaSzcO+a+/DV7nmauJ/OP0Ye8f9hINET2Id
         A6HbFlpRBtDTW3dXVcaGB+ThcAsF/8InvRlM/BqnvcVAyCSSJsbdXsupyT2mqO2H0EsH
         WTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691654; x=1794296454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=ywzSn9zGSuw8J45VrJX8GJYahjK+5PBmo+zozM+Df7moSnULm8NJiFNsFBKmQEJm+3
         vPUa+BHLx10D/xaFgCKgcWrxaEW4zHqy+REg4t4dqe98mTVpPCbVQgsIJJaFvLKHf4Fa
         zwMK6MA5eUAPAFVEz/aEVYw3N48eRkMOM+qBw86HeuimUOMZa9SFOzi0Uxd6J2bsoUvB
         gl6Zh1b8lnksHBICgXUQMqwk/5vLCnlEbJEgIHryNXebJAh2afvBGnBOMD5KSvOcuXd4
         KWj4BL5UThNp55UCN5zGoQ5BWN+F/BuuvKksxyutirbsIgtnlGSPwdWRjV/0Ak6oFg9V
         AC7g==
X-Forwarded-Encrypted: i=1; AKwUvBy2ifVc68ksRKESKvwZtBtM0e78i3woy7cBYEP70BL74028iHyDX7SsQ88JfGViYTe8hPFZfv6U3JpmpsNeVg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8T/h7yaLHVQo+A6LlFRly6ko+Wyo64z7Tc8YchhMOjM72LbHjL
	ufWc761vg7N9FDifTGM3R+Jp5KL5+p7Nm7zr7Aq5ctdIFuG45b1BpBRX
X-Gm-Gg: AYBFou1WvDaM/mBz+NgZ6QhC8skRaGdtG2tchurGsIfw0gj4MVGXwRBtWM011Qg/z0s
	MnkbmBp/FdDbDFrGV+XIeSt/ws9y9zm241izyq0gOsM9l3f/hT1ykp4XUOdw8xipn3upE+JzpU8
	9Fdbc4YmzEI1hYEB42c6538YsgiPA6dwXkl/4I2kpir3EUY3Np504JlSuF7vqRtOSmPjqaj5uGg
	rjKaNs7EqGElsojfAXuQy5MPJa4za9MxaQWBqJky2K9Fwp8I2cz6ZdlCwVis4/wLeIzRKQQvJvY
	zuo3vDh0zSKwSzdPCaTJhQALh+omBPBhyV3HKjTGL1VPtrg1zoxZ6m91bIJfKsYDH8W7pyHqw7a
	aUeiGDTpkGKv/Cu27uXV+e9hueSLRY5rOYY5y60d1z8YM25UNohOEy4ETOtzqTKHGdbEdBge4oO
	gKwKvtQOaB0jgVaj2IG5kXP6+JYgfgimqiJ0UuDdmrwY9B3rSrrZS2ImYh+mtH4FvhrLVVL9ADD
	RMmkdbnbSvWbJZMiMKr30QwxTdwIwEyNZi4NuPLVMK3P3T3TKBHsprYmoisuoV8kAAQ7sX71A/Y
	3UOEE9bzet8WV3o0L93BUNF7tg2u+3NCA20HrCJlKc5NUUHBoGyh/TdYkxBZH6XuXgxufgadhlb
	4fhZNdxw+cv4erz3tXsaf5YVmSZy3UEMRJyMZjIGZMHRp3keqPzgKT8425WyCwdUAujb+r8rbpw
	QRIkZyEJ+fRso18Zz0R4Afa24B
X-Received: by 2002:a17:90a:ec88:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3ae89817e67mr10390517a91.39.1793691653576;
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:53 +1000
Subject: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hdczG9NEn27ni3LRkyWf48VrrSCYHeqmgsUnxw+t7c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/m/vxd8mT2w9wzJq9zHr7fds5GpJlvk/hZ7rBVm
 d+O7vvj3TGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqp05GhrWvelleP2jLfaEW47KL67PTlYtSmlO89EQ8JZyOOl2/pcfI0MSmciz
 Bue742WSjd8f01zrYWO2W/i56zGoSMydD2E0OPgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234054_740573_7175FAAD 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Martin Povišer <povik+lin@cutebit.org>

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f346..fbef941157ee 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -565,6 +565,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 497ea82c1778..1d60e290e40e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -473,6 +473,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
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


