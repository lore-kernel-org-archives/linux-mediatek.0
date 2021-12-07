Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C848BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sD0CrU6hX+DZO+DYtA9moJvar4yN6mg3yFkTkiH/dsY=; b=YONSzJm4jyZNNb4HHSUguc9yzB
	nnu164KcpV4/T9VTGrfFNFXUwaxIrV6Bug6QSw/9LSqweGrQc0q+kVxXrWajbem83vhWiy4RzII+s
	zf4OnwQqQDWzIDevYDC9dOeeJ1WaLs/Q6znNAMMY08cKATjf9lhsZazBScwBplB3INHQ6ZT2pQLxN
	61b85JNvH2H+ADcKJ4Ysz38NFy+0pvjRIStGZDI5fyHb2BsYE3wYI/OpsQ6J6rIJeJP/KgfQ+3XmI
	RJCQ/iMr4yeFw/wLyWM524tWLiKvBFdpeTrHfN+WMMnO/727nmZin7JA6yDfrxCh4bEMiwEa1urFi
	PvQsPbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muXv5-0085uw-Ao; Tue, 07 Dec 2021 10:41:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muXP8-007wrY-Ib
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 10:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638871735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KlDiwZ4tMUXp9iaZKeiV/247+6yiA1LjrbgnMLkqiY=;
 b=DawyVWs5KHvsfUM92qFYLYIhLJnP/9KxRS/4KVc16ziOjpySR4wnYwV82TVJhhqht2ll26
 o4nxnrOLrgbsfh/E9xn3B1RwU2srZbUjY3g5Q5E8SD+w3UR5xFxbv8YtG2mWEvC4zYR65s
 TAgoe9fmYjcNCpE9K04HdKuANTZ0hUs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-525-PhcH2qDTO2qkXZOLeaEkEQ-1; Tue, 07 Dec 2021 05:08:53 -0500
X-MC-Unique: PhcH2qDTO2qkXZOLeaEkEQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so2741673wro.21
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Dec 2021 02:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y1qc17Wzkg9QMJ9/oH1d2JR/jyCeyLONuO+KPdMgSh4=;
 b=J9RW+rn+m7fHbjQ4EmGhBaE4KoYzp5WvX8CRQw4pQrf4F5Unz89IBUE9OE6Tyi/sjn
 C+QOZT6WOsJQy8D/ZlHr/FCs8ECYALR33PgnQ5OxEUO64w3+uzvCAjmhycYq9ZD90zoe
 DSTkSYt9gmNiY+kzj6Q5qie/Sz6c//V2jnmnkQrgVfCZfsg5Rjj2OoAORZ1IDor25G6f
 zgNORRObE11x+lojGZD67lMK7DIJaLyOmC8UeULvQNiy6qcbK/Q/RMaVwRCOHZCeb9k1
 vGT8kr24UaM2NkMKbW63s9bt3/C6x/Jr9kyuahLnl3yWlBaMmH/oV52KXN/0kN/qzFo+
 KaNA==
X-Gm-Message-State: AOAM530mBt2DoQfkQ1EJvb12BylfQU72YTz73ORfCM7/Xhhs6e+CgPmS
 Pv4zuyy6zH1si4YNeEADVGQyOzjF87Zz7CV82DuzeaHUHVIZCmMT0zm2V4bv48uZgspW7MuobVQ
 Z9hUR+Zc4EItMoonDBrGcGr4vH/H6P3Dl
X-Received: by 2002:a5d:4843:: with SMTP id n3mr48648875wrs.335.1638871731834; 
 Tue, 07 Dec 2021 02:08:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxC3Wg4ZRZ5NwLZWUnPZjez4JLkBG0PxpuxKgTsBZotBk5ER9r/VoLvB8Lo0nqag9Mw3b9xTA==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr48648844wrs.335.1638871731649; 
 Tue, 07 Dec 2021 02:08:51 -0800 (PST)
Received: from localhost (net-37-182-17-175.cust.vodafonedsl.it.
 [37.182.17.175])
 by smtp.gmail.com with ESMTPSA id g5sm18307403wri.45.2021.12.07.02.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 02:08:50 -0800 (PST)
Date: Tue, 7 Dec 2021 11:08:49 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: fix possible resume failure
Message-ID: <Ya8ysehFjoEGGEf+@lore-desk>
References: <ff1e35dcaa0a56c04339bba2ebd2c68bf815919c.1638844068.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ff1e35dcaa0a56c04339bba2ebd2c68bf815919c.1638844068.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_020858_766500_A919EAD8 
X-CRM114-Status: GOOD (  18.86  )
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
Content-Type: multipart/mixed; boundary="===============2047579652518715921=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============2047579652518715921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7oJp8/YxkC2x5kNk"
Content-Disposition: inline

--7oJp8/YxkC2x5kNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Fix the possible resume failure due to mt76_connac_mcu_set_hif_suspend
> timeout.
>=20
> That is because clearing the flag pm->suspended too early opened up a rac=
e
> window, where mt7921_poll_tx/rx scheduled a ps_work to put the device in
> doze mode, that is unexpected for the device is being resumed from the
> suspend state and would make the remaining MCU comamnds in resume handler
> failed to execute.

do we have a similar issue in mt7921s_resume()?

>=20
> Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 5635de3c80b1..21a48f02ab60 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -315,7 +315,6 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
>  =09struct mt76_connac_pm *pm =3D &dev->pm;
>  =09int i, err;
> =20
> -=09pm->suspended =3D false;
>  =09err =3D pci_set_power_state(pdev, PCI_D0);
>  =09if (err)
>  =09=09return err;
> @@ -353,7 +352,11 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
>  =09if (!pm->ds_enable)
>  =09=09mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
> =20
> -=09return mt76_connac_mcu_set_hif_suspend(mdev, false);
> +=09err =3D mt76_connac_mcu_set_hif_suspend(mdev, false);
> +
> +=09pm->suspended =3D false;
> +
> +=09return err;
>  }
>  #endif /* CONFIG_PM */
> =20
> --=20
> 2.25.1
>=20

--7oJp8/YxkC2x5kNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYa8ysQAKCRA6cBh0uS2t
rGBdAQDY8aCjO7iCtMqaQQL5IrkI60tKUwqIm9xROabHgiY61gD/XyTTgv5OrKa9
xbm/p9w5lGdB8sZghE+yq7urQ3vowQg=
=VfrE
-----END PGP SIGNATURE-----

--7oJp8/YxkC2x5kNk--



--===============2047579652518715921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2047579652518715921==--


