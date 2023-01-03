Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26009C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNHGYeVYFIzxBf24jgwJU2T/wl2hD0aiCUszvE1r6qc=; b=W7KEPCD7UY0YAavz/tmJlpWtuu
	yICbvmWowa3eZpRUogL1q2fgZiTzudxjheS6cRe8XJPWvwKC5XrrRCH845KA2nQz9t2/T4NS1V83X
	KB55UnCvGv6B49oavAsh0o3g4hd16te96K9jMc3BzPqLxi0oztjnccqjVX8B5tW7XkR97QI5vH+mJ
	KbYCX5W/PrcNy3/Cm8UrzboyjQJ4Cz0KFFFBK5ddRA0QEBityKn821CprLKoX7MAyvfA7SlXdBGFL
	xe7msBT2rtdEKmyyWfIPWsRCTZU9Q51tMK7AjM0MEB8B4IFBtLn4Sv2lw1fokQVUkwskaj6Lxtwm2
	m/II7a3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClRv-003akz-MV; Tue, 03 Jan 2023 17:51:43 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjxN-002pl8-8l; Tue, 03 Jan 2023 16:16:11 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2C3583200902;
	Tue,  3 Jan 2023 11:15:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 03 Jan 2023 11:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1672762554; x=1672848954; bh=wNHGYeVYFI
	zxBf24jgwJU2T/wl2hD0aiCUszvE1r6qc=; b=pjCYKo7gkCK5f2pIymt6QPnLBC
	1DAk7msGDlygQAQNqEVyCIpFaOyMgaHSi40KVwP+w+L6RrW2p5XYYI1VqB3rG7dx
	KEjGnr8HJwsjwZoQRvabZE5YxL8qXbJz8wRykSz3ERcPZx7n7E/OG+hl11/vLkbg
	a06mvms0SGOqlyX0iMJ83oydOETkNwpTTu7grzSiLToon31tLFhkz4o7eh5iBou4
	MxVnC/ZDnvM9P94hvHrcDURJq58ZYxwA3SlT3lGqJlK0eSF0GPHMddpVHO2ldnjB
	uhG30YyVqwEtr/cCfgAAU1RUwWaiMmfwyBP76iCkiVBIeOBs/K8Nobgq0IpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672762554; x=1672848954; bh=wNHGYeVYFIzxBf24jgwJU2T/wl2h
	D0aiCUszvE1r6qc=; b=j531BDLWxm/ohYQJ7nDDhf9HZ38aqVzvC/s9TGxSWFOF
	iiYyCfot5ViuJBPsApS5/UR9lIF4taTuAL4+nbDvqMjQkZGhHU9h03T8aaJaQjHJ
	KTOMF2W1onoAb/5nUCjwe3LJeMQJeuG9q89F1Y0ozgV/zdROkYA9crYI+U05Jvmt
	nCvLmp92lk26OKxFnXrgHeSFA3iVvwxkR69pcDKumWR3J0EWWdDUkd0mLpuBi97M
	l/88gmqhLrZQCuPWRLEuc553zwBBHOTY2e+B+OrNT8lgoICwo/vmtj+9+DkWcXSd
	NotMN9hkOPXxvXxGe/ixjYNbxBvbmJ+YFvUJxxpuLg==
X-ME-Sender: <xms:uVS0YzB0JXSRVIAi_tGC1otQM2RzPjHpcflhIgdzCVRZrzgRfROJDQ>
    <xme:uVS0Y5i0ix6UjpUCqv-WU3J8FLgiHnuLKXZKjl9oCftIjeoxe8ZhAZLuUMwa_4PBv
    ytZfM0HWcvHe6enzsA>
X-ME-Received: <xmr:uVS0Y-nMPMm_4ZZv6rRdHATK2kWWJIZJ8TVVp4gOFFT1RGkmP6Q_UDvLqCmbfQ35RACyLiq4fB9tjz0QGBKP9nEVd7kPF1FHT_4s6tSM4oeIJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffejieeg
    teejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uVS0Y1wBrIhxHWXikal4guApjH66SvtY4OcZSpj9b1-KrvPGX-uI8g>
    <xmx:uVS0Y4QAif-qqBka94NRhYpDVTtWsMhf5sxJwNSqoyhZC3swXYhcog>
    <xmx:uVS0Y4ZsYlbpnrqbDSwACwmC-fzNNOsr_D788yWirfW-kANxEbry5g>
    <xmx:ulS0Y7YS89FzmTs6M_WxvTPd4EyTSa5Y4NKV3wydY-ZSTc8dmhi46g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 11:15:53 -0500 (EST)
Date: Tue, 3 Jan 2023 17:15:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sean Anderson <sean.anderson@seco.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Joerg Roedel <joro@8bytes.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>, alsa-devel@alsa-project.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
Message-ID: <20230103161550.4tui3ihl65olvkd7@houat>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
 <20221222233759.1934852-3-sean.anderson@seco.com>
 <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7v4zidzdfmuud6o5"
Content-Disposition: inline
In-Reply-To: <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_081605_380738_3DE8DCA4 
X-CRM114-Status: GOOD (  21.19  )
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


--7v4zidzdfmuud6o5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robin,

On Tue, Jan 03, 2023 at 01:01:07PM +0000, Robin Murphy wrote:
> Hi Sean,
>=20
> On 22/12/2022 11:37 pm, Sean Anderson wrote:
> > Convert users of component_match_add_release with component_release_of
> > and component_compare_of to component_match_add_of.
> >=20
> > Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > ---
> >=20
> > Changes in v2:
> > - Split off from helper addition
> >=20
> >   drivers/iommu/mtk_iommu.c    | 3 +--
> >   drivers/iommu/mtk_iommu_v1.c | 3 +--
> >   sound/soc/codecs/wcd938x.c   | 6 ++----
> >   3 files changed, 4 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2ab2ecfe01f8..483b7a9e4410 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *=
dev, struct component_match **m
> >   		}
> >   		data->larb_imu[id].dev =3D &plarbdev->dev;
> > -		component_match_add_release(dev, match, component_release_of,
> > -					    component_compare_of, larbnode);
> > +		component_match_add_of(dev, match, larbnode);
>=20
> I've long since given up trying to make sense of how the DRM tree works, =
but
> the conflicting change is definitely already in mainline:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
?id=3Db5765a1b44bea9dfcae69c53ffeb4c689d0922a7

As far as I can see, that patch doesn't affect DRM at all, and the
commit you pointed to doesn't either, nor has it been merged through the
DRM tree.

Can you expand a bit on how we're involved in this, what we should
clarify or help with?

Maxime

--7v4zidzdfmuud6o5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY7RUtgAKCRDj7w1vZxhR
xdWgAQCl2SxPgHcEj92AdlH7Y2VvK6G5Bczcu2wrB4ZrHXVpawEAsJlD4MKrpINP
IZalK2KlJTqUilPQudOtqmCeQzWQqAo=
=cdeC
-----END PGP SIGNATURE-----

--7v4zidzdfmuud6o5--

