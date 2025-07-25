Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E64C87FCE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=; b=c472Kb2WJGm5fXoxX+z6sTCxZa
	Ccd/f9WuToCkxZ/98UXnyupSlCaPR9sv9C5Wx7kxFHEfDOhY5iAvPE0+4NovO9JoOVzj5SeF4Ioit
	TUuCL44cpMKSIDMQShaQHxbaUm3xicBrKQgvIiPc68eWo2DOtjJO0BnAj4Ae55cLpsl4tD4vmB6WR
	0ns6bFIE9SK6ArdoG6YcTnB+8EMKdkr6eRnRocpDwojlZNsDL945M9Vg8NpSwqts1tH0IPZ176n2V
	BL44aAfClxY+tqi1A1MhZto49Ku0Z5LX3T72/lrIpmJ4G/OL6yCo6CjpSAkGD+ZK2gBZPLH3IBhwa
	iPGU2Y7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHIa-00000009nEQ-0O7d;
	Fri, 25 Jul 2025 12:13:16 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGs4-00000009kTC-20KN
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 11:45:53 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-73e82d2ec9eso1196992a34.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443951; x=1754048751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=MoJg8D1VcRJ6Z30+ed7Bc0WJaZh849GvUie12VSbXR5ZrFIZQAQzp/gzX63LiMxwPf
         rzsaDCI8PYEe2OYBexkLdhjfMteZnvUf8NibnJHNFua9BeTw0HUV6kMd/4K6Hg+UStO/
         3ySGK01zor3N4STWimSwhQ0TN17EFlqbJ2mm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443951; x=1754048751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=NRVbAGCKOHTQKCW0/Aj1FXyuPARPq2Zf0ADuhEVWb1z7fMqupG3swLdDqUX8JFao9v
         pZ674hebLp5aSgLV/Yf17I/jBZV6fkxe433k2i/PdCrFBKtOtR9iGZwU9ebP0Ph+MbV4
         dmGfRXb4TbHHUiPLQlzzDC2eO+Q1MrLxEec16z6MNiyYr1DwkB0zETB8ieWOjfB9wnI1
         BaLVW9nz60Tq6GKxwQPzHVzPlOmi+UUDodzGxXbYd+p948fBfqvYni0mXjSn8JBzYinY
         xD31Mff5294lwhRx63kOEDULJb9qxB/l4bq7FRugKLS+Hcfz1EwIIDeoBobdtkNKEOjD
         Q1BA==
X-Gm-Message-State: AOJu0YwbGEbErB9ScoQsrUHXAjZtICDo++B5UcwXazEKI1c2xcR3a1Ud
	Yc7gomq53sLYSoPQ+lqOFzpcQIuV8zHNiqcoyIBOz05ekTiv3vowpp3J106pf8swRC/DBSKTkzH
	hiVe44Q==
X-Gm-Gg: ASbGncvzea4OqiAdK7VH/+KCOedxiOjuRD1sZLdyW/hWL91SES++sop+xGv6ZLZbWnl
	S9mnIiH31x1gW/IwSW3sUsG0tKDymORORGuEsop1cmvHctCJFUNG36NQH0D9wjkvWEuhPzpxwSj
	C46h+PNCNeJ5W7cs8U6oNM6liCYLh9dED3ARCGB49gu1y80xvu4RXgJtWyJjxlpmQ72lxg9bT+e
	l4oclO1T7pig2eFr457vDIY4y6nA7MDi9cUHv9g+stO/2Q7UHmqtD8nQNWw71hDaNQsGaPAoRvm
	Sr6tyd0rRWvGSOx/dMgSBRmwsNeiviflBFV7EYlKKCPO54olyyo+ChKlsij+8QgzpT2dLVgQIce
	zokmRdR74i3qJ/niXhHly+nlMAhhgaIWS10JqFtSKULYM6RwOvp9BHYlLng==
X-Google-Smtp-Source: AGHT+IGpJz0c4Kp0Q+SvxhMCBxOPLSNIX+UBCu8QcEi5s2hL37BgLs3b+hxsDfV1uPfVSpLp4qK7Rg==
X-Received: by 2002:a05:6830:628d:b0:73e:a4b7:f8fa with SMTP id 46e09a7af769-7413dd30e28mr1187663a34.21.1753443951285;
        Fri, 25 Jul 2025 04:45:51 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7412d2e8988sm639189a34.41.2025.07.25.04.45.50
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:45:51 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73e82d2ec9eso1196983a34.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:45:50 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-4fa3f8f1683mr313640137.0.1753440679035; Fri, 25 Jul 2025
 03:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:50:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
X-Gm-Features: Ac12FXxJVbrVgIPSlm6u4--DKBHxaHRjM_36IT45XEIgpl9bR5PM8dE-s5Wt-28
Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_044552_510220_7F64639C 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
>
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

It'd be nice to mention in v2 (if needed) that this patch also drops
redundant #address-cells and #size-cells, but it's minor.

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>         };
>
>         /* i2c of the left SFP cage (wan) */
> -       i2c_sfp1: i2c-gpio-0 {
> +       i2c_sfp1: i2c-0 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         /* i2c of the right SFP cage (lan) */
> -       i2c_sfp2: i2c-gpio-1 {
> +       i2c_sfp2: i2c-1 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         leds {
> --
> 2.50.1
>
>

