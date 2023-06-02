Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6928CC7EE29
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYtXDg1vJF1esslh5Nteg3t46zB00VJx6u1oSpQyx+0=; b=WAl8chaiZoUiOEksyuQvrGppR2
	DISoCCLkEQRV1XZanl7xavLfXemT9Nez+o9QMjQmWSh0l9rojixHOOK7kbIgll8oFDr51zIzJXVd6
	Txx41NOx52ft+OAVRhatTnzlFOu5j0bD25Thiw+syvRaXudtdleXf2iIcD4o2kA6eJj81mt8yO3Vc
	KR37PP2YuiEGuU1QCf173UxJl5+Jgv3RDLrEBFAiWTnXOPXsXSr2F6tdAlMNDBDppA/UVy3jIzzqG
	5QREl3jzm8HiLfPuAsnDTdlbad3puZzYvOhITrV9dJaNlfxgeceuD5RgoiPTqqsBbvOQVfLoSrEGX
	8LhPcSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q591p-007aRF-19;
	Fri, 02 Jun 2023 17:57:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q591m-007aQh-2Q
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 17:57:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2954060F15;
	Fri,  2 Jun 2023 17:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE93C4339B;
	Fri,  2 Jun 2023 17:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685728649;
	bh=mvN5M0iGqD7SXXGwWWLrqk3W79voWGsffhlUFGaufC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onYFmJogHGFmh+csAtb2E17lDMAY74JSS8/d7doKguBUbNsCFdoPwe/mPD4F+0MRt
	 66o0yNKzN6cu4dwcGdjXrV8hc8CfTF1XLQMjz2qsjBivKMEA8tu4C/0RFZEBD79p5O
	 8m2ujeCGUjNTVzfYZeL11cZA1C//j+iQ0ab3Wn15kvQwq4D2KmpTPAm5yAv/cbpEbg
	 2sAn1bMTLGTptuAKzT/nctNKA4okVJXRe0yhtQsF1F4fj96IV9VhyOYPoz+Fxa4VLm
	 rTbgT/6jqR+vIjwEj2EPn7e7RXEPz+MIXSrnyzPX9htMf+tHDskKP8dVw37iNnHMzX
	 dmLqLHNjGxTAw==
Date: Fri, 2 Jun 2023 19:57:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH 07/12] wifi: mt76: connac: add a new bss_info tag for
 setting ifs time
Message-ID: <ZHothb9YzTAUcKz+@lore-desk>
References: <20230602152108.26860-1-shayne.chen@mediatek.com>
 <20230602152108.26860-7-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YvpdQ4zsZ5JQlJO5"
Content-Disposition: inline
In-Reply-To: <20230602152108.26860-7-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_105730_847430_68095B97 
X-CRM114-Status: GOOD (  14.65  )
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


--YvpdQ4zsZ5JQlJO5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Peter Chiu <chui-hao.chiu@mediatek.com>
>=20
> Add a new bss_info tag id UNI_BSS_INFO_IFS_TIME. This is used for
> setting IFS time by mcu command.
>=20
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index 4a21c237ea6e..3790d68525e5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1288,6 +1288,7 @@ enum {
>  	UNI_BSS_INFO_UAPSD =3D 19,
>  	UNI_BSS_INFO_PS =3D 21,
>  	UNI_BSS_INFO_BCNFT =3D 22,
> +	UNI_BSS_INFO_IFS_TIME =3D 23,
>  	UNI_BSS_INFO_OFFLOAD =3D 25,
>  	UNI_BSS_INFO_MLD =3D 26,

same here, this patch can be merged with 8/12.

Regards,
Lorenzo

>  };
> --=20
> 2.39.2
>=20

--YvpdQ4zsZ5JQlJO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZHothQAKCRA6cBh0uS2t
rDtPAP4ouJrh0cFPM8L52UtVpfHvIYXcF8lsYmeK1VuCj4u2ewEA2GKHK9VLMJC1
p56s+EnJXrXSLbNf7gln3UBxRjT9Aw4=
=mAYh
-----END PGP SIGNATURE-----

--YvpdQ4zsZ5JQlJO5--

