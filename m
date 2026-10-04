Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AB6CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=; b=p787M7YPeA18iHGTJG5wlkptT2
	cX+gTJfGudq2noyllKXxMlwyWDrK1lhw0WPKu/uC2wJYDdr/vIZPqMEi3iN05elT0G6NNVhzv8QOC
	ATiOM64sCLHsgUrgNaY8gL0tSiKMeaqf79VgTzVDvaoNSA39m49iZN7Uc0tqv1VF3jsXqbEYJJwiN
	DXDpB+24TOyBbIFOZ0mq8AH91+hVc9pd1Ir26mANH7XqSgALwiNXbSdhaBY4wXojSri7I9zHdW4J7
	rYOtSMxfw9fBQdwWkwYHpDB5fz9Ku2OQ5CSZBcyiMGMvylE4SCxODs6AUI6hNO9Ffj5kv/cnB8RPh
	5hBymiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLx-0000000ENot-2Hbb;
	Sun, 04 Oct 2026 06:05:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLu-0000000ENlA-2VUO
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e30b9f1441so8971075ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093938; x=1791698738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=Xhw9w9Ox5IbsRDt53+FpUniHyUN8nAcVdExxwIlN5rl/IU4OCGbUQzhZK4GvgXbsyh
         h26WIgGZb7VgAQtSQ6W+67WTSYkHNZdF9Eg4BoULoyc7EVeMidMH0jd/SGOVz2tWGeF8
         1TEjnHavw5mAGZ66r6Kbaq5/xZb8ZogaA8N8flGTZBY9I6ankykbZp9sWXlYwFfs0CWy
         IMO4GZs0Vth4oHPophlFx4jsaoixS8IUFAORki0nnfa2EHx3ZPXj7MVzbmX6kVeCYoSl
         gFZ4lWci5A2qEu+F0Vsk2x57h2tgBQA6wYQzAWvK9lP+MJkdoJIpcYqeuutRSGH08Hmq
         Ri5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093938; x=1791698738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=fAzt9HhU+++qR+luUnw9JQ2j6TEJc0GdGcFBS1d01DyP9omTcGGnAQ49Kyni2b3+L3
         ca7aQEGDSQ9eDU3RkN0v7l+x8Q+6p/Ej3qnhyzs7nTgSL9lTJlWbJeXkFf06H7X6KCYc
         s9pxXI7Fo+VvggIXTXXIO8XlILix2GNToxlVeIIlMSzAdSrz0y8nwGVZsedY8vYwgJMi
         TrNSkcKdBqN8m6t7Wem9hm2/BkTRBP2FzY8BRXh30pIpJ6aiGVjABIZblWCTe1Tep6sO
         v4DZIgvunBzZ2Juk9XCDxaagoD2jXuqAbyF88+54mNwPREy52/0jKGXc3T2GCDYrdnP6
         ZqMA==
X-Forwarded-Encrypted: i=1; AKwUvBx4ZcaeAQaPdKGt5kid3xAxFKMYfE+q9UyEVyAJYkiNKDPbVXPzD8KDr6m+kuaGeljq6Nyj3cYIH7hK9DfnTw==@lists.infradead.org
X-Gm-Message-State: AFq9FYI+Vy4Dgk/CUWhAUS5EcaqOQm8/j0dmpH/1Mr+N1rFMECA4tFvp
	1xhJ/H6PxSsl4JzXfM4v9SJsX+Ex/fQxYhLBb6jgg4FrqcDYM0pJOcCt
X-Gm-Gg: AYBFou0NJqiBjibOAoa9a3r3JrqUXBBAXIxlAWUVz5w5xBmUjLQjhD/YSU33AwfrGdt
	L3dVQpuhKeuf+54Kpc9iJcNtK16KUxCxjj0079AcqDquhup+V3ntnsVdEfU3aRbHXJ53P7J+YKT
	WbfIWda264doKmlVwtzyZP4KDS8l7C+wV7NhTZksYygYczIfg/d8MQUEYo13akk+HgNI7tQBjSE
	Uj4YYMvsYreFxcY1EDvvIuV7tOqtN9/uaxfaXI1W474389OM+zJzVfP/2tL8w+Er1kgxNj8WJoz
	lXjewg6veq4hZbByCh80mb0TbRueKv4XnQ77KWQZTooyypi89rcH5Yz8NUOBJOXWWiZ0VgYxBwf
	oGM2zCeiV14SEPMC37u6Jzm+CzeovWi+9LXccJzOeKX280tNtX9QNAK4rfJuM09LIuF/lmARN8N
	Psh7wjsvjam9BTcNfkkDJQc4S3iCIedRqjKjUQylMJlXgaETwLQWX6NSTTEPQHolTHDiOscjavs
	9PW2Fx5iCG6f5eB37X3ugzaM2yXwFJBL3ITe3O60P8n1TJiDMs3/YTwtJ0HKTIo2swQ7JBr7OqF
	gidDeiSdHjRf2Y+ewhUM7f18PtQHjKyCPLXm68CqCZatOjc=
X-Received: by 2002:a17:90b:1807:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3a786736764mr3389299a91.7.1791093937568;
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:35 +1000
Subject: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+S6/V6Rf+CQkZB8/d8Fh39Hzv1fkX9mK4PJDtM1F
 ls4/js2dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6yZOR4U5dScnqLI/y+oajswwsflst1AkQninyhIsheYujw62rKxj+u63d4uq
 j8bA70sPo5VtB9qCwq6lvD/V8MKvXC368M6WDHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230539_470079_38FD1D27 
X-CRM114-Status: GOOD (  16.57  )
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
index f356b553227d..d638fc69925c 100644
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
2.55.0


