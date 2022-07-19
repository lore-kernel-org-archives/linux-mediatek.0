Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC93C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OazogUGaTCAKTxUDesSa7xd7vVnLXoIUVapwa9DLQ2s=; b=jzDpRxn+o+V/jNgA4ZUBdnJkgZ
	4kvSHastEsgXSy3jhUMEb/b73bOqrAg2ixw/UCVQIoH9muI0cuRFloRXdoy+CzkCV7pybNIAD1wMD
	ywo5FhO8RCZllCX63fdZBqMkVsG3BcNvBvbyPUql8suQQ8zx3v22OUrHAMCwwbOsDdmKS3hgikzg1
	PWSeBOjucg6Mb2rseHsLWDgCCbpQfRgto1yhB0so2NLMpW5ng/5cVHRFKlRTsKV73EX66iFFJDGx6
	m/e3fw2luQ/XLtqj8VIpfvtad8aG9MJsOSGiKV/KBl38DCsCLzNjKhNgiAIXVOxy40lRN4/Td//Ps
	HFaI1Tfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnoH-009TJq-6C; Tue, 19 Jul 2022 14:02:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnoE-009THz-UQ
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 14:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658239365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OazogUGaTCAKTxUDesSa7xd7vVnLXoIUVapwa9DLQ2s=;
	b=RJ1iTTa428S8m67jOfziGRp0FyZHOquJTVT31FVxDwIb9DcrJgceMCsPkgbAqot7YvGnJ5
	cMKHpcBAgPYM4SeWltWFGu+wFyUGuqKXs27tFXRpcgh+/GvRO+pcvl56hiY2i6i2Rx2K88
	+A0UlbwamQmyjJlYaqnO/sTlkOxBjZc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-dM89ZfiNP2OuaQG8ZNUNVw-1; Tue, 19 Jul 2022 10:02:43 -0400
X-MC-Unique: dM89ZfiNP2OuaQG8ZNUNVw-1
Received: by mail-wm1-f70.google.com with SMTP id c126-20020a1c3584000000b003a02fa133ceso6845253wma.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 07:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OazogUGaTCAKTxUDesSa7xd7vVnLXoIUVapwa9DLQ2s=;
        b=FFVKQ6i+fLKfWVxvvy7wkD1nDotpQAIqLAyqMetoyuNURJCR5lVYQOaQlyr34Sz3ia
         B5t0zFoH6OTFksVJm/n8aPplQHjlsSQM3oWhkVR2K8RzkbuFodLQVxu5E7pv27y5QmE1
         umfwBDQnlZD2QAYlKUZVbD4Rd70ah2c1fmXoCp5AJ39HUypyMvja7pFC/+AuhvR0OmdT
         6zVVB6/bxCvhjrFLCe0kfuHhbjrnVCOHEFEMc5UYYKn5EedDXxbs80kC0Rq4FAyOc2Zo
         RStfEtQNSo7AAA9cwxkj3vRUs5sRvPwju+M7RaqdDUSYsD1tmmBCV3NXQht4LTPJKIHF
         Rn/w==
X-Gm-Message-State: AJIora+OpAp8sda2MZvwYWvOVvCvW66N9fpWJ9HCSTWtddIM+L5AJTZJ
	zLRCYS6+4JVIiYfX+8XOkP0qFvXBQoo8eIg/imx3HPoNauhqcwjZyRGPKh05LnPHF9DIk+kQcWQ
	vANFNS8MHS1yV0XSinRUoipAn6OeNCsFQ
X-Received: by 2002:a7b:cd15:0:b0:3a3:1d69:5201 with SMTP id f21-20020a7bcd15000000b003a31d695201mr7195529wmj.10.1658239362493;
        Tue, 19 Jul 2022 07:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tDezm8A92mTd+muf5BeHpRsDPK7Fgy5dwBdOS7SZtDj/NGlv5bszF4tZKQLWnulPN2pQwHPA==
X-Received: by 2002:a7b:cd15:0:b0:3a3:1d69:5201 with SMTP id f21-20020a7bcd15000000b003a31d695201mr7195489wmj.10.1658239362223;
        Tue, 19 Jul 2022 07:02:42 -0700 (PDT)
Received: from localhost (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.gmail.com with ESMTPSA id m9-20020adfe949000000b0021d4694fcaesm13424818wrn.107.2022.07.19.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 07:02:41 -0700 (PDT)
Date: Tue, 19 Jul 2022 16:02:38 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, ilias.apalodimas@linaro.org,
	jbrouer@redhat.com
Subject: Re: [PATCH v3 net-next 5/5] net: ethernet: mtk_eth_soc: add support
 for page_pool_get_stats
Message-ID: <Yta5fsw0U6KWMmTL@localhost.localdomain>
References: <cover.1657956652.git.lorenzo@kernel.org>
 <8592ada26b28995d038ef67f15c145b6cebf4165.1657956652.git.lorenzo@kernel.org>
 <43ff0071f0ce4b958f27427acebcf2c6ace52ba0.camel@redhat.com>
 <YtaE/KJDNOqkvLml@localhost.localdomain>
 <d432c897a8eef451bdd65cfdf5b1da0d866a9a5b.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5EMNoz+9F+nqgqFZ"
Content-Disposition: inline
In-Reply-To: <d432c897a8eef451bdd65cfdf5b1da0d866a9a5b.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_070247_077914_59B2AEA8 
X-CRM114-Status: GOOD (  34.17  )
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


--5EMNoz+9F+nqgqFZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 2022-07-19 at 12:18 +0200, Lorenzo Bianconi wrote:
> > > On Sat, 2022-07-16 at 09:34 +0200, Lorenzo Bianconi wrote:
> > > > Introduce support for the page_pool stats API into mtk_eth_soc
> > > > driver.
> > > > Report page_pool stats through ethtool.
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > > =A0drivers/net/ethernet/mediatek/Kconfig       |  1 +
> > > > =A0drivers/net/ethernet/mediatek/mtk_eth_soc.c | 40
> > > > +++++++++++++++++++--
> > > > =A02 files changed, 38 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/net/ethernet/mediatek/Kconfig
> > > > b/drivers/net/ethernet/mediatek/Kconfig
> > > > index d2422c7b31b0..97374fb3ee79 100644
> > > > --- a/drivers/net/ethernet/mediatek/Kconfig
> > > > +++ b/drivers/net/ethernet/mediatek/Kconfig
> > > > @@ -18,6 +18,7 @@ config NET_MEDIATEK_SOC
> > > > =A0	select PHYLINK
> > > > =A0	select DIMLIB
> > > > =A0	select PAGE_POOL
> > > > +	select PAGE_POOL_STATS
> > > > =A0	help
> > > > =A0	  This driver supports the gigabit ethernet MACs in the
> > > > =A0	  MediaTek SoC family.
> > > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > > b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > > index abb8bc281015..eba95a86086d 100644
> > > > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > > @@ -3517,11 +3517,19 @@ static void mtk_get_strings(struct
> > > > net_device *dev, u32 stringset, u8 *data)
> > > > =A0	int i;
> > > > =A0
> > > > =A0	switch (stringset) {
> > > > -	case ETH_SS_STATS:
> > > > +	case ETH_SS_STATS: {
> > > > +		struct mtk_mac *mac =3D netdev_priv(dev);
> > > > +		struct mtk_eth *eth =3D mac->hw;
> > > > +
> > > > =A0		for (i =3D 0; i < ARRAY_SIZE(mtk_ethtool_stats);
> > > > i++) {
> > > > =A0			memcpy(data, mtk_ethtool_stats[i].str,
> > > > ETH_GSTRING_LEN);
> > > > =A0			data +=3D ETH_GSTRING_LEN;
> > > > =A0		}
> > > > +		if (!eth->hwlro)
> > >=20
> > > I see the page_pool is enabled if and only if !hwlro, but I think
> > > it
> > > would be more clear if you explicitly check for page_pool here (and
> > > in
> > > a few other places below), so that if the condition to enable
> > > page_pool
> > > someday will change, this code will still be fine.
> >=20
> > Hi Paolo,
> >=20
> > page_pool pointer is defined in mtk_rx_ring structure, so
> > theoretically we can have a
> > page_pool defined for queue 0 but not for queues {1, 2, 3}.
>=20
> I see. I missed hwlro is a per device setting.
>=20
> > "!eth->hwlro" means
> > there is at least one page_pool allocated. Do you prefer to do
> > something like:
> >=20
> > bool mtk_is_pp_enabled(struct mtk_eth *eth)
> > {
>=20
> > 	for (i =3D 0; i < ARRAY_SIZE(eth->rx_ring); i++) {
> > 		struct mtk_rx_ring *ring =3D &eth->rx_ring[i];
> >=20
> > 		if (ring->page_pool)
> > 			return true;
> > 	}
> > 	return false;
> > }
>=20
> Even:
>=20
> bool mtk_is_pp_enabled(struct mtk_eth *eth)
> {
> 	return !eth->hwlro;
> }
>=20
> will suffice to encaspulate the logic behind page pool enabling in a
> single place.

ack, I am fine with it. I will fix in v4.

Regards,
Lorenzo

>=20
> /P
>=20

--5EMNoz+9F+nqgqFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYta5ewAKCRA6cBh0uS2t
rKuZAQCoCiT1JxTElHC3iJAa4jRFWpzrzUrdHO0YZcFySGakagEAnfzhbDRFauBQ
FtsqE623N2etCj2VpVdGQz7s7LXAUAQ=
=RmXr
-----END PGP SIGNATURE-----

--5EMNoz+9F+nqgqFZ--


