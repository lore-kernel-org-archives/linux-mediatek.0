Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D43EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgFaYnJSA1QyodCVn3a08LDHfBJI4VMBJBEfAWdyNNo=; b=fcacPJdXRMVus+ND0KHuPz6p6F
	w30YGfs1QKYRt6x9lICkZVfXoRqU3El1KYYlR6zN7TdEZMxRxL7rHsqWpoflDwaTNavqdtoHTnotW
	BKHjsTryfBkcXphCe/bywIBkADbGszVXX1TYDU1iQg1A+TNobV3EClGf0j/6mYCs9uTunruUfqi80
	4Sil7iE1ujy9P3gKT/5TTTP2H+fHzu+rucacimCeT0+36i5yJEQHGXY74eTwCRlNEWGf/4ZheD6Vq
	WqpJuYoK/NLWWLgAwMuRyJyKoHNLJejo3ETwkGx475HR9fkcRvQG9yrUGiOdc8OxVV/JqaFyYJiGE
	vYqIbBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIXK2-007fgJ-KS; Fri, 11 Feb 2022 14:54:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIXJq-007fcw-Ie; Fri, 11 Feb 2022 14:54:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E973B82A77;
 Fri, 11 Feb 2022 14:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9778FC340E9;
 Fri, 11 Feb 2022 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644591280;
 bh=bxAUhKGpof08/VSFAF/LODZ1CrGcjJunAUPVk+bKa1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2yhIiXOQJRaIajP29LJOZGHUZ49NqmL5XSbf84yvJD0Cw2RNDpIGCzeh6pq/cxqX
 uMjolHWJhWpBzvViLbTxleRtgSRANAN1ctsOwk806VP+3Sx/GqaykpD6jf5dDFbQGD
 HJWdgA3AanLR6avnq77f2sQ8yMIizJCJW4CsjxGC+pF/oVUJ8aUS835nn5eyix7gsf
 FIRqJFZtb/mfdN1fgHqd9D6ovpuzZbhGfFejkRBvi0WBh7FkoqCRHRoLGDtw+hhfgR
 Hpa9+82grgIKShn00SCZvCnsCpRVfHQ2hBBiwrKffa++rXwr7RuAv4SakvArbBEnR2
 thCnb2uM5iDFQ==
Date: Fri, 11 Feb 2022 14:54:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH 01/15] ASoC: mediatek: mt6366: add codec driver
Message-ID: <YgZ4qdYWeAutC2Jo@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220211103818.8266-2-jiaxin.yu@mediatek.com>
X-Cookie: do {
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_065442_779724_4A2C8D9B 
X-CRM114-Status: GOOD (  13.38  )
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
Content-Type: multipart/mixed; boundary="===============1356111801838757590=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1356111801838757590==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QlW9pqOvflC+sGV2"
Content-Disposition: inline


--QlW9pqOvflC+sGV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:04PM +0800, Jiaxin Yu wrote:

> Mt6366 is a new version of mt6358, and they are same about audio part.
> So we can reuse the driver of mt6358.

>  snd-soc-mt6359-accdet-objs := mt6359-accdet.o
> +snd-soc-mt6366-objs := mt6358.o
>  snd-soc-mt6660-objs := mt6660.o
>  snd-soc-nau8315-objs := nau8315.o
>  snd-soc-nau8540-objs := nau8540.o
> @@ -465,6 +466,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
>  obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
>  obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
>  obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
> +obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6366.o

Why build a separate module here?  That'll just make the binary larger
but not otherwise do anything.  Usually we'd just add a new ID to the
existing driver.

--QlW9pqOvflC+sGV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGeKgACgkQJNaLcl1U
h9DIMwf+Pw2HnVc26RpFgDOHvR1H5BYRLyHgSJCd6JQpE2TKhMORPogTaAy1fbkv
Z5OLAx1KFg8nMeSJuCXzny8VmMmY+MLyp4c8kuIdowe+ClR9PrF0XkA+IOLy/eLJ
GF6OxinUeozGJ2rjC58quKQ0cW187ZimFRHTnD7oMDvFI8o9utLHA1Uu7/qQEHDC
J7jBMlvxGdd+rXgKTC7qcL2tFsoUT4VXcTugl3snvv6NqoKw+oAbDKzDKCCfBJRh
nWFWTgMaFIF2GLUoWUP2Z/s42wATKLOBpA0HrwxK8dAx3Q7rvLNLROLlr7efJ9Ou
DXPbM6WV2+luGql1tBWKti715JibHQ==
=+wGZ
-----END PGP SIGNATURE-----

--QlW9pqOvflC+sGV2--


--===============1356111801838757590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1356111801838757590==--

