Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D12C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSs56dmofc5XTLDxFiysoC5cqGQh98x0RzCpYaoOavY=; b=j35lpR/lYNd0/4b74O0xuWoh7J
	W6nDsFeT2DMMvBNQlQPvX5sOswqQK73XaYPD+qKnlORcfjm00tD0GxYD2VVnaWw/W+/1RZ1imj0LM
	ZxbIAXuXqJlYMd29va38A8fMCvok5Y/qtsaaBvlTaKdnbYMNFkFhSMh2Bxx5RHpnaFdTG2+gSmGO5
	KrSF01fj4Z7Fah33ngeU1XqK2LTGGu5iXq/hNWadNUSxOTkhDCQxYxdZeFt0IQVLIecEvWNBWxSCc
	vk23odPzfFGa+3PzwG8Tc+/smJ9ek44Ru6CwNQKIBY5tUUt/2po4yykruQ/m/V9Tw6BVHtZ1ZHP6d
	kSi2q28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0j4g-003Uk1-IJ; Mon, 13 Jun 2022 12:21:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0j4d-003Ui1-5O
	for linux-mediatek@lists.infradead.org; Mon, 13 Jun 2022 12:21:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 89148B80EB2;
	Mon, 13 Jun 2022 12:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE68C34114;
	Mon, 13 Jun 2022 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655122896;
	bh=CvnL9f5eH8tGLhL38W/FX4XZ2qwkOL4ty31C6bqj5xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jrp6kkQQdAPALoW7Lbctam7VQfiq0RYqYzpD9cVrhpnAH9Yjg1IFU6zH4XMuQAn7+
	 BKu0Lq1OE6mVBiMo9GH/t06KKSNoB8W1ezwpRIQ/ldYgWZ6Ou4ORfVKGSRb67d4VbW
	 qT2iRa82ECj/s9U62ifTJSM6jL3GmUJ5ioR4Jcf+FC8PU+y/ARdgkThVta5CgtnNWg
	 ADzK/8tb7vxaUv3rGHy1UveZGXXD6fqrQt2C31X+xWCSaVwe5Iv8wpedkyKPbDBJDf
	 5TnNdRpcUXy/AVoE16L6KJfr7xACqQCRJqEaOAh/hwmwgU8/83CMgu/aduEiF1mgi5
	 EstcPFmga1y9g==
Date: Mon, 13 Jun 2022 14:21:32 +0200
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
Message-ID: <YqcrzCbeJUg3s18b@lore-desk>
References: <7122534ce50527e099a23fa198683a0e20c6db38.1654998031.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <7122534ce50527e099a23fa198683a0e20c6db38.1654998031.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_052139_539106_01C43997 
X-CRM114-Status: GOOD (  18.00  )
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
Content-Type: multipart/mixed; boundary="===============2621300530319323996=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2621300530319323996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZG2qsKGRAlilLHEg"
Content-Disposition: inline


--ZG2qsKGRAlilLHEg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> Move sdio_release_host() to final resource handing
>=20
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

Hi Deren,

in order to align the code with mt7921e, can you please fold the following
changes into this patch?

Regards,
Lorenzo

--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
@@ -135,8 +135,8 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
 	struct sdio_func *func =3D dev->mt76.sdio.func;
 	struct mt76_phy *mphy =3D &dev->mt76.phy;
 	struct mt76_connac_pm *pm =3D &dev->pm;
-	int err =3D 0;
 	u32 status;
+	int err;
=20
 	sdio_claim_host(func);
=20
@@ -147,7 +147,7 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
 					 2000, 1000000);
 		if (err < 0) {
 			dev_err(dev->mt76.dev, "mailbox ACK not cleared\n");
-			goto err;
+			goto out;
 		}
 	}
=20
@@ -155,18 +155,18 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
=20
 	err =3D readx_poll_timeout(mt76s_read_pcr, &dev->mt76, status,
 				 !(status & WHLPCR_IS_DRIVER_OWN), 2000, 1000000);
-err:
+out:
 	sdio_release_host(func);
=20
 	if (err < 0) {
 		dev_err(dev->mt76.dev, "firmware own failed\n");
 		clear_bit(MT76_STATE_PM, &mphy->state);
-		err =3D -EIO;
+		return -EIO;
 	}
=20
 	pm->stats.last_doze_event =3D jiffies;
 	pm->stats.awake_time +=3D pm->stats.last_doze_event -
 				pm->stats.last_wake_event;
=20
-	return err;
+	return 0;
 }

--ZG2qsKGRAlilLHEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYqcrzAAKCRA6cBh0uS2t
rEl/AQCKiEW6E0JL9uZaWi9nnfWIKAUjy6ahKPIjnkkCeZEcIwEAvBn+Bp1r9L/Y
/UUDvO0oMmmS8HR6B1jyCSWgHPSxHQY=
=F1iM
-----END PGP SIGNATURE-----

--ZG2qsKGRAlilLHEg--


--===============2621300530319323996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2621300530319323996==--

