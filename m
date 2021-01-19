Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42076C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 09:37:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C399223137
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 09:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C399223137
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=daesdSTsWNhS8dustmpAgTQAJvVvqDnFUGlqum5XXgk=; b=3hg0v4FTc9mSBsNqxjlCY0KMj
	5K1d3EcYxKSpgdfkIcRimUrM8pmSpAsFEzvtRZRbytRFwE1wugH+s4OywakU8HGS6f6j8o6AgPoPG
	RBQ+McQWdWo2uwg2pmJSEIyG0sVbfFTDJRzHtQgjSFnUPNlVvAUgBJff65VMGJNi/UFRCd+BhNwDZ
	5Zc/9wgwGlOfK6r+l8jeyFMepnscu/bUypGqCRnd06O/6EvWuLkgJs27IeV+MVQBI+B7YhyrPEcVf
	xggIOC1mFEA5Ti55g1fGBt+9mOyTW3lNDhR3qdNB3o53p1+Vis6BWF/gKMswGQ9/LtHj5ROUHEaRn
	KMxRPuYUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1nS9-0000on-RA; Tue, 19 Jan 2021 09:37:33 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1nS4-0000oH-Rj; Tue, 19 Jan 2021 09:37:29 +0000
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 807B6C0015;
 Tue, 19 Jan 2021 09:37:25 +0000 (UTC)
Date: Tue, 19 Jan 2021 10:37:25 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 06/33] of/device: Move dma_range_map before
 of_iommu_configure
Message-ID: <YAaoVTlCjriJt+iY@aptenodytes>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-7-yong.wu@mediatek.com>
 <20210114192732.GA3401278@robh.at.kernel.org>
 <1610688626.4578.1.camel@mhfsdcap03>
 <1853732d-0efd-171e-9e1f-7ee7ed72a98f@arm.com>
 <1611048011.14702.6.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1611048011.14702.6.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_043729_089875_76EF64ED 
X-CRM114-Status: GOOD (  32.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, Rob Herring <robh@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Evan Green <evgreen@chromium.org>,
 linux-kernel@vger.kernel.org, chao.hao@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0017743568132470437=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0017743568132470437==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZpZRInV+koQDOukd"
Content-Disposition: inline


--ZpZRInV+koQDOukd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 19 Jan 21, 17:20, Yong Wu wrote:
> On Mon, 2021-01-18 at 15:49 +0000, Robin Murphy wrote:
> > On 2021-01-15 05:30, Yong Wu wrote:
> > > On Thu, 2021-01-14 at 13:27 -0600, Rob Herring wrote:
> > >> On Mon, Jan 11, 2021 at 07:18:47PM +0800, Yong Wu wrote:
> > >>> "dev->dma_range_map" contains the devices' dma_ranges information,
> > >>> This patch moves dma_range_map before of_iommu_configure. The iommu
> > >>> driver may need to know the dma_address requirements of its iommu
> > >>> consumer devices.
> > >>>
> > >>> CC: Rob Herring <robh+dt@kernel.org>
> > >>> CC: Frank Rowand <frowand.list@gmail.com>
> > >>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > >>> ---
> > >>>   drivers/of/device.c | 3 ++-
> > >>>   1 file changed, 2 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/of/device.c b/drivers/of/device.c
> > >>> index aedfaaafd3e7..1d84636149df 100644
> > >>> --- a/drivers/of/device.c
> > >>> +++ b/drivers/of/device.c
> > >>> @@ -170,9 +170,11 @@ int of_dma_configure_id(struct device *dev, st=
ruct device_node *np,
> > >>>   	dev_dbg(dev, "device is%sdma coherent\n",
> > >>>   		coherent ? " " : " not ");
> > >>>  =20
> > >>> +	dev->dma_range_map =3D map;
> > >>>   	iommu =3D of_iommu_configure(dev, np, id);
> > >>>   	if (PTR_ERR(iommu) =3D=3D -EPROBE_DEFER) {
> > >>>   		kfree(map);
> > >>> +		dev->dma_range_map =3D NULL;
> > >>
> > >> Not really going to matter, but you should probably clear dma_range_=
map
> > >> before what it points to is freed.
> > >>
> > >> With that,
> > >>
> > >> Reviewed-by: Rob Herring <robh@kernel.org>
> > >=20
> > > Thanks for the review. I will move it before "kfree(map)" in next
> > > version.
> >=20
> > Paul noticed that we already have a bug in assigning to this=20
> > unconditionally[1] - I'd totally forgotten about this series when I=20
> > theorised about IOMMU drivers wanting the information earlier, but=20
> > sweeping my inbox now only goes to show I was right to think of it :)
> >=20
> > We should really get something in as a fix independent of this series,=
=20
> > taking both angles into account.
>=20
> Thanks this info. Following your suggestion, Move this into the "if (!
> ret)". Then it is like this:

Thanks for preparing the change :)

>=20
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -163,8 +163,10 @@ int of_dma_configure_id(struct device *dev, struct
> device_node *np,
>  	dev->coherent_dma_mask &=3D mask;
>  	*dev->dma_mask &=3D mask;
>  	/* ...but only set bus limit if we found valid dma-ranges earlier */

Maybe the comment would need some update too, like:
/* ...but only set bus limit and map if we found valid dma-ranges earlier */

> -	if (!ret)
> +	if (!ret) {
>  		dev->bus_dma_limit =3D end;
> +		dev->dma_range_map =3D map;
> +	}
> =20
>  	coherent =3D of_dma_is_coherent(np);
>  	dev_dbg(dev, "device is%sdma coherent\n",
> @@ -172,6 +174,8 @@ int of_dma_configure_id(struct device *dev, struct
> device_node *np,
> =20
>  	iommu =3D of_iommu_configure(dev, np, id);
>  	if (PTR_ERR(iommu) =3D=3D -EPROBE_DEFER) {

And maybe one here, something like:
/* don't touch range map if it wasn't set from a valid dma-ranges */

> +		if (!ret)
> +			dev->dma_range_map =3D NULL;
>  		kfree(map);
>  		return -EPROBE_DEFER;
>  	}
> @@ -181,7 +185,6 @@ int of_dma_configure_id(struct device *dev, struct
> device_node *np,
> =20
>  	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> =20
> -	dev->dma_range_map =3D map;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
>=20
>=20
> If this is ok, I will send this as a independent patch.

With the suggested changes, this looks good to me!

Thanks,

Paul

> >=20
> > Robin.
> >=20
> > [1]=20
> > https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be097c=
7ceb32@arm.com/
> >=20
> > >>
> > >>>   		return -EPROBE_DEFER;
> > >>>   	}
> > >>>  =20
> > >>> @@ -181,7 +183,6 @@ int of_dma_configure_id(struct device *dev, str=
uct device_node *np,
> > >>>  =20
> > >>>   	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> > >>>  =20
> > >>> -	dev->dma_range_map =3D map;
> > >>>   	return 0;
> > >>>   }
> > >>>   EXPORT_SYMBOL_GPL(of_dma_configure_id);
> > >>> --=20
> > >>> 2.18.0
> > >>>
> > >=20
> > > _______________________________________________
> > > iommu mailing list
> > > iommu@lists.linux-foundation.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> > >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ZpZRInV+koQDOukd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmAGqFQACgkQ3cLmz3+f
v9E3gwf8CT7hHXO41OxQvi2MFcgYFzwhZZyobCae68dTmEbC4OQjOxfwex0hT0Fc
fSqWrI33YU977JQ5MA+ZDZKJ9LenssabEikucOUfCCaiTxjy+EK7Sn83ub51okw+
IHa+n83H1G5nwTHPP1fn40z97Lyvk9wgOGRGtkqOuzADCoQ1ouQ6j0m+/nN0xJme
ORP/0J4qvKaZJznz7yDSPNP6QQ4UHXmg8e9CU9Oo9L6IaqH75jOJ0EtZDTrvqetL
Y2AzrZSrGESdcqXGAgO0sPICDorDbvP9dFGTsCeZwuM2lpCyWFRhE4sCQAA86NtG
JsLC4pzVbtkIepjP8eXSMmJf93G32g==
=pOip
-----END PGP SIGNATURE-----

--ZpZRInV+koQDOukd--


--===============0017743568132470437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0017743568132470437==--

