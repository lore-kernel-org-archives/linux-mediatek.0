Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552B3C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqiSLvJxdke/yqrf6iYu6+yVJoRzkJ0McEbSIHch4qc=; b=qHR62+VoCV6pNs2wBNBE2hnWf2
	K4ahm4ZN1dtie6UgGFnyysBf/wceqcJklsxUuTR8Cj859DQq48mYhth04wtSpXPmCN1LyqNH2/vOf
	5IAj2nGsRGTcapOVn7mOOgbp7jb9BYafKbyGoNB8r12Aw6rZw9kPVRZnKd3CoU3PJleVM89v3+oUT
	pIS61z+FVtDiyc79iSeOQi77wiXleg5NwQSITKZzXxSKbAlzOtNLSiBtzicveXq3RfOkU/qv78aZY
	OWLi0RRKC4fBZYLxWXmXEZPqlmptk7SxO0/FyDNZfv0ufp8kI75s2DwuAqYQfDrMdtORItJhqHpF7
	ip8jk4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osmcO-00EMhe-7F; Wed, 09 Nov 2022 15:03:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osmcL-00EMg2-L3
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 15:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668006230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zqiSLvJxdke/yqrf6iYu6+yVJoRzkJ0McEbSIHch4qc=;
	b=GZoiw6ORQ6Ki7p3GnFbql+SY/CfBAy4c5M46IVhQdclOGdmdJ3T3mxJwq0NJBKmYVtCMNi
	6l70oBX3RSZIQUsOztuffhuagc9pA+mjgpnaJly8tl4Lp66RAeb3jmvAHw8pvWnlkU4jkk
	s7Vr+ewYBGPGaUKo5NLq6N5ehFXWF0s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-FZ2sqmipMGajLlEdN22aDQ-1; Wed, 09 Nov 2022 10:03:46 -0500
X-MC-Unique: FZ2sqmipMGajLlEdN22aDQ-1
Received: by mail-qt1-f198.google.com with SMTP id fb5-20020a05622a480500b003a525d52abcso12696185qtb.10
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Nov 2022 07:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqiSLvJxdke/yqrf6iYu6+yVJoRzkJ0McEbSIHch4qc=;
        b=4KuFcONzwrekB4cW9yBFKhWre/dx4Jz5ymKCV31wOLEyBTQ7RqZvaNX/FhMDsxtr2T
         tpX82R3xcVBflcC6WDi4mFEiEpe73+MczBOkUOZFKFYnpXsVIf7WPhtWqIk4Mj0JdQsw
         UMGL/e/Tv0ysl05tep1K0hCoPXaXKje8Q20Zg6BYqtPv9GJircDFBfjZ5c3jnbdW3hB6
         i+yZz89tUsJJW4JlGForrt4XP8QQr3xC1kc/FyVDhlThn38zE9ZJrXrI+F2S2X5ZxciN
         CT36rLZQedf4r4p16bxIt8Tclz4jQMIwLuogif5Ld1zS+Ryzm/sZN/Y9IAcMnXpjS0OX
         yflw==
X-Gm-Message-State: ACrzQf1gOGZ0lTbdQImY5gbdg/bKJ2eRl5jEpDnWyRHuqlY9ZGbaLm9r
	oHiTwkorjHb1idGX3WX2aQzrfJfT6VNxl12TjU4GCG3r8FY0Oq6eDPd8aBGbTfnZymPc1zdSoPs
	2cmretMXFEJ2s+MKjyyfCe4y98iwKvVaJ
X-Received: by 2002:a05:620a:1476:b0:6fa:4c67:83ec with SMTP id j22-20020a05620a147600b006fa4c6783ecmr31728034qkl.23.1668006225828;
        Wed, 09 Nov 2022 07:03:45 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5W/7Ofyy9aq2b4znPe4up0GqSbcYRBkArYCCUVmHJGVm6seQcJp68VlQkJ57qQhD7SVx9FuQ==
X-Received: by 2002:a05:620a:1476:b0:6fa:4c67:83ec with SMTP id j22-20020a05620a147600b006fa4c6783ecmr31728001qkl.23.1668006225495;
        Wed, 09 Nov 2022 07:03:45 -0800 (PST)
Received: from localhost ([66.187.232.66])
        by smtp.gmail.com with ESMTPSA id az8-20020a05620a170800b006bb87c4833asm11102303qkb.109.2022.11.09.07.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 07:03:44 -0800 (PST)
Date: Wed, 9 Nov 2022 16:03:40 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com, devicetree@vger.kernel.org,
	robh+dt@kernel.org, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com, kvalo@kernel.org
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
Message-ID: <Y2vBTBUw47sshA+E@localhost.localdomain>
References: <cover.1667687249.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gRH5EQBfd9X8l7db"
Content-Disposition: inline
In-Reply-To: <cover.1667687249.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_070353_809265_2864E3C6 
X-CRM114-Status: GOOD (  20.39  )
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


--gRH5EQBfd9X8l7db
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Similar to TX counterpart available on MT7622 and MT7986, introduce
> RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
> offload traffic received by wlan nic to the wired interfaces (lan/wan).

Hi all,

I noticed today the series state is 'Awaiting Upstream'. I am wondering if
this series is expected to go through a different tree, e.g. wireless one
(adding Kalle in cc). In this particular case the series changes only
the mtk ethernet driver and mt76 is built since we modify a common include =
(but
there are no changes in mt76). My personal opinion is this series is suited=
 to
go through net-next tree but I would be fine even if it goes through Kalle's
one. Any opinions?

Regards,
Lorenzo

>=20
> Changes since v3:
> - remove reset property in ethsys dts node
> - rely on readx_poll_timeout in wo mcu code
> - fix typos
> - move wo-ccif binding in soc folder
> - use reserved-memory for wo-dlm
> - improve wo-ccif binding
>=20
> Changes since v2:
> - rely on of_reserved_mem APIs in mcu code
> - add some dts fixes
> - rename {tx,rx}_wdma in {rx,tx}_wdma
> - update entry in maintainers file
>=20
> Changes since v1:
> - fix sparse warnings
> - rely on memory-region property in mt7622-wed.yaml
> - some more binding fixes
>=20
> Lorenzo Bianconi (7):
>   arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet
>     Dispatch
>   dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
>   net: ethernet: mtk_wed: introduce wed wo support
>   net: ethernet: mtk_wed: rename tx_wdma array in rx_wdma
>   net: ethernet: mtk_wed: add configure wed wo support
>   net: ethernet: mtk_wed: add rx mib counters
>   MAINTAINERS: update MEDIATEK ETHERNET entry
>=20
> Sujuan Chen (1):
>   net: ethernet: mtk_wed: introduce wed mcu support
>=20
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     |  52 ++
>  .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml |  51 ++
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  65 ++
>  drivers/net/ethernet/mediatek/Makefile        |   2 +-
>  drivers/net/ethernet/mediatek/mtk_wed.c       | 619 ++++++++++++++++--
>  drivers/net/ethernet/mediatek/mtk_wed.h       |  21 +
>  .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  87 +++
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c   | 387 +++++++++++
>  drivers/net/ethernet/mediatek/mtk_wed_regs.h  | 129 +++-
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 508 ++++++++++++++
>  drivers/net/ethernet/mediatek/mtk_wed_wo.h    | 282 ++++++++
>  include/linux/soc/mediatek/mtk_wed.h          | 106 ++-
>  13 files changed, 2256 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediat=
ek,mt7986-wo-ccif.yaml
>  create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_mcu.c
>  create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.c
>  create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.h
>=20
> --=20
> 2.38.1
>=20

--gRH5EQBfd9X8l7db
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2vBSQAKCRA6cBh0uS2t
rPcgAP9PAG0essRbeHBLaiZaGlJXLeM6J4qukctGB9+r/1Ix1QEA8bLkD/GDnBc4
J4EU5i4C57QJ7m+WDzf/nKWJReThFg0=
=jPqc
-----END PGP SIGNATURE-----

--gRH5EQBfd9X8l7db--


