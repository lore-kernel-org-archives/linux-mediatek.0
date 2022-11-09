Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721FAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07B+ipuUGPa1oSrg0ssDpz9XSSuA65btwItkypaE/xw=; b=vW6qij5s3+lOX15OOV0/ABbHW5
	37DIzkesCm5Y6JJrVJ8eZSm5Zq94TN0U/241Ev66qVFme/HevbwHKsDAt7jO//DDNLuOdIHZhPLWe
	UwQML0h9rsNclaE9yGbgoz3sROS4N4F7VHwaT3K/F/gjSNTc/pOdgPzA3aWw3y/kXBKjKpEDfoljN
	gP07ifFXM3IRPLzugn6e3hNIdDqgkzc7K+TueeIuAEawuLU7Zi2xtXITcbVBv4HWsixcp9o3fyqlw
	3/BX8uRl7p+q4fOAop8armq0fqR3W078bpgGfFRPXR+iJ62sBpIgk19QkVlS0KEHoCaeXzRJ5Q94/
	yn56/YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjoK-00DL3C-Ug; Wed, 09 Nov 2022 12:04:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjoH-00DL1k-GL
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 12:04:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A4B0B81DD7;
	Wed,  9 Nov 2022 12:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF823C433C1;
	Wed,  9 Nov 2022 12:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667995434;
	bh=NJ5GVcvGeMR/bawxbaeebqLkYeMabe8bNBhIIG7od8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGPowr6k0l3Uh6VRLu4qXFdovu90YOb0M7cXRFg7nOZTbW2zshBedhLR6Aojse7LK
	 juwDK0aXlpMq4I5+RYm0a8yfGF5ViB/xGQZxT4ll8DnmkdCuhj1Yg9Jo1hxtEyZjrv
	 COV+u8D/WypzWy9Cjk69ZzAfEF6UbVs6OOGHDQO37apBfpZqE3vkJMdFwPswRcvb79
	 Dpf0yuA/X587wCwhYlsjYijk9Fdw9/SlCFIw+t6mFeGozw4woM1l2OemkimnGX8bok
	 Low4/WcAiwypBTnIx9zf83Pk+Y83JdsjbQJQRGlYSoWbqASEY3y11Mf5Of53H1YYwY
	 mThMixSm0aQvw==
Date: Wed, 9 Nov 2022 13:03:50 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 08/10] wifi: mt76: connac: add more starec command tags
Message-ID: <Y2uXJh5rFm9uocvz@localhost.localdomain>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
 <20221031164000.17063-9-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gT3vqYmmKO2wHLuj"
Content-Disposition: inline
In-Reply-To: <20221031164000.17063-9-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_040401_758252_65F7B009 
X-CRM114-Status: GOOD (  14.81  )
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


--gT3vqYmmKO2wHLuj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add starec tags which will be used in new chipset.
> This is a preliminary patch to add mt7996 chipset support.
>=20
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index ed1d24822c37..336c20fcc8dc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -791,6 +791,8 @@ enum {
>  	STA_REC_PHY =3D 0x15,
>  	STA_REC_HE_6G =3D 0x17,
>  	STA_REC_HE_V2 =3D 0x19,
> +	STA_REC_HDRT =3D 0x28,
> +	STA_REC_HDR_TRANS =3D 0x2B,
>  	STA_REC_MAX_NUM
>  };

I guess this patch does not apply cleanly.

Regards,
Lorenzo

> =20
> --=20
> 2.25.1
>=20

--gT3vqYmmKO2wHLuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2uXIgAKCRA6cBh0uS2t
rIDMAPsE3oby14vVQSHX2fTS4hhlkEtnCaTSTymIorjldcYNtQD/WadNMgazZTTg
KV5JGHuWZzPzgbCa49tzU5mBIP3NvQA=
=wk8x
-----END PGP SIGNATURE-----

--gT3vqYmmKO2wHLuj--

