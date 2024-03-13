Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A94C54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGH6/zI7wq2PJoOSh0zfuxVwyAIJzOp6a2Vas2Iee44=; b=1/hMIhq2TOhAUL+teJM2nFjiQ1
	8f8V7wGxn/x+xwaOA05xwRcadz06uMyrZxoMMFqJ4/TSI1APLClF3Zg/3e/qSWXxu8prGyHbiZ/uh
	Cli+I/YRmKroYJrp/98cwPNAgfd5pcBTmVByZ+0g7p2HbiNjzvxmgC7zYgC1t06IONfVImDiDX32d
	cis3+icFJ8A9gdbb7zkRQrvSJ973qQ6ABtr+/tlxSk//QFiCQsEwZn5NsCL2fYBKVMSf1qFsJLO/8
	YT8qakoBS51o72Q8mL86aSa5ZtYG5VrOjxnwCg4zfhDLE6TX2UIqX5IHT3MCjUIBJmHZebaq6y5+0
	qbc3aZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSKC-0000000B0lR-29fM;
	Wed, 13 Mar 2024 17:23:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSK8-0000000B0kJ-1FFl;
	Wed, 13 Mar 2024 17:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5600A61477;
	Wed, 13 Mar 2024 17:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2F2C433C7;
	Wed, 13 Mar 2024 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710350607;
	bh=PAjE7BPOCrbybCWWbaLc6x+dJTUxbHq0aBWL3JN7HUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ias5kLdFpwbVTOnuFBiHfowtvPUTf/oQeYy8ydLpumuvXSWAV5hvswhDSaUXbFeuz
	 eUu9fC0u60jN7riKiX4kTa7tqZAA6p+j9W7Rqk7esgtV/DK5AlXr0qshOjm/iTBLG8
	 lPIlYKHkaCsCCcgVq4tlqGSpiNQy5+KVia6zOs3yfcSyYeUZMALoTqx6z2LOncLoVX
	 +gH4xSWs4c7ATGhaBWq8OT7aALAKbpIKDRn+jx6UFLNIqTUVO9eweTyL4QbPiApksn
	 aE8Q8tDD8/9THGnlBzvNB9Cb4UCBR9vyZ4gW8RLpIZ9sguYmL0JT3Uzhf2og6TmLoK
	 kiO0XuPWMvZbg==
Date: Wed, 13 Mar 2024 17:23:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Message-ID: <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
 <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bu1f4F19CTgWKqA0"
Content-Disposition: inline
In-Reply-To: <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
X-Cookie: It's later than you think.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_102328_451190_95BB8B69 
X-CRM114-Status: GOOD (  25.07  )
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


--bu1f4F19CTgWKqA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 07:03:25PM +0100, Alexandre Mergnat wrote:
> On 26/02/2024 17:09, Mark Brown wrote:

> > > +	case MT6357_ZCD_CON2:
> > > +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
> > > +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =3D
> > > +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
> > > +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =3D
> > > +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
> > > +		break;

> > It would probably be less code and would definitely be clearer and
> > simpler to just read the values when we need them rather than constatly
> > keeping a cache separate to the register cache.

> Actually you must save the values because the gain selected by the user w=
ill
> be override to do a ramp =3D> volume_ramp(.....):
> - When you switch on the HP, you start from gain=3D-40db to final_gain
> (selected by user).
> - When you switch off the HP, you start from final_gain (selected by user)
> to gain=3D-40db.

You can just read the value back when you need to do a ramp?

> Also, the microphone's gain change when it's enabled/disabled.

I don't understand what this means?

> > > +	/* ul channel swap */
> > > +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT,=
 1, 0),

> > On/off controls should end in Switch.

> Sorry, I don't understand your comment. Can you reword it please ?

See control-names.rst.  Run mixer-test on a card with this driver and
fix all the issues it reports.

> > > +static int hslo_mux_map_value[] =3D {
> > > +	0x0, 0x1, 0x2, 0x3,
> > > +};

> > Why not just use a normal mux here, there's no missing values or
> > reordering?  Similarly for other muxes.

> I've dug into some other codecs and it's done like that, but I've probably
> misunderstood something.

> The only bad thing I see is enum is missing currently:
>=20
> enum {
> 	PGA_MUX_OPEN =3D 0,
> 	PGA_MUX_DACR,
> 	PGA_MUX_PB,
> 	PGA_MUX_TM,
> 	PGA_MUX_MASK =3D 0x3,
> };

The whole thing with explicitly specfying the mapping is just completely
redundant, you may as well remove it.

--bu1f4F19CTgWKqA0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXx4QYACgkQJNaLcl1U
h9Cq8gf/c3/T6nZpwn3qjvPt1GYUFUscyy2lTACU0mVHAjCBiaczv/OAoKQGmNpm
Gg9Lnezruu41314zpVUvu/pl80roWJoCd/b7/VjOp9lawXWnWalXNeqcaTSYne31
FUzdFe4a+quH9LDo5Nv9AzMnLBokld6ELApXMG/Uxmd5HJn+unU5euMCTH0p4jKs
H9ptL1meZwotydv6+TTT2jEc8PSdLUr7EdHa6z9/6ih5st+RrHoLI8iCDa3lkOfR
muwbG4CNh9PqrI00X86GUDvHTv5cZsIPeOoVLgBEA3ouIO5RgX1uWMNW6J779WIa
3olA/hHBePVDGwV6qVQKVWyLY8klXw==
=LtHz
-----END PGP SIGNATURE-----

--bu1f4F19CTgWKqA0--

