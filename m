Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D5C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JrYBKJ+RvgdTDc3k2bTdx+kammTQVuU4jdoBxQltsY=; b=fxXArxij3EPXKbH+oUWF1HFb+Q
	AfXrqC+d8DGw4pDvAR1Ozo3fc65fYyD8KNaMV4c3oOWUYtKk0mvpWNmUBOpfFxPPO0qIhkjaz5Wkv
	qfeoIgO6hFIP20tgxo1+BXugySge7ub/Zy1VA+iXv/DrNjc+3f8PoBwVRPe/Xone5mibblPIWjWa+
	M01BiboC852vm3B9D3XNRTAptuLuphVoaGqeB851gjlhxqBb9+K6+uulVqEGgf6y5noF6YoZ3LX9+
	GFvV9YaBLCtOJYOc0by/8Cz7ly68VSdqWBUnU9nQeotI0MlPGHA+hmAqzG9lVy/FLFtkgX4fBCT+q
	Ut4YcCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBeS-000000013ir-1pVh;
	Fri, 15 Mar 2024 17:47:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBeO-000000013gf-1ERw;
	Fri, 15 Mar 2024 17:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82B6260BB5;
	Fri, 15 Mar 2024 17:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3B1C433C7;
	Fri, 15 Mar 2024 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710524842;
	bh=/JrYBKJ+RvgdTDc3k2bTdx+kammTQVuU4jdoBxQltsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDARwqBGiGClIz25uGXrpOxGj/1cHQyQTcBsJvIVJxoWfdw5bZFeQUUKB15FuqP2b
	 HCRHvM5mBYugsjRuWMrNkjT+qGGbs/s2nVNR4HIu1R2PP8Stvbb3gvgAlUwhs6v/86
	 LRfRKqBcSC8QuavWPL9aneeHbpDyhfeqx44T4l/CKpJYyKueY5w5107MORP/RYJwlw
	 bUTh1kwZmgwyZhnYCBQZqLIul3RKb/98cR/594A4cvMmPTfAmwKTfBNDg3Pt6csqvQ
	 h9ysLp+9vKiPQdyYbRoCCIsvKdCU+Nc8KnnoEdoNRu1EC2YmAlFMg8KGy2fWKZWpM/
	 3W3pIflDWoDrA==
Date: Fri, 15 Mar 2024 17:47:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spi: mt7621: allow GPIO chip select lines
Message-ID: <6c92fddd-f79b-40b5-bd52-61f43d6a7591@sirena.org.uk>
References: <20240315015708.13948-1-justin.swartz@risingedge.co.za>
 <d562be73-ad76-4450-8bff-38ed5d144714@sirena.org.uk>
 <2dbc59c9133542f6f8bc465113d9630b@risingedge.co.za>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdzcpQVLMTO214wS"
Content-Disposition: inline
In-Reply-To: <2dbc59c9133542f6f8bc465113d9630b@risingedge.co.za>
X-Cookie: A well-known friend is a treasure.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_104724_394872_0CE284B7 
X-CRM114-Status: GOOD (  20.46  )
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


--sdzcpQVLMTO214wS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 06:23:09PM +0200, Justin Swartz wrote:
> On 2024-03-15 16:45, Mark Brown wrote:

> > The core should handle GPIO chip selects for you?

> As far as I can tell, it doesn't - at least as far the state
> of spi-mt7621.c is concerned prior to the patch, plus kernel
> configuration choices, device tree definition, and other
> factors I might not be taking into account.

> But maybe I'm doing something wrong, or perhaps have a
> misconfiguration somewhere. So, if you're able to point out
> something I've done incorrectly, it would be appreciated.

Look at other drivers that support GPIO chip selects?

> To attempt to confirm if the core will handle my desired
> GPIO chip select lines without explicit state toggling,
> I tried to set the value of use_gpio_descriptors to true,
> without any other modifications to spi-mt7621.c as of
> commit 90d35da658da8cff0d4ecbb5113f5fac9d00eb72:

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

The core needs to know that the GPIO chip selects are there but once it
knows that they're there things like setting the chip select should just
work.

--sdzcpQVLMTO214wS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0iaQACgkQJNaLcl1U
h9ClYgf/VBvBkaKRqN1N5jGqzbE+7ahGMhNcsH8qLPqWGA7txz7YIJ0DYg+F3ySq
QRYJmJCexCEEH9Vmj/49sauUmN0DXGIBjdUNOR5J3jf5KZD0xNIu69/jTxpjxL7l
QBFpRB4Rh+7I7+ObVhluJpBSexUrK73x3xwb+FMjOUV5Leh/fM71E2SWiUG9vX96
Gr3NingqmwpWwnLGkAv/G/45YPo/171bONDqnE7zfslPCSQoexXW0CdDwYiQEU21
SkDozS8Wb+qRUox0uU9Gp10zPNCzwbFh0FVyikmJ3t0RiLSCLSI3RHfhEd4FMi7t
1IaadgvwOf5iayGgCUxilb8PlMZNng==
=HCgu
-----END PGP SIGNATURE-----

--sdzcpQVLMTO214wS--

