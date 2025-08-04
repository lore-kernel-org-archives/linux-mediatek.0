Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACE4C87FCF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTN6DQNpcMHKpy2OvEV2qP5hGAy9yu+IDmfs1+NjDFw=; b=NkrYtWW48RSXnubxuZSzmC1ukt
	tDOW7KqHDCqAY5yXuYgZ+EH+9f711va8mhBu+PVc94xUx7BS81XD0P3y+XSueAu9A4Qw/nBEty15B
	zqB2pl1xfKll56Wi2frI3c6nfwe09qlsVl/9jjvchUTZFsAntZttqMz7bNLxHkD8pjTdgLhd+0w4B
	U8+AfEzNTNn8srgWDm5aXmiWEgsL0l7kt4YMLgBr+jiMd2ik74GhvDNUG3CTY68dvBkIP+GERdDSg
	6+uWjONoqGVYwlWtZwJ9cKBHv+CjkK7+PhzSg2eycjFhJwDAdaFnAhONfrErUMPnK97JFxNoLaU4X
	hkP7UOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiso5-0000000AE2n-0g1j;
	Mon, 04 Aug 2025 10:52:41 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisSx-0000000ABxJ-2eMA
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Aug 2025 10:30:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6153a19dddfso6494118a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Aug 2025 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754303450; x=1754908250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jTN6DQNpcMHKpy2OvEV2qP5hGAy9yu+IDmfs1+NjDFw=;
        b=PwHNYzHf7lgCbkRdfzVdriWoSjhl6gE4iDiRKi6IYp5OsoCLG2n8HHw/8YjqWdc3Ya
         hCQmZTBhSbV4Ve7xCPAz3SkGPvieJt3IWHnSoQ5QcZl8EHoVjkzTbFmIvo5haFalvh3D
         85tm92TjAaFFfHH816ZYUtDQHkcOMyLHIz1qO6Rdyih3b1sc/W93FI/NjTSXq6SFsxkq
         OynMUguYLYX+LWE9zWo4O6nIriJz/DXFcZuqTkxVF9MHB6usTUutok5HiZUyOL8M0nKj
         qRoL2tqGZ3J3txwyC8m21MRY8c3E+dudTPq+qdtuKv1bsmzcbjuSboyzwVTPlQAeUOi6
         X7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754303450; x=1754908250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTN6DQNpcMHKpy2OvEV2qP5hGAy9yu+IDmfs1+NjDFw=;
        b=CoSCSMjkRcyo9woI2sSCN6KOXGbaPRP1pVColwV/3tDuGCnAmgeTQb/RkFpWOySf5+
         ZC3VFFadp2M+Slvh4VVo2Lx7Tj+rFWhadv/YO6nKWddDwqwh2xKYbzRCAlBWSc9//GxG
         I9yrbk+ZBAB9lUoRMGe4LEo/nspRmnCCyufXKIanZwbtTAWg8uhKi9f5TkY1lWUEZN/k
         vLKGYoVKk02G1NK5n4QYLrAuC5zSnd6hBZcBMlenEPZkLzQyZPRYfpk0dj0CBD0m1Uza
         NzzN2MOhq+ve4i8W0xl9tP1z5fynXMewPovn7qkuqy2TKYYcQ7DV1ZtwgmHgh0ixphwY
         FhnA==
X-Forwarded-Encrypted: i=1; AJvYcCWeQraYj1Usgx5rmuDaWu9jikhZ0FqdsQb4lG9n6yMtrMwACnlKYhrtnYW/wts0ThSnvzJAK6UsSq4xW3+z9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlsqW8srs1n07tM/IjGjR0tjJ04swkujT8J+ijB3gwBhZTV20m
	kT7LC6TS9r+AEsA4eBYoNtaSmxmU8wLvJLNCGh40ycj0PjiFOZIG/RrlihieOaMSN7U=
X-Gm-Gg: ASbGncvD/5o9Ku1F6HRAnCkVwmRzgsHshZnhDrbf5FWjvBN0eBJDNfskPK7xDPsqQCK
	G90xL66imHFWmDqBexIyWtag4n1liLxF1QGOA5n+McNGB0hkPfh9dtcksUAgBRBLHkbaqFrAs1+
	eYf7S5Qn98s9CHVhISOgKq6QVDP7JNKMRJYbH+9DYE96C/3RXAITdymBaE7opGS+GyOeoEmSQd4
	4Zay/B8MSXU+lUrdWTu9d9OPSUnulg8QWfCXTojIuXN5/EI4Mq27Vf07CEexHFMvL8I8ftZl5tF
	hRh0BSOCRwutKHEI6NGn+Xs92+f0blFoKIVllgdLf1WoojAY3eBSXRI94h2ZEva/moO+QRjW41c
	QSYnj+U67u9p2gqJ5pZexzXjiLH8=
X-Google-Smtp-Source: AGHT+IHSUiWGu/+IUmZfr7UuZTzuzqt4FpzSovbXhqhrTAZ/3nG/5APGMONyYDA0Ula6YRbTqUNTlg==
X-Received: by 2002:a05:6402:4403:b0:612:a86b:ac79 with SMTP id 4fb4d7f45d1cf-615e6eb6935mr6975874a12.2.1754303447934;
        Mon, 04 Aug 2025 03:30:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-615a8eff8d3sm6674755a12.6.2025.08.04.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 03:30:47 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:30:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/8] pwm: mediatek: Simplify representation of channel
 offsets
Message-ID: <g4qrehzi44mgvmy76wnrhabmin454wwrngubvvikgjv3w5udl7@wmxrly3mxoiu>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-11-u.kleine-koenig@baylibre.com>
 <e3495f99-4a78-4910-9b67-6c25dfe7f989@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eaj2ceowxzk5qqet"
Content-Disposition: inline
In-Reply-To: <e3495f99-4a78-4910-9b67-6c25dfe7f989@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_033051_928853_308EAE5F 
X-CRM114-Status: GOOD (  18.91  )
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


--eaj2ceowxzk5qqet
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/8] pwm: mediatek: Simplify representation of channel
 offsets
MIME-Version: 1.0

Hallo AngeloGioacchino,

On Mon, Aug 04, 2025 at 10:50:01AM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/07/25 17:45, Uwe Kleine-K=F6nig ha scritto:
> > The general register layout contains some per-chip registers starting at
> > offset 0 and then at a higher address there are n nearly identical and
> > equidistant blocks for the registers of the n channels.
> >=20
> > This allows to represent the offsets of per-channel registers as $base +
> > i * $width instead of listing all (or too many) offsets explicitly in an
> > array. So for a small additional effort in pwm_mediatek_writel() the
> > three arrays with the channel offsets can be dropped.
> >=20
> > The size changes according to bloat-o-meter are:
> >=20
> > 	add/remove: 0/3 grow/shrink: 1/0 up/down: 12/-96 (-84)
> > 	Function                                     old     new   delta
> > 	pwm_mediatek_apply                           696     708     +12
> > 	mtk_pwm_reg_offset_v3                         32       -     -32
> > 	mtk_pwm_reg_offset_v2                         32       -     -32
> > 	mtk_pwm_reg_offset_v1                         32       -     -32
> > 	Total: Before=3D5347, After=3D5263, chg -1.57%
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> What if we do, instead...
>=20
> struct pwm_mediatek_regs {
> 	u16 pwm_ck_26m_sel_reg;
> 	u16 chan_base;
> 	u16 chan_width;
> };
>=20
> struct pwm_mediatek_regs pwm_v1_reg_data =3D {
> 	.pwm_ck_26m_sel_reg =3D PWM_CK_26M_SEL,
> 	.chan_base =3D 0x10,
> 	.chan_width =3D 0x40,
> };
>=20
> static const struct pwm_mediatek_of_data mt7986_pwm_data =3D {
> 	....
> 	.reg_data =3D &pwm_v1_reg_data,
> };
>=20
> ...that should reduce the bloat even more :-)

Having the three u16 directly in pwm_mediatek_of_data is cheaper because
=2Ereg_data is a pointer and so 64 bits wide (on arm64) and so bigger than
3xu16. Also having the data directly in pwm_mediatek_of_data saves one
indirection and so it should also be slightly faster.

Best regards
Uwe

--eaj2ceowxzk5qqet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiQi9IACgkQj4D7WH0S
/k6FSwf/bHraub08qdDH7NGDbse/dAus/PfuLOMMUmvWdr3WYZSQWeXZpzuysXdx
iX3pSR6SloJ3NDNN04P1in8Dj6VoPVVk+6xsyiJKfKLTq5mgJ/qcMrB0xXSI0gII
6JQi0z26kRjVF2x4642gsDRjQzztfJwiZpW7XfJtrxJfmWLua4gvTngXai3TS6tk
C9pmm9I8WkZm7TNKBa7mzYgqjeet4tuSujRZiOAwMtBKh8lT/RSZvv2cIeon31Uh
1FKeSzDTO3WyMiTC17z7WpZlWVxpAefUGaqsfa/3tYImC4xWvi+4cscMIPVjJCe/
SFIRoPIZusi/eUHVETsQ4f57cYg0IQ==
=UIdE
-----END PGP SIGNATURE-----

--eaj2ceowxzk5qqet--

