Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD4CCF2C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=; b=OuI1vJWcxc9hgj9n+7BwR+45w0
	kMNklRzlW1QNmwoL9TpL55OfYOsJkw8B+vMxPbAaTr4tmupHs/sqdUhMGbOOeZshdufaCRYOydXDF
	tYiV3oM3HtsT1xgweBbbqp6M8pc2XJ3Da9CJsGuHa8iLHqoThfKo9hMhqGXh12TJJMtpJJ9c0Gzcj
	Fi74e1JG53Y9v7pPOVfYjhigYuOZkXEIT/iUemMk76gcQRG21tG//zEfvzfZksSqw8yQ6lJIiwdbx
	W39+sr8jf2jmbexhsMQhSmfKAb4knrOs6xFlm0BJmTFOwGZrAYvnCRCye8wyPz0Ed96/qx8dNCzWd
	rI65wOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrx-00000005Zww-2gbN;
	Sun, 18 Oct 2026 05:55:41 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrn-00000005ZtU-33d4
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:40 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1021044a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302931; x=1792907731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=B12RPDjIA0RonOda1TX2ciyi5bIvzdZnTydj01kK4R9PVDgO0Lc9upPKdou+3eRSJt
         ehs+J90LOlrA+2xIn4HyKT+8xbij0gHoUyH3qzdg2XeppbOsO4ZzMEdeCDxWO1H1nGH2
         pMIl7jGaCXFJjAX0zkC3utlc4iMCiZm4KVKBzvWrwmmwf3QkGzC7Mtjp3uS6khvKUgrR
         mIeSaUjCUHwgDBD6vAGXK68YemIyBKdgMoNCB+A0abRZAOQ0rFNPiVgc4sto86qkA0Ow
         hYZuTYKVb+/6qe8yWhkicPfakqDq8uhDpFcnG3Voc6EbgvQjf9NPhRM/0cMoY/iAuUPe
         LdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302931; x=1792907731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=uKZ0ZD2euVyN0H7JAzVxfydhzqMeG63N2Kofv2NQtm98YtINLRmRi0WuxESRCzh1Z/
         EXBQRgws4sO/5oVZyvLKuqfa0A2Drlc31jAmPRgN7dnx5KiXRJWLxTUcwnLi27+ZOgUT
         2xyLsRIhfImXKx6ekAO5OZMdT8dTTgvZebVZLY9d/VER6fS7O56xk6P862SvPkwmcAaE
         eksLymg9Xmnv/KGAX7TnII//lbOmNQrFrBjP3NQewCfbXxKgVwQErteayP6QxcgiiMAE
         hTb/hrb7B8FuL0EuG1S/KJ+z+ql/qTSYX5OQDxPpt49ciUYm3cQkTESyAFfWz8DkQ3Ix
         M8Pw==
X-Forwarded-Encrypted: i=1; AKwUvByaIUARd7HOkgXSA9OFWlF4P+rYH0gv5kIq/JBM/esozir5h0CgPH3No++GxiK+QFPH8I7yDS5Q9Mpfrx5/lg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJrXwW46kP7IMGsRN5dy7HQe1iaZnkUngKa/Yc8mI/dFHIDFZZS
	aFjLSpe29ZLPphp28rTALIXStN6yldtP4YNMeknNHWL8DOcLMB6RrA0hgt8HHJnm
X-Gm-Gg: AYBFou07avgERY1cMMLDkfNqgCJrz9yTMf92hs7gj8LKBwwFcUpAue8u/VZcGq2HQKR
	ZqsBQ7zSIHGO/zjlXFLPWNlAtTULPhJ1dac3DrzYD5E17g3TJ64bEs+OAOiBPOvRbgWv2a8YlLE
	oTLq3i6uvAO52kkiLXciPENb3td5rVdt4JsoVwZVGaGqPoFAbpv1RXGFMR6ldnuirUw9iJWaOh+
	arcoBm99Nf6/TmHWbXwmrCTcosnLs64ARxIRJl8ZispiIgaxJ4UGfXVhEgiJA7N/Xb6QnCfeqC8
	CB929vuZtSj+FgfJSGdul3NVKt3sg47+5bpfc3Ki3lRl21QFJOba5wTd3m/O0PD3d61wT6DDN4v
	8N0ZEzTSduWDS52Xy/bfHlxukSqJgKcMNPMXCegpX0ejPUynz1FW+9fRig0VQxItc6+Gaud26kP
	OIA2NNPemQCKStpAovPFvuHtkeDBgi9t/dIR/+3tmp19iMZGrhERjr1oKuzWAV7xk+PG5OWc6J7
	dysRhleecK0U7503JSJe4S0KYVPU/dgHyHlIXTti+mt6t2TAss2MItx3N43cVZ8AD3MXMW25Ni/
	2YuKIAOk3X3vM+BG5lLMuGU7TqVrfmroMQ7inaz2DX6+UQ==
X-Received: by 2002:a17:90b:388c:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3acef17b443mr4199337a91.28.1792302931040;
        Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:00 +1000
Subject: [PATCH v3 06/21] ASoC: card: Let 'fixup_controls' return errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-6-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WKyXFBYrRnpsdpBs7slDgKqmeLl5GkYhostLo7OTo0E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl87T3eH52yiC/OL4kx8RDDVXlZQf9lU9a6vbxw9
 +IPh/hjHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKne8ZGRYX/F3ut5WcfvqE5O/rHN8cD3KUEB56UknrrOjWb/crB7ricjw2Vm9hK
 RRfx77sqoHRCY9KBn30OXzQzajz/9dbPNujk9jgUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225531_777734_89F84807 
X-CRM114-Status: GOOD (  16.51  )
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

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index dcfd706a73ad..a3b9d2610514 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.56.0


