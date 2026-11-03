Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01BD606D803
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YhXrh1Ta;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpWIlKRI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=; b=YhXrh1TaGezol0
	Wef/mzpAYVR13GS0+3PNhmKkDa6GP5GuSlOZ+wr35vMZCzDvDFtdtrx3Jv5nWrtw/P/Arja+a1Xll
	58rXUhG8RqAhmGexNRtp2ODQ9/Ax9MrGAcqQfXOLjvCCDumornXfq5BLxmikm6ebm9pGEJJCKQ+eZ
	xZdHOWNFpjGCdPI2BNhF8tbGor8PCPyKTd4JYnn1Q1hKhR95a3PoqG/PklS9AY5xtDxXEAz3n8pFh
	aHZWd82tH/xMwGaWnYd+A+CIDTsoZ7hQZM8rPxkjwbfDdxKhz2STBnd9EybyU2CE3L9lLeDL1N5K2
	CRtm5ti1OjHFTs7fpOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98t-00000001MJ5-1lyL;
	Tue, 03 Nov 2026 07:41:15 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98p-00000001MET-3EVO
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:13 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1940040a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691671; x=1794296471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=zpWIlKRIJ9EVE0AlIyWOBwT9rRchwzoqFUxQRcDd4s5Q1aDV6qMRsxJrCldrzzwJES
         K+L48if3c1g2MPYj7q1BXOF/8o5LU0/h0P5XuwIzJvYCcknhuEckHr4ndwxzZNx5Fhpb
         JD4OYCyXP1elbZ5Ho5Mm/SC4Qn6mWIDFvTHFGEsQyR5/jNC5ttDBvf5Re2Ulvzon9Sdp
         sh6gmHnc2Mz55VQ616fxFZ7h47/Jbn2VwSond0nYn8GzQalNZWZm58cSA22Cf3vaWp40
         6PyxEirbvlrnazQX6m/G4aqvtGYvkMeve7JQUWbLjiiQxlonJ9zW+Vz/2nwMl5NeWStK
         j1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691671; x=1794296471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=LjiJT5FELmPoDV6dkF8xyviftfjhYlnqiPRzi8n3UM6ZVznqVnkU4m+HzKUPyy+oAY
         dZXwXM9XvHq4g5Kl8R678dh70yWczycWayVp5b4/iaABP8t5FBNmxFJHG4kMhYmY8/Dz
         iQ1ka0OtFe/nOnuQKITl+pLF3Rp24XNNeD/6yCgmeFr1kk81TVjzYT8Ap7D1WENH+HJA
         mRdXEEBA4qE1zwhY/lwYGCnkS6QfUqlJYzyNg0PvvCjFpidjD35yQj4CNmgdZ6SkPtcH
         jmmyLwLMkaR+tJ9Ag4i5WC/Tz7cnT5CPJlelmB3xQ7OX55lA8s0DkETl1xvqMn/J8db3
         QOQA==
X-Forwarded-Encrypted: i=1; AKwUvByHGGbw9KQUhMRjbZLQJGfICpLqJGRbXgv8MoOdXks3Vtr6omS1oVIN98520CMYTIjXEs6L+XokU62ZYCYSaA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+DXcgTvVbzS3nbImsTE+srFYzepHp4vTY73OQQENX10+2nK6al
	dOIbspmszNIPwCTDwxEoksSCoEwpvuwjoHhIneNO+qdxscbMSFZvGwcI
X-Gm-Gg: AYBFou2eI0nvXYbuOkk0yICkQ0EDKjE98UUg5xazEmCpzkPIZTpuA8fazrrR5B0Ajpg
	dE3u92zJAiK59k/83HHH3eDwoqjA+96cfwY4Ng0+RgEOY43Iz6ctyfIbaY8+BcTLelAzdgncHJe
	8UDYZDtaU5mBHBSLgNr7L0xHaEDknuetMUCuFvSNuf4r3E0ECPEuz81wcGLkgFEK7zf3qagbP0h
	r4tAPFT2pnQ3ESwB+z/L/0htCiJBNC04/ZT022XO2aSN/3R/HxRT+j+u2UM46Pb3AsrYt+QbhN/
	/PK6+6za9TBT0HSb3QGbYbx0kmdoeb2N7jCIoV043b4wS4rXBM/kbT8A4ucp+zCjw4AO+oXB11Q
	9n2sgCa0ps4ef3hgOOFyWZHy50BnIT9XAiJCrv0Dnx492E91+dys8v82yiR1Agz+6fLFXsCAWv7
	Qz+CGXsE7/KIVDPtwwuOxCbUaR7uUaKUSRwHdw/oWQZO/RKQn1FnruHa15rdxgSrxLVskY2i9Ja
	0opwNlg623085s+Xtx3r/Nw/QVWcL128QDccn/RuC6LCEp/fzKtJdz0gEsvwoxfZ51kpxvDsHzf
	S5I4XsL+TTMl3K5JefNb8QQ/6/OiuSjlyvnq5iqyHtYZGpChC/iKLzdHq+3uvLCdaOrXiLN7jxO
	GJp11zbLpSkywWuU59n1sKCv9jRIJcrua5lndeWtlu5ml5fTZQr0jAMwXTHcvPsbHBmvuXR6cJK
	5hOmc=
X-Received: by 2002:a17:90b:1c07:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ae897c9501mr9764839a91.19.1793691670795;
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:55 +1000
Subject: [PATCH v4 07/22] ASoC: card: Let 'fixup_controls' return errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-7-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2OZVyHzqzH+8PcXoAdYlRjbU/QYAqY/WFwuuw7hvh0s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88dv6PWURB1okEw5aSq8G7Wic51S16aXTmtcOFTt
 eLLV2z3OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMdvpPhf2bIkuV7z5n6rp6tmH227+eD7Ie9ojtd1veKTHyVlxhwSZvhf+iWG13
 LWxZ/3KeeNcnGfUeJ1OWZzZXCR3bNaWVlULpzkA8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234111_826392_14D4BE72 
X-CRM114-Status: GOOD (  17.09  )
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

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                  |  2 +-
 include/sound/soc.h                       |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 +++-
 sound/soc/soc-card.c                      | 12 +++++++++---
 sound/soc/soc-core.c                      |  5 ++++-
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
index c77119f92dd3..771234028fd1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -992,7 +992,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f07aeb637108..f93e830ef4a6 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1283,7 +1283,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1305,6 +1305,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
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
index f33bece378b6..d4743d68deb6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1845,7 +1845,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
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


