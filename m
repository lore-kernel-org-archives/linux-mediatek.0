Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFF9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiNnkuyZxEbd3VZEAnAG4p6eQ3rAENA+quVtgKpqX5A=; b=HLqIRW0CJ+8kW41b7XUB9hCNsR
	FdiNes/0BBbgxWs3ns5y199KTNtPjW+k134S/QN8Wf5wUzX9PNgoEVIgIR2NEKexgP2aIm1vmtfoS
	aUbOMD+5iD1jzUjUyy2+TxdXuQkywtIHZTWVIvi1tS8TiLQh/5DrE/hsyKTF7X/+nfOUZ4eQtDxzV
	5866+25ELaCT80DNNmfUbusdgieXnEzvdq3hhWd8OZGAnw9OnsrJs5UHoJulSUe2qjUxD3pDy1kRA
	hn3HDZ4/eyWOE1PD95i7GJwotWXzBFJOa8+93Yq0f7/Cod/kHNUBmTqm44XhVUXUAYmIi+PcjpLGm
	UckIDl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no95U-00G36y-9G; Mon, 09 May 2022 19:30:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no95Q-00G35W-SI
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 19:30:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18DE7B8190E;
 Mon,  9 May 2022 19:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1DDC385B6;
 Mon,  9 May 2022 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652124625;
 bh=iKkvMkx3TWErRse2gRWZPu0JgulYvhKzrWv+sdCjmE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IK/sF6Kk+Mmg3QyNwrtOTr+pjEeOgaRRiBxd5mGbEgdl6TIZAf74uXf69zcZdpjPR
 GrOTjJNZbrIWWywvp9xtiipmVmf8owX4J9QeNgeJIl/yLzhhtM6Zyf0zWluQBomnrI
 quF8JWTpkjY++RxkqYtWb05duVOCRWsaFYhM4NwGmpCfKR4+k7Zc8l/UH7bCUVana5
 5hVLJeLEvwZt0MIdhVF5ymNCnDF2hO+zm6AVb33UZRzH4GrE5kOpQeYpjdOxUZjrkU
 0ZazWkkwAakuyprfGxn1YaocXBqzTUMI+FIbo4ksqLuCPd4quQeR1k5mufnJA5oWNg
 9505VHnOXvXUA==
Date: Mon, 9 May 2022 20:30:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
 codrin.ciubotariu@microchip.com, lars@metafoo.de,
 cychiang@chromium.org, tzungbi@google.com, bleung@chromium.org,
 matthias.bgg@gmail.com, oder_chiou@realtek.com,
 steven.eckhoff.opensource@gmail.com, srinivas.kandagatla@linaro.org,
 alexandre.belloni@bootlin.com, kuninori.morimoto.gx@renesas.com,
 jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
 chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org,
 patches@opensource.cirrus.com
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the
 endianness flag
Message-ID: <Ynlryv8fgKiHYXUt@sirena.org.uk>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
 <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
MIME-Version: 1.0
In-Reply-To: <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
X-Cookie: Boycott meat -- suck your thumb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_123029_271946_DE2851D0 
X-CRM114-Status: GOOD (  33.64  )
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
Content-Type: multipart/mixed; boundary="===============8257606356729680519=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8257606356729680519==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sFYP38gXZ2zPTepc"
Content-Disposition: inline


--sFYP38gXZ2zPTepc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 09, 2022 at 09:22:42PM +0200, Kirill Marinushkin wrote:
> On 5/9/22 10:37 AM, Charles Keepax wrote:

> > This sounds like an error on the CPU side of the DAI link rather
> > than the CODEC side of the DAI link. The formats that will be
> > supported on the link are the union of the CPU and CODEC supported
> > formats, ie. a format must be supported on both for the DAI to
> > support it.

> Yes, agree, both sides of the DAI link should provide only endianness they
> support.

> This works currently, but, from my understending, it will break, after we
> set `endianness = 1`.

> As soon as we start setting `endianness = 1`, the function
> `convert_endianness_formats()` will extend LE to (LE | BE), right?

> If so, setting `endianness = 1` is the source of an error, right?

If doing this for the CODEC side of the link causes an issue it's just
exposing an existing bug on the CPU side of the link which may already
be affecting other systems - like Charles says the CODEC is expecting a
fixed bit order regardless of the memory layout of the data.

> > The CPU I2S hardware should be sending out the bits in the same
> > order regardless of if the data you feed it is BE or LE, as I2S
> > specifies an ordering for the bits.

> What does the endianness in the driver configure, then?

On the CODEC driver side it is meaningless.  On the CPU side it controls
the in memory layout of the data.

> > If this is not the case then
> > the host I2S controller is claiming to support an endian it does
> > not, and the problem should be fixed on that side by removing the
> > supported endian.

> I think we have a misundersanding of my example.

> In my example, i don't mean, that my CPU part of the DAI link is broken.

> What i tried to demonstrate - is that if i set the unsupported endianness, i
> wouldn't expect that "the CODEC probably can care about the endian", as the
> message in [PATCH 00/38] suggests. I would expect, that i will have no
> sound.

If the CPU side of the link is fine then there should be no problem, we
simply start supporting both endian settings all the way through the
chain, if userspace chooses something that wasn't supported before then
the CPU side driver will look at what's being configured and set up the
hardware appropriately.

--sFYP38gXZ2zPTepc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5a8kACgkQJNaLcl1U
h9D6Pgf9H2WDFXnhOVxdcfuLzbr5M39VEldhVxs3V67Fh3LEY2eoRJS3zHp1Gu8C
T6Cw+l4akBqpSfcKuvq6qQpuyC3XeNHQvjLAKeNvAdB2uqx6YgsxZS2RkXA6a8/e
eU9u8oxZk2PKCaE2egLuOT+JqSfn9qASLhhC0hesETMlYyoAIVFNlW4vGbOlWMDh
/ex/ytCjP2A1sHScIuCKNJlDItoSJfztx03QHuoVK5iBzrAtc86hrsvr8nVOz8tj
jvNOR8n0N3xc8+KvLGXUD9hfKkXGGPTMz8ijZFo2tYyy12ITuoxQKtRJrxcC6CcS
C7NCPO8SrHd1mWVHeMjz5jQYTmnGhQ==
=3nBv
-----END PGP SIGNATURE-----

--sFYP38gXZ2zPTepc--


--===============8257606356729680519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8257606356729680519==--

