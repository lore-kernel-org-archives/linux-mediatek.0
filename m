Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A994FC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLy/CfxyjrkMH4abzpNE9BsY7WmJfcpuu3WPXS5/mLc=; b=BPPxF2rCXOFz0BCqRu0QqfpjWi
	XDMDCu14U2MRp2leikG7P42Z88UtlncgTwSXEt8gzp98g4LtJtN4ER5ro5ZphtZVORVHFm2JhY7hE
	gkXtjfufqDvWAjyPmQyvYPJLbVPXuOjNZrRvCPgrLvGtmdqjetYIsi6tvRYpiJ9s9GrCOvNzHQ+Hl
	N7XyTniGYYwyz3pYnt6ErOlZrCq2A/A81jEWD3RtCMNGAASV0N7fisCnMuyVGtr42C9w0gYtrr/Fi
	uj4ikdZx9EstExzSYKNFbL9qc/5uLphfuU3zi+t/7P4aTHJAXFi7UuzBRpgDDk3bHUziL6R6VyBT/
	Mj5LddWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnke-007VrD-Ho; Mon, 13 Mar 2023 19:22:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnkT-007Vno-7h; Mon, 13 Mar 2023 19:22:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B28DB811DD;
	Mon, 13 Mar 2023 19:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF695C433A0;
	Mon, 13 Mar 2023 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678735338;
	bh=ZkbNkZ34NZMdf0rITcJevdNA8xkyXVHk3RQ3QHQCPo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYRY/VOEfWWIWUGkUCEd2cUc6VwsJNb9sQK7C/5po95pQcevLD7l0xgF0y6QmJ/Tm
	 eNj5ZgbZf07KGpnlv0sHLqA1u5wZT0twxjYVECSoYCaXO76bNQS4iFXDW7j1ubbi5l
	 JYEPa6C9b/XNYnXmhBYcWPZ3g07cMVQbfCzCd+0tIpcdMnYqk51NEXVVLMbLpTrRFf
	 MRw1pjkhKY72BsZ57jxfMu5FlyeusoXdjuIffEqvxR3MJIOP+hy8V2KMXtYLDpgvZl
	 pnIRq8MjquCtUDVkmqock3S5sWKiNTiW32jKwkGSc5Rfjphd83d35JcoL8yK/iB0QT
	 HV2ZFtRbGLYCA==
Date: Mon, 13 Mar 2023 19:22:10 +0000
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
Message-ID: <9bf3dd37-71c2-4118-a8da-40e656b42d10@sirena.org.uk>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <7a65d775-cf07-4393-8b10-2cef4d5266ab@sirena.org.uk>
 <08e98d1d-e79b-fe7e-0d59-827f72277fc5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3ox4e/H/VGMGGHy"
Content-Disposition: inline
In-Reply-To: <08e98d1d-e79b-fe7e-0d59-827f72277fc5@linaro.org>
X-Cookie: Type louder, please.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_122221_579738_F85E9623 
X-CRM114-Status: GOOD (  19.10  )
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


--w3ox4e/H/VGMGGHy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 07:39:45PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 14:55, Mark Brown wrote:
> > On Fri, Mar 10, 2023 at 11:28:42PM +0100, Krzysztof Kozlowski wrote:

> >>   drivers/spi/spi-armada-3700.c:807:34: error: =E2=80=98a3700_spi_dt_i=
ds=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]

> > It would be much better to fix of_match_ptr() and/or the module stuff
> > that also references the match table here.

> Why? The recommendation is in general not to use of_match_ptr, because
> there are little benefits but it disables matching via PRP0001. Jonathan
> in parallel thread explicitly said of_match_ptr should disappear and he
> is not accepting any new code with it. And in general he is right.

If that's the case then why are you adding maybe unused annotations for
half the drivers rather than removing their of_match_ptr() usages?
There doesn't seem to be any logic here, it's just randomly making
changes as far as I can tell.

The PRP0001 stuff isn't an issue, of_match_ptr() can just be changed to
do the right thing for CONFIG_ACPI.  It doesn't buy us huge amounts but
it also costs us very little and may be useful in future.  When there's
missing annotations it's not causing issues for practical configurations
as far as I can tell, and if the macro were updated for CONFIG_ACPI it'd
be even less of an issue.

--w3ox4e/H/VGMGGHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQPd+EACgkQJNaLcl1U
h9DNrwf/S3t3cwLWoA+nkWX0VuXmOpSbOw7CSZL7nvCqVHn162nrIu6LmmcfJG/5
TvxaEb4hrOmkhboKNrvX8JYqykzRJE12GtrxlveQhR45dqP5F9pFGMDpR62fk0LL
NChJLRUKXP9asPzr3MxBXKfZ1PdpCctyZTIQb2hF6+u4FDHA7v0jinpxpyKXiJjI
PyAjXx4BUFspLxkUdkJE8coTxx1IeckxcmbEtpSj3iSDUzmIM0mfzc2ZpvoKPCBo
PNjLoEXpL1MRbe7LyijpEe66LxerpAYjUKtav8A4iJERLpIB4o1QY8wqNwZ3+P5+
NdQrFLt5aqs/+fwE4YQl+4Q6BNUkWQ==
=fkKm
-----END PGP SIGNATURE-----

--w3ox4e/H/VGMGGHy--

