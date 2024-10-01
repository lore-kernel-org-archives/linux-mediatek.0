Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF928CE7D0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZZv8c73acq/AYAbbPQjmJhwftVKGToQYH4TmKLfMRc=; b=1KmyAg0a68/KVTwTal1MYEIimY
	olaDsO3nnK9q7Sm9lrhfWCr+fGBnf1RNzSrRt+w2nkTNVz0/tfND/oshwbUygVaKFyCQl8418p6sm
	6Y8YQE6q5njIfHnoZdBjIxnkydpxE1kW/sE9fry3y6Buag8s+bEqOHCzbZ1QXJH8G9TgjU43Hsv8x
	7nRq+sblhPvl7F3+Wv8qhmPq7ueKSJmNqBnxgVbXipuAyt3c4HHv/VNYqZ6NH6Lcrj/fgtRJ1g3AA
	0B54saklimZKcSWYQyWdwRe9dzXGe9VA/iVaYqqQz8Fg4LtH8pvDxc8TEh2w/G9OZYSgQ5/QNpA0K
	oEPy2YUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svaix-00000002SqS-3UuH;
	Tue, 01 Oct 2024 11:07:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svaiv-00000002Sq3-0aBv
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57ADA5C03DF;
	Tue,  1 Oct 2024 11:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC78C4CEC6;
	Tue,  1 Oct 2024 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727780840;
	bh=o0ib4p9BLqUoNdnKPQTdiWpsl0UL02H149/KT3vytJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyFkZsH29tzHQ8Vq5hZvpMUdoajniCpw785nmNekWVem2rwvcjRCcVuX7EtpXP7DX
	 5dol7u4GHA7OBQh7q9JqSc5kLBM+B09oc/DLhiGpM5WziGvkpbUW11ddO9csNBX6jS
	 HJ+neE77R2/5jPoovPMNdByuHupxKjQ1KedtIaeVEjn80yenM4mKz0FlkVBPWz2+0C
	 BwvNmw9nxL8rtib97StocSdGOzTGYL1e2h6oGRAzE4IXLkCrZuj7yyIiMS7HcO1I4S
	 nd5qIiQfsAicGdAOvwM6fBUyWk590a3+7gIFAjDu/jDaH1/OKUfIPrwzx0ILuEMYSN
	 cgEfP1duIWW1w==
Date: Tue, 1 Oct 2024 12:07:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FB6ybZExq1WM35s/"
Content-Disposition: inline
In-Reply-To: <ZvvHdlD6E5bzsWwV@google.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_040721_261328_BE563239 
X-CRM114-Status: GOOD (  13.69  )
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


--FB6ybZExq1WM35s/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2024 at 02:57:10AM -0700, Dmitry Torokhov wrote:

> This will add an unwanted delay on ACPI systems that handle power
> sequencing in firmware. However use of "optional" regulators is frowned
> upon in this case as the supply in reality is not optional.

> Mark, has there been any developments that would help reconciling
> difference in behavior between ACPI and DT systems. Ideally we'd need to
> know when supply was turned on, and adjust the wait accordingly.

There's not been any changes here, but there's always been an event
availalbe when a regulator is turned on?  There's also no difference
between DT and ACPI systems here, both could have the regulator fixed on
and I'd certainly not want to rely on an ACPI system implementing a
device specific delay after power on given the sort of stuff they like
to put into machine specific drivers.

--FB6ybZExq1WM35s/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb71+MACgkQJNaLcl1U
h9CGOQf/XaxfJ10h2QybwaLcAhwIr4t4aVxpAo30seHpdJXr5g6e8m/PIKcnHaj0
svyCjb7p8/wvufBwBxK/bsNPGdmK36l2rdkszNGlf7Xx9MsB91sSlHtlQaZq6Y4X
ZvkkbkyP/uDTFekDdhbJJMMFNyZ/9nZOttpF+c6kjkhgtPzfEloTUhMA+Uct0iEO
Ak44DWhDyFhtbm4YtX7KKCGCGJmFKEAch6zRJbyfxkwTN/c6vExQuONmwSdLNUWK
UYfmcwUgGShfkf7yhRLvVHcGE4rgSY+yzpjq8QZtHdkfCebPipnqtp6Wc55o4gUr
JyXW3M0Lo6QaPKwLTvcJBN7g94P/gg==
=ax8w
-----END PGP SIGNATURE-----

--FB6ybZExq1WM35s/--

