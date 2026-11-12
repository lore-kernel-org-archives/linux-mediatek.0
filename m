Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D49606A327
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 06:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SqcHTzp5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sezenHww
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=; b=SqcHTzp5d6+tAA
	Z5ZJv5Yf2hx5T+g6+3dWjly8XZdExgGkEt1QZ5DifFlFkX28yOi8I0CA4o+3gaKz6wmKejLJNNFaj
	x8qtKNhXi0a32ksUnis5MR47GaWOfu8/heJmQiRbGtN1T8eEYHtTXJq3yieBNjwP1djLY4BY9tas+
	rZjHBxOGj9kMtj8qZZ0IOJ29Q//SMsyEwoBUWzwJpYOSfdWth08MK3idJ3lGrH6kk/rwcjBhThf8Q
	z6aKLtVwue1mqNGNDvkXLH+R5GjEL7+XYmeOPwBYnQyHseqsWIMCfw6ufO2yyGgD+fQyiPbW6uI4M
	N1+OIqOPRhMqW7CuDT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROA7-00000008nyU-2yqc;
	Thu, 12 Nov 2026 06:19:58 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8L-00000008nPK-1Lx0
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:22 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93f22a8515eso316117685a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464284; x=1795069084; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=sezenHwwSoZVVd7DS3c66k14qgnVG/jurM29o1eiJebFFvjMqccEKuxlFE/qXCeoQ3
         tPs88gSdHbE0UkGoS8oCJh+HzgFdV0UJeTtR4xobcgXitHpSO0uukPIUhD8/apBFQ44T
         i3Sjg2tWv+EawCeQtoEK7Dp67pRN5cHAbiiLbIwO3k97jcnLCWroZH6V45eRcxBxPqmF
         Mh10vHHjNnPHgDaWR8gjHNh49D4PpWejHQMORfn4RCb2m7fGRXV02ZsBdU8yRV28cjoj
         sQeKjxh2oKh9C7uSm1JtGAeEYUBJ8nHmALfRcbD0apdK5BeF/NcXxvEaDAn7ylVUvdrG
         llcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464284; x=1795069084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=pMV3QAtRyjiDXgB5VaKt9O0IYvuhZiQMXXWdBpd6LXM7US0X2cCiBa9L6SfrgHacMR
         HV9Bmq7U9gXvp2lMCoSER8ax594eFQjTYtViCUMp8rEJ0c6Sxrh0gnciU56yNwxWuC14
         CSQSUbSMLfQhXeeHNqs5qTW6kNOdmmaDEh4EPJVt4DuHEd64uByLQHb0HhQGuIBncMmc
         NTv7PQjy6aRBRR4PgovuLUUa8VZ1x7/Z3GAIjUU16GoGL8BzJNDeYH0L+0hdYihl8JHj
         0Wr4JIfUFoCPjzGpJpHu9DuZyBMhvmUS4STIOkxu/viHEuy+bW9tgNIMqOW66YahjfyB
         XHgw==
X-Forwarded-Encrypted: i=1; AL+hErFV/JFUspvoxolG2b02psi9iaim+pwC2bWE3v4Soto8+3dhR4wOzBRKYdFwuNiFmzCdXc8knWOBc9juFIrGiQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+bcyAgoCi8b6qyZRcsT3CvoIXxEvuKugRJWLNCMQeGEw7icVDR
	PScnAq+OwAynbtHmszSYNSuNm5+VyCAmxnkX/nMiXJSmZkvioUjXIro=
X-Gm-Gg: AYBFou1OYv9z8BZ/RhhFaU45eFyNu9lIVQQHF/C92UekbzF3REastHJroXeOs3k+SBv
	FHsjyN9fZ4dYqvveGqKYk3O3LPVtQGw5SsBqviLqlS4H3y2fTebFVMK/muJ913BmqWVZ1lwyWyX
	gX9Zx6WnvZvCqxMsjLxsB0Q6NALmHkC4feA/qRaSir3z9th7gq9ijLikoaNF8WgFaec/7yYHcp2
	20ZaBrCgMNyQTJhc17lSeLM7loBrBeaicWeXLdKMVaxjfdodnYkxZ6Wzc7VRDd50F6UbRU1AQyN
	nuw926J2Y3GSpBFrR5AyaLHHP3lB0AvgQwarODFqUJuTSeIU5p94kHLgBc+7PUmdwAsEzEFHuXz
	XVJd99wgFQkFDaEJtFcGXk6FE4nv8F+HGAkM13/mepILxNkwaHoIkajlMDo8LSik1rHL6ae+Aeu
	q9XzInO82TgJJ9+1hpbzhWBuop6maxkmXDBJupHP9yUnh/8MX/ihvAm7qEwBodDvsdByFQsyYz8
	YTfhf/PN3DYYgshLN0wWm0FN4i4wGNfLBsS3ueMfbQuGpkeUqPYe1NqplKkXgbtuUg/5K5MkHtc
	AriGxiW8Uoj75u5rSKHrBhdIOMTZM8JyDCoOhl/6mQj5I3ljNAuzaWIKmI8B9TA026lvZ/mAQPM
	1ikCg9KI8iRydK8cL0b+PO4/j9sPkT61b8w8guVErlI+uJtul7dPHGABkKMiQeNILoNaL/Uui7D
	WyhwPiN5904rACzbdvraxhp8PVD3CjTl5G
X-Received: by 2002:a05:620a:2257:20b0:947:b201:fad7 with SMTP id af79cd13be357-947b2022eaemr552868385a.67.1794464283900;
        Wed, 11 Nov 2026 22:18:03 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:02 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 5/5] ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:49 -0500
Message-ID: <20261112011708-afe-v2-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221805_695997_0ACFF932 
X-CRM114-Status: GOOD (  15.33  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is allocated. The audiosys reset earlier in probe
makes an interrupt before that point unlikely, but devres still
releases the regmap before the IRQ on probe failure and removal.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and devres releases the component, the IRQ and the regmap in
that order. The driver has no remove callback, so the IRQ needs no
explicit release.

Found by a static analysis tool under development.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index d9c82cd8869e..2a27e5de9184 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3306,11 +3306,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
 
@@ -3362,6 +3357,11 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-- 
2.43.0


