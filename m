Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24978CCA47D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwwxlKHijuVte72hKkbIStXVeTz1JOAF8uhptFQsvpY=; b=4C8rCUkJknLiymqz5HxksUCgzl
	q2vV31guoRq6XJYcTJRl0QEVCwYIMfgSuPaC0Ech0G8gbMr8JTLUepOxQr+q417KGSKvnyRqAXsFq
	FWtpEgCA+snV8pi9+RyCBRFMhJTdvW8qCmH+BkYfLCPEbR++pTSmbnwMcPfjtF99PHEr0uSI9LalP
	6Fmsq0Y8+C0353AQoz9sBi4nF8WM2oKH7IMQ0MsQjz+SVEfZUj8MO9LTWKoCgLZZY133BFllCxzfN
	2pX8SJ2M1ck3M11jKp4P+Yde72mVWIUZLzZSGzHs17YkFpcFz+h95Av1NTtimyJQdztUU4DoVAq4e
	SlJa4kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gQZ-002YbA-6T; Mon, 13 Jun 2022 09:32:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gQX-002YZt-4G
	for linux-mediatek@lists.infradead.org; Mon, 13 Jun 2022 09:32:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B519461361;
	Mon, 13 Jun 2022 09:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EABC341C4;
	Mon, 13 Jun 2022 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655112723;
	bh=SddoYtToYnd60vSjGq+xaMPEhrFsty5ft9T+UA0njtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSqHDkRMztXJ1K9i7c9jfF/kjwwUcOLm/+pUCvqqtDW/5yMzZPamcEsKmwE3vy34e
	 yQRGS+aqwqP+iUI81Yft/cULbLm9rEx+gX+RvpV+UEWcZ08Vt8Dj0vib8zTItDC6FV
	 z5//94arY5H6nVQF8CUpP4LUqyGKNaLJzYe3ShwruNldf58AJTOh+62cmWiY9ymj/F
	 o+G3KAnEm0wox/FGUFfjKv8W42sU3LH24qpnQs4KlPa5WEXx50VwYHbQzMwu2QjVCp
	 e/QZY4CPxu+hvWdtGlQqN7Tlq6xh9uRLAz0Q1BiYhmbYs8m9jefSxhk3MBWUYSzcHx
	 o6IqoEL+4FXBw==
Date: Mon, 13 Jun 2022 11:31:59 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
	Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
	KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
	CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
	Eric Liang <Eric.Liang@mediatek.com>,
	Stella Chang <Stella.Chang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921s: fix possible sdio deadlock in command fail
Message-ID: <YqcED2AWOP+mFPQV@lore-desk>
References: <7122534ce50527e099a23fa198683a0e20c6db38.1654998031.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <7122534ce50527e099a23fa198683a0e20c6db38.1654998031.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_023205_244152_B7E152BC 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Type: multipart/mixed; boundary="===============8641702695116072613=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8641702695116072613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A5J39+V/GstiCcPe"
Content-Disposition: inline


--A5J39+V/GstiCcPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> Move sdio_release_host() to final resource handing
>=20

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> Fixes: b12deb5e86fa ("mt76: mt7921s: fix mt7921s_mcu_[fw|drv]_pmctrl")
> Reported-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> index 54a5c712a3c3..1856d677fff4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> @@ -156,9 +156,9 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
> =20
>  	err =3D readx_poll_timeout(mt76s_read_pcr, &dev->mt76, status,
>  				 !(status & WHLPCR_IS_DRIVER_OWN), 2000, 1000000);
> +err:
>  	sdio_release_host(func);
> =20
> -err:
>  	if (err < 0) {
>  		dev_err(dev->mt76.dev, "firmware own failed\n");
>  		clear_bit(MT76_STATE_PM, &mphy->state);
> --=20
> 2.18.0
>=20

--A5J39+V/GstiCcPe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYqcEDwAKCRA6cBh0uS2t
rKi5AP9bBre9sLH9PTh+EH3Jr/qpaTrLs7r4oOzOHR1pYRujYwEA110zit1P/R1p
V2NpPVVAmKVq5M9jc72S1elD2wL+hws=
=1cka
-----END PGP SIGNATURE-----

--A5J39+V/GstiCcPe--


--===============8641702695116072613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8641702695116072613==--

