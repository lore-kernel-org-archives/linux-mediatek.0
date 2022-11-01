Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F07C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 12:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7ATZryO3TjGj7xTXAJD/NietUD1CSnvEvNqQmfKAes=; b=ClO+8DNuMhuUDB9YOIPqYBOu7M
	fHgnfRtKbMzcG2ZBXVK+h9ZFCP3aLxzG+XFV3mHu0vnaCcjKo7VkZUdrB6kGJ2BYfkjyG+0kZHrxL
	x2PC3zmBjxQL/8NM3ZMCmSb+vcd5VYRx+ZraldTqUMS2GkjwhtJcRr+fLjDOrcVzwEt5Oxe1t/Vdc
	5h7gzYH9/KhofWQmZduLtw5psMxx6ICtcCk/iHHZJoxEzX1dHhTeBqyR+lMv16Ec/JyTvS/br0rrd
	jGD4ixz0Mq2q/OyczUdn7xX+wj43O7I8Ru2LR5CMwteYLFmI8nyay17acjZfZOOx0OF5LP5xx8WLi
	PD5Qt+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqaW-0055DB-1q; Tue, 01 Nov 2022 12:41:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqaL-0055A7-V9; Tue, 01 Nov 2022 12:41:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0DCD8B81C89;
	Tue,  1 Nov 2022 12:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290DDC433C1;
	Tue,  1 Nov 2022 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667306498;
	bh=O7ATZryO3TjGj7xTXAJD/NietUD1CSnvEvNqQmfKAes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrLKkhnZ3ZEUGvc/PlFHT0pVDoRWrAl+9FZIjWkfiX7MwiBULWwakSDlheaC3BGk6
	 VBMTe2IiuTjyLrwiGI2lEaIeaLB0wOs3ukKNFlecPpV7HiO5cpbRyH9RFHBe7ixLva
	 nrpmyiMiOYRGmlRIUl8TvwgP1FYsAwUD3bKC8sVsJKv4nmWXqJHb9RyQu+9rUyxI0O
	 xSNHmrbej1nJ6u0ZR50hejZ4IoxJMTb8O8Scth4vhEWxcSBKLeo54YP+ibVwp+9cam
	 r8Au/0hzkr7688XZea3c3UB/vKyNEdVQOi0yzqQMFOLJ8fsSRhlDlGyFYkJVBrpKtz
	 YLjb4oq6dFSZQ==
Date: Tue, 1 Nov 2022 13:41:35 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: update bindings for mt7986 soc
Message-ID: <Y2ET/xCCZBnSkify@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Frank Wunderlich <linux@fw-web.de>,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OVe5jiAChcWLZ5TL"
Content-Disposition: inline
In-Reply-To: <20221009101631.82380-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_054142_183444_5CA2B43D 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--OVe5jiAChcWLZ5TL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 12:16:30PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add i2c compatible for MT7986 SOC.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to for-next, thanks!


--OVe5jiAChcWLZ5TL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhE/8ACgkQFA3kzBSg
KbbjHQ//e/qAp3S8diQPLa1LMdac1yjF2cy2QHnuH6cG0OgbBSW+kHgLZqP1M+BR
+ZoM8Pba+m/8qs1O3d0cvXBEDd3SbqB9yLJ1RPkyF9inK//TkyGz58YUmvXkexfU
uOt2OGLFyhzfa4jV3V8CFc0vqRKVbbVniFu5D9Nrfqi5ztolKZLgGhCmMIohr8vl
gS/nQmADI3hTW/UP8vOUqCWOHF07bVQ0t0VAjSOb0HWqM09EaH/sFoNypDfAYRrg
C6YJbVzl26qDhArXHTxUsDJkrZFzFn0CulNxlCvMkaQIlAb8cfviCUoqT35tVIfr
tjujcI9Jn9L8I2nHxUHulBfUNnM+3peCrSfWvoDIcIpV8n/ZeaPZaSAurgtbvF8v
CAyyXS1xOyoMHDtLaHyF5wMrwZ5pithjhXRugPa0sQM/Q35BAr0k6xkealJgGzBn
QoYIfsn2uToxmnEPqMGVFEciryr8DEXFY9P75uu2JsJYz7i3Frlmy9QLke/1GD9A
6U1bliJJq5tkRV/EUQMgYp2GrxYOXfRiEPe02DwqcYMiMftCNO8oiFWusJoJw6ga
U+5H8MkrJJ8cHuKOnKJOIvoUDTdp9aKGM31zWi3vfAtLhuF4XrYDTajAWKH9y7yI
RrX+qvH9RpAe1BNb2T5MMkKQj9tQwDDRw5SCZIvfUvXPOVrIf3o=
=qXU1
-----END PGP SIGNATURE-----

--OVe5jiAChcWLZ5TL--

