Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA9F327BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXcEsPkaE3nBchm7YaHAcD5u2O6FyVBqda9tZxmDoL4=; b=g5mMbBcME6YhQ1bKaJAsy3qBGQ
	IEeHWzBGpWtXb0oFx+czjVdcRHs4l44W5a6zaZee3wVlYGPT6wATNPna4gkZMlMUKE4kI4kebuIeZ
	Rc+q6f+HlfmYXUthK7+LFOau7IMNIuaeIyuTHNtsi5BM/LcDtXP7NU1WFYWOPSEFXklIwUgyPCusn
	pTa573uaTYTpriVdhbglm5Msz9md0wO8GkZHH0AGlJmHacSUfOZRmxun+a5WzIqBq2J+D8s5L6534
	ng6C16lQlrrmtqxqZkK+fxry0IhRALCzBhAM2WEWt+3z8MAr+VI619Zb7zzx6hMGEcpX9vLWZHId9
	bmb+QmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Dy-00000008Ejc-08jj;
	Tue, 21 Apr 2026 08:12:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Dt-00000008Ej3-49xs
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 08:12:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so50656665e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776759164; x=1777363964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXcEsPkaE3nBchm7YaHAcD5u2O6FyVBqda9tZxmDoL4=;
        b=Y/HmjvwazseNH1xdPctSqf1c1+47piXdzSi28ol9wETw8/53TYeMuygwFHdqlcSrK1
         NYcQQasmtg5yiWqcv5DOBf1fecKk2d8GoHd98FyZhYy8lbiBj/TI0bZRALwAlFEmGBzq
         DIx/PU+p2wlLXjHRFzXcKus6KsbUZ6Lg4P9gCHMP5SglAcbTot0PL/Ep+bsub5S/mXnf
         QBYpCoB4+0XSsXxnaY9OjIXLqK+3mK3bhOFRRrRa8W97HtrdwMYulzK1CeAPW+UBk/Iw
         9KArHYVCjGlhFHgbjQGlT7r4k0Y12Cu6hudybzDFbEvzHB+B39cDdqgTmpsn9AwPnhSQ
         wamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759164; x=1777363964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXcEsPkaE3nBchm7YaHAcD5u2O6FyVBqda9tZxmDoL4=;
        b=Dq74zQ0PGB0qP8xcaeZqTG8NTAYOL1u3RHz7QxjtJIBvW+XopGIUd685ukExLh1MfS
         vCjCK+qjzE9xHl4mhL/lVMw/1TmlS+ZNZCGEKeQOX9g+lRaQqN/uQ+1SG9w+szfhnAZp
         UREAF+vCKpJlB31ZC+0drgRPcrYumryQkRXYR/N+eAMEyQ+yhz+QLMI+NhHEAaNOThrQ
         YeVDYiLQEuh4qXeI4YEqq1QRVaXHbG5F4x9VkKWfJ/HO2JokvV1gxNhGFCqdpi0FYXd4
         C0joGdQObqBkJt1GCZ2bD5fFTA34wBX5gvz99EF30VY8SYQUxOHKMcCRqxvPeXBHaGGB
         k3CA==
X-Forwarded-Encrypted: i=1; AFNElJ9E9SC6Fo4GofTXe7hh7JW1vwbeFjRPR5C2fhUI8508B8p10sdrLw5Rswkf8SoBeBjdUK931LEaIDVho8m7GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsu7KJuE6KrsQ6rz6xTPYnVHTtFjVbLcpTaWEkP8+PChCDIMT4
	C5gJZnETiHRnsOt0DpTwx709jzWNsMVuN60FTMzda4/vpXL/OAus6GlpPak5doS4f30=
X-Gm-Gg: AeBDievT2+qaT5lufiIBNe8KjsGZ4Z8Tqme8oWrWk06/pcu5duNVPRq4W9eUwIeDotF
	foJxskhhouavvD3DMMF2s60AmIkUjy3kxlDA7NH1LcDlRFuQcCxFRXJtNaRngFaWyQD4o5ZnQFl
	OmEO3VPWpH7tWIo9CFfZRNudX8jK+VW1nk6wa4cR3r0Q/Rtfe4mK0oj8nAUkzSiWMAsO9zolhef
	7sIXKTtaEyvhQBuCYR3On3nF4Xzkbf2IiOqJZrqVB6ZNhsPskRSBUQ9stnR0sdBpJ7CGBovyRUx
	wg3L5q73KDxyxYgctovd7fkFCd/Rgepij0zGpKQIhsWICuf+nb7ZY76KeXTfCIAu9r0eUl9Yk/j
	hSuMzaca2CWxvRcoQ7fl939w9xOjz7CyYUeXmdg30QrHHaSv9XNMCxTXaggXLYrswOcDIw8ThcM
	YcJ7cVI+R3nAdHK5NG9Rn/arQrpuZ5TVnzNC2YtqE=
X-Received: by 2002:a05:600d:1b:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-488fb771438mr205335215e9.19.1776759163884;
        Tue, 21 Apr 2026 01:12:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4891bb3d121sm239274565e9.14.2026.04.21.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:12:42 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:12:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux-mmc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-bluetooth@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <aecu1ixyHP2hQvgE@monoceros>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ou2vweurizbmr2mn"
Content-Disposition: inline
In-Reply-To: <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_011246_307240_4C8AFFA7 
X-CRM114-Status: GOOD (  31.06  )
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


--ou2vweurizbmr2mn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
MIME-Version: 1.0

Hello Luiz,

On Mon, Apr 20, 2026 at 04:46:56PM -0400, Luiz Augusto von Dentz wrote:
> On Mon, Apr 20, 2026 at 4:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> > On Fri, Apr 17, 2026 at 03:10:47PM +0200, Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub) wrote:
> > > On all current Linux architectures sizeof(long) =3D=3D sizeof(void *)=
 and
> > > this is used a lot through the kernel. For example it enables the usu=
al
> > > practice to store pointers in sdio_driver_id's .driver_data member.
> > >
> > > This works fine, but involves casting and thus isn't type-safe.

To be honest, with the involved void* this isn't really type-safe
either, but at least the data keeps being a pointer which is really
helpful on CHERI. FTR: The alternative would be to use uintptr_t instead
of unsigned long, which also has proponents in the CHERI community and
which is used in the current vendor patch stack.

> > > Additionally with the CHERI architecture extension there are machines
> > > with sizeof(void *) > sizeof(long) for with the traditional approach =
of
> > > storing a pointer in .driver_data doesn't work.
> > >
> > > By replacing the plain unsigned long .driver_data by an anonymous uni=
on,
> > > most of the casting can be dropped and it yields a working solution f=
or
> > > CHERI.
> > >
> > > All users of struct sdio_driver_id are initialized in a way that is
> > > compatible with the new definition, so no adaptions are needed there.
> >
> > sashiko.dev found s/sdio_driver_id/sdio_device_id/ twice in the commit
> > log and once in the short log. If you consider applying this patch
> > please adapt the commit message accordingly.
>=20
> No problem I can fix them up once applying.

Thanks! If a new revision should be needed, of course I'll fix that,
too.

> > Many thanks to those who created sashiko.dev!
> >
> > Best regards
> > Uwe
>=20
> We only received 1-3 of the 6:
>=20
> https://patchwork.kernel.org/project/bluetooth/list/?series=3D1082520
>=20
> Or is this on purpose, and we should consider the set complete?

The remaining patches are for wifi. My expectation was that they go in
via wifi+netdev once the first patch is in their base. But of course I'm
open for maintainer coordination to let the series go in in less steps
than I expected. If that helps I can also create an immutable branch,
but I have no urge here, so if only the first patch goes in during the
next merge window, I won't have problems to keep track of the remaining
bits.

Best regards
Uwe

--ou2vweurizbmr2mn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnnMXcACgkQj4D7WH0S
/k44bwgAnoMan1Imv3flaHCO3huDhjM34bPslVMZz9O3wxMMwFGStgpU3tDvAlFl
FisTZf//q5YDKDMU8QV1lWvbQoFEpQzTG9y9T3kx535oPPgxlG2VOVssH/fhxPgC
5WRR74C/5X9vCV6KRMHrD8GhGNsn2S9si+AjSVxGC6NWrVOrbIyK1lRHOACx6rFV
eM3s+J44T3ZGK60m180+bEFUfCsmOqCLoOTOJ2dB4hxddm0VF0MLiuby8b4v8RvB
/IPA8CqsKTVcj01EMr5853cJiCZjfq5CHdo2tTK9JScUUBXv0Azi7Rv3s3P0hV22
e9swpLSspOKoPqq6qBNNDtr19tQDTg==
=Mg7P
-----END PGP SIGNATURE-----

--ou2vweurizbmr2mn--

