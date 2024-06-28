Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D4FC2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq9SouLfDkAq2b4kiLL/vjr3Qpha12g+yMURW/ZzG/E=; b=iXWIUTP2jKaS3X6ZPSTXLDLvUy
	jK0c/w9feJ3a7gf167qt+tAbn0DZtix64s28AAkGTQDkl+JRKVpMm4olyTdLtaFIHXMrpeQuZ73Qe
	QeUQ7hb82e/Zarla0MJ2hkQ0X/jFgdtKcoQ8Ha2sdcaihwPL39tzPp2cn0X5ZobArRpN+xl3q8Ucu
	qTw+xwPA33nK1Xqp6FC50KBvoAQWfopIDR+v+VAtHZE0ynteamFIkzBDsZ1vzE4OX1lqHsPq9IcLG
	x7FDPxASwxdC9C6mZkvwAJaVOvraORxa7jmRUiti2HAM7usHHclH90zqd2Kde7FSgVmMIvb1q/73L
	a/n0qIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCMR-0000000DyNx-07KH;
	Fri, 28 Jun 2024 14:13:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCMN-0000000DyMd-1mJu
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 14:13:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-425624255f3so4419175e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jun 2024 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719584034; x=1720188834; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq9SouLfDkAq2b4kiLL/vjr3Qpha12g+yMURW/ZzG/E=;
        b=Dr5+k3iSlFAfVzQ/geC+ZkOl0ZHzI+a0u0Gk514DNaSwFLmu9TaH7VU8yo6wzNwgik
         Nsan5PDSltaxbP082dNrepyshmAbIvJQn83csYl7icWdx36tFKZTuUVUslbosFYbMdGp
         kAUCojmTnElmTve6prlh+M68mBwNdODS2ECwKa63OGuj3gPfeJaDJgtagkvW43xEZY3Y
         jnRtD7aIFiNA4Yf0E1j25zP+eF2ogVQ3N/Greshko2BfjCMQ/PHSd78y/9ZpGhe0aBOs
         GsKCuRykkn4v3ClEpLLWyUKhuWwYqgsajh/MBXL2MJKJRIwqk3kEyg3Qt7L09l7iU6JZ
         XLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584034; x=1720188834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq9SouLfDkAq2b4kiLL/vjr3Qpha12g+yMURW/ZzG/E=;
        b=tVNQTR1kmGMPK6bMnbayq7nungLaQ+8OZatfDQPw+uxhOjnfC0+goaTgio6SOk7ARH
         6OxQUPAimkHEz9P+0QDEicepDg0uQBEGoHKKCwr/FUhjbJjLrx1M3OhqOnlothudrX99
         Nr/gx0Ppw571soS5KzlGFzCTpyKJp9hJzv9QjYjFzadPl0btxtenQufafiyTMKhQWnlA
         +TWqKGg5F9cNg6UwLyPnhXxCEZIMpo4M1HM7tr09z+M0d8U8YiX5yxAIttdYJQ22AXCB
         LiizJQc3WT0fDPG9EPuU7lpus2r4Ac3H7c+9J5LfyeVPtAYF2qE1DeylGlQWKuIgj+zR
         GlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrg4XpkPVrkrHIkAe1ZhfTPgtm1ykC1d/qMOltL+5rhXB5x7hNq53a2T5jxD/5oAUvugmjp27/eLndjjtIth9Jknp6jlVZtHS1ZBRmJdjQm6TL
X-Gm-Message-State: AOJu0YwmUYk/cF1vmSBuyej4fIvlZqQlYmOlzJa8nDZBiTLCo4M4hFAo
	wHTOOuW6tHe8VF9cQ1FegpM264TCrdC9upKQ/E4BhmttFtV6+nuXlxn1xGEAUxw=
X-Google-Smtp-Source: AGHT+IE0BlUwhF204AB9g4b6OLsdn4teKyk6Fag2Qv65HRVh4aDPpq9NzuY0p47pWCuW2XMrGGe9CA==
X-Received: by 2002:a05:600c:4645:b0:425:6424:5f97 with SMTP id 5b1f17b1804b1-4256d4e579cmr18385955e9.5.1719584033689;
        Fri, 28 Jun 2024 07:13:53 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b098426sm36633245e9.32.2024.06.28.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:13:53 -0700 (PDT)
Date: Fri, 28 Jun 2024 16:13:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	Sam Ravnborg <sam@ravnborg.org>, Hsiao Chien Sung <shawn.sung@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	Douglas Anderson <dianders@chromium.org>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Michael Walle <mwalle@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] mediatek drm next for 6.11
Message-ID: <idb7c2ogmvecxetkuqo52sqkih7iflba4x22fgfcdt7c4l4rnp@tjysd6nkha4s>
References: <20240628134632.28672-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dchb2smjqohke7fi"
Content-Disposition: inline
In-Reply-To: <20240628134632.28672-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_071355_681132_AC2C75A2 
X-CRM114-Status: GOOD (  10.45  )
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


--dchb2smjqohke7fi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 28, 2024 at 01:46:32PM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
>=20
> This includes:
>=20
> 1. Convert to platform remove callback returning void

Note that this change (commit f5d5759d29e93fa76466204ad34169b3900a36c6)
is already in next (as commit 573a39d05053cb234a9ac3c7b0b359fb3258bd76)
via

	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git drive=
r-core-next

=2E A quick test doesn't show any problems, your branch merges fine into
next. Still I thought I'd let you know.

Best regards
Uwe

--dchb2smjqohke7fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ+xR0ACgkQj4D7WH0S
/k4cEAf/S6QnpqRwzYlwKHcPhnbzcx1y0kL8li82wdsXH5v18xQvthvSeToiduB+
0IQHWhoLOH1ZsRVxXBWDIKQ3buKXOIljwJzjxuqbOog5zyCLgJ2JHlBDDxK1TXSe
YPdqV6D2/+g7JX7jLo+d2houzoJKB6ZPVmmmKOqbfr9uMvlfeT/TZeVWkQTPiI/W
p1X0omkCzRZVebN8WV2Cwf0PSmPM2i72TmkUcwHILXqQ3wpqhtkdMh3xAG/3UjKm
O+95C/M0306/FAagcja/jgWQHxKoYMZ0IIR1a0FhCqtLw4CxSHmeR/RecdY77juF
c2piaGs6UTb1c5PIbh6YM1N5vkzJXw==
=A9h2
-----END PGP SIGNATURE-----

--dchb2smjqohke7fi--

