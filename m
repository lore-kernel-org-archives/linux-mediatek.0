Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F38606A333
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cuZ0gMlq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPVjnm+c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=; b=cuZ0gMlq/9T7Bu
	RKuvfKBBGRBdsU05wAfm09I2JuwCAqElf6YZZesxzCl5FaRkLRk55W+e1Q9TpQxkKjTfQjW9OzWIn
	G3oLyWYPXdMBUGsGZTNrgKyIgqCLSJfFpbWQD+pxTflRitraTylKf35Z1E79PPqvBsHfPbBj/MjpM
	875DzzX2fQ/tbJmtmcpZ3EY77TgbduGjzG+qjQxtqhNVb3zrPZfS23mCw0htnOaf1DyKBmMM0mx+R
	JdAfJmbwQ+jTR3nAZYV9gS/ri8/6kgRoqUMTCG1Nzy+1r51kn5JuBaBOE+xiR4Lv0kx8EuKYerfzI
	f1biDubBvdQ6nGv5Ng4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98l-00000001M8n-1AOw;
	Tue, 03 Nov 2026 07:41:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98h-00000001M5a-0RLq
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:06 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2816572a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691662; x=1794296462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=WPVjnm+cvWRtUjvP2YZCDKw1aYUJo6zw+ia4o3TnQRzgMDnut0pnN+MptPZXlQNwIk
         5iX2BQkcx3ge39Ej5TXeHU8b+vTnv46yY3g/zjn4xDtB1GzuRlrLmIxu9Vn0fF1nDp3v
         lqnEo4az0k8XEZHV6EKQ2NjRiMBx0olz9Bd69vgwSK/WrjEs+Pb26l5BOSStluhvtVWA
         b3PST44rzIsI7iYNbv/j8XsC9Wl2h5TfE/P/Xf53+78GRcPQkgO42x6AnitDiex2Ifo3
         DsdLEnLudf/R4NKFVV1/ihiYT5fb80Kr4F5urZ6wFdOZwJ6XG/qkZpynT7oyXP0VefuG
         7nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691662; x=1794296462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=L0k3VoP+T9hefptKUc6kOoZ3+nkKujYxy2d0s72Mpv4d1zhLiPVTRJVLf43Fru9YCh
         C3E5ih8NwhU3esktIYTResh0lGltLLtOHwId7junv4w9XJBahKhxy/19TO3uThq3R+Hp
         oZ6ib6NMPxV3IFKfARQ3bfeiJAzxoYzvySvfpqppLdJE8xT0y+GqDWZUGXODpKhzxBru
         IdKvoXtdnWpVacm9zw/JQhL4mPMUWddiyGDrLqT+Au7A1ZSCgt1NsY4doEFG91/xyR+K
         qDFdCqK5WTkXwyx+yPHniJKPHHc/TzEs8V/r1d29v+UgAS4LUi0ULFoh3gE6yLJFDssz
         9utA==
X-Forwarded-Encrypted: i=1; AKwUvBzMz9cmr3GLoz6Ykwn4ZDq+7FV7yGLmW/qKmtupyq360xGLZir8oN5dlqmEaqCNCj4ClDTRCoxrFafu5ALZgQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/9gk6RMbNxgql6FLtfRk5WvFxs6DcrNbPLO/nU1oF+hTQJithX
	MD3JEfTG8gETJHf25OpWhJAxTj3p7f186iHokJ/Qx0l5UxSntpQEejXQ
X-Gm-Gg: AYBFou2tNbTJmvIVq6vlRl3jRf1B8vnDcgAXgpea2tYfjUsxWxDfGkkyCyiT2I2cXCA
	Aw8kq4peMpJ/jcX8kdn6d7A1Vam2WG1mO2b1N/x9KEAMWdolCj1fzuwKzCPja9oqcZ5tSjwF26D
	zP8pYQPYGGK6Dg2rnHlzNlxfAAHlXNkYfU495i6yy22u2rtTiOTC85gEOSHoAAyY3yt7KC22aKI
	vdI56OHEvUATWfCZJRkTC1VHgtd1xHTxsFQkMoT57nyImn8G/KzUR7rd5X9vDE6EpZMoaUdbjBb
	nyLidRbVr9TlQQcTbGcyiYmvO461QCRMSiHAA99Yx+psgUAUIFW4sQYrE8LzQjnAAQ6vypZ08eQ
	/MnrGnhhZ2UJ6fUApbU3aHy3IsriwdKBK8VL/CLyJ1gdO7X0gR62OpBchTi8X/JdY2l1Meb5a9y
	vReafP2oJMJUj1cWmaJ8SwozRrwzrmyJex8HL2ylsX07NdmVtNgsW/xds3KPyHmvrnxEc6yK8Qx
	kDmIkq7BMOTtd/OwZt+W7DKmabph0rmmzrCKKroy+92WdvSvH/x9/36eha/LDOBg79mvZ9uMvbQ
	lcZLvIkmQlTgMS4DUY9KJbOo/Sq5QfM3w4UxGW5z0s/btGn6kYpjS88kgfwZrWQl48b5qs7+fcW
	UPqc7CBMgmgKlb+fLvH3oblgbavV10twcaYwFiTyqJiScdu2Js7AWATsCQu4PnyYFY7T3Eochle
	vnzv0=
X-Received: by 2002:a17:90b:48d0:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3ae8983c697mr9569540a91.43.1793691662194;
        Mon, 02 Nov 2026 23:41:02 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:54 +1000
Subject: [PATCH v4 06/22] ASoC: ops: Introduce 'soc_set_enum_kctl'
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-6-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZOqi03cyyWOVQz9j7HJ4ZmFw5Ix5rcoCeApwbxKDnBA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+VbzVZeGCSGtuf7T8lO1l2PZw9+d9pc6Off7xS+
 a//rXq4v2MiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVv1YzMuwxlZYSjtp//6Xdd/vzhn+UEiaI2Nl8Foy+FXurk6WcZxvD/9CgyNx
 P55mtvLP3dn/MKNAJ7Dd4zuef8XD7uayGQ/n3eAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234103_287662_A70646C1 
X-CRM114-Status: GOOD (  15.67  )
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

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fbef941157ee..c77119f92dd3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -567,6 +567,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_ctl_activate(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 1d60e290e40e..1cd7f1caefe4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,73 @@ int snd_soc_ctl_activate(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	int sel, i, ret;
+
+	struct snd_ctl_elem_value *evalue __free(kfree) = kzalloc_obj(*evalue);
+	if (!evalue)
+		return -ENOMEM;
+
+	struct snd_ctl_elem_info *info __free(kfree) = kzalloc_obj(*info);
+	if (!info)
+		return -ENOMEM;
+
+	info->id = evalue->id = kctl->id;
+
+	ret = kctl->info(kctl, info);
+	if (ret < 0)
+		return ret;
+
+	if (!kctl->put)
+		return -EINVAL;
+
+	if (info->type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info->value.enumerated.items; sel++) {
+		info->value.enumerated.item = sel;
+		ret = kctl->info(kctl, info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info->value.enumerated.name))
+			break;
+	}
+
+	if (sel == info->value.enumerated.items)
+		return -ENOENT;
+
+	for (i = 0; i < info->count; i++)
+		evalue->value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, evalue);
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
+			  const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+	if (!kctl) {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n", name, value);
+		return -EINVAL;
+	}
+
+	return soc_set_enum_kctl(kctl, value);
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0


