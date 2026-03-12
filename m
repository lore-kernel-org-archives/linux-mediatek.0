Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2D7FED2FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ees3+k2H3luRMt2jSEe7WhAYjQxr9l/XUiK3ssTu20Q=; b=oN5Zzg6z5NGyd6oMEOCHq2wBd/
	OJiTPVLTMPRAa7Fd0s257XqteqHhx4o8PQlCJLvvhV6eRvI8t2UvS3ffsx/JqonPhlcNW/4K7Oz4b
	ybiuRuwz9RX05DqfsKYHJxwpKJq9E0QSSyU8aqps1viIaSL9axkqWXKV8wi043iTOqX23I3YTj403
	9JLLgaXYe1k3EZTrj6pO5tYZ9YJ0cdgzM5BBWBy5Us5EcVEWx8knWdnArLsdDAU4IsaazTHOrQ2QN
	dRX4uho57ThRdXtzj6dTNoLjP4MlWjclOQc5Jh9KJenmNAMksOmtaCM1m3Dxj0lFBiKq9X1emQcTv
	t5OqZvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dVi-0000000Dt49-3X0i;
	Thu, 12 Mar 2026 10:43:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dVf-0000000Dt3N-1AeU
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 10:43:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBABA40C2B;
	Thu, 12 Mar 2026 10:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D22C4CEF7;
	Thu, 12 Mar 2026 10:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773312198;
	bh=eNNwljuKwZpQJe7RmPn+/KLEEdwoQq78oBULF+I5elc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wy+3RA64Z/zlQx9gOyRPs2OlYPKVDtgOmVzRs+mLaTOF/kzqQWqeZmB2ftMQeyz7Z
	 wK3SB2CjJVx9JtOi4Prp2UHScPmtJw356ycocviIMBqxPdr6wE8QwOHIRuhSzeVWTp
	 9udzzDwFEAqeKOPrr/sN1zyfVj2v3wSMv5lr6HB6jguxH8jk4gIDkbD3eekta9a04h
	 3Lmp7WKLmh3R4MoL0mstFnAEYowjEi67dTJcyG+Ce9Gthg0DhGkem3cbnMVus0XkJf
	 iTpYrv4JMZMaCyb822wjgW4gIb6rNVwdzb6fVSIYld8+mSYvc9NLSvtbc+Wnupykf4
	 TiRe6BapeYSrg==
Date: Thu, 12 Mar 2026 11:43:16 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Rex Lu <rex.lu@mediatek.com>
Subject: Re: [PATCH mt76 4/6] wifi: mt76: mt7996: adjust timeout value for
 boot-up calibration commands
Message-ID: <abKYxPItJrrIcODc@lore-desk>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
 <20260312095724.2117448-4-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6oGIyq5Z/UamuDZT"
Content-Disposition: inline
In-Reply-To: <20260312095724.2117448-4-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_034320_644099_4C326550 
X-CRM114-Status: GOOD (  12.82  )
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


--6oGIyq5Z/UamuDZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Rex Lu <rex.lu@mediatek.com>
>=20
> Align the vendor driver by adjusting the timeout values for the
> MCU_UNI_CMD_EFUSE_CTRL and MCU_UNI_CMD_EXT_EEPROM_CTRL commands.
> Without this adjustment, false positive command timeout errors may occur,
> especially on some iPA variants.

I guess we are missing a Fixes tag here.

Regards,
Lorenzo

>=20
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index bdb9e30c54c1..2a9c59d15894 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -271,7 +271,8 @@ mt7996_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
>  		mdev->mcu.timeout =3D 2 * HZ;
>  		return;
>  	case MCU_UNI_CMD_EFUSE_CTRL:
> -		mdev->mcu.timeout =3D 20 * HZ;
> +	case MCU_UNI_CMD_EXT_EEPROM_CTRL:
> +		mdev->mcu.timeout =3D 30 * HZ;
>  		return;
>  	default:
>  		break;
> --=20
> 2.51.0
>=20

--6oGIyq5Z/UamuDZT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabKYxAAKCRA6cBh0uS2t
rA5kAP4ikpFq4v65K0ZsizSUVwd8SujJiyt4RVOKLQnwhL/BjQD9HKI5rl/7BhfE
5QE3cHI/T5Q3OcGbaHTDjTw9r4s2hgg=
=iSs9
-----END PGP SIGNATURE-----

--6oGIyq5Z/UamuDZT--

