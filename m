Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F9BC54795
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nztb8QTWKE8vCqoi2j1vz8Fswgv7hpm8l/u2GeDh0dg=; b=g66BTwUtoQgOI2RIBbFJIIT92q
	vdEzE1GN2U7YGiNgv2sn+X2SKGWBuwOMrFVdR7KpFjkOb8xOVYM2jszMDJ+VMhMskTLORXDdutzxm
	Q9itXsyIIHzyzP9Hm1k1gZaGvgh4L94fGCZOFQO8bP4DtVIGvhZy9KClgF33/JOsa8ybGYKNRQ7mY
	xZ2QSafi923ofOWuVEBe3QZKMP6QWYEFRh2i1+/9YLHf5yLGj4/pDtOoOa9sVCocd87IIYuS9lxno
	JeyaiSyRYCmvQdLlWueMifEv3rgRAn8h8AFeTWgbFGxG0EOJJkuQghwS2plVic06TbbgmFgz/Q86m
	IqYkmaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF1J-0000000Eij8-1iZL;
	Wed, 28 Aug 2024 09:31:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF1F-0000000Eii6-39Wh
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Aug 2024 09:31:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-428e1915e18so54261375e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Aug 2024 02:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724837472; x=1725442272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nztb8QTWKE8vCqoi2j1vz8Fswgv7hpm8l/u2GeDh0dg=;
        b=p5OtwFKlOQ2dUnungzczt8iWN+WBNs37GaLGO29TsbeyL0cIdEsMcfClAVbbb7cn7e
         BU1Y8iOZ7qIOc21PAHDQcQn6RTfxwuTt6qBmnUr9MeklnoJ83G3TTDE67e1liSAE7Dgs
         G+9Un9NCG0uQLjy7B+NoSEG5HDtTK9+zBy3xxmZcXDoWS272lwY7j0LisI05e2fz26VL
         JTHkVTFGs3hzpHjTDkq/AAOtGuRBNgXnFjYjvC8csVPfHckI1AGSb2/xjb4nWodWZkMH
         imvY7/zVqYgNDnCFt+xjerA+fdgfb5N0CTIPFCttc2Guy9vw2TwoHPYGAMFxL9mxgL5K
         WO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837472; x=1725442272;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nztb8QTWKE8vCqoi2j1vz8Fswgv7hpm8l/u2GeDh0dg=;
        b=EPtcFycGZvF3omDchjFRhwfEJBqT8IKyovUQrckFmCiVKOMbwox+wc2+mO7+97irrk
         46Xgk2Z2imY0CiQSewIRxtdfZRZ1Up8H9yIRCLGj8aYufBTGDWwvi/0h78X8mG+yoYkV
         nLe0BuN/0TKBo5zvqjt3guZSgFHOyFHuRMhLt9SGIyqu8QrBO/gRPmt+JsXvRMi6dBvm
         Byb5gos02fItTV+RVqJM5qI+Oyj0DR7M7X21hXM4+52vzNPBVEh3kIPLShmGxy98ThBV
         2/Nia4c6W2yYC5qSG3TYTa3JP861p/z+dX6xnifiiBYLGm+RLxQGA8zOiPqlumqbbyHR
         KVXg==
X-Forwarded-Encrypted: i=1; AJvYcCWLhftSLIIPrSyj7o2Z/UNiDInC5s3J4EYdiA8dJKlpo7jOhMYqPTD48MGvphX7nP0x8/t3twvBQhHK9983fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAs7cGuOz+8tPX+CtWR7sxPTHFZgaujbS+5iSbJJ3IZV5IA+Tt
	d0PXZS+VZwdiMHUr3TBYbtRg3lpQbO4DQoA7sqF5k+JipxroVLXj2tkTCNXSMWo=
X-Google-Smtp-Source: AGHT+IF2qTvtGuAd4Hsxi0pkISJXFGgyQwIBCynnMQqBlF2Bo98neUQNmwhUdIKiZ3qtSZRVcHdVng==
X-Received: by 2002:a5d:4687:0:b0:371:7e73:eb43 with SMTP id ffacd0b85a97d-373118e35ccmr10622857f8f.42.1724837471143;
        Wed, 28 Aug 2024 02:31:11 -0700 (PDT)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813cdf2sm15169916f8f.38.2024.08.28.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:31:10 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mt6779-keypad - use devm_clk_get_enabled()
In-Reply-To: <Zs4UWGKt3hLjNmoP@google.com>
References: <Zs4UWGKt3hLjNmoP@google.com>
Date: Wed, 28 Aug 2024 11:31:08 +0200
Message-ID: <87r0a9q9ib.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_023114_066050_3D11AEA6 
X-CRM114-Status: GOOD (  16.44  )
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

Hi Dmitry

Thank you for the patch.

On mar., ao=C3=BBt 27, 2024 at 11:00, Dmitry Torokhov <dmitry.torokhov@gmai=
l.com> wrote:

> Switch to using devm_clk_get_enable() helper instead of acquiring the
> clock with devm_clk_get(), enabling it, and defining and installing
> a custom devm action to call clk_disable().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/mt6779-keypad.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keybo=
ard/mt6779-keypad.c
> index 19f69d167fbd..c13880103429 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -92,11 +92,6 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, =
void *dev_id)
>  	return IRQ_HANDLED;
>  }
>=20=20
> -static void mt6779_keypad_clk_disable(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static void mt6779_keypad_calc_row_col_single(unsigned int key,
>  					      unsigned int *row,
>  					      unsigned int *col)
> @@ -213,21 +208,10 @@ static int mt6779_keypad_pdrv_probe(struct platform=
_device *pdev)
>  	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
>  			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
>=20=20
> -	keypad->clk =3D devm_clk_get(&pdev->dev, "kpd");
> +	keypad->clk =3D devm_clk_get_enabled(&pdev->dev, "kpd");
>  	if (IS_ERR(keypad->clk))
>  		return PTR_ERR(keypad->clk);
>=20=20
> -	error =3D clk_prepare_enable(keypad->clk);
> -	if (error) {
> -		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
> -		return error;
> -	}
> -
> -	error =3D devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disabl=
e,
> -					 keypad->clk);
> -	if (error)
> -		return error;
> -
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> --=20
> 2.46.0.295.g3b9ea8a38a-goog
>
>
> --=20
> Dmitry

