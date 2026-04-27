Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C08DFF8862
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UpfWzzlS+wWtg5CRsO2Vrz/eOat72hB7FM8+ABI9aw=; b=zSouQ0j/aXtcMgizh8fHk7MyF9
	miapZzzXRmHo+c+FX9AcDRvDuUX+bBy30Rsm8QmT31mS7b+O95UvKliYwEHwBfFYw7/PburbQ8NNO
	fObCc97azLT7qJrFs1oPvhlSep8B+tpF0Z6FtdWwsUbHGT9dEtAARoyTr29RtuwVBpW7xsK+iSOQu
	YRayaT9nomWOMQnAnMQ4G4i1oPLNYr3y9GGLmdcLjeXwxMY47gKGgUKtyXeMaZ3xNSQ+/Hls7eOmK
	RYMXvcIzikBrMy0DbERLKHFsUXbdDVMVrRHAdw3eD/kIZSFtrTN30MC/dySFqoD0TnuVoYPbRbTTr
	sfVYS+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFxP-0000000GJyy-4B71;
	Mon, 27 Apr 2026 07:00:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFxJ-0000000GJyS-3u7y;
	Mon, 27 Apr 2026 07:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEA2144361;
	Mon, 27 Apr 2026 07:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A383C2BCB8;
	Mon, 27 Apr 2026 07:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777273232;
	bh=hscgZXrH/5hlVlI4joz/OwlsC/ItzGkqY+r3g/tMh6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/UO8nr5TQ7PliWjUKlAZqvmtgQU+FEMkbRmmSgrIX7+9ZgK/HIdX4NYWVZ4rngKw
	 PLBQ0/wMFxTjBXytc8sMx2PcAaIJUCNUNus9UpAS0DhvvpIolB2CfnSbt8y6g3u783
	 4e6eNxqixT4kTNhHFlxBIuqeVX3NZhfdHxj4Z+nudtcjnondSnBuoupFAF3EdjoALF
	 56TK9X9uH+Uv7gDR6L3FJ17myhK+nPEb2Xzx7pPVYCMqiKLog4QTEgJPM54KXGoI5h
	 b0RP6hj3HJCTnvpSJs4bTwtNGexQKcRoLqkpcafByY/22j7sIulWa9Q1ER6iZY0/q5
	 ceI/MVWjDbmJw==
Date: Mon, 27 Apr 2026 09:00:30 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error
 handling
Message-ID: <ae8JjhGXn4RmHSF1@lore-desk>
References: <20260427051746.954704-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VmDJMRbZHv0Lzy9p"
Content-Disposition: inline
In-Reply-To: <20260427051746.954704-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_000033_999939_04E750B9 
X-CRM114-Status: GOOD (  14.49  )
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


--VmDJMRbZHv0Lzy9p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Check return value instead of is_valid_ether_addr. The latter is handled
> by the former.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wi=
reless/mediatek/mt76/eeprom.c
> index 93d91264687f..0f6ccf6ed53d 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err =3D=3D -EPROBE_DEFER)
>  		return err;
> =20
> -	if (!is_valid_ether_addr(phy->macaddr)) {
> +	if (err) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",
> --=20
> 2.54.0
>=20

--VmDJMRbZHv0Lzy9p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCae8JjgAKCRA6cBh0uS2t
rBXWAP9XbNiVEDpyQr3wYwK6yy95P7sLbl7oGeiTS3olm3X2sQEAn6TCQaIm/1uu
vNVMiJbIVrmUHHeTG560ExFWwjBmTQQ=
=lAlv
-----END PGP SIGNATURE-----

--VmDJMRbZHv0Lzy9p--

