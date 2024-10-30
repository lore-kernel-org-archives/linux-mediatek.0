Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73078D7495E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:From:Date:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwEZskytNCIxQggG34Kcvzn/h7WxM+KE0ZJz42WQe0A=; b=SXX9xI92ANuHVueKWWZbdRFf3q
	C6FlodVABVVRaaHVsrn07BPn1isUX9kQ8iK0K28EJ9o2cH/+IePl7iLgnzrOx9cmAdowjsKoxiGc0
	jPhzqXp1eEu44U1RH1b4HUuFw9zjfsD1UNVy2kExxe9w1NtQtZOPFqQg2qoxjNi8yFtj0DmpZqQj/
	MIZnzdn+tvh7AK+ynduQXEp6A3E12MlH1rMB6H01uFE/g4e57v5HI7iR1u1rRzmrnRmxoZ8o6hsuz
	GI65gUe1T+bb2iTV0Si0UpZ+K/mPYbh0eccFl8CrAKw8ZBowAzM0FTpTd1kgIcXZZ7EXujPICuJ+5
	v+gVNYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63ET-0000000H9wZ-0bpI;
	Wed, 30 Oct 2024 07:35:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63DQ-0000000H9iU-1wSu
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 07:34:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43193678216so48687375e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730273643; x=1730878443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwEZskytNCIxQggG34Kcvzn/h7WxM+KE0ZJz42WQe0A=;
        b=nnTLQwTW7Kis1L/g9eXeCx0SS70sq/xM18zy0I1iKwSO1Z1OawjS0nGdEweBcbWmOk
         UYY4tUFzqKmGugBqsXB6UuCCXJInnwblN/3UGzIl1nEl5XkEM68vp7zcPgoKykp2pbHx
         CY/pfKMyQU4nOmqLeDBO8ivw5W6SdfcTm51I8RlbrkT7Mjo4D4Go20qXqIE20L+lA7P8
         WIm+lpytRp7sUF0cdGTilnHwCj59yAFFs2ogogLUDWzBjbDtJiTfgO5w8ZIOhOOttmwu
         OyscrKpxfpcFiPGvpfDUcuskoQXYxBG7kH/uU3+C1SaZLiS5WAI+Ik8oVrOD/iq0Ueg2
         M6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730273643; x=1730878443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwEZskytNCIxQggG34Kcvzn/h7WxM+KE0ZJz42WQe0A=;
        b=IHxVguBRWQdqcK4KIyhcfFUQGsAVSY9lDV1YZOOQvgUIly06JJq9fFTGoq+NgPZQbg
         68XnpZhtwXLegpgHv5gwlLIPNYIM5PdAWaG3gAPSoHf8Dhz+H0iiW4pCl+uiZzL65A+7
         sLDvBViitQTAWe2df3RJbdO3LReSEfTJb8bWhx/tW/Gg6Z21i61S/Ra0Z0UfJXo2ZeoT
         7oxIFp00dWukIQVDchVD+6JgjmxJUM1pI4jTZNDB/hh1emTxRDTzEmxukwbL+4v9PjGQ
         0wWpyyTROXKvwzwzGHuQktQUy1VFMp3f5p7ocl4EmcK+JEO/aipm/YHjZ7Bno2C9O7tJ
         NZfw==
X-Forwarded-Encrypted: i=1; AJvYcCWkslZP9C1ZTQ61DAxVw4/3jPFv+hwBIe4xbXEknd4LjXJIxnsdyuX+PE+rvdZXiNFZAOYIySa5RG1Ajj3S/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxNwOwD1GeH3Tt7AIJEo/mWKKiDxyM1cimKm6jSWT/4WKU9/cm
	myxmSWzHQkpU/qWILLA0vr+AiHtCByuMns90tGVS5V7sI3SDD8osSOrTVjxC5y8=
X-Google-Smtp-Source: AGHT+IFvSeQlKDXZ2TaznWZQry6qmvVUbv1vCSFsNuf03fMgrDansChUa9SPu6uyHlj1+Orbp7RrSg==
X-Received: by 2002:a05:600c:4ecb:b0:42e:75a6:bb60 with SMTP id 5b1f17b1804b1-4319acb8fcbmr123819465e9.19.1730273642534;
        Wed, 30 Oct 2024 00:34:02 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99eab4sm12468095e9.44.2024.10.30.00.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:34:02 -0700 (PDT)
Date: Wed, 30 Oct 2024 08:34:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
Message-ID: <t7i6lkx5oedjma6uauiygnvbgzixnsqmolmkse3j2qiy5znf7t@kfozote6mm2k>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56rk2czsrrb44okr"
Content-Disposition: inline
In-Reply-To: <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_003404_543704_40F16B5F 
X-CRM114-Status: GOOD (  15.59  )
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


--56rk2czsrrb44okr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
MIME-Version: 1.0

Hello Linus,

On Tue, Oct 29, 2024 at 11:03:14PM +0100, Linus Walleij wrote:
> On Wed, Oct 23, 2024 at 1:21=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
>=20
> > Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > needs to access the same memory block (gpio memory region) to configure
> > {gio,irq}_chip and pwm functionalities respectively, so model them as
> > childs of a parent mfd driver.
>=20
> OK someone has to merge this and I suggest that I merge patches 1-5
> (all bindings and the pinctrl driver) since the different bindings have
> dependencies between them.

Fine for me.

> Then Uwe can merge patch 6/6 (the pwm driver).

The pwm patch needs some more love, we can handle that separately then.

Best regards and thanks,
Uwe

--56rk2czsrrb44okr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmch4WYACgkQj4D7WH0S
/k5D1QgAjbBhIuEEliXD8FforKpez8jJ1PxkBpkZubAbNImwSpOpOGraTpIwdy94
+Mp7owHDJULSYRibBSz9vASz1ULu+LElGQSTtfO/FMdo4fxZhS8mNWJmso3GgbfB
6sf83Ou6IPy0V9RZS06z92en0jFa296T66+U+eQRcMvgZRZnL0R7Aqhm9acidZFS
kTzQw7fKIpqi5t07aAeQxKZWZ8Ag8hPwQdEECSpzJedn8c9yRaop1swgJ5X46Gs4
NZMYuepIpatIVEfog8i/NzV/AQpy99nlQfLpt7nbPQk+o0gINALiBGe7bGzZMDNj
27futyysj3wJ/nuiDdGOnZtazOm71Q==
=pz6h
-----END PGP SIGNATURE-----

--56rk2czsrrb44okr--

