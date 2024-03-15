Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30638C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 20:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHqjsOzcUbVrDSpytoyEaLdHDpP/EhcorlLYt/IVjBY=; b=LNiP/aUbC4OSn8mq3vPhlDS6Hl
	t4M2MMozDptWA4ggZ3MUV7SNhe+USyGdFCK9saSqaad2IkiHT+OyUqFfdbap5CrPywHfbTGqmks1V
	v4FXYLzQE6f7NXt2gGTrgpXaYcs2z9GZy6Vo0jfvsFh5WbnOPiwNdau+Yd4rZ/LR2fpWhCoMkWCxD
	Lkwy6LtdkjPKxYB0/zNjoFDQSy6AdPJk0uhgcJ1yESars6oD0x6u6IV/mAWY837+eZjbzlz4jlICE
	Ax1TW9kyeKxYBXzKum4L1tCk4rKfutmxBWbbeugR8vJA14YjlkdcbFQ0QQ/7tVldxDtZBxjXz5wPa
	6EeX09Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEMt-00000001W8K-3Bfb;
	Fri, 15 Mar 2024 20:41:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEMq-00000001W74-2qTP;
	Fri, 15 Mar 2024 20:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4069CE2128;
	Fri, 15 Mar 2024 20:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D09C433C7;
	Fri, 15 Mar 2024 20:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710535286;
	bh=OCGwnFTrEKMR7c0B6YzT8O9HyaNBGHd+2FsDDY5QnpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6KYFR0eGqSI4WRdnxqRUW0SUG6msu1cMhnmPGxxyVVa5RiisKSr8sviDtWOonI7U
	 hHSyyxdUesc95vAVrkcOKoodbsd4Hqz1B/WzWELSVqPgsjmXVehj9qg14qSUaKzDzL
	 +NcM0ZzGuSMTzLQ03rFQtVh68jeumeRjIZ2qVLypThrf4ExNhreLWXMJ3xOo8mZu1V
	 C33n6H50BJQWErH07JixQ3cd7RF1iJJ3x1yZCLO8lD3uq68I9Z1czYpx5EdXGQXJOO
	 sAPuZH0yZZJDJQvfxJWCoWxG2tEvWtiw+81W5EcjqCjYcfct0bvmwkXfKmRt4CzbsF
	 hj65LPqGR0LfQ==
Date: Fri, 15 Mar 2024 20:41:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spi: mt7621: allow GPIO chip select lines
Message-ID: <71533474-eb08-438c-b7ec-5f3277c195fc@sirena.org.uk>
References: <20240315015708.13948-1-justin.swartz@risingedge.co.za>
 <d562be73-ad76-4450-8bff-38ed5d144714@sirena.org.uk>
 <2dbc59c9133542f6f8bc465113d9630b@risingedge.co.za>
 <6c92fddd-f79b-40b5-bd52-61f43d6a7591@sirena.org.uk>
 <55c5f2e0723c18384c781e87985f0d22@risingedge.co.za>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D8fyoBk023SaRwkC"
Content-Disposition: inline
In-Reply-To: <55c5f2e0723c18384c781e87985f0d22@risingedge.co.za>
X-Cookie: A well-known friend is a treasure.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_134128_922977_86D89CE5 
X-CRM114-Status: GOOD (  15.86  )
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


--D8fyoBk023SaRwkC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 10:21:53PM +0200, Justin Swartz wrote:
> On 2024-03-15 19:47, Mark Brown wrote:

> > Look at other drivers that support GPIO chip selects?

> Of the 43 drivers (of drivers/spi/*.c) that setup the
> spi_controller's use_gpio_descriptors as true:

>   39 drivers use the transfer_one hook, and
>    4 drivers use the transfer_one_message hook.

> Drivers that use the transfer_one hook benefit from the core
> taking care of chip selection on their behalf.

> Drivers that use the transfer_one_message hook handle chip
> selection on their own, within the function they've pointed
> the hook at.

Oh, this is an old school driver.  Glancing at the code I can't see any
particular reason why it's not using transfer_one(), you should just
convert the driver to that which will reduce the open coding and just
generally improve functionality.  You could add a callback to flush the
write FIFO or add that into the write function, I'm not sure if there's
a meaningful performance benefit there.

> Considering spi-mt7621.c was implemented using the
> transfer_one_message() hook, I'd assumed that it made more

I think it's just old and based on having gone through staging likely
based on even older BSP code.

--D8fyoBk023SaRwkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0snEACgkQJNaLcl1U
h9AiQwf/UOmHNcZDrwzH7kt6mKHCl+t2aZ6FfT4MQdJ8icSErJVvBcuuQ9oJsVxP
xz1vy6RLJhwCbN5LBk2dq55XzuBxiITCjPJhusoxmvZhbYZeZYzWzzWY8aB88aFV
fyxs1trGjhla0rRAs1oNr/y5UDZFLYQvD9tBX+BWyGbous6fV7yYBycO7nYdRHd5
rsfasrQicNwMFKe1CJfKPp7GbaHPvC4drNGlDL9EaAFHGlxCp0a5ayWrLV4k1A6W
v77j7yGf8gagHBzL7wp3pTbBKfJkYxSJiyEeIvsxXpKg7cjVHMywkzWlvF9RYTvv
ZN3l1mazhE3mtXYNfbTEgMCj1iNXKg==
=gBAh
-----END PGP SIGNATURE-----

--D8fyoBk023SaRwkC--

