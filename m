Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA538C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7oDZH53hVR8JP/zG4kP3+WHRLXwTLCz9IfzoyTDmM0=; b=yZLiB2bobTNUZRoVgJUsjD9ura
	0Gz0bIt8DSE7mdjeRarmXusBxGaHdhZte8/3hZeFtXq6ce9xy1ORG9Rw9h9fJQE0Pc+67fMK7bJlA
	h+IoNCLWXJiWwpPwghM2F0SfUnnQ1Yec/NqIn5hK5MwUpWTb6DBbGajFpSDcy47LkN7nWS4R8++HN
	50lU1duC/hhO2kZomoNEadsC0hV9+PgxtXsAa6H6jxraNajjPy7AmB+Ha1KlQMe5EX4cp3XwtsWqR
	rhOlUJ/kpo+dFCy1EK4eWk0kZkjgJNrdZR0XO17GhWOzfc19iJq0eUPT+wnziuxpi4zOypvJwRtE7
	JMoKZ3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiMS-008vfy-Jy; Mon, 13 Dec 2021 10:15:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwi1o-008miI-VJ
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 09:53:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB226B80E9D;
 Mon, 13 Dec 2021 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6984C34601;
 Mon, 13 Dec 2021 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639389227;
 bh=v7Lg+J16vRQFISY4twI+8sD57NLw7i8MiOwfhdznK+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s0Djrd5RBGfyMWUO11UbkwkExyeoQVutnpI/n2Lj9NPQwQjqokhl2zmxtDJIAosy0
 tALPIRGEVSlKub8Nps4nBEot/UmLzS5KYxXjs3LIUOHLZzpzz+OwCL0yGgvCNJtHzF
 mw9KwyX7KshOEpAN5pjrUJ9gWeUR2Qg4hjObUruloVyPQa+EZ1qxbAQ09pxIGNoEDC
 T//bqIeuJ/H0jEmB9POl62OCr+joQvO5uIwmOgfrSAVBVvRiAObXjOJNnBuNSyHwBy
 taXI6+Yz9u6KjiyZGqjXssNV7wtMlCz92+ZnrBsmLVcWg9RGsCfTxVDLHPm5g8arZT
 kHhJ/ltNQMPZQ==
Date: Mon, 13 Dec 2021 10:53:43 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: lorenzo.bianconi@redhat.com, nbd@nbd.name, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Mark-YW.Chen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921s: make pm->suspended usage consistent
Message-ID: <YbcYJ47OKfh0A5Vt@lore-desk>
References: <YbTU08hzeTSJPIsp@lore-desk--annotate>
 <1639242882-15796-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1639242882-15796-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_015353_357339_E537758B 
X-CRM114-Status: GOOD (  20.43  )
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
Content-Type: multipart/mixed; boundary="===============8202234678418372328=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8202234678418372328==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0SXPcFI+nToIgH3R"
Content-Disposition: inline


--0SXPcFI+nToIgH3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >> From: Sean Wang <sean.wang@mediatek.com>
> >>
> >> Update pm->suspended usage to be consistent with mt7921e driver.
> >>
> >> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> >> ---
> >>  drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/driver=
s/net/wireless/mediatek/mt76/mt7921/sdio.c
> >> index 84be229a899d..44ee9369f6bf 100644
> >> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> >> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> >> @@ -278,7 +278,6 @@ static int mt7921s_resume(struct device *__dev)
> >>	struct mt76_dev *mdev =3D &dev->mt76;
> >>	int err;
> >>
> >> -	pm->suspended =3D false;
> >>	clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
> >>
> >>	err =3D mt7921_mcu_drv_pmctrl(dev);
> >> @@ -294,7 +293,11 @@ static int mt7921s_resume(struct device *__dev)
> >>	if (!pm->ds_enable)
> >>		mt76_connac_mcu_set_deep_sleep(mdev, false);
> >>
> >> -	return mt76_connac_mcu_set_hif_suspend(mdev, false);
> >> +	err =3D mt76_connac_mcu_set_hif_suspend(mdev, false);
> >
> >should we check return value here? Something like:
> >
> >	if (err)
> >		return err;
> >
> >	pm->suspended =3D false;
> >	return 0;
> >
> >Or, is the chip up even if mt76_connac_mcu_set_hif_suspend() fails?
>=20
> yes, chip is eventually up again by recovered with the following wifi res=
et
>=20
> with current logic, if do so (not mark pm->suspended back as false to sho=
w suspend/resume is over),
>=20
> the pm runtime would not be enabled again after the wifi reset

maybe we should just set pm->suspended =3D false; in mt7921_mac_reset_work(=
) as
we do for hw_full_reset, wdyt?

Regards,
Lorenzo

>=20
> >> +
> >> +	pm->suspended =3D false;
> >> +
> >> +	return err;
> >>  }
> >>
> >>  static const struct dev_pm_ops mt7921s_pm_ops =3D {
> >> --
> >> 2.25.1
> >>

--0SXPcFI+nToIgH3R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYbcYJwAKCRA6cBh0uS2t
rJ4JAQCttsm1F7E9ENH4GfBlVaclyHUhAnjDI9hi6Bcl2Y/deQEA/+HpBfUhu78I
/hJgrRrPGMZvkS/H1w2m0a4xUcgGWgs=
=ioOx
-----END PGP SIGNATURE-----

--0SXPcFI+nToIgH3R--


--===============8202234678418372328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8202234678418372328==--

