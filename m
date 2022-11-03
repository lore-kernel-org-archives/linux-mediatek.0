Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CA9C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hck8cjJ+4R3//xB7Q8qTKGJ9aassQ5/yidi0JVA2cWo=; b=HsNdcEzvt/+Lg7/61mDdch9GqS
	I6Wsjvw7Vanpdw8rARMdwnTOQI0qCGG0pXbeV4VThaDMoEA0Duhvv05pBf8Mf3X9LbyehCLH6gkxB
	4gCaOUiunwzENqmnGAj4L/j4Tvdv3k/LBvaYfI86QS11Cz54GJp2WIZzPTq52QW4nrOJnX7j2xa1i
	o5Ka3LbSvPg3B53IawVW/dLydUPt5NZ3JwDB/cqo2jh99L+a9aJ8B9GGnCq+VUT2xOGUbj8pPL7Ak
	YKc4B0E7fP7jSkcS+7TPrBmqpprVeoYWDmBiN+m6MJzhBfranE/Clp0BHahHhlMVwKiVvhXe1rFj5
	EbwKsyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqf1Z-001ITb-8u; Thu, 03 Nov 2022 18:33:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqf1I-001INU-5t; Thu, 03 Nov 2022 18:32:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C37E61FBF;
	Thu,  3 Nov 2022 18:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7F0C433C1;
	Thu,  3 Nov 2022 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667500371;
	bh=Hck8cjJ+4R3//xB7Q8qTKGJ9aassQ5/yidi0JVA2cWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejOx1hr62Urb3MPgwsvwVgy8/5u4h4hzChkyJEo5u06oUX+ssYAcJqI6cInVX1LhP
	 hOpUu/zXdK9PWCBk+zBXwdNLgiA1YuPzZDawmP11vMRnXpbNoaTCdPoVmeRIn5cNEm
	 TFxYWFocut+w26Wm6BgeI8uWEG0Pbin78DGlZU2cNKWl6MdEbuIOxkNHn3TRvraDeF
	 HTDIGeYUPnSikE4nctDrqWgR89VPqaMOENOFCyzY7ZGnY6qgXXhXWqgDTrFDdxLB9Z
	 zDjBOyxgEBIO/UY5LOuaP1JF7s44fL2UW7JNOJBbbGKR9XUY29oi/ss+9HvRJ7kOmm
	 MuTW6+RXC/ECw==
Date: Thu, 3 Nov 2022 18:32:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Takashi Iwai <tiwai@suse.com>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	alsa-devel@alsa-project.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] component: Add helper for device nodes
Message-ID: <Y2QJS+M1xX2RaK1v@sirena.org.uk>
References: <20221103182222.2247724-1-sean.anderson@seco.com>
 <20221103182222.2247724-2-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZW7Ag/fXdrbtoky8"
Content-Disposition: inline
In-Reply-To: <20221103182222.2247724-2-sean.anderson@seco.com>
X-Cookie: Dead?	No excuse for laying off work.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_113252_274260_F8601715 
X-CRM114-Status: GOOD (  14.04  )
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


--ZW7Ag/fXdrbtoky8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2022 at 02:22:21PM -0400, Sean Anderson wrote:

> There is a common case where component_patch_add_release is called with
> component_release_of/component_compare_of and a device node. Add a
> helper and convert existing users.

The usual pattern here would be to split adding the helper from updating
to use the helper - it makes things easier to merge.

Acked-by: Mark Brown <broonie@kernel.org>

--ZW7Ag/fXdrbtoky8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNkCUoACgkQJNaLcl1U
h9DfiAf/fccSbdTPcf/MR3+HytglBkaO/HlwepPSW582YcQ2/3q5mNX8QDYVAtq5
4LQR5pjemiBDY+lWTqufmKlDBjw8h9NY0L6v/NApr7x+PK1ZUEW2Ecqc6zcZ8LRT
FzBdTQMO00sV3mkJywGQBQGuqyvZrHYNL1RWP0ZDYoRU+27RZn7zOmnNuiA1g8IQ
AoMLzEGkIxhXEF1cmblJ7JuiB1p694k+nltDrbjqc0FsuGMVbfwOG2sTbHYYZJF2
EcaVTqEpCkwmxU2XAY8lgt4SXVO9m26QvgAFqyHSXOvag/H3HaSPNmNPWpUamabu
UWfwTYDmTIOxKFZxy+b7VIfdb/ZWrg==
=igBE
-----END PGP SIGNATURE-----

--ZW7Ag/fXdrbtoky8--

