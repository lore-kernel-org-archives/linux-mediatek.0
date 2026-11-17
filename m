Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB30606A894
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ORUH71vr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q/iaKNLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=37uGohoQrLHj2USu9UhU96IUxbYg5olFY/6kdsoRNco=; b=ORUH71vr7SDsusiriWIWVtjBHX
	1DSGsHzHbOud1N6vPQ7umhSCrLDH5ahzYiHvnaQO3rK6XeQ9VNCTu4uTk4IbAMtXEhOeQ4MhzI7uK
	lpjbvruwH1kcOMUP/mmwxZTDZn5gGf8n9YyunbjcS+yUoW5DvDDlkikbjytr9vX/jq6EBOdKeKJ1O
	RacJ6gAtRMD5aYyB9/XmJ7DEHowwWtKbbEJ3quADmFQWQcnkIUZhoJfNKqWDz6jcL1q77ji9wpOrI
	dvKjM8W06pBwawjPB+iW4GC7FN8ZwyxjllPlyEe9bcrGWwzq1lPeZK96Z7T8+f/fPhS7qNhMX2Oz2
	mx3yoGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNQG-00000006hZl-3GHT;
	Tue, 17 Nov 2026 17:56:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNQF-00000006hXW-0zWB;
	Tue, 17 Nov 2026 17:56:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9645A60D42;
	Tue, 17 Nov 2026 17:56:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794938206;
	b=iz2roCO7X9hERV9Pf2dAFWjv7S0Amxd/l8/Jg/MwaxHqZEFkLO4hVo1z549zB6256JIs
	 hYMnnyj5JzaEF4cJD4RZbnNUBiIqd7j2nHwkBdQlmRv5ga+PO1sUZDH6mppUTCAuZrE8V
	 OALahacFNyn8iZ5aFSmgql1OJ7/oMxlg1TM+81qN5cROXR6OqCRh7Q4qocrNFzI+DTOcN
	 7i56ofFGX8HOoUOu5JYtl1vcQqpZ2UC79I57y9a0AobJi4pvysGKZbAEq2ucVDwdYHf5g
	 Eo0dcmX6MN9D6Pafe+6H2s8G9FYBz84Qm/s5j3s498/MVopMGzsBzPtdq1r/Ve3swIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794938206;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=37uGohoQrLHj2USu9UhU96IUxbYg5olFY/6kdsoRNco=;
	b=l3u0l1ZNdtSkqBlqAyPTEFAptuJDjAC1+WeEnu8DJ5KBTxPCo+HA1RCuQyJFWvyGKZfd
	 aWtUM/OaYfBJRHgkvmlzoG22ACwXvhf21sOuFvpyAfcDs9xm4uoEK4cjj+HSzt5uxQFPv
	 UqhEBUEehNnkqB73EEnQDyyrtAIqFU2U+jd9RFHi/oR39c25b+OJO2vYxe6chTBMv2kuo
	 KEZpugywRnEgWUMA5IAwBE153cAIa5H4ltH70fqdgqmu3fTYtzQ9ONQ+lT5N32iVp8yET
	 Ur55Ttq8igixGeVxlQ1DhuTOYEDC5imUXsAqU+2bZDtg/fCcwdXK88RUXoSZ1y5W1ng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6787B1F000C9;
	Tue, 17 Nov 2026 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938206;
	bh=37uGohoQrLHj2USu9UhU96IUxbYg5olFY/6kdsoRNco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q/iaKNLlBufYPlZbtZrnh/h7jMfujgz39Fz49GIWzLBxcMKuh5jyMsxX3YwuJJeHp
	 rVsjkFgBiuZ7gYlfoa6yXnJvk9Vt9G0mvFQCRRu+oY5hNFEsz3bvYkGki2j6JOuhAL
	 FVd6I9F4/ntadqJiz78Max4iGaiffSrlTlhQnHUcMYimbJfCzdAaBGk3UBykPPyzZC
	 k5QXAJxDykE1w3uF/ALGEtMPaVOd3k+kpOacmzkfRi5BAEHs8qYF7WpCDyXHn7wLaG
	 FSEiFxaRCu22jS9sHXztBj2FG23pUb03bF6vnMaKQUmkf+9GLeGJimJ+kYswwQHJlu
	 lBxRg7N85QSvw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DFD0F4AA2C;
	Tue, 17 Nov 2026 17:56:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 17 Nov 2026 19:56:33 +0200
Subject: [PATCH v2 2/3] iio: adc: mt6359-auxadc: mask conversion ready bit
 in mt6358_read_imp
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-6768-6358-fixes-v2-2-1ffc3c2f3c80@protonmail.com>
References: <20261117-6768-6358-fixes-v2-0-1ffc3c2f3c80@protonmail.com>
In-Reply-To: <20261117-6768-6358-fixes-v2-0-1ffc3c2f3c80@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794938202; l=935;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=bZjW/quYiBMjfPjx4Er0DwmCVZ9DiZQDsN1KE4x1ONc=;
 b=OusJTjkZgLVAQdFTHc5MWzls2x8KOggCi76d/hEZKW7sLdQMmQUGtc1+S5huPfcnIAGMHGrZz
 AeXtIKS1cu7DL5N75QIwAQGFGeJmi1NS9rmUiPO/OWlXCPD2UIP9KsM
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

In mt6358_read_imp() the raw ADC value is returned directly without
masking out bit 15, resulting in incorrect battery voltage reporting.

Apply the mask to strip the ready bit, matching the behavior in
mt6359_auxadc_read_adc() function.

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 951d236f972b..09432d0974cf 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -502,7 +502,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 	mt6358_stop_imp_conv(adc_dev);
 
 	if (vbat)
-		*vbat = val_v;
+		*vbat = val_v & GENMASK(chan->scan_type.realbits - 1, 0);
 	if (ibat)
 		*ibat = 0;
 

-- 
2.56.1



