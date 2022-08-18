Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FA6C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EB6ZKa75xKJCugdEpTSiUQmpyBDagLDjW5D+4mthFkQ=; b=EKEAyhPIqnV6mv/gRvMByMBsWc
	7jJb+qVwXYHCuiYSpxZxqFCnA1K3yP0usCgPwMN3LUbyx2ZdG7jJQ2OYw+AoZ/tFgp3GjhgmXF9cN
	FWXoiP+PiFgMTHhQ6blXZxnWppay9RJ+G8j9tgQ8wzx7lMjp0BK9Dez/aPMNMahoujorNjoBa63tQ
	kvIDn6vlkk7FkXOq9QCsVzZzM3WY+F2gxt8iBokLGPZJjT4JGZyTD+te0PVjXIMqedWjwkTPWHzt5
	Sn/oxUxaMNrWvawnRmgJAY8d2CEvf9KIkjGzSMu7JHsROphgjeB2cQmdsbL2Bsw0MIAjt6hxTpqBp
	wEg0IEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOa7q-000EsX-EY; Thu, 18 Aug 2022 07:39:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOa7n-000Eqr-Ek
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 07:39:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B76E616EE;
	Thu, 18 Aug 2022 07:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5910DC433D7;
	Thu, 18 Aug 2022 07:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660808365;
	bh=sH0amc1oQGzoAx6pTnDSo2dE4ufvfCYoouKwkZPO7eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sS+PPvzx/vTOy2Z6pKTG1pDTeuG2A+I7oYn/PXOJu5tNAewCl7Ajfg65wU/7/C990
	 O6lg4oGzH4MGY6eXuyG0m2yNmPuajrMAaSMVrB/exAb2yM4lQYY8o/FYVTffRSDfRb
	 Bydx544aU+bIjdoxCI5meX0VN4MBaEhZx+IPVo5pWNSdTg4jYLsIQKv6xljJetfB4K
	 SbMLR3WE6My0hHtmuOMeGgkIta6T8+5m1VWPS8xJGpKDOg7UuH0i2Nf12F0mM+yXyV
	 A8INz718eaHV19DMmb1bJfoJa6iUryp2zsJC4uWddBytwSYVz6UJW+ehG69TwBdlQG
	 dyxgefqhgYCIw==
Date: Thu, 18 Aug 2022 09:39:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang =?utf-8?B?KOeOi+W/l+S6mCk=?= <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com,
	Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
	Deren Wu <Deren.Wu@mediatek.com>, km.lin@mediatek.com,
	jenhao.yang@mediatek.com, robin.chiu@mediatek.com,
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
	ted.huang@mediatek.com, Stella.Chang@mediatek.com,
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
	frankgor@google.com, kuabhs@google.com, druth@google.com,
	abhishekpandit@google.com, shawnku@google.com,
	linux-wireless@vger.kernel.org,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 8/9] wifi: mt76: mt7921: introduce remain_on_channel
 support
Message-ID: <Yv3sqvhXnGiOpKkE@lore-desk>
References: <cover.1660606893.git.objelf@gmail.com>
 <f48a750e8ad17d5b2410eea03fc30a6403732168.1660606893.git.objelf@gmail.com>
 <YvyUwEdURYHiAduf@lore-desk>
 <CAGp9LzrvVQOrUNPR8aguUTgWo1wZFMR2Y3kdTk8WqxmG=B8--w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3UM8ZQzh0v68rXAd"
Content-Disposition: inline
In-Reply-To: <CAGp9LzrvVQOrUNPR8aguUTgWo1wZFMR2Y3kdTk8WqxmG=B8--w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_003931_652706_025786F6 
X-CRM114-Status: GOOD (  34.08  )
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


--3UM8ZQzh0v68rXAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> On Wed, Aug 17, 2022 at 12:18 AM Lorenzo Bianconi <lorenzo@kernel.org> wr=
ote:
> >
> > > From: Sean Wang <sean.wang@mediatek.com>
> > >
> > > Introduce remain_on_channel support. Additionally, we add
> > > mt7921_check_offload_capability to disable .remain_on_channel and
> > > .cancel_remain_on_channel and related configuration because those
> > > operations would rely on the fundamental MCU commands that will be on=
ly
> > > supported with newer firmware.
> > >
> > > Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> > > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > > ---
> > >  .../net/wireless/mediatek/mt76/mt7921/init.c  |  36 ++++++
> > >  .../net/wireless/mediatek/mt76/mt7921/main.c  | 112 ++++++++++++++++=
++
> > >  .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  24 ++++
> > >  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  34 ++++++
> > >  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  13 +-
> > >  .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  11 +-
> > >  .../net/wireless/mediatek/mt76/mt7921/usb.c   |   1 +
> > >  7 files changed, 225 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drive=
rs/net/wireless/mediatek/mt76/mt7921/init.c
> > > index cd960e23770f..1b7a18d42f5b 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > @@ -44,6 +44,35 @@ mt7921_regd_notifier(struct wiphy *wiphy,
> > >       mt7921_mutex_release(dev);
> > >  }
> > >
> > > +static int mt7921_check_offload_capability(struct mt7921_dev *dev)
> > > +{
> > > +     struct ieee80211_hw *hw =3D mt76_hw(dev);
> > > +     int year, mon, day, hour, min, sec;
> > > +     struct wiphy *wiphy =3D hw->wiphy;
> > > +     bool fw_can_roc =3D false;
> > > +     int ret;
> > > +
> > > +     ret =3D sscanf(dev->mt76.hw->wiphy->fw_version + 11, "%4d%2d%2d=
%2d%2d%2d",
> > > +                  &year, &mon, &day, &hour, &min, &sec);
> >
> > does the fw have a differnt base version with respect to the previous o=
nes?
> > checking the date is a bit ugly.
>=20
> I admitted that way was a bit ugly, but I have investigated for a
> while, and that is the only way we can use to distinguish the version
> in current mt7921 firmware.

the fw seems pretty new (2022/7/15), is it already available in linux-firmw=
are
git tree? If not I guess you can increment fw version in a more evident way.
For the future please remember to do it for major fw changes.

>=20
> >
> > > +     if (ret !=3D 6)
> > > +             goto out;
> > > +
> > > +     /* Old firmware cannot support remained on channel and channel
> > > +      * context management.
> > > +      */
> > > +     fw_can_roc =3D  mktime64(year, mon, day, hour, min, sec) >=3D
> > > +                   mktime64(2022, 7, 15, 12, 1, 1);
> > > +out:
> > > +     if (!fw_can_roc) {
> > > +             dev->ops->remain_on_channel =3D NULL;
> > > +             dev->ops->cancel_remain_on_channel =3D NULL;
> > > +
> > > +             wiphy->flags &=3D ~WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
>=20
> <snip>
>=20
> > > -     mdev =3D mt76_alloc_device(&pdev->dev, sizeof(*dev), &mt7921_op=
s,
> > > -                              &drv_ops);
> > > +     ops =3D devm_kmemdup(&pdev->dev, &mt7921_ops, sizeof(mt7921_ops=
),
> > > +                        GFP_KERNEL);
> >
> > why do we need to copy mt7921_ops?
> >
>=20
> As the old fw cannot support the roc and chanctx and considering
> backward compatibility, I need to copy the mt7921_ops here and
> disable related operations for old fw before registering the hw to mac802=
11.

ack, right.

Regards,
Lorenzo

>=20
>      Sean
>=20
> > Regards,
> > Lorenzo
> >
> > > +     if (!ops) {
> > > +             ret =3D -ENOMEM;
> > > +             goto err_free_pci_vec;
> > > +     }
> > > +
> > > +     mdev =3D mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_=
ops);
> > >       if (!mdev) {
> > >               ret =3D -ENOMEM;
> > >               goto err_free_pci_vec;
> > > @@ -286,7 +293,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
> > >
> > >       dev =3D container_of(mdev, struct mt7921_dev, mt76);
> > >       dev->hif_ops =3D &mt7921_pcie_ops;
> > > -
> > > +     dev->ops =3D ops;
> > >       mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
> > >       tasklet_init(&dev->irq_tasklet, mt7921_irq_tasklet, (unsigned l=
ong)dev);
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drive=
rs/net/wireless/mediatek/mt76/mt7921/sdio.c
> > > index 487acd6e2be8..6d27875f41b8 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> > > @@ -120,18 +120,23 @@ static int mt7921s_probe(struct sdio_func *func,
> > >               .fw_own =3D mt7921s_mcu_fw_pmctrl,
> > >       };
> > >
> > > +     struct ieee80211_ops *ops;
> > >       struct mt7921_dev *dev;
> > >       struct mt76_dev *mdev;
> > >       int ret;
> > >
> > > -     mdev =3D mt76_alloc_device(&func->dev, sizeof(*dev), &mt7921_op=
s,
> > > -                              &drv_ops);
> > > +     ops =3D devm_kmemdup(&func->dev, &mt7921_ops, sizeof(mt7921_ops=
),
> > > +                        GFP_KERNEL);
> > > +     if (!ops)
> > > +             return -ENOMEM;
> > > +
> > > +     mdev =3D mt76_alloc_device(&func->dev, sizeof(*dev), ops, &drv_=
ops);
> > >       if (!mdev)
> > >               return -ENOMEM;
> > >
> > >       dev =3D container_of(mdev, struct mt7921_dev, mt76);
> > >       dev->hif_ops =3D &mt7921_sdio_ops;
> > > -
> > > +     dev->ops =3D ops;
> > >       sdio_set_drvdata(func, dev);
> > >
> > >       ret =3D mt76s_init(mdev, func, &mt7921s_ops);
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/driver=
s/net/wireless/mediatek/mt76/mt7921/usb.c
> > > index d06cee386acd..cf3ec59a4270 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> > > @@ -217,6 +217,7 @@ static int mt7921u_probe(struct usb_interface *us=
b_intf,
> > >
> > >       dev =3D container_of(mdev, struct mt7921_dev, mt76);
> > >       dev->hif_ops =3D &hif_ops;
> > > +     dev->ops =3D ops;
> > >
> > >       udev =3D usb_get_dev(udev);
> > >       usb_reset_device(udev);
> > > --
> > > 2.25.1
> > >

--3UM8ZQzh0v68rXAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYv3sqQAKCRA6cBh0uS2t
rFZiAQCjVE2G83nEhykFqvrmQDycLZfoVOVpNo2bSixUSKciLQEAgnQ5ZQSRmaSw
VY39dBMtdmjpyiKfolq8q7Q5ghNJ0wg=
=I+5d
-----END PGP SIGNATURE-----

--3UM8ZQzh0v68rXAd--

