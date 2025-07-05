Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89375C8303D
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Jul 2025 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipNd1HQQ2Ma2pisa7/gO96wA/WYXb5+4l3FrYAWC8qA=; b=szNFCI1TSXPNQdSSg75DjoCvFD
	DuN6yt6Mt8vYC415wDfkFztPeOMl8AkyHUp8ASbQ8i3IoY9MuQBQ327SEW6uWty8nrUFtkmgCRbUt
	CZq2qnpgc6tSYr9mCjAXQGyitlAJVjYT9Q5SRqtkn1ebeR3xxFXDY2VbPwJKMMQElZ34ttTmT/CgP
	Z8/2AePoVxEzMxQGUuG8U2Mj+QPKJ0WpFQTp2BV4TmABffy/XNeptCXTbPkVrwr9qO0ZY8ZNRfLTw
	aMo4EvwD3urs3JS+p2O520cvMNXyP9+DWmWT0LVnUch/cUgFiLFCGYr0cR4i/TpV2Tk0bWyJeuo+M
	mgs0SMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxbB-0000000GF7J-3Msm;
	Sat, 05 Jul 2025 07:46:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxQd-0000000GE9H-2EyX
	for linux-mediatek@lists.infradead.org;
	Sat, 05 Jul 2025 07:35:21 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso2925082a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 05 Jul 2025 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751700918; x=1752305718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ipNd1HQQ2Ma2pisa7/gO96wA/WYXb5+4l3FrYAWC8qA=;
        b=XkFtvnIGj5e2HUxUOe0nA9l94DWj+tzK60cvrrjegt1PqBfMH4opJeL98/XF6x8kuW
         OKSOxpB7X5ZKtxtX51SYUFk5kW7m+yLF4s1/3UlpMSnJTAA/yvjyzfKiFzbwZqhu0esv
         +28JK+l3wEOWOC6oK3LcV++Undm8Q2d8T9kERwpCcB/LneSMVyntmS/+eTnQLG4Rv1f5
         7IVwOAP3YXXg7BT+sH506OLJmIXYfP6H+QbfseANwA7YENyLLihkKs8/y9BkWL/D/Z/W
         Y7c1sl65gj1nooriNsyALm/HuNnElokGA7wCQR2LgAdK/vVNN1O/d17WBxVLoHYiFARV
         tArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700918; x=1752305718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipNd1HQQ2Ma2pisa7/gO96wA/WYXb5+4l3FrYAWC8qA=;
        b=Qw61+9v8AL3Y93NVrrQh8/zGLmGXPFtafko+OpSOifmYKOwUalI8EFDPh4X+wcOSzm
         3n8FkZyVuJcGqXSZ3HAI8uINA1hGe75aii/910IgeuqkS2WrdHRQ/7TmCvVh24KyadS3
         Cn2X2BNLsbWSaHqM4m+MK181H+zQTkmbQXg5YZ0PzhpnQDIiFLOGnZY7bpNtWbYBAi8v
         Nnn7qj67J4auOf42PZczcZzlWwasCo0P0Jkw5OJS47f0oPRT4c5UGFLaDhU/KqXj1ihW
         aYr2v7F2MJhnueKaUvQ6cEjeStZ9rjaVOnfV2x7qwg8L9/+5/oOkX0fS/hozGVUNzR3q
         rygg==
X-Forwarded-Encrypted: i=1; AJvYcCXt3LjZQhgqJia1rFSl41pjb5CisxGwdoQYuUxlTcvXELRuDllCVxcPxAvAmt9pHT+hSib1LYgykdoLhaMQAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzarA4oHgq4kcILg/kJ4Hhhx6CgSCW8bXgak3uMpzI5mWCX+yl1
	5J+MoLYKaRE/v79oX4V05lRHQd2zGtcW8J/KWMBgiO6el2SZ4oX6sXNT8pOpjp/I88M=
X-Gm-Gg: ASbGncvBWmb/aFVK3omvDMNr6vhH9iIZOnL9zt6TPBhtCuGXL/LhTN9F1plUglium0H
	NmtslWNfKhuLTwaCfV84iBLHkX87NwIm70QWI3sym6e7xKgAe0yqBo4LYmTsRBPIr8+IceXKyyv
	xyShjm0yAWrMP9KRoL29m367ZwkM9cfywgPjG0IGBIXSvorj7SJ2f3QZioDQmiS2eqFtZbceNf7
	0TU3OSGjqwXbMOKkhTgq70MJY4syVWny/IDnZJ/WJbpxZwg4TcrjrocaSzbg15kUWPjsjzp1gJE
	iq2bF0pzGKOsJSWyjynblFRJJWaJ8nQTtGXkwTifPlyH9uMw7w8JDIy9pUiEOLXcj2R+P5uzVol
	fLA==
X-Google-Smtp-Source: AGHT+IFxMK52Ys26C4f3voCZTaLQ1Z4j/f7jjualB3g4BAkzo8LsAb43BYWlC0Jml4RwTMj13AKgTQ==
X-Received: by 2002:a05:6402:1611:b0:602:bfc6:f99d with SMTP id 4fb4d7f45d1cf-60ff3e20afdmr948476a12.24.1751700917862;
        Sat, 05 Jul 2025 00:35:17 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60feab9b483sm758267a12.22.2025.07.05.00.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:35:17 -0700 (PDT)
Date: Sat, 5 Jul 2025 09:35:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
Message-ID: <5v5u4nzvlryu5vqaihufqpkzd2v4xqhbdsgqgrxbj4r75oeu5c@sjtdsmjd7tqf>
References: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hbbon3em7477z23"
Content-Disposition: inline
In-Reply-To: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003519_813631_6D85A864 
X-CRM114-Status: GOOD (  11.40  )
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


--5hbbon3em7477z23
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
MIME-Version: 1.0

Hello,

On Fri, Jul 04, 2025 at 07:27:27PM +0200, Uwe Kleine-K=F6nig wrote:
> After enabling the clocks each error path must disable the clocks again.
> One of them failed to do so. Unify the error paths to use goto to make it
> harder for future changes to add a similar bug.
>=20
> Fixes: 7ca59947b5fc ("pwm: mediatek: Prevent divide-by-zero in pwm_mediat=
ek_config()")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I applied this patch already to my next branch and will send it together
with
https://lore.kernel.org/r/20250704172416.626433-2-u.kleine-koenig@baylibre.=
com
to Linus next week.

I'm still accepting acks and reviews anyhow.

Best regards
Uwe

--5hbbon3em7477z23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmho1a4ACgkQj4D7WH0S
/k786wf/WU3raOHbDhvJS1ZL3utHhPXKLF/aFzrojFTP+stDBRrBRc3kKsyxUrfE
On/ZlJYNchwG1kTUh0i3kzgInRxvJTZADwkmsVuBjp9TTbMWVDywhJeQXDkF+r3Z
VbVDNnInWH2DytpwCoTPzppMtLzEk+UaKaboxHfL7t5izNKeuat4UXqHKX+C5i1s
45wZVhPeMFnzN6s8bqeLNGIbkl299gAqU/IgpgUYz/RhlrSKkfl+Wa3OXsuO+riK
O4xK6BXGwS4H5DOHpJXB8/5iagEoEJyWrk2mfDKw0yTxoLjSJfNbzINnHY+mNs3D
qJDLigEtxsN3ZNv+QkD90zYP+E5tHA==
=VHIx
-----END PGP SIGNATURE-----

--5hbbon3em7477z23--

