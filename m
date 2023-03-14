Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0BEC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfEnNx/AtmKQ6+j2cB2Tu1ghvgv+nXYlVjsWMHYFeWs=; b=GSDe761mLZfdJXxRf9Ys56O2Uy
	nszKznTA336uF3eEOYXGRyFJiTaoNXjKUaBD0z8zheM2sUcCCZdmmMRFLoFV1b43qOCl1IVN/i5z9
	0jNRrZy5ljYQADDcId9At4/d6fm/OaHo9IbluHx5gFxodjQPEY2XlbiBzsXX2h3wylwbDbpB83P9x
	3stKZXgZFJl2XZIsjxyLdUR+nh5HamL6Obz8Wiqrb5D4vylhW4tPIwKRkZEFg+P5rho0g3jSne3ZY
	6Wmfc8RhiTboOnvbDbZAxjh5o4OMjtVMExUOKVKNGatyL6YrNaxdrgKVNo9bhW4+a/6ZOiqwcyn0D
	Cutm/6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4fz-00AI94-2H;
	Tue, 14 Mar 2023 13:26:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4ft-00AI6C-31;
	Tue, 14 Mar 2023 13:26:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3FD6B811F5;
	Tue, 14 Mar 2023 13:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68B5C433EF;
	Tue, 14 Mar 2023 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678800402;
	bh=rfEnNx/AtmKQ6+j2cB2Tu1ghvgv+nXYlVjsWMHYFeWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HQdvzfIbZzXtrHVHeJg8joac91CkFNUhUzka7UIgOQ3I0FVOwkfTcWeroLJ31/N7O
	 01OIfdO5oayYpm8+UDO0/KWpqhZlwRH++bOxN+0CTXQ6T/vAaAhHIWq3PWORYgNdu+
	 z8HPP+L3vWZpC3QqInApRRu4W0ND12eVv9xd3zqw9nh3ErFL+dJoUC2MTlBkeIT8mz
	 yRgg+BoDNQO8M885SHiRpZ4NlCsM74IxZcOG+swSKa0mEd8MzUkgN3Wh2np3OsVUhq
	 wKWf8t4NW/4d/W9C03p5tiQl8tBdkxFnmud7ENuSVhpviYrfKxe4rpki0XfhGzz31+
	 O0suXgkmHMBgg==
Date: Tue, 14 Mar 2023 13:26:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/16] spi: armada-3700: Drop of_match_ptr for ID table
Message-ID: <5782b7a2-3942-4bed-9a70-55a43833f69c@sirena.org.uk>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <7a65d775-cf07-4393-8b10-2cef4d5266ab@sirena.org.uk>
 <08e98d1d-e79b-fe7e-0d59-827f72277fc5@linaro.org>
 <9bf3dd37-71c2-4118-a8da-40e656b42d10@sirena.org.uk>
 <ed293caf-e787-a29e-f1c5-bdcaf1aa483a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elD8KD6t7+wRv3Op"
Content-Disposition: inline
In-Reply-To: <ed293caf-e787-a29e-f1c5-bdcaf1aa483a@linaro.org>
X-Cookie: For office use only.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_062646_282644_0DBA498E 
X-CRM114-Status: GOOD (  24.75  )
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


--elD8KD6t7+wRv3Op
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 14, 2023 at 07:44:04AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 20:22, Mark Brown wrote:

> > If that's the case then why are you adding maybe unused annotations for
> > half the drivers rather than removing their of_match_ptr() usages?
> > There doesn't seem to be any logic here, it's just randomly making
> > changes as far as I can tell.

> These are not random but depend on whether OF is the only matching
> method or one of few. Although for IIO all of my patches would be
> dropping the of_match_ptr... For some cases in other patchsets I added
> __maybe_unused also because of_match_node(), when the table is not used
> in driver of_match_table.

This logic is both not apparent when looking at the patches and doesn't
move us in any particular direction - I'd expect this stuff to be
written the same way for all drivers, there's no reason for it to vary.
That just adds complication, it's more random obscure rules people have
to learn.

> > The PRP0001 stuff isn't an issue, of_match_ptr() can just be changed to
> > do the right thing for CONFIG_ACPI.

> That's actually interesting idea, kind of obvious so I wonder why it
> wasn't done like this in the first place in 886ca88be6b3 ("ACPI / bus:
> Respect PRP0001 when retrieving device match data"). Maybe not to
> populate OF device ID tables for the ACPI systems which do not care
> about PRP0001?

Or just it didn't occur to anyone at the time.

--elD8KD6t7+wRv3Op
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQQdgoACgkQJNaLcl1U
h9Anagf/THfRG/RbMsHxaqKJsYsu8z++5R15gbuBbWAl1XHrOE03sdWawbw9nx6/
7FjyWP0YguU7o9glL92CdGxV9CSl2mMJw06/Mvasde/AqKVs1hIrTEBLc8esfnmK
y/l3de8OGXwYRz7UontPhCtwqNjdwza95hPCqQNLi1LhQ8DwEK9TIRvpfsD15NfI
p+M8l80hFu85Hz+2LrWrmgcbQwuvowzOGYminHMypypU2qkEka6P8Avhuz9sB6Jj
H1qukPGKGE02cXrtNfCG6DPdWzp2vPcIzeyFSendbDtHhlOets4W06I02bN3bFD8
VlVyWgaICjPC/DjVXOuTe1yovomvig==
=lrkL
-----END PGP SIGNATURE-----

--elD8KD6t7+wRv3Op--

