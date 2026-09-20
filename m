Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FE1C982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=; b=G4bjGp+VAJK97zSeev4SYEz6Kz
	y1nC+A0vcQKiAu7BhrUFQaulX+nOaoCaoF/K+PnXn5f4bMvSCtpCRPNTV60I6ycQmODqbdx91zV+p
	QLpxpvkFxaoy1SdXvOtxMop5oERjE6B1YCYS60slZE4FPuLbHucgq/tBlSjiMUE0vfOEgeqBNDEFB
	YQXu3MOx5Lb7iuRH+ImqEXQ7OMo4JmWPgpgrldzpYOpwPHLpmwqhmX7MpyBID/a5gASmdAadNAaIE
	JqvkL7hb/u0UWNTFgFpNJSqcgM2+sNrR63jzSxmgQAfPVt2KtMVRCnvGMhL4bHygPy5fjnMG/YMGI
	pVnHRUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bg-0000000GsuX-2eoP;
	Sun, 20 Sep 2026 04:56:52 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89be-0000000GssF-23NS
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:51 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db1ca069c8so20272335ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880210; x=1790485010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=;
        b=fa+klqGpaXQypXURrg2R5hkYTaKP8f3kUYC82+LwVDhrIKn5m9ZYU22mG87L9fC+An
         8+ge8D0zYGO8mZWor7uv4UPNrhiebhm+4WtkCP+FzspB3zHCSfA9s70+PRHvEi/3x22N
         dKJ8EnzAPtzN0o6xsE8lNf5NavYPrT/k8vQJj8FGiT1zvOmG6+nLlkyd7Frdz89WfYbc
         r274++49a6DyK8PpVqZoXryY4d+gZ9u6KlYuHJjQpY/r/E8Y0yHQXqjeycotqH43YIis
         kW7lMNaZxdxIVLg9UvG4/QLdHmupUzkZa/Jpu3KP0wyvOiG1F8B21o3J/IQTg/ZpdcBJ
         JLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880210; x=1790485010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=;
        b=sXPrTRyt9VPQmIoUiqEFRet8zj9fnZWbBopFwjaCFEsjdnKO6JX5CDOoJgCK/LTb2A
         FvSuMS2wzrWdZQf1GaAqmI5nOk0a1ki/GvfzGpu5OnY6ik+lQF8eBvvUzy8qSHOeU9ml
         2SZdfLUwEuKnAgx5JJTrwl/msLlBDF9MR0H/vN4Ehgye/rTJGlLx8tmHQK34tOC/jb/Z
         +FK38GN1yZuugaQYj616aV/nq9e9ii81fB3+RlVt0sR1K5zg0EVI2seqwDC/iAPNg2oP
         BqJ3+eJTiXhfRCAThnl2/vzPBxpz+FTDTL6tSpuj2MNsmQPrk0/nqd6jrQcS9BmWLi2r
         GPpw==
X-Forwarded-Encrypted: i=1; AKwUvBwt1gCcvvWstNSJZNr+Cxsve3mj5HTqAOxBxaZg4y6SEUuJvDJyE3r0btIp3PTy6EmX9AMYEnr2X56zWVEJrg==@lists.infradead.org
X-Gm-Message-State: AFuF++lEBaGeFiCPqCuvArDET1hlI27RYeX7PsNxKMUcZkWN+7z1QWTO
	cE9YbdbhGXb8eRUyrl9GvP1h0owq9h/bsm9JFIxnOFbejvI7jKDIX2M7
X-Gm-Gg: AYBFou1lzEUNzcEUGcyLE0YXahyQd/psvA7J2Ef15nj/xODzFXIcWM3fjIP62UKv2GV
	48a2o61hOpS4KeE11Db5ZnPIKXWw6ljS5FYxwKNqyeLONg8BOmKlRxr9+UEpFNWDm+AYp6oFtCD
	3H4W9Rn0RFoZP/QkcuhutpVTVmlBd/SmtWx1x2MuWtQYsJsSCMokgsidVy3NaAZLn4YZmGmqYPw
	3Sjts8rczCdy60bI/TDhymPqGLZQGCuwNtb533aXdGHr0nX3pPjyzgYeqKZYia+ydD9qEy6atxX
	48E1kK2Tj11lQwAWuvOzmUjgzkEs8EJdwgRqkc4s5AUC2ez2yfUEXxCeCpgSrX06yReolw05ben
	R9LqBZjyje52O+NyKtRONm3x2lJzL2F6CJ0mVHwINzDeqO2CO0+ImqwFOoK16EhufGLf7kQX+uq
	CgWYYv39ElocVYpLkmcnaAbEwGMaqOfs7m8dDcq/f/aFx7Tal2hsqtUnvyr1KbiQNccK7QnoFCi
	MqgQ6Lr6g54rWeuwqy21/G97ldjFD+Qm1c2woo3L1J7PJY982zqutuXK6hJ4cPv5b1oFWvePgCB
	jdhxrBwo+wEaFv8+wBMfScQffn2pB9Iy0DYtkhJodTlhCeY=
X-Received: by 2002:a17:902:f645:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2ddb1b79d84mr118058735ad.15.1789880209811;
        Sat, 19 Sep 2026 21:56:49 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:50 +1000
Subject: [PATCH 11/28] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4cm5zIm3FR1CXBqv5TeTAc7DTM6jYX/PUwYOK0HZ2oU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xVeP9V2u/i9uIX1ytYqxZ/snN8836Rv+51+YvqOp
 vWx0vd8OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMtt5rhf3hUQtvsyg7bl9YHX3CIpm9Wea/cHlYhG3Jxoc2m8Led0owMv//eL7J
 x5Duk6RhwIVNQ43zMTevZAQlyynuN2G49FnzPDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215650_545284_83EEBE54 
X-CRM114-Status: GOOD (  14.86  )
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

The new function can be used to deactivate controls -- either a single
one or in bulk by pattern. It is something a machine driver may call in
fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 38 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

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
index 2f91ee7946bb..d35e24df891b 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -512,6 +512,44 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_deactivate_kctl - Activate/deactivate controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @active: non-zero to activate, zero to deactivate
+ *
+ * Return number of matching controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active)
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
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
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
+EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0


