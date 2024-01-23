Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1894C47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAVdTUR6AraUf4MR7BIUfDWUmWTSaAJv+Uue5vYBw30=; b=vrahmXfQBI/g22E7ac9XF/vPjG
	Hvdo5pbSlXh7axDOJ2+YBGTH4PCr5+bLnGcaXhM6J82zIfVLiYzn8ZGupsqZW4g4gkaF3IZfUtKQX
	Ju8dJjjsRQ0reJd3nViB3CzkA/hRwERwekkniCYR9FlDcmkamXxAN8vCbwrJ9h3UagrvGnr6vKDLK
	OaffUAKu/DW7o/KURPgjarXUREOUsuwWmIyHuSl2tDdL+cg/urviRgLExINnMIGyCXBfB9WDs7IBN
	jiqCCVwoAkNkrM+21rXBfiDQCWMVFbM85Wy3S8UnLJoNdf9iH8FEhzBlSVOqtxl1b//DVCsRgzAns
	QWhKSUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSK9P-00HPiB-0U;
	Tue, 23 Jan 2024 17:01:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSK9L-00HPe3-2C;
	Tue, 23 Jan 2024 17:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5D03CE2EDC;
	Tue, 23 Jan 2024 17:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2FBC433F1;
	Tue, 23 Jan 2024 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706029279;
	bh=V+pi3c5KR+NexGtTEkvtMJ8NNNixuoR/P6ynDkGNHog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkGZ+/ogS6+hCHS8WHjmlSxTgntXLY5/EvV7KM/I0UJQsFIvfYFISudTysjnMMAtm
	 XBN8NJ1rWx0kgM3kDM3ITGf+2vNTRV5P70FmMznXtyuaO/VZVvKJy/EIPztnP4fY8b
	 fMhzPv3e/J8qlgnYBt5k9wMH2ZqDGtqkCuEeOgOZf4E+zdf7KQeLHXyAoLVbHeyuy7
	 ypaKJbkV6koOWVdtRSWwXeybmQyzWHpyqUVXZQBJLlid3iUCUsGSaQgDjp2VLEpDjc
	 NTH3uZG2rSC8dWPP2DSbD5Jd3wsbUr2TeN6Lp/ysx/0OjMe71Z7r7VpGpddE9Hn3bJ
	 MI4xI7Pgdt9lw==
Date: Tue, 23 Jan 2024 17:01:13 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Message-ID: <20240123-powwow-drainable-77dfd6158b05@spud>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-2-jason-jh.lin@mediatek.com>
 <20240119-demote-fragment-624a35367a87@spud>
 <9c447297-2738-4b63-9da9-0d004660e65d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2CTCg0wQKdRlifcE"
Content-Disposition: inline
In-Reply-To: <9c447297-2738-4b63-9da9-0d004660e65d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_090124_071658_B0B4960A 
X-CRM114-Status: GOOD (  22.44  )
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


--2CTCg0wQKdRlifcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 11:38:15AM +0100, AngeloGioacchino Del Regno wrote:
> Il 19/01/24 17:44, Conor Dooley ha scritto:
> > Rob,
> >=20
> > On Fri, Jan 19, 2024 at 02:32:22PM +0800, Jason-JH.Lin wrote:
> > > Add mediatek,gce-props.yaml for common GCE properties that is used for
> > > both mailbox providers and consumers. We place the common property
> > > "mediatek,gce-events" in this binding currently.
> > >=20
> > > The property "mediatek,gce-events" is used for GCE event ID correspon=
ding
> > > to a hardware event signal sent by the hardware or a sofware driver.
> > > If the mailbox providers or consumers want to manipulate the value of
> > > the event ID, they need to know the specific event ID.
> > >=20
> > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > ---
> > >   .../bindings/mailbox/mediatek,gce-props.yaml  | 52 ++++++++++++++++=
+++
> >=20
> > Is bindings/mailbox the correct directory to put this in?
> >=20
>=20
> Well, the GCE is a mailbox :-)
>=20
> ...but I get why you're asking... and I don't think that this should go to
> arm/mediatek/ as it's really just only referring to extra properties for =
kind of
> "special" mailbox client events...

gce is a mailbox, but this isn't a binding for the mailbox itself, hence
me wondering. I haven't been able to think of something better though,
so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--2CTCg0wQKdRlifcE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa/w2QAKCRB4tDGHoIJi
0mVkAQD1E1YROaciJvV15+DoVLqDPd5wy0CwA0/B+tXa1nnLGAEAx7CXc/CtIrWm
h/V9z3ZETpXmdBl0DoEl6myfpxb9pgc=
=/QkO
-----END PGP SIGNATURE-----

--2CTCg0wQKdRlifcE--

