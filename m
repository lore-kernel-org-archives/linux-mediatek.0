Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64B2C83F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jul 2025 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NE/MXzUMZS+44xcmHH89HI/9f+w1SgEl87LO7gVP//E=; b=zX7G3elVEpzwObtF93TZQ67kUD
	AoPLpa4AenNLC+eEjIWS997u+bpR+JbN2CtTYuXZx7EsmJHeXGoIeSTUCAS1/5lpfGhzZcBJvZq1t
	AgczKXf1ofJy1mHYMIsF1pWYzar/iufsEuS/fhJeCGGqmh2wg7vmSAs41+ALQJu+fUYM+HTjVEj35
	YKwnc4gxfox4opd/Om8S4YIKN7yEnXtrN2IKBf5l4l4mjvTUi0uZn26B207U4fzr3edhzDBj61diI
	0e/fE6dKdkRFqCpl8MpSln87h33Br+ZUXILo73tZZQNQ9uobFmqVtlYFD7aMTyWAfk7CjmSRr+6/Q
	PuKP/JQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnO4-0000000HI8I-2qwm;
	Tue, 29 Jul 2025 16:41:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmvZ-0000000HEpp-36DY
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Jul 2025 16:11:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45629703011so40361095e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Jul 2025 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753805503; x=1754410303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NE/MXzUMZS+44xcmHH89HI/9f+w1SgEl87LO7gVP//E=;
        b=vejFLYvJBH7rYTFadSlauiHKsW+M2JrR/qy8FQgqDdqfA/Yy5MG2s8RjMbOMKcZl7y
         toT1X5unM4uDUx9hgP7XGJ9TABhf640dWaJyLBbcU2Xn0ll2eH0S4ZlOZ5C1Ubw3q7PT
         Es0xCrLYB/ViWv/v3t6Cn5cepX03opt1JMW6bsM2CsVJ2hT+qjP7tzjNpqhZuYrvXF1h
         jAEtNAA2+NbvU+n5FXFidfuIWeJsNELtNESv41VW98nskaxUGPtKyevXRdsOifY3tnOW
         kI7jxapPc+1KQ/7isF2lyOq0uxyGqb15vahI23Qdm93jXUyypO1o1F2T9BAFryNsgIft
         u+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753805503; x=1754410303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE/MXzUMZS+44xcmHH89HI/9f+w1SgEl87LO7gVP//E=;
        b=INu762H34SvR72wiCh9usyE8X/60fT5TH95fKpgsN3J6nRTFwEePp5dDfqsgTONqxk
         aJhlPRGqnuYVYyK01fcHnXPEn+dCRpsd/K4WVbsXwm9xXthRVTdHefAmHDW+FNqvyeNj
         gLwcl3s1goLIfCbmtzHXZt2XMNxCZhIQ8HcSpG3cR0czCa9d/28lIXkypshaOFgd2zuB
         Qw7RyaxyRBJm89MT+GuvU9aC1K1yVcV+IhazgOeotO++IMesSmZDtAWm5cSUxTA6thTY
         znvRpS0+sYz3qxKEziaokX00U7c2yj5EFXkSpA1P5e+1lKakfmWmB5DQHFMHQQsbhhD6
         ORpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP7/ghb6TIBheJfE5xywaOTLffFmyZU6AnJXQsDWnsP6GDWjQuwI/dlh7ptba35mGIvUqo9zMz8D/KE4PxYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpICqfGDGJPMYPy+SYiOnEF2bPMS2RbEaga4KwQGIOFxbluJq+
	rPrIYBl+jAce9llpjAK3eGjV2KIUiNJ/3fiI1nXB5U3iEvA+nijAIUdBLA2VdZJmy18=
X-Gm-Gg: ASbGnctHECp2DoJ9thwe1k72I6e5Iu1HvPVeagogQu2t7zYT/618MsNZDPZ4Ig8gfVM
	VPyAWHRHwx4D30MX+HIhCLSjHoRPPG9Jryt1TwvK0QQVrXheTyPfigFfIrVo4rRIdiBuShVxCm8
	S0wsvdGWBcXT92tTs/KRCyeUqc4S42IO+/XPpv6HBhmk2MuFcsrspXwdwLXs2s9emGVDU605thE
	Ae+yTItrm10XQ0CZ1vLHMsgZ6WE9Wf8+41tpKrVgCkFceRWAUYl9WpSl4y3oe+gjSNuSLwYq5KM
	rFxBhmKpFtfWzKuLg/cV48zcRjB5GBnvLvn/tNGyRSTCnAPdkkFGbXnPCbco7i5XJ1UkqkP9V9L
	I8n93cAZGtqzW5IUYmLSTsGeYK53OsPVSKwnYwvl9GSTE8QV51pnIGGXd/9OoqHhB
X-Google-Smtp-Source: AGHT+IHiv1ekgWGQ9lIBRubNcJRWHtn+F6BZSVr06aOsETrpLIQ4sL11Zd7N187ZXHB8fb0D1LxR2w==
X-Received: by 2002:a05:600d:15a:10b0:456:24aa:958e with SMTP id 5b1f17b1804b1-45892d3779dmr2509355e9.0.1753805503409;
        Tue, 29 Jul 2025 09:11:43 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4587054f686sm199914665e9.14.2025.07.29.09.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 09:11:42 -0700 (PDT)
Date: Tue, 29 Jul 2025 18:11:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/2] pwm: mediatek: Fix duty and period setting
Message-ID: <uqazab4e4srnpw3lh7ewxmlywbdvjgl54idhqi25n5oegfd7oe@7nskmsyftfr6>
References: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
 <bb4d8100-ceb2-4ce1-bf27-86fe21ce2aad@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qjtsiiolmtxft4yv"
Content-Disposition: inline
In-Reply-To: <bb4d8100-ceb2-4ce1-bf27-86fe21ce2aad@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_091145_776544_6CBB9B44 
X-CRM114-Status: GOOD (  18.57  )
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


--qjtsiiolmtxft4yv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] pwm: mediatek: Fix duty and period setting
MIME-Version: 1.0

On Tue, Jul 29, 2025 at 12:07:43PM +0200, AngeloGioacchino Del Regno wrote:
> Il 28/07/25 18:00, Uwe Kleine-K=F6nig ha scritto:
> > Hello,
> >=20
> > here comes v3 of the (formerly patch, now) series to fix duty_cycle and
> > period setting for the mediatek PWM driver.
> >=20
> > v2: https://lore.kernel.org/linux-pwm/20250724210041.2513590-2-u.kleine=
-koenig@baylibre.com
> >=20
> > Changes since v2:
> >=20
> >   - Split changed clock handling into a separate patch (suggested by
> >     AngeloGioacchino)
> >   - Drop
> >=20
> > 	if (err < 0)
> > 	        return err;
> >=20
> >     just before an unconditional
> >=20
> > 	return err;
> >=20
> >     .
> >=20
> >=20
> > I didn't add a R-b for AngeloGioacchino yet, as it felt wrong to do that
> > for a patch that he didn't see before. So assuming you're happy, please
> > provide the tag again for this v3.
> >=20
>=20
> For the whole series
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks, I added a Cc: stable and applied it to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes
=2E Will give it a bit of time in next and then send it to Linus for
6.17-rc1.

Best regards
Uwe

--qjtsiiolmtxft4yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiI8rYACgkQj4D7WH0S
/k42wQf+LyIe+PzHJ/dc2HatljzBygTMblA26mlrv0teYNlNBdKlX7PnqbDXfUWP
vMC2CPTlk6JPJFCmjSHo/vNDb8EEnkmntXlsl/eYes3Hcp1VBUqsc0BoKy2NjGJk
z90KVF7RsaJuKX9mb+1noo4LK/fPydLHzuwNBlPQJs7upZWxWxUe21Qzz97vJlhn
VKru19L8uGvL8rN+anZzv5Vx+DLHOBO8ukE6MDQ+znDgsjxoWCByhUrPDfXNOhK0
BzoaF203kjqj7LzOxNKqYG26vZTXhZc+qe3BtZMziqyIgZP3rAa05jFaZdsqGZ+K
rOvtkC+kH0yS/cU5Q5XSS7HhqsyNZQ==
=mMtw
-----END PGP SIGNATURE-----

--qjtsiiolmtxft4yv--

