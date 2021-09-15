Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2007C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:21:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F216121F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94F216121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ha80gyD6dpfnR8IQ+G4pz7K9DslU1KqZpeLofwgHZII=; b=Ot89wGwstIs9Prgb283Us8Ew4E
	ZoTK0ZkoLzu0JO6i0U7tjkMWhUOo2w8NVuFj0Y2giVy/1Md8+47VN+7KLR3elpVAJd+fdthzamwj7
	eySqV5xuNzJK4ynveyXrY7hFpz6FAENtgpDO8TDHDce+QPbBv5AhxXfgq2ET6P6Xa1Tel3HHq1m4K
	pCirU5sp7mlBNjG047TJVM5rFY7tsbLvppVIz2eSUFD15dfoKJFOgxpru2G8DiV3M0rPj98M831/2
	IKfMURSO26x0eB7tqCdOrDgfA39Ig5TDfb8RicySF01ZWuYV58q2GXQyJ3OMA9eVi11dgYWm5qyBM
	K/LQ73NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQUqg-0099T7-Tx; Wed, 15 Sep 2021 13:21:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQUqS-0099MP-7p
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631712059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ovxt4dpgXE3vNkmjSaA4/rH94adfu1N7H2IL7g/GkdE=;
 b=QxxXHqGV6dFJmhLnCXoHc+7o+TjTKurpClRnG9S+vtzAqJ89gClHOeIVzd2RdRrIyqX1c0
 8R2K+JZRGWOXu0vR0rrf4ceHmdKUlyyfb3f2GRvNaqBWJYODZmhZU+YI5RpDnorNZJ1MIC
 pRQlABDk+7/DadNPDElCheWCi3TN+Ts=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-lNUGolgSP5Sm5KzfolJ3qQ-1; Wed, 15 Sep 2021 09:20:57 -0400
X-MC-Unique: lNUGolgSP5Sm5KzfolJ3qQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 g18-20020a17090670d200b005f0df5ce29bso1527044ejk.1
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aa9FiGBy/D3+nHBLbwbW+mz7AL2yFPv/Gw+jeR+72Kw=;
 b=rm1JslJOA6qu4+bJRe+E+7h0l5CJCimGuKnIOOC/pvW6T1GFOf7Q8sBo9aH1Ie0GVU
 gXPAIdmp4sJkK75rb9WfW6t1nM2fdJXLeMtb81GtkSAz7vJaruk7BkEI12YOkabX6mW0
 M61Cuy+a2WCr67NY+xkAmZ4ZrHdF8lawkjr52YQwkNmsW1iVnKzpheFMudKxVpnMVlms
 s39BxQcKnM5TQjAwjHbadIBELmgRrmkTGlGHsHKXPxic02J35/LgBJlWPW7/zim1Q/lA
 lmGiv8PpsUFZIu41v+ecx19OCk/5CZjzuAWn0A1+ccfh6qlK+0xWtK7OvnDTxEeb2eFq
 H54A==
X-Gm-Message-State: AOAM532jhNMG1sUGVbQ82aee27oDvEdkvGgmxVKB5/CEZFWyYW4x+qdq
 QIZLdVNzzBeyoTt/bmkCjO0qNjY0QsLz+C3374WWCMmyfnZIiCxlt38WSKg4xFG1LWg6Laf2D4y
 rNjFMF/jJ76f2z2sHc9HnuNo1EUclrMz2
X-Received: by 2002:a17:906:4c8c:: with SMTP id
 q12mr25055439eju.254.1631712056366; 
 Wed, 15 Sep 2021 06:20:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPuW/ApqpdN3SHwTWOtxOQtOm1uDVBTBuelf/gF9m/waxJzg6EQFdPf97709RLdh2PPAtmAQ==
X-Received: by 2002:a17:906:4c8c:: with SMTP id
 q12mr25055405eju.254.1631712055962; 
 Wed, 15 Sep 2021 06:20:55 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id ky7sm1255656ejc.75.2021.09.15.06.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:20:55 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:20:52 +0200
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
Subject: Re: [PATCH v1 07/16] mt76: connac: move sdio utility routines in
 mt76_connac_sdio module
Message-ID: <YUHzNMibE1IVniE7@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <9933b221edd43802b67b6d8893737db62a3aea60.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9933b221edd43802b67b6d8893737db62a3aea60.1631667941.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_062100_517411_7C9A5A23 
X-CRM114-Status: GOOD (  22.45  )
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
Content-Type: multipart/mixed; boundary="===============3213028058729195941=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3213028058729195941==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4mVMvcy2JhSq7fYf"
Content-Disposition: inline

--4mVMvcy2JhSq7fYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 15, Sean Wang wrote:
> From: Sean Wang <sean.wang@mediatek.com>
>=20
> This is a preliminary patch before introduce mt7921s support to hold the
> common sdio utilities between mt7663s and mt7921s in mt76_connac_sdio
> module.
>=20
> mt76/mt76_connac_sdio.c, mt76/mt76_connac_sdio.h and
> mt76/mt76_connac_sdio_txrx.c originate from mt7615/sdio.c, mt7615/sdio.h
> and mt7615/sdio_txrx.c and the patch don't add any logic change.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/Kconfig    |   5 +
>  drivers/net/wireless/mediatek/mt76/Makefile   |   2 +
>  .../wireless/mediatek/mt76/mt76_connac_sdio.c | 317 +++++++++++++++++
>  .../wireless/mediatek/mt76/mt76_connac_sdio.h | 137 ++++++++
>  .../mediatek/mt76/mt76_connac_sdio_txrx.c     | 318 ++++++++++++++++++
>  5 files changed, 779 insertions(+)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_t=
xrx.c
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wir=
eless/mediatek/mt76/Kconfig
> index 9ff43f1fc50d..a6b388bfb563 100644
> --- a/drivers/net/wireless/mediatek/mt76/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/Kconfig
> @@ -28,6 +28,11 @@ config MT76_CONNAC_LIB
>  =09tristate
>  =09select MT76_CORE
> =20
> +config MT76_CONNAC_SDIO
> +=09tristate
> +=09depends on MMC
> +=09select MT76_CONNAC_LIB
> +
>  source "drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig"
>  source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
>  source "drivers/net/wireless/mediatek/mt76/mt7603/Kconfig"
> diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wi=
reless/mediatek/mt76/Makefile
> index 94efe3c29053..17b2ed93f6a3 100644
> --- a/drivers/net/wireless/mediatek/mt76/Makefile
> +++ b/drivers/net/wireless/mediatek/mt76/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_MT76_SDIO) +=3D mt76-sdio.o
>  obj-$(CONFIG_MT76x02_LIB) +=3D mt76x02-lib.o
>  obj-$(CONFIG_MT76x02_USB) +=3D mt76x02-usb.o
>  obj-$(CONFIG_MT76_CONNAC_LIB) +=3D mt76-connac-lib.o
> +obj-$(CONFIG_MT76_CONNAC_SDIO) +=3D mt76-connac-sdio.o
> =20
>  mt76-y :=3D \
>  =09mmio.o util.o trace.o dma.o mac80211.o debugfs.o eeprom.o \
> @@ -28,6 +29,7 @@ mt76x02-lib-y :=3D mt76x02_util.o mt76x02_mac.o mt76x02=
_mcu.o \
>  mt76x02-usb-y :=3D mt76x02_usb_mcu.o mt76x02_usb_core.o
> =20
>  mt76-connac-lib-y :=3D mt76_connac_mcu.o mt76_connac_mac.o
> +mt76-connac-sdio-y :=3D mt76_connac_sdio.o mt76_connac_sdio_txrx.o
> =20
>  obj-$(CONFIG_MT76x0_COMMON) +=3D mt76x0/
>  obj-$(CONFIG_MT76x2_COMMON) +=3D mt76x2/
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.c b/driv=
ers/net/wireless/mediatek/mt76/mt76_connac_sdio.c
> new file mode 100644
> index 000000000000..d18a66e5445f
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.c
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: ISC
> +/* Copyright (C) 2020-2021 MediaTek Inc.
> + *
> + * Author: Felix Fietkau <nbd@nbd.name>
> + *=09   Lorenzo Bianconi <lorenzo@kernel.org>
> + *=09   Sean Wang <sean.wang@mediatek.com>
> + */
> +
> +#include <linux/iopoll.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/sdio_func.h>
> +
> +#include "mt76.h"
> +#include "mt76_connac_mcu.h"
> +#include "mt76_connac_sdio.h"
> +
> +static u32 mt76_connac_sdio_read_whisr(struct mt76_dev *dev)
> +{
> +=09return sdio_readl(dev->sdio.func, MCR_WHISR, NULL);
> +}
> +
> +u32 mt76_connac_sdio_read_pcr(struct mt76_dev *dev)
> +{
> +=09struct mt76_sdio *sdio =3D &dev->sdio;
> +
> +=09return sdio_readl(sdio->func, MCR_WHLPCR, NULL);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_read_pcr);
> +
> +u32 mt76_connac_sdio_read_mailbox(struct mt76_dev *dev, u32 offset)
> +{
> +=09struct sdio_func *func =3D dev->sdio.func;
> +=09u32 val =3D ~0, status;
> +=09int err;
> +
> +=09sdio_claim_host(func);
> +
> +=09sdio_writel(func, offset, MCR_H2DSM0R, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed setting address [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09sdio_writel(func, H2D_SW_INT_READ, MCR_WSICR, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed setting read mode [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09err =3D readx_poll_timeout(mt76_connac_sdio_read_whisr, dev, status,
> +=09=09=09=09 status & H2D_SW_INT_READ, 0, 1000000);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "query whisr timeout\n");
> +=09=09goto out;
> +=09}
> +
> +=09sdio_writel(func, H2D_SW_INT_READ, MCR_WHISR, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed setting read mode [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09val =3D sdio_readl(func, MCR_H2DSM0R, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed reading h2dsm0r [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09if (val !=3D offset) {
> +=09=09dev_err(dev->dev, "register mismatch\n");
> +=09=09val =3D ~0;
> +=09=09goto out;
> +=09}
> +
> +=09val =3D sdio_readl(func, MCR_D2HRM1R, &err);
> +=09if (err < 0)
> +=09=09dev_err(dev->dev, "failed reading d2hrm1r [err=3D%d]\n", err);
> +
> +out:
> +=09sdio_release_host(func);
> +
> +=09return val;
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_read_mailbox);
> +
> +void mt76_connac_sdio_write_mailbox(struct mt76_dev *dev, u32 offset, u3=
2 val)
> +{
> +=09struct sdio_func *func =3D dev->sdio.func;
> +=09u32 status;
> +=09int err;
> +
> +=09sdio_claim_host(func);
> +
> +=09sdio_writel(func, offset, MCR_H2DSM0R, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed setting address [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09sdio_writel(func, val, MCR_H2DSM1R, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev,
> +=09=09=09"failed setting write value [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09sdio_writel(func, H2D_SW_INT_WRITE, MCR_WSICR, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed setting write mode [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09err =3D readx_poll_timeout(mt76_connac_sdio_read_whisr, dev, status,
> +=09=09=09=09 status & H2D_SW_INT_WRITE, 0, 1000000);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "query whisr timeout\n");
> +=09=09goto out;
> +=09}
> +
> +=09sdio_writel(func, H2D_SW_INT_WRITE, MCR_WHISR, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed setting write mode [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09val =3D sdio_readl(func, MCR_H2DSM0R, &err);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "failed reading h2dsm0r [err=3D%d]\n", err);
> +=09=09goto out;
> +=09}
> +
> +=09if (val !=3D offset)
> +=09=09dev_err(dev->dev, "register mismatch\n");
> +
> +out:
> +=09sdio_release_host(func);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_write_mailbox);
> +
> +u32 mt76_connac_sdio_rr(struct mt76_dev *dev, u32 offset)
> +{
> +=09if (test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state))
> +=09=09return mt76_connac_mcu_reg_rr(dev, offset);
> +=09else
> +=09=09return mt76_connac_sdio_read_mailbox(dev, offset);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_rr);
> +
> +void mt76_connac_sdio_wr(struct mt76_dev *dev, u32 offset, u32 val)
> +{
> +=09if (test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state))
> +=09=09mt76_connac_mcu_reg_wr(dev, offset, val);
> +=09else
> +=09=09mt76_connac_sdio_write_mailbox(dev, offset, val);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_wr);
> +
> +u32 mt76_connac_sdio_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32=
 val)
> +{
> +=09val |=3D mt76_connac_sdio_rr(dev, offset) & ~mask;
> +=09mt76_connac_sdio_wr(dev, offset, val);
> +
> +=09return val;
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_rmw);
> +
> +void mt76_connac_sdio_write_copy(struct mt76_dev *dev, u32 offset,
> +=09=09=09=09 const void *data, int len)
> +{
> +=09const u32 *val =3D data;
> +=09int i;
> +
> +=09for (i =3D 0; i < len / sizeof(u32); i++) {
> +=09=09mt76_connac_sdio_wr(dev, offset, val[i]);
> +=09=09offset +=3D sizeof(u32);
> +=09}
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_write_copy);
> +
> +void mt76_connac_sdio_read_copy(struct mt76_dev *dev, u32 offset,
> +=09=09=09=09void *data, int len)
> +{
> +=09u32 *val =3D data;
> +=09int i;
> +
> +=09for (i =3D 0; i < len / sizeof(u32); i++) {
> +=09=09val[i] =3D mt76_connac_sdio_rr(dev, offset);
> +=09=09offset +=3D sizeof(u32);
> +=09}
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_read_copy);
> +
> +int mt76_connac_sdio_wr_rp(struct mt76_dev *dev, u32 base,
> +=09=09=09   const struct mt76_reg_pair *data,
> +=09=09=09   int len)
> +{
> +=09int i;
> +
> +=09for (i =3D 0; i < len; i++) {
> +=09=09mt76_connac_sdio_wr(dev, data->reg, data->value);
> +=09=09data++;
> +=09}
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_wr_rp);
> +
> +int mt76_connac_sdio_rd_rp(struct mt76_dev *dev, u32 base,
> +=09=09=09   struct mt76_reg_pair *data,
> +=09=09=09   int len)
> +{
> +=09int i;
> +
> +=09for (i =3D 0; i < len; i++) {
> +=09=09data->value =3D mt76_connac_sdio_rr(dev, data->reg);
> +=09=09data++;
> +=09}
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_rd_rp);
> +
> +int mt76_connac_sdio_hw_init(struct mt76_dev *dev, struct sdio_func *fun=
c,
> +=09=09=09     sdio_irq_handler_t *irq_handler)
> +{
> +=09u32 status, ctrl;
> +=09int ret;
> +
> +=09sdio_claim_host(func);
> +
> +=09ret =3D sdio_enable_func(func);
> +=09if (ret < 0)
> +=09=09goto release;
> +
> +=09/* Get ownership from the device */
> +=09sdio_writel(func, WHLPCR_INT_EN_CLR | WHLPCR_FW_OWN_REQ_CLR,
> +=09=09    MCR_WHLPCR, &ret);
> +=09if (ret < 0)
> +=09=09goto disable_func;
> +
> +=09ret =3D readx_poll_timeout(mt76_connac_sdio_read_pcr, dev, status,
> +=09=09=09=09 status & WHLPCR_IS_DRIVER_OWN, 2000, 1000000);
> +=09if (ret < 0) {
> +=09=09dev_err(dev->dev, "Cannot get ownership from device");
> +=09=09goto disable_func;
> +=09}
> +
> +=09ret =3D sdio_set_block_size(func, 512);
> +=09if (ret < 0)
> +=09=09goto disable_func;
> +
> +=09/* Enable interrupt */
> +=09sdio_writel(func, WHLPCR_INT_EN_SET, MCR_WHLPCR, &ret);
> +=09if (ret < 0)
> +=09=09goto disable_func;
> +
> +=09ctrl =3D WHIER_RX0_DONE_INT_EN | WHIER_TX_DONE_INT_EN;
> +=09sdio_writel(func, ctrl, MCR_WHIER, &ret);
> +=09if (ret < 0)
> +=09=09goto disable_func;
> +
> +=09/* set WHISR as read clear and Rx aggregation number as 16 */
> +=09ctrl =3D FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
> +=09sdio_writel(func, ctrl, MCR_WHCR, &ret);
> +=09if (ret < 0)
> +=09=09goto disable_func;
> +
> +=09ret =3D sdio_claim_irq(func, irq_handler);

The only difference between mt7921s_irq and mt7663s_irq is the RESET check,
right? Maybe we just need to add the same check for mt7663s_irq and move th=
e
routine here?

> +=09if (ret < 0)
> +=09=09goto disable_func;
> +
> +=09sdio_release_host(func);
> +
> +=09return 0;
> +
> +disable_func:
> +=09sdio_disable_func(func);
> +release:
> +=09sdio_release_host(func);
> +
> +=09return ret;
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_hw_init);
> +
> +int mt76_connac_sdio_init(struct mt76_dev *dev,
> +=09=09=09  void (*txrx_worker)(struct mt76_worker *))
> +{
> +=09int i, ret;
> +
> +=09dev->sdio.intr_data =3D devm_kmalloc(dev->dev,
> +=09=09=09=09=09   sizeof(struct mt76s_intr),
> +=09=09=09=09=09   GFP_KERNEL);
> +=09if (!dev->sdio.intr_data)
> +=09=09return -ENOMEM;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(dev->sdio.xmit_buf); i++) {
> +=09=09dev->sdio.xmit_buf[i] =3D devm_kmalloc(dev->dev,
> +=09=09=09=09=09=09     MT76S_XMIT_BUF_SZ,
> +=09=09=09=09=09=09     GFP_KERNEL);
> +=09=09if (!dev->sdio.xmit_buf[i])
> +=09=09=09return -ENOMEM;
> +=09}
> +
> +=09ret =3D mt76_worker_setup(dev->hw, &dev->sdio.txrx_worker, txrx_worke=
r,
> +=09=09=09=09"sdio-txrx");

Same here, I guess we can move mt7921s_txrx_worker here and share it with
mt7663s

> +=09if (ret)
> +=09=09return ret;
> +
> +=09sched_set_fifo_low(dev->sdio.txrx_worker.task);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_init);
> +
> +MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
> +MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.h b/driv=
ers/net/wireless/mediatek/mt76/mt76_connac_sdio.h
> new file mode 100644
> index 000000000000..e176d6e562b2
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: ISC */
> +/* Copyright (C) 2020-2021 MediaTek Inc.
> + *
> + * Author: Sean Wang <sean.wang@mediatek.com>
> + */
> +
> +#ifndef __MT76_CONNAC_SDIO_H
> +#define __MT76_CONNAC_SDIO_H
> +
> +#define MT_PSE_PAGE_SZ=09=09=09128
> +
> +#define MCR_WCIR=09=09=090x0000
> +#define MCR_WHLPCR=09=09=090x0004
> +#define WHLPCR_FW_OWN_REQ_CLR=09=09BIT(9)
> +#define WHLPCR_FW_OWN_REQ_SET=09=09BIT(8)
> +#define WHLPCR_IS_DRIVER_OWN=09=09BIT(8)
> +#define WHLPCR_INT_EN_CLR=09=09BIT(1)
> +#define WHLPCR_INT_EN_SET=09=09BIT(0)
> +
> +#define MCR_WSDIOCSR=09=09=090x0008
> +#define MCR_WHCR=09=09=090x000C
> +#define W_INT_CLR_CTRL=09=09=09BIT(1)
> +#define RECV_MAILBOX_RD_CLR_EN=09=09BIT(2)
> +#define MAX_HIF_RX_LEN_NUM=09=09GENMASK(13, 8)
> +#define RX_ENHANCE_MODE=09=09=09BIT(16)
> +
> +#define MCR_WHISR=09=09=090x0010
> +#define MCR_WHIER=09=09=090x0014
> +#define WHIER_D2H_SW_INT=09=09GENMASK(31, 8)
> +#define WHIER_FW_OWN_BACK_INT_EN=09BIT(7)
> +#define WHIER_ABNORMAL_INT_EN=09=09BIT(6)
> +#define WHIER_RX1_DONE_INT_EN=09=09BIT(2)
> +#define WHIER_RX0_DONE_INT_EN=09=09BIT(1)
> +#define WHIER_TX_DONE_INT_EN=09=09BIT(0)
> +#define WHIER_DEFAULT=09=09=09(WHIER_RX0_DONE_INT_EN=09| \
> +=09=09=09=09=09 WHIER_RX1_DONE_INT_EN=09| \
> +=09=09=09=09=09 WHIER_TX_DONE_INT_EN=09| \
> +=09=09=09=09=09 WHIER_ABNORMAL_INT_EN=09| \
> +=09=09=09=09=09 WHIER_D2H_SW_INT)
> +
> +#define MCR_WASR=09=09=090x0020
> +#define MCR_WSICR=09=09=090x0024
> +#define MCR_WTSR0=09=09=090x0028
> +#define TQ0_CNT=09=09=09=09GENMASK(7, 0)
> +#define TQ1_CNT=09=09=09=09GENMASK(15, 8)
> +#define TQ2_CNT=09=09=09=09GENMASK(23, 16)
> +#define TQ3_CNT=09=09=09=09GENMASK(31, 24)
> +
> +#define MCR_WTSR1=09=09=090x002c
> +#define TQ4_CNT=09=09=09=09GENMASK(7, 0)
> +#define TQ5_CNT=09=09=09=09GENMASK(15, 8)
> +#define TQ6_CNT=09=09=09=09GENMASK(23, 16)
> +#define TQ7_CNT=09=09=09=09GENMASK(31, 24)
> +
> +#define MCR_WTDR1=09=09=090x0034
> +#define MCR_WRDR0=09=09=090x0050
> +#define MCR_WRDR1=09=09=090x0054
> +#define MCR_WRDR(p)=09=09=09(0x0050 + 4 * (p))
> +#define MCR_H2DSM0R=09=09=090x0070
> +#define H2D_SW_INT_READ=09=09=09BIT(16)
> +#define H2D_SW_INT_WRITE=09=09BIT(17)
> +
> +#define MCR_H2DSM1R=09=09=090x0074
> +#define MCR_D2HRM0R=09=09=090x0078
> +#define MCR_D2HRM1R=09=09=090x007c
> +#define MCR_D2HRM2R=09=09=090x0080
> +#define MCR_WRPLR=09=09=090x0090
> +#define RX0_PACKET_LENGTH=09=09GENMASK(15, 0)
> +#define RX1_PACKET_LENGTH=09=09GENMASK(31, 16)
> +
> +#define MCR_WTMDR=09=09=090x00b0
> +#define MCR_WTMCR=09=09=090x00b4
> +#define MCR_WTMDPCR0=09=09=090x00b8
> +#define MCR_WTMDPCR1=09=09=090x00bc
> +#define MCR_WPLRCR=09=09=090x00d4
> +#define MCR_WSR=09=09=09=090x00D8
> +#define MCR_CLKIOCR=09=09=090x0100
> +#define MCR_CMDIOCR=09=09=090x0104
> +#define MCR_DAT0IOCR=09=09=090x0108
> +#define MCR_DAT1IOCR=09=09=090x010C
> +#define MCR_DAT2IOCR=09=09=090x0110
> +#define MCR_DAT3IOCR=09=09=090x0114
> +#define MCR_CLKDLYCR=09=09=090x0118
> +#define MCR_CMDDLYCR=09=09=090x011C
> +#define MCR_ODATDLYCR=09=09=090x0120
> +#define MCR_IDATDLYCR1=09=09=090x0124
> +#define MCR_IDATDLYCR2=09=09=090x0128
> +#define MCR_ILCHCR=09=09=090x012C
> +#define MCR_WTQCR0=09=09=090x0130
> +#define MCR_WTQCR1=09=09=090x0134
> +#define MCR_WTQCR2=09=09=090x0138
> +#define MCR_WTQCR3=09=09=090x013C
> +#define MCR_WTQCR4=09=09=090x0140
> +#define MCR_WTQCR5=09=09=090x0144
> +#define MCR_WTQCR6=09=09=090x0148
> +#define MCR_WTQCR7=09=09=090x014C
> +#define MCR_WTQCR(x)                   (0x130 + 4 * (x))
> +#define TXQ_CNT_L=09=09=09GENMASK(15, 0)
> +#define TXQ_CNT_H=09=09=09GENMASK(31, 16)
> +
> +#define MCR_SWPCDBGR=09=09=090x0154
> +
> +struct mt76s_intr {
> +=09u32 isr;
> +=09struct {
> +=09=09u32 wtqcr[8];
> +=09} tx;
> +=09struct {
> +=09=09u16 num[2];
> +=09=09u16 len[2][16];
> +=09} rx;
> +=09u32 rec_mb[2];
> +} __packed;
> +
> +u32 mt76_connac_sdio_read_pcr(struct mt76_dev *dev);
> +u32 mt76_connac_sdio_read_mailbox(struct mt76_dev *dev, u32 offset);
> +void mt76_connac_sdio_write_mailbox(struct mt76_dev *dev, u32 offset, u3=
2 val);
> +u32 mt76_connac_sdio_rr(struct mt76_dev *dev, u32 offset);
> +void mt76_connac_sdio_wr(struct mt76_dev *dev, u32 offset, u32 val);
> +u32 mt76_connac_sdio_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32=
 val);
> +void mt76_connac_sdio_write_copy(struct mt76_dev *dev, u32 offset,
> +=09=09=09=09 const void *data, int len);
> +void mt76_connac_sdio_read_copy(struct mt76_dev *dev, u32 offset,
> +=09=09=09=09void *data, int len);
> +int mt76_connac_sdio_wr_rp(struct mt76_dev *dev, u32 base,
> +=09=09=09   const struct mt76_reg_pair *data,
> +=09=09=09   int len);
> +int mt76_connac_sdio_rd_rp(struct mt76_dev *dev, u32 base,
> +=09=09=09   struct mt76_reg_pair *data,
> +=09=09=09   int len);
> +
> +void mt76_connac_sdio_txrx(struct mt76_dev *dev);
> +int mt76_connac_sdio_hw_init(struct mt76_dev *dev, struct sdio_func *fun=
c,
> +=09=09=09     sdio_irq_handler_t *irq_handler);
> +int mt76_connac_sdio_init(struct mt76_dev *dev,
> +=09=09=09  void (*txrx_worker)(struct mt76_worker *));
> +#endif
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_txrx.c b=
/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_txrx.c
> new file mode 100644
> index 000000000000..3ef42f90f3f5
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_txrx.c
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: ISC
> +/* Copyright (C) 2020-2021 MediaTek Inc.
> + *
> + * Author: Felix Fietkau <nbd@nbd.name>
> + *=09   Lorenzo Bianconi <lorenzo@kernel.org>
> + *=09   Sean Wang <sean.wang@mediatek.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/sdio_ids.h>
> +#include <linux/mmc/sdio_func.h>
> +
> +#include "trace.h"
> +#include "mt76.h"
> +#include "mt76_connac_sdio.h"
> +
> +static int mt76_connac_sdio_refill_sched_quota(struct mt76_dev *dev, u32=
 *data)
> +{
> +=09u32 ple_ac_data_quota[] =3D {
> +=09=09FIELD_GET(TXQ_CNT_L, data[4]), /* VO */
> +=09=09FIELD_GET(TXQ_CNT_H, data[3]), /* VI */
> +=09=09FIELD_GET(TXQ_CNT_L, data[3]), /* BE */
> +=09=09FIELD_GET(TXQ_CNT_H, data[2]), /* BK */
> +=09};
> +=09u32 pse_ac_data_quota[] =3D {
> +=09=09FIELD_GET(TXQ_CNT_H, data[1]), /* VO */
> +=09=09FIELD_GET(TXQ_CNT_L, data[1]), /* VI */
> +=09=09FIELD_GET(TXQ_CNT_H, data[0]), /* BE */
> +=09=09FIELD_GET(TXQ_CNT_L, data[0]), /* BK */
> +=09};
> +=09u32 pse_mcu_quota =3D FIELD_GET(TXQ_CNT_L, data[2]);
> +=09u32 pse_data_quota =3D 0, ple_data_quota =3D 0;
> +=09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(pse_ac_data_quota); i++) {
> +=09=09pse_data_quota +=3D pse_ac_data_quota[i];
> +=09=09ple_data_quota +=3D ple_ac_data_quota[i];
> +=09}
> +
> +=09if (!pse_data_quota && !ple_data_quota && !pse_mcu_quota)
> +=09=09return 0;
> +
> +=09sdio->sched.pse_mcu_quota +=3D pse_mcu_quota;
> +=09sdio->sched.pse_data_quota +=3D pse_data_quota;
> +=09sdio->sched.ple_data_quota +=3D ple_data_quota;
> +
> +=09return pse_data_quota + ple_data_quota + pse_mcu_quota;
> +}
> +
> +static struct sk_buff *mt76_connac_sdio_build_rx_skb(void *data, int dat=
a_len,
> +=09=09=09=09=09=09     int buf_len)
> +{
> +=09int len =3D min_t(int, data_len, MT_SKB_HEAD_LEN);
> +=09struct sk_buff *skb;
> +
> +=09skb =3D alloc_skb(len, GFP_KERNEL);
> +=09if (!skb)
> +=09=09return NULL;
> +
> +=09skb_put_data(skb, data, len);
> +=09if (data_len > len) {
> +=09=09struct page *page;
> +
> +=09=09data +=3D len;
> +=09=09page =3D virt_to_head_page(data);
> +=09=09skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
> +=09=09=09=09page, data - page_address(page),
> +=09=09=09=09data_len - len, buf_len);
> +=09=09get_page(page);
> +=09}
> +
> +=09return skb;
> +}
> +
> +static int mt76_connac_sdio_rx_run_queue(struct mt76_dev *dev,
> +=09=09=09=09=09 enum mt76_rxq_id qid,
> +=09=09=09=09=09 struct mt76s_intr *intr)
> +{
> +=09struct mt76_queue *q =3D &dev->q_rx[qid];
> +=09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09int len =3D 0, err, i;
> +=09struct page *page;
> +=09u8 *buf;
> +
> +=09for (i =3D 0; i < intr->rx.num[qid]; i++)
> +=09=09len +=3D round_up(intr->rx.len[qid][i] + 4, 4);
> +
> +=09if (!len)
> +=09=09return 0;
> +
> +=09if (len > sdio->func->cur_blksize)
> +=09=09len =3D roundup(len, sdio->func->cur_blksize);
> +
> +=09page =3D __dev_alloc_pages(GFP_KERNEL, get_order(len));
> +=09if (!page)
> +=09=09return -ENOMEM;
> +
> +=09buf =3D page_address(page);
> +
> +=09err =3D sdio_readsb(sdio->func, buf, MCR_WRDR(qid), len);
> +=09if (err < 0) {
> +=09=09dev_err(dev->dev, "sdio read data failed:%d\n", err);
> +=09=09put_page(page);
> +=09=09return err;
> +=09}
> +
> +=09for (i =3D 0; i < intr->rx.num[qid]; i++) {
> +=09=09int index =3D (q->head + i) % q->ndesc;
> +=09=09struct mt76_queue_entry *e =3D &q->entry[index];
> +
> +=09=09len =3D intr->rx.len[qid][i];
> +=09=09e->skb =3D mt76_connac_sdio_build_rx_skb(buf, len,
> +=09=09=09=09=09=09       round_up(len + 4, 4));
> +=09=09if (!e->skb)
> +=09=09=09break;
> +
> +=09=09buf +=3D round_up(len + 4, 4);
> +=09=09if (q->queued + i + 1 =3D=3D q->ndesc)
> +=09=09=09break;
> +=09}
> +=09put_page(page);
> +
> +=09spin_lock_bh(&q->lock);
> +=09q->head =3D (q->head + i) % q->ndesc;
> +=09q->queued +=3D i;
> +=09spin_unlock_bh(&q->lock);
> +
> +=09return i;
> +}
> +
> +static int mt76_connac_sdio_rx_handler(struct mt76_dev *dev)
> +{
> +=09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09struct mt76s_intr *intr =3D sdio->intr_data;
> +=09int nframes =3D 0, ret;
> +
> +=09ret =3D sdio_readsb(sdio->func, intr, MCR_WHISR, sizeof(*intr));
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09trace_dev_irq(dev, intr->isr, 0);
> +
> +=09if (intr->isr & WHIER_RX0_DONE_INT_EN) {
> +=09=09ret =3D mt76_connac_sdio_rx_run_queue(dev, 0, intr);
> +=09=09if (ret > 0) {
> +=09=09=09mt76_worker_schedule(&sdio->net_worker);
> +=09=09=09nframes +=3D ret;
> +=09=09}
> +=09}
> +
> +=09if (intr->isr & WHIER_RX1_DONE_INT_EN) {
> +=09=09ret =3D mt76_connac_sdio_rx_run_queue(dev, 1, intr);
> +=09=09if (ret > 0) {
> +=09=09=09mt76_worker_schedule(&sdio->net_worker);
> +=09=09=09nframes +=3D ret;
> +=09=09}
> +=09}
> +
> +=09nframes +=3D !!mt76_connac_sdio_refill_sched_quota(dev, intr->tx.wtqc=
r);
> +
> +=09return nframes;
> +}
> +
> +static int mt76_connac_sdio_tx_pick_quota(struct mt76_sdio *sdio, bool m=
cu,
> +=09=09=09=09=09  int buf_sz, int *pse_size,
> +=09=09=09=09=09  int *ple_size)
> +{
> +=09int pse_sz;
> +
> +=09pse_sz =3D DIV_ROUND_UP(buf_sz + sdio->sched.deficit, MT_PSE_PAGE_SZ)=
;
> +
> +=09if (mcu) {
> +=09=09if (sdio->sched.pse_mcu_quota < *pse_size + pse_sz)
> +=09=09=09return -EBUSY;
> +=09} else {
> +=09=09if (sdio->sched.pse_data_quota < *pse_size + pse_sz ||
> +=09=09    sdio->sched.ple_data_quota < *ple_size + 1)
> +=09=09=09return -EBUSY;
> +
> +=09=09*ple_size =3D *ple_size + 1;
> +=09}
> +=09*pse_size =3D *pse_size + pse_sz;
> +
> +=09return 0;
> +}
> +
> +static void mt76_connac_sdio_tx_update_quota(struct mt76_sdio *sdio, boo=
l mcu,
> +=09=09=09=09=09     int pse_size, int ple_size)
> +{
> +=09if (mcu) {
> +=09=09sdio->sched.pse_mcu_quota -=3D pse_size;
> +=09} else {
> +=09=09sdio->sched.pse_data_quota -=3D pse_size;
> +=09=09sdio->sched.ple_data_quota -=3D ple_size;
> +=09}
> +}
> +
> +static int __mt76_connac_sdio_xmit_queue(struct mt76_dev *dev, u8 *data,
> +=09=09=09=09=09 int len)
> +{
> +=09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09int err;
> +
> +=09if (len > sdio->func->cur_blksize)
> +=09=09len =3D roundup(len, sdio->func->cur_blksize);
> +
> +=09err =3D sdio_writesb(sdio->func, MCR_WTDR1, data, len);
> +=09if (err)
> +=09=09dev_err(dev->dev, "sdio write failed: %d\n", err);
> +
> +=09return err;
> +}
> +
> +static int mt76_connac_sdio_tx_run_queue(struct mt76_dev *dev,
> +=09=09=09=09=09 struct mt76_queue *q)
> +{
> +=09int qid, err, nframes =3D 0, len =3D 0, pse_sz =3D 0, ple_sz =3D 0;
> +=09bool mcu =3D q =3D=3D dev->q_mcu[MT_MCUQ_WM];
> +=09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09u8 pad;
> +
> +=09qid =3D mcu ? ARRAY_SIZE(sdio->xmit_buf) - 1 : q->qid;
> +=09while (q->first !=3D q->head) {
> +=09=09struct mt76_queue_entry *e =3D &q->entry[q->first];
> +=09=09struct sk_buff *iter;
> +
> +=09=09smp_rmb();
> +
> +=09=09if (!test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state)) {
> +=09=09=09__skb_put_zero(e->skb, 4);
> +=09=09=09err =3D __mt76_connac_sdio_xmit_queue(dev, e->skb->data,
> +=09=09=09=09=09=09=09    e->skb->len);
> +=09=09=09if (err)
> +=09=09=09=09return err;
> +
> +=09=09=09goto next;
> +=09=09}
> +
> +=09=09pad =3D roundup(e->skb->len, 4) - e->skb->len;
> +=09=09if (len + e->skb->len + pad + 4 > MT76S_XMIT_BUF_SZ)
> +=09=09=09break;
> +
> +=09=09if (mt76_connac_sdio_tx_pick_quota(sdio, mcu, e->buf_sz, &pse_sz,
> +=09=09=09=09=09=09   &ple_sz))
> +=09=09=09break;
> +
> +=09=09memcpy(sdio->xmit_buf[qid] + len, e->skb->data,
> +=09=09       skb_headlen(e->skb));
> +=09=09len +=3D skb_headlen(e->skb);
> +=09=09nframes++;
> +
> +=09=09skb_walk_frags(e->skb, iter) {
> +=09=09=09memcpy(sdio->xmit_buf[qid] + len, iter->data,
> +=09=09=09       iter->len);
> +=09=09=09len +=3D iter->len;
> +=09=09=09nframes++;
> +=09=09}
> +
> +=09=09if (unlikely(pad)) {
> +=09=09=09memset(sdio->xmit_buf[qid] + len, 0, pad);
> +=09=09=09len +=3D pad;
> +=09=09}
> +next:
> +=09=09q->first =3D (q->first + 1) % q->ndesc;
> +=09=09e->done =3D true;
> +=09}
> +
> +=09if (nframes) {
> +=09=09memset(sdio->xmit_buf[qid] + len, 0, 4);
> +=09=09err =3D __mt76_connac_sdio_xmit_queue(dev, sdio->xmit_buf[qid], le=
n + 4);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +=09mt76_connac_sdio_tx_update_quota(sdio, mcu, pse_sz, ple_sz);
> +
> +=09mt76_worker_schedule(&sdio->status_worker);
> +
> +=09return nframes;
> +}
> +
> +void mt76_connac_sdio_txrx(struct mt76_dev *dev)
> +{
> +=09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09int i, nframes, ret;
> +
> +=09/* disable interrupt */
> +=09sdio_claim_host(sdio->func);
> +=09sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
> +
> +=09do {
> +=09=09nframes =3D 0;
> +
> +=09=09/* tx */
> +=09=09for (i =3D 0; i <=3D MT_TXQ_PSD; i++) {
> +=09=09=09ret =3D mt76_connac_sdio_tx_run_queue(dev, dev->phy.q_tx[i]);
> +=09=09=09if (ret > 0)
> +=09=09=09=09nframes +=3D ret;
> +=09=09}
> +=09=09ret =3D mt76_connac_sdio_tx_run_queue(dev, dev->q_mcu[MT_MCUQ_WM])=
;
> +=09=09if (ret > 0)
> +=09=09=09nframes +=3D ret;
> +
> +=09=09/* rx */
> +=09=09ret =3D mt76_connac_sdio_rx_handler(dev);
> +=09=09if (ret > 0)
> +=09=09=09nframes +=3D ret;
> +=09} while (nframes > 0);
> +
> +=09/* enable interrupt */
> +=09sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
> +=09sdio_release_host(sdio->func);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_sdio_txrx);
> --=20
> 2.25.1
>=20

--4mVMvcy2JhSq7fYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUHzMgAKCRA6cBh0uS2t
rJGlAQC/ir+HGL6BKPmBcJgayfL9NyDk55XHRjAYlsa1u5N/XAEAsC8i5XUlQ9SJ
w0zxEDt76Aeg3mcnG05rVewbQfALZww=
=ANSp
-----END PGP SIGNATURE-----

--4mVMvcy2JhSq7fYf--



--===============3213028058729195941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3213028058729195941==--


