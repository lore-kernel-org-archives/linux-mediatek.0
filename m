Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB77C982E1
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=; b=C8T3X/4IUVM0u3wJt8hGLsyyqS
	D+P19p9SeO1FdPlM/K1AQ7mzyJjIAsQJPdwO/R4glMh/Uacb/qX1Qujl/RIPMG2Bx2KtrvcFF6Y47
	XcHj4Zo1Xhq0mWCTCBW0nVt43S35OPvO1AusVGjKk4Kr+hfoVoAfomHbKH19fDOzdSoXLq3lWN4vu
	ifTkwJ0sKyf32M7RSf4zJCfUGOJnCz3mYVYRveyo76zWpN6+V5hHFI7G7cSr1XokLPiIaym36EnbU
	juUPzsSTAk5F4vdteDhTEDFmF+w1/wGWxYMTUMgFnIfVdUyoAhKxXLZvni7yCYgcpGZD8ZGhxrIvf
	fxy7bySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aM-0000000Grwu-2sxm;
	Sun, 20 Sep 2026 04:55:30 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aK-0000000Grvo-1xWe
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:55:29 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd53691be5so18287915ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880128; x=1790484928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=XxHHW8ciWLxatVSxf2s9gfbcZUM9YR9bp8p4uv6r/ecpW4ivnAg4jL8wniiEaKtX3g
         5usadD2vJ1ekq9xUI05KU2E6EKAg7nArr+I1vOY7rgy3a/pTiIKMBRpnww1HG8aVQlVj
         I0dmOSy3zWDzJJUMUQCdz2r1o4xeQWhna1pNSu0NmFkpV+Ge4ZpGPTt/sBXftfeNxEtb
         kJFjCnumq/vGTah6G+f2/SHRGnfGOPxjAdS3JvMlu4YeblSByQBw3P4SXtjfT3Wz0EF4
         AIrlrEVcDGohPPbX20QxqlAmZiJnAX09xwqPZqO5LujBXJz1gxxcHnDKc2NkeZOO3lnv
         6rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880128; x=1790484928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=rPkGh/D9k930mGMhAilEUc9vNoUE34iMJIvWP4b3IdunmWZne1w+WD2TpU7MUw8/s4
         fkQdMToAjvn/CEH7EJ0+D/g5Fh9ob5t6Id7Vm9fXwbKcwCc6I03tI1k234SNjGqTgUfV
         9+UZzHIwjciiSuelZ2SzMqQ0uQpJCM3WyfGGTPZw9SndNxMOA/iDg1NfNx+rBTlSGQCd
         skznqK+X5rBkv/rB/yxmA1AW3m+WZm237XzkGTeQDhAvgg3qj694p3tD+BQwVbVPznt8
         hrN5YGLv4G8/+mNF+SIG/yKBY7yn8mnv0LyquZP1pDEP+ZRmieycUzgXtZLhKQvWjOQ7
         yHmQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ/OBqRo+O5KzYzydKu/NTzr2revoNd9kPqRBqX/auLwmqhLcA0w7YcEej4Yvj7o8312k73+iaXveNSrR0tQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mrvM8gyfYgwEwk/A+/iE80wxLaUv8i1zpjHhdxJtttZc5QrkJY
	k9HANsIy9fEWfQG6k7833bqz8mSWbqjo3FehVPJoYSYqCS2TEoFUH1Fo
X-Gm-Gg: AYBFou12jghdiwHsArMy1F+O0PxvmEZQdPUwq8lIDHkU3Wsl8QQ7WkWcH/KyfMQf7Ak
	zBUPYM97Ze1S1QPjm5cUQMobhfQ8KaZq+ftuJyvWwlSYSzPDKI+gjkfyjAxBF/Ck6X08dLPDen6
	WgIkQGxC/oMoPvIXLPPcoD0VBzBAdgkpWSNedEpY6o9NuLTrrFFsYoOC2hlfQFRh1P+msmGKNFG
	QbR23HuZmBkxwqdrlgfWHQsuysFLmNDbi8TkawiEpmdV4lIrzl+KPRctkNHip3JJbUUwGFnqE5v
	BsESwtgBzNlSLUkFQ8SX43JyknuSI8fofDdXM6mwS+YKMyjee7JKGQk1phtiZAT8EWUf+2z5Lu3
	Mk46DdSNh7E6rPdy0vIvL4U0zWBUe1jQP9m8CxOiVDJvj+584RWFjfVCPieU3r79u50p4h8wPKT
	Ew27ODFhmb9kUOOnj98wTLWAU+riuFvtpNgFk7WVsZTIMAT9l5wlighoVdrigErG76WFeFcLfGZ
	jrXaCxP5nRCD043soUv/8y/+wVfubs5cf+nSzIeChC6JmbNLeYEs+huBRD0RmcIsI4F3XZ/aoC0
	1599gbhEg109SxJgigO5zHTtdCaFxM7WybkkObPZ4liv8pMsqe1sU7a7hA==
X-Received: by 2002:a17:903:1246:b0:2dd:ad74:ac81 with SMTP id d9443c01a7336-2ddb1bbfe2dmr111629155ad.28.1789880127792;
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:41 +1000
Subject: [PATCH 02/28] ASoC: cs42l42: Fix typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RKZhvpz4A2rORIqdl27bjjryHeuUXe6kyHBpGORO8M0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U3+zQnhu+zaJQKbtE55GvuMdeJjUP0Xn+D6iO1s
 kfcag4dE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqRZxZvjv09Fj/vVMx40H1RefGF4ryvsty2485Ub2Gn7jwwt+e7WcZmR4oruqv/L
 X3j3Zqp6fA2dZMNX5TDt+qnrCrGgbgfol+he5AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215528_508077_8B8380EF 
X-CRM114-Status: GOOD (  12.64  )
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

From: Martin Povišer <povik@protonmail.com>

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 9e40c03ada4e..b5d69d5516a6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1682,7 +1682,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
 
-	/* Read sticky registers to clear interurpt */
+	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
 				&(stickies[i]));

-- 
2.55.0


