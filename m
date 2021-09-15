Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74229C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F6C60EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28F6C60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdS9UXXl8Nw1weOezYdbF51SOA2McOMy7XLHuNRYVlw=; b=P4PHpmT+wZNaFEE4f0dmAvZWnl
	/YVDZRdSXGGuRs4V8eM7Lkvl7mhiZsUCafcizAWoCvZA//GLNw7ySGopPndSmKw6P34xU8NFzERZd
	PkVWoHyULq8yEgOM7qP080xqDNTW441Z5XkCTMCDGraqK9CSPzDYdvl9vv+0c/ZywE9cVoGA99XVn
	gWDy0r85LypyywewpCnzR9KjrR94yh+bO5hZAj6MnXjdBZ3F25fmeqoMHuWrdFM8g2FRc53J6XvlM
	5islf4y4aa5HvkZInLau7oz5uvh09dx5TUakOGnMYa8kcpcYQ2ccEF9UgayZtXjbc+Zw1UVDeCNAP
	NvSJ6UVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQUkB-0098NM-BC; Wed, 15 Sep 2021 13:14:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQUk8-0098Me-9s
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631711667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KaUZhGAjU6bQ70ioE2buCY92eSkmuczMc4yLCctOR8=;
 b=QcyIsBGjHsx8g7c3+V44hwMgrs1JtTQb3DJ6t+wQAjGcInMcVBzdVhW1YCDn27LYPQ6zmn
 Vx1bBQJWxxtZMRJ7HBqPpZVMyd9dXJTXtf9YQ0XlcflWQeA2eT265otcPP8o2Aa5zP6Odr
 D1hKh7WJDvltxCfyEY26FbQJEFkj1DY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-s4kfJlbOOXid_TiKaMPIeA-1; Wed, 15 Sep 2021 09:14:20 -0400
X-MC-Unique: s4kfJlbOOXid_TiKaMPIeA-1
Received: by mail-ed1-f69.google.com with SMTP id
 e7-20020aa7d7c7000000b003d3e6df477cso1570358eds.20
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y7oQ950/Pyu/LxpdrskR5m0WjgHUUF+FwtQRkRVzSQQ=;
 b=Xzw+/qgsa1kBRX+DcJbCINChYhqTYHHynFZCSQXYJFqI7w6a1vaKwsXtI1TLjlOuZX
 72bYpWaB9X4dY2cGBYUGHd1b6kFyp91uvnijumWIDhEJkQPDFe5z6qE2ZYGt8JPnndxP
 eamWsy3VABxX2Mv3ITWxcFQ/pE9nlxbIVAlsPpB40GKY1Py6f2lZKN1U80MHqfbCp2pK
 5JbGdd5tUh6MMZjBR1nsLcMW8AoDNBtyrmcpMXLW+K7TKiVN16dkfVvLZKeAGiM2LMvS
 c12BkGKiHVpe0dAOVVG54I/LewpNEeaFFOJTY5GVTWvbpsGdK7zeu1V58xZKCAfssaTe
 lS/w==
X-Gm-Message-State: AOAM530+MDJx3ib/OCKoJOtpUSeMYyN/rCyyUzxvWIfXuL0l57OkwyYW
 HutcBtrN/D8w2ehlBeSdWT+t9o9DL0KPX0KGVMGbrFqLZdW7oqkrXuh6HzJ43kRdR4E08KutYyR
 Kj9p2Ifzc/ypF090szlcSgnTGFF3m/3JG
X-Received: by 2002:a17:906:31cf:: with SMTP id
 f15mr24774233ejf.272.1631711659461; 
 Wed, 15 Sep 2021 06:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGx1iKfJAV1iZ9k4R1rPMLOWa4JNqnaSyvdsIlXHx/TO/17QrrkTfTFE0dbsSanw8jx3mWJw==
X-Received: by 2002:a17:906:31cf:: with SMTP id
 f15mr24774188ejf.272.1631711659115; 
 Wed, 15 Sep 2021 06:14:19 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id e22sm7419235edu.35.2021.09.15.06.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:14:18 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:14:15 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jemele@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 04/16] mt76: mt7921: refactor init.c to be bus
 independent
Message-ID: <YUHxpwccPHlVQSsW@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <210a8cd3ab6698401b55a3268719d194cc96e0b5.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <210a8cd3ab6698401b55a3268719d194cc96e0b5.1631667941.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_061428_505553_5C44A371 
X-CRM114-Status: GOOD (  20.09  )
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
Content-Type: multipart/mixed; boundary="===============5782202591061841517=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5782202591061841517==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l6W5gynAvom1fuO+"
Content-Disposition: inline

--l6W5gynAvom1fuO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> This is a preliminary patch to introduce mt7921s support.
>=20
> Make init.c reusable between mt7921s and mt7921e
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7921/Makefile    |  4 +--
>  .../net/wireless/mediatek/mt76/mt7921/dma.c   |  8 ++++++
>  .../net/wireless/mediatek/mt76/mt7921/init.c  | 28 +------------------
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  3 ++
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  5 ++++
>  .../wireless/mediatek/mt76/mt7921/pci_init.c  | 26 +++++++++++++++++
>  6 files changed, 45 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci_init.c
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers=
/net/wireless/mediatek/mt76/mt7921/Makefile
> index 4cb0b000cfe1..15f940a23ea9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> @@ -4,6 +4,6 @@ obj-$(CONFIG_MT7921E) +=3D mt7921e.o
> =20
>  CFLAGS_trace.o :=3D -I$(src)
> =20
> -mt7921e-y :=3D pci.o pci_mac.o pci_mcu.o mac.o mcu.o dma.o eeprom.o main=
.o \
> -=09     init.o debugfs.o trace.o
> +mt7921e-y :=3D pci.o pci_mac.o pci_mcu.o pci_init.o mac.o mcu.o dma.o \
> +=09     eeprom.o main.o init.o debugfs.o trace.o
>  mt7921e-$(CONFIG_NL80211_TESTMODE) +=3D testmode.o
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/dma.c
> index d3e2036a1974..be24241fb8e6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> @@ -313,6 +313,11 @@ int mt7921_wpdma_reset(struct mt7921_dev *dev, bool =
force)
>  =09return 0;
>  }
> =20
> +int mt7921e_init_reset(struct mt7921_dev *dev)
> +{
> +=09return mt7921_wpdma_reset(dev, true);
> +}

it seems used only in pci.c, right? maybe you can move it there and make it
static.

> +
>  int mt7921_wpdma_reinit_cond(struct mt7921_dev *dev)
>  {
>  =09struct mt76_connac_pm *pm =3D &dev->pm;
> @@ -343,6 +348,9 @@ int mt7921_dma_init(struct mt7921_dev *dev)
>  =09struct mt76_bus_ops *bus_ops;
>  =09int ret;
> =20
> +=09dev->phy.dev =3D dev;
> +=09dev->phy.mt76 =3D &dev->mt76.phy;
> +=09dev->mt76.phy.priv =3D &dev->phy;
>  =09dev->bus_ops =3D dev->mt76.bus;
>  =09bus_ops =3D devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops=
),
>  =09=09=09       GFP_KERNEL);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index 7c7a26102e11..f0fd32c424c6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -181,10 +181,6 @@ static int mt7921_init_hardware(struct mt7921_dev *d=
ev)
>  {
>  =09int ret, idx, i;
> =20
> -=09ret =3D mt7921_dma_init(dev);
> -=09if (ret)
> -=09=09return ret;
> -
>  =09set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
> =20
>  =09for (i =3D 0; i < MT7921_MCU_INIT_RETRY_COUNT; i++) {
> @@ -192,7 +188,7 @@ static int mt7921_init_hardware(struct mt7921_dev *de=
v)
>  =09=09if (!ret)
>  =09=09=09break;
> =20
> -=09=09mt7921_wpdma_reset(dev, true);
> +=09=09mt7921_init_reset(dev);
>  =09}
> =20
>  =09if (i =3D=3D MT7921_MCU_INIT_RETRY_COUNT) {
> @@ -289,25 +285,3 @@ int mt7921_register_device(struct mt7921_dev *dev)
> =20
>  =09return 0;
>  }
> -
> -void mt7921_unregister_device(struct mt7921_dev *dev)
> -{
> -=09int i;
> -=09struct mt76_connac_pm *pm =3D &dev->pm;
> -
> -=09mt76_unregister_device(&dev->mt76);
> -=09mt76_for_each_q_rx(&dev->mt76, i)
> -=09=09napi_disable(&dev->mt76.napi[i]);
> -=09cancel_delayed_work_sync(&pm->ps_work);
> -=09cancel_work_sync(&pm->wake_work);
> -
> -=09mt7921_tx_token_put(dev);
> -=09mt7921_mcu_drv_pmctrl(dev);
> -=09mt7921_dma_cleanup(dev);
> -=09mt7921_wfsys_reset(dev);
> -=09mt7921_mcu_exit(dev);
> -=09mt7921_mcu_fw_pmctrl(dev);
> -
> -=09tasklet_disable(&dev->irq_tasklet);
> -=09mt76_free_device(&dev->mt76);
> -}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index dbace154bfa5..60f4552cb212 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -133,11 +133,13 @@ struct mt7921_phy {
>  =09struct delayed_work scan_work;
>  };
> =20
> +#define mt7921_init_reset(dev)=09((dev)->hif_ops->init_reset(dev))
>  #define mt7921_dev_reset(dev)=09((dev)->hif_ops->reset(dev))
>  #define mt7921_mcu_init(dev)=09((dev)->hif_ops->mcu_init(dev))
>  #define mt7921_drv_own(dev)=09((dev)->hif_ops->drv_own(dev))
>  #define mt7921_fw_own(dev)=09((dev)->hif_ops->fw_own(dev))
>  struct mt7921_hif_ops {
> +=09int (*init_reset)(struct mt7921_dev *dev);
>  =09int (*reset)(struct mt7921_dev *dev);
>  =09int (*mcu_init)(struct mt7921_dev *dev);
>  =09int (*drv_own)(struct mt7921_dev *dev);
> @@ -394,5 +396,6 @@ int mt7921e_mac_reset(struct mt7921_dev *dev);
>  int mt7921e_mcu_init(struct mt7921_dev *dev);
>  int mt7921e_mcu_drv_pmctrl(struct mt7921_dev *dev);
>  int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev);
> +int mt7921e_init_reset(struct mt7921_dev *dev);
> =20
>  #endif
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index b16bcee08cd7..f6bc3505b06a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -116,6 +116,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  =09};
> =20
>  =09static const struct mt7921_hif_ops mt7921_pcie_ops =3D {
> +=09=09.init_reset =3D mt7921e_init_reset,
>  =09=09.reset =3D mt7921e_mac_reset,
>  =09=09.mcu_init =3D mt7921e_mcu_init,
>  =09=09.drv_own =3D mt7921e_mcu_drv_pmctrl,
> @@ -172,6 +173,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  =09if (ret)
>  =09=09goto err_free_dev;
> =20
> +=09ret =3D mt7921_dma_init(dev);
> +=09if (ret)
> +=09=09goto err_free_irq;
> +
>  =09ret =3D mt7921_register_device(dev);
>  =09if (ret)
>  =09=09goto err_free_irq;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_init.c b/drive=
rs/net/wireless/mediatek/mt76/mt7921/pci_init.c
> new file mode 100644
> index 000000000000..4511fec79d43
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_init.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: ISC
> +/* Copyright (C) 2021 MediaTek Inc. */
> +
> +#include "mt7921.h"
> +
> +void mt7921_unregister_device(struct mt7921_dev *dev)

same here, we have pci_init.c just for mt7921_unregister_device(). Just mov=
e it
in pci.c and call it mt7921e_unregister_device(). Agree?

Regards,
Lorenzo

> +{
> +=09int i;
> +=09struct mt76_connac_pm *pm =3D &dev->pm;
> +
> +=09mt76_unregister_device(&dev->mt76);
> +=09mt76_for_each_q_rx(&dev->mt76, i)
> +=09=09napi_disable(&dev->mt76.napi[i]);
> +=09cancel_delayed_work_sync(&pm->ps_work);
> +=09cancel_work_sync(&pm->wake_work);
> +
> +=09mt7921_tx_token_put(dev);
> +=09mt7921_mcu_drv_pmctrl(dev);
> +=09mt7921_dma_cleanup(dev);
> +=09mt7921_wfsys_reset(dev);
> +=09mt7921_mcu_exit(dev);
> +=09mt7921_mcu_fw_pmctrl(dev);
> +
> +=09tasklet_disable(&dev->irq_tasklet);
> +=09mt76_free_device(&dev->mt76);
> +}
> --=20
> 2.25.1
>=20

--l6W5gynAvom1fuO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUHxpQAKCRA6cBh0uS2t
rDmnAQDCmHAzM70Z+T2x7lXFoKgbZTPqyKksD3JLDwd0pyX3JgD+PyMyzRR1t1ZI
WgufDx7pI+wfZpgyWC4/ZHf7/qaGvgg=
=75s1
-----END PGP SIGNATURE-----

--l6W5gynAvom1fuO+--



--===============5782202591061841517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5782202591061841517==--


