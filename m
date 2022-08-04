Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ED6C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igk0I3rokscPuTqExm7RY28MJd7htjVzvl4oTrul63E=; b=xkamUWiz4Tg10Tytjd+cvPOpwF
	TmU0hfkvTXozz7JgkJCO6pT/zdYT+hEV03BKrn024X9jFMQz4pWM8Gverptz5poDYzigcpAu3Y1f2
	f1/iuKcS+KStIN6FvXa1y4WoQsl94wjff/kHz/j93e6OVByPsFpUWpKIPPq4wnYuIP80VSOiECk5F
	OObevngtJAr0V1t0if0v9BiT1bmqvixXCYG2vAP9O1obyBE+4luzhNXunGpbxUTYgRZDdoPSfcvqs
	H3Rzy2B24yKlCsx6Kjho6apOzop25v8ZBjuB/Ie75gQlxWPsSj6cCLHcWj2O8u8UEcapzBmwj3SCA
	Mksja6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJayZ-006NDE-0J; Thu, 04 Aug 2022 13:33:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJayL-006N6m-QI; Thu, 04 Aug 2022 13:33:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 502C561831;
	Thu,  4 Aug 2022 13:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAB4C433C1;
	Thu,  4 Aug 2022 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659619989;
	bh=4UN4Sh851nEfGxs4mtdDwaJj3APw+mKwvZfqZjce8ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gw1Ka9jQm2EnMMwx87dKHUeoy+UdaWeKnJcFzH+ufqWvkB/UIKAQPeylrazG6dB6A
	 RvphiLRFHzxrQnyj/OXMm0IgsSoYtEu3gKvOkKRQ+vHGDkAhhGPSbTn0RMLsK3DALZ
	 pzNMyDmjzyTO/vugVmqZDxnpuLb3L5wqtYSvNapb5/ADyPcBDSS9kXdp1IfiRmBi/t
	 kpqDpJalEFzyxxu0f0ArUAKsUVggAgDUN9p8rT46mQlP/rJ41DEqi2tK12e8bUTjU9
	 hUCIex+JS390PNT80Ryac2vYSt+QGBNepf6IMPJ+vQJe/NQHTeaYA0G/zcR4uJSv9g
	 Ntb+B+G04n5uw==
Date: Thu, 4 Aug 2022 14:33:02 +0100
From: Mark Brown <broonie@kernel.org>
To: "chunxu.li" <chunxu.li@mediatek.com>
Cc: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
	lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com,
	daniel.baluta@nxp.com, matthias.bgg@gmail.com, yc.hung@mediatek.com,
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	project_global_chrome_upstream_group@mediatek.com
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
Message-ID: <YuvKjn3cW5im2Yw9@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-3-chunxu.li@mediatek.com>
 <Yuu+elYxBv3xZ1O2@sirena.org.uk>
 <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6kGedXdUenW5S127"
Content-Disposition: inline
In-Reply-To: <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
X-Cookie: Did I say 2?  I lied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_063309_932910_CF78405C 
X-CRM114-Status: GOOD (  17.14  )
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


--6kGedXdUenW5S127
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2022 at 09:21:37PM +0800, chunxu.li wrote:
> On Thu, 2022-08-04 at 13:41 +0100, Mark Brown wrote:
> > On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:

> > > +		.board = "mediatek,mt8186",
> > > +		.sof_tplg_filename = "sof-mt8186.tplg",

> > The mediatek,mt8186 compatible looks like a SoC compatible not a
> > board
> > compatible...

> Our dts config as below:
> kingler board:
> compatible = "google,corsola", "google,kingler", "mediatek,mt8186";
> krabby board:
> compatible = "google,corsola", "google,krabby", "mediatek,mt8186";

So the SoC is listed as a fallback for the board and things work out
fine.

> Which of the two approaches do you prefer?

I think it would be clearer to keep what's being matched the same but
rename the .board field to be .compatible, or possibly .system_compatible
or something if it's unclear what's being matched.  That'd be more
normal for specifying a compatible string anyway.

--6kGedXdUenW5S127
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLryo0ACgkQJNaLcl1U
h9AV2wf+P1McXNe47oxC4pSkB6Vp8RnE2YJLp73cxmN6fQR0tXycCwlIB4nTYrWt
C7H/h1k9T+ARv2785fTMpykEQmPUjhdAQW5TXdewWzvoey37H03oE1SkpJrqKsVh
VMDX+njYEvDzi3OL+D/JMxPVCzPQnnk8SwSRo8KUV4yxaLCZ5aJEQ73hXL7kwkYT
EK+KjGM010dcK8X79ZGDBE/0N5UgOWTbWw4WpQH6mNCzAcMhmiCCS48t25W+5fXj
BT05BMe4/RSuo6Q3Oznve6xsfjhPkAC9/bdvDszSagBZDrOuqq0Zt0gh3LayI60O
5LASb2bTbtSyzAys/ISEh1xt+33Tfw==
=AqQy
-----END PGP SIGNATURE-----

--6kGedXdUenW5S127--

