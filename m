Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C428C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 16:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08F361002
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 16:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E08F361002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sR7Q2gwvRPJ3k8wiciLK4YuP6rVBt0oeWUSvJ78Wh4=; b=Zevi8RPKRnHY78mSQH2ZW3izbx
	pPSxNSEU47kN44qLOzNrz/VwYNW1B4H+6oYhEPG7mIJjC0wKy8eff9avmSTqqD5QnrdqxvkHYULrY
	O07CLCMSuuRI/vFVBHwvrgvWE1ccIwUGsJbqzFc3YDB6drjKxq8W5Dxti8zCIsM/lpg7tMjGuWbgR
	2nQE5cZGVgtV7flaSM3dM33AImRLEHjbLJx5TuXwug217TOr0XBHgQHNl8EZznMgSjoHmuf0I0mFj
	Z9uj7xyGunTkhz1vObGNBK9DvDUOr4WnSwX8VS8bbgeW7hGjLYNKNjB9hhKdyMuopW90CT5qkvpCG
	7asyLeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBJeR-006kTX-SQ; Wed, 04 Aug 2021 16:21:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBJeP-006kT2-4H
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 16:21:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E438860F94;
 Wed,  4 Aug 2021 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628094108;
 bh=3KghkMAaEVvO0bpaXEGPMyBaiRpeQXsRfgm2tvbKbFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=etP3HeEVLchoQYPkz3OdxNNwoQofy2/aGrtIeOZGh2QzxVAcfDYwx22PX+X3JT3Qn
 lskhxWVyibhOmVbaxw5EzjmndGfFD5/GjZjdrerWa/SOmaG/ajlIiFIIBEy/cYVskr
 Q+k4AtYTnndrzra1dR/j7q83T4kM/syMtjFA88pLlkn18DAAAVmw18heD4clqEINxT
 KK3+RRYNDjJAZPyPtMzJvY4AqwBqhKST4nh9M8B7jjdIhy/IZF/mQamW2bW65srG9M
 pzL31t1SEcYTDxMvWvjgjrV2lEz1/pd4F2ws9zu2tbP6QT4cFlPDwurEXbPTiBjvdj
 N4Gehi8pjP3kg==
Date: Wed, 4 Aug 2021 18:21:43 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: YN Chen <YN.Chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
 Deren Wu <Deren.Wu@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>, jemele@google.com,
 yenlinlai@google.com, linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] mt76: mt7921: enable VO tx aggregation
Message-ID: <YQq+lxbs7SlKt87h@lore-desk>
References: <889fc1f28a8402f82cb83243af4916c3311c3eb1.1628072837.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <889fc1f28a8402f82cb83243af4916c3311c3eb1.1628072837.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_092149_232147_F83DF52D 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Type: multipart/mixed; boundary="===============4680067809017733307=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4680067809017733307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vNJtZXllMJRnjY3o"
Content-Disposition: inline


--vNJtZXllMJRnjY3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> Avoid throughput drop in VO streaming, enable TX BA by default.

802.11 ampdu is disabled for VO traffic in order to avoid introducing delay=
 I guess.

Regards,
Lorenzo

>=20
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> ---
> v1 -> v2 : commit format adjustment
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 296e0f7a1d14..1be1e07ae786 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -913,8 +913,6 @@ mt7921_tx_check_aggr(struct ieee80211_sta *sta, __le3=
2 *txwi)
>  		return;
> =20
>  	tid =3D FIELD_GET(MT_TXD1_TID, le32_to_cpu(txwi[1]));
> -	if (tid >=3D 6) /* skip VO queue */
> -		return;
> =20
>  	val =3D le32_to_cpu(txwi[2]);
>  	fc =3D FIELD_GET(MT_TXD2_FRAME_TYPE, val) << 2 |
> --=20
> 2.25.1
>=20

--vNJtZXllMJRnjY3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYQq+lAAKCRA6cBh0uS2t
rOWPAQD9D952emRHoqvknYacCFHvccY6iDjStYHSolG6jiE/VQEAq7k5f4u7Sh58
MG0GaWDIbZ4/javYeZ2HrTAQF+R+wAA=
=fERJ
-----END PGP SIGNATURE-----

--vNJtZXllMJRnjY3o--


--===============4680067809017733307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4680067809017733307==--

