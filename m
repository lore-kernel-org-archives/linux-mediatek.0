Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F225BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE74F617E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE74F617E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjn/fD0GTsuJPrjeQWcVAfo/7TUmjYIEaCvykBB/IOo=; b=Tt7qjUT8HI2BBKC+ZLdju6x4Pl
	9sdPMhdmif6/8A+Krb3jRkA47109XzPffpl5nSTfFPCKvMqyxjXrpttU3lZy02tKQK9FGV6R0Ypuq
	VCTVbF+vBhKQg73CBgxby+2aDOIp5bGXKEDrvmLCWt1l2Gqj39sY/ZE8BlJP2cVB4aJO8JYlBixQl
	ikwx5o6rpE4ZcoIvAI3jKx/lc/wjcltaGpbIR7ki6vqyt5bE4BTYqcLmadkZjcaMApDsEoWZ4/uKx
	cbefuNQVPE22FAVbPUHJRF1McEK9Rj9HLRESRczsHjloxVOWEx3hzKo6+eiaHOUWUmv1EvuBzIPB0
	AoJLJYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVv8j-00EBo0-Im; Thu, 30 Sep 2021 12:26:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVv8X-00EBmm-CA; Thu, 30 Sep 2021 12:26:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3C416136A;
 Thu, 30 Sep 2021 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633004764;
 bh=XMzKJ6yQ8GbX+H2Mwz1aDa/jAtUE4SY9wpVtxJIyZlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s3Eo3qkzu0Ybzjop5jdJIvAJCw2rR6kSVz8ydyU8+d6/AEFcKt82yCpmZhMWNMR18
 txTbK4AznXgsFdNvNU0XcKXpkzaPCV501bHudxqlqlHxnUOc7CBRj2dzhgheCvT+fl
 pTt101pLo8mKIts0d4zrPrk8olXVr9L6P4Z03+innWuMTSJYV4e1BJYP1ta75ED0zA
 ICYLj7QThUpt2UrNmRtkLk3p8ZAJajM2AXKObOUV2mAzAI9E3gTWvf9HB1sfd73V/n
 jdyp9LEQjJ7vsZL+ypBhXs1rvyp9Aw5lZ2QwHs6cQi0KAOScLV/dY/Tvkcax6rRBM1
 rWw0XSyQRzYeg==
Date: Thu, 30 Sep 2021 13:25:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: kernel@collabora.com, linux-spi@vger.kernel.org,
 enric.balletbo@collabora.com, dafna3@gmail.com,
 Mason Zhang <Mason.Zhang@mediatek.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Revert "spi: modify set_cs_timing parameter"
Message-ID: <20210930122513.GX4199@sirena.org.uk>
References: <20210930120700.2564-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210930120700.2564-1-dafna.hirschfeld@collabora.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_052605_461387_15A48DE5 
X-CRM114-Status: GOOD (  17.71  )
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
Content-Type: multipart/mixed; boundary="===============8837991823929521434=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8837991823929521434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BtNCO5h84ExDStzY"
Content-Disposition: inline


--BtNCO5h84ExDStzY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2021 at 02:07:00PM +0200, Dafna Hirschfeld wrote:
> This reverts commit 04e6bb0d6bb127bac929fb35edd2dd01613c9520.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> This revert the commit 'spi: modify set_cs_timing parameter'
> and its following commit
> 'spi: mediatek: fix build warnning in set cs timing'.

Which is not what the commit message nor the paste of the full hash
claimed :/

> Those commits cause regression on mt8173 elm device. The EC either is not
> able to register or it sends numerous amount of errors:

> cros-ec-i2c-tunnel 1100a000.spi:ec@0:i2c-tunnel0: Error transferring EC i2c message -71
> cros-ec-spi spi0.0: EC failed to respond in time.

Do we have any analysis as to why?  Do these devices use timing
parameters in some way for example, or do the values written out to the
device change in some way?

You've provided no analysis here so it's hard to tell if this is just
some random change that happens to change code generation slighly or if
there's some actual reason why this might fix something.  I'll note that
as far as I can see there are no users of this API upstream so I'm
guessing that you've got some out of tree consumer driver which uses the
API, it's possible that there was some error in updating that driver to
the new interface which is causing the issue.

--BtNCO5h84ExDStzY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFVrKkACgkQJNaLcl1U
h9BQ+wf+L0v6eP7/ZC1yGM364eVeDsmC7RZB1iQ+4emAZbeaTiv7ISlnwpWSYO9z
80HsRI6OyRoEZK23fudRrN0dV/GhiBunllTihW9w2oh/TB2mKP8Ilq7pF9ziL1Uk
Wa0mXzMwdZ6KA4dX24Szlnogkwoep61uPNcjvglsxfQMdr5o210AEHt3QqVZz3gU
dRi/chCDiy0GhmqlC7Ajcvb2Xx7aBoFYTZZR4ZGZj+htIo+bbwuoFCEqOGtoqxSf
d/OCbLOzvu+/zvXNnoFKMinCTPcpRYx6WZW8nDM5SeJLTsQ9wpaMTHxMeRFVnY7W
gLT1N00BcSOUIEGzUOwpMGbGMFFpJA==
=RhSa
-----END PGP SIGNATURE-----

--BtNCO5h84ExDStzY--


--===============8837991823929521434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8837991823929521434==--

