Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFFBC47073
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSmZLqcH0/qM97IhBlN7snThtbg5181+bo9/6tfsXd4=; b=qXUcU8iUAIdjs3xLd+qnfDT5v0
	y0FC7hCM6hhZszn0zUtl50ootRBvw2FpNEQTBw2sbkRvB4nEBStP6U2kzaoKqOguWcmMDwTLp2CG8
	u3swy1Dxwuy8g0US2mgVzMJM4vEt4T1LcJ+jY1T3S4mqa1op+915P+XxZubeMleCPGLx3MYmZW8ZG
	MeAmEeJmWgW9+KvMgFvBusA+P/CXB3cwkx5ZmmZFHFAE604huHJTLKGaEiVLp9PVnBwpm2PwPs59B
	ApBo34rNUrokRd3tgVmvgXKTODGWoGyWqwrdRCnPxG7x+KUq5Xmk3AJ5mvhym7j1UXNw48tDyxVVZ
	ThjPda3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKlu-00DUO8-2U;
	Thu, 04 Jan 2024 10:16:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKls-00DUNe-1n
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jan 2024 10:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 147C561721;
	Thu,  4 Jan 2024 10:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9E5C433C9;
	Thu,  4 Jan 2024 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704363374;
	bh=trtYVSxi3isFLB8hoN1od6VQLhV5mwb7swOYF748Zew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cz7qsW9MPjKFpA2TZzP/1KGARempp/UvWITzg2RAYw8MT4wP403BJzUU/ZNJw8xVf
	 VJHSEr6A/g4ALLEgSUEK/qeapu0fcHHQ4YQy5ullzVK9kvRy+sz7HeZn0SRaC9EfS6
	 4BAmppw2aCYswJXoWoo4rIjWtPgMqQ3k4CR0tEqyoDBncVXvACyZ4zOcT8XsjkWvkC
	 QjVoOc4k41JiV36M98UZ2VebtYYtJzXgSdHC6zcN7F+qMn/8U6jH0K0un1M4iQfzB/
	 +dvNdU4ADVqrLBE8oE5MjjJYr0gaGJV5IlAu3tZjj1iL2tsPW33liK69rjZgm7lAbl
	 hBBaUrOM1flSQ==
Date: Thu, 4 Jan 2024 11:16:10 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, deren.wu@mediatek.com, Sean.Wang@mediatek.com,
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com,
	robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7925: fix the wrong data type for scan
 command
Message-ID: <ZZaFaim6nK2ZvVgi@lore-desk>
References: <20240104094845.11276-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BeFzi6ePts3aTjGP"
Content-Disposition: inline
In-Reply-To: <20240104094845.11276-1-mingyen.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_021616_662903_DA5A3D7C 
X-CRM114-Status: GOOD (  16.13  )
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


--BeFzi6ePts3aTjGP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 04, Mingyen Hsieh wrote:
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>=20
> For the member of 'struct scan_req_tlv', replace data type of
> func_mask_ext from 'u8' to 'u32'.
>=20
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.h
> index 3c41e21303b1..82b7e277397f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> @@ -208,7 +208,7 @@ struct scan_req_tlv {
>  	__le16 channel_dwell_time; /* channel Dwell interval */
>  	__le16 timeout_value;
>  	__le16 probe_delay_time;
> -	u8 func_mask_ext;
> +	u32 func_mask_ext;

should it be __le32? (even if it is not used yet)

Regards,
Lorenzo

>  };
> =20
>  struct scan_ssid_tlv {
> --=20
> 2.18.0
>=20

--BeFzi6ePts3aTjGP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZZaFagAKCRA6cBh0uS2t
rMWXAP9dzAp5Gzih9wedLKC/AGU0SBlg0TJE6lBprCWHYoWZCQEAvtSNhH+cxsK/
dKSs8G4dOsxJdzMxmOLTJCyQy6jIyAc=
=9/B7
-----END PGP SIGNATURE-----

--BeFzi6ePts3aTjGP--

