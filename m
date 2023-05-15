Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA2CC77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AwKHDxjJFHiIpnElANVMNxlXghPESLDPH/B3VCghqE=; b=PqDLl10m99Sztjahclu/YLc1/x
	Oz8CU7kwtpdwYW1sIMLP62y3jFNfyc3f6vqbDU//bmKR5U4EP+w1lHeRygqUaWJNEEsH4uIYcC4/f
	Ly/OkSOieXwO3olsJ49mwH/dlqYhT4qpZExpoMr8NqEzrd86F5Y8DHJPYY3u8W5yN/PJINPkv5wgK
	iqRnPmUV37tj89GMUHbcX434qRdbcneqCnz/rc4QFBIpA5K7TQ3LQo/LabEOz4NgP8HVnkGKM3UL7
	7dqq2L0M5cmMxKkhXgBVFDE7r4wrnFKfcVgtMAhacF6zfqFpQf63t4OYFShca1bO4IPBd3e+8HOIr
	IJeGGW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyZlf-002Vaf-0J;
	Mon, 15 May 2023 15:05:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyZla-002VZF-1O;
	Mon, 15 May 2023 15:05:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAFAB61FED;
	Mon, 15 May 2023 15:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E618BC433A4;
	Mon, 15 May 2023 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684163137;
	bh=M+R7QJX9tlmUfjLa93PTIOcnlPo8fCYSptpe+Z31hvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dm0/l0pj1T5XWHflBhC+rfrSh3kzTg9GrY3XVsk6KrT0+mVHpuIhNCj7Q/SQKC3B+
	 VcxdsPs/gS8vjGV/PlidJBaytbkh6gKS0ONKAj7ERQoL/ms/rjdByWiMOmQxGxvfJJ
	 Kirghm//gDxI5jmKCmJfIcXLI3rIxSPlLfKWGUL29bvI0HZLo3II+p6Oiy39J6pZk/
	 M1KJmQK/Wlm0UPQMpIQIlFxk18Deot2xqLx5kBtseaflGKQWDljTRkmXrJPTl6PGeD
	 53WTQ1vw+sZjrNINUlM/0LLzWD9mmqs7eX6E0mqjdDYZfEbblThqLdCKrOxdvRCW/K
	 nAt8dy2OpwULg==
Date: Tue, 16 May 2023 00:05:34 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Trevor Wu <trevor.wu@mediatek.com>,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com, lgirdwood@gmail.com, tiwai@suse.com,
	perex@perex.cz, matthias.bgg@gmail.com, yc.hung@mediatek.com,
	tinghan.shen@mediatek.com, sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Message-ID: <ZGJKPuf1FX4AYLXl@finisterre.sirena.org.uk>
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
 <20230515052540.9037-2-trevor.wu@mediatek.com>
 <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a4Gd7i8RRVnq1R5N"
Content-Disposition: inline
In-Reply-To: <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
X-Cookie: Avoid contact with eyes.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_080538_511689_DF8F8D9B 
X-CRM114-Status: GOOD (  16.68  )
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


--a4Gd7i8RRVnq1R5N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 01:25:44PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/23 07:25, Trevor Wu ha scritto:

> > +{
> > +	/* common defaults */
> > +	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(struct snd_sof_dsp_op=
s));

> Never use sizeof(type), always use destination var size! Anyway, there's =
more.
>=20
> I don't think we need to perform this memcpy: we'll never see an instance=
 of
> both mt8186 and mt8188 drivers on the same machine, so you can safely jus=
t use
> sof_mt8186_ops for mt8188...

> > +	sof_mt8188_ops.drv =3D mt8188_dai;

> ...which obviously means that this becomes

> 	sof_mt8186_ops.drv =3D mt8188_dai;

This does have the issue that it then means the ops struct isn't const
which isn't ideal.  It's also not the end of the world though so I don't
have super strong feelings.

--a4Gd7i8RRVnq1R5N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRiSj0ACgkQJNaLcl1U
h9DXNgf5AfJtzdmTyLjLoAOi+seXTanouzlJtqeDLp9sgeXi4XAMwpxoKIZjJmdy
VsSH4ChbVLoFOfsJhTFHPNL25XiJzmpLcXSLSHX6ICeF+4smiSTVfnNmOhr0sjoa
6O64OvuPRfWJwsTuUnaUpnrre638+d13uyk/kdotCEvmIwTOWnLexBlin6pdeyJa
SoPO2RPTuLkO2QLodLDoW3s/C4pP5Oj1hS8UobyIDxbYnH8Azk2mzhOeg4R+aRS0
1JQl4uGFzB0TzW8Ob2Q31pD4lIxV5tSCEc2ChjaUchAqu2TAUDz6ZgMQRus11mSh
OVRLrGihJnGRLQOGDlrtsOS0Uwqa8Q==
=VHrp
-----END PGP SIGNATURE-----

--a4Gd7i8RRVnq1R5N--

