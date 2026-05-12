Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E29CD4F21
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 21:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KauRRGWWoPp9x/X8IyWNQoIFf417xrJIJuZhStW2+Kk=; b=w/ioi13KThYQqty3CR3sEPzz6H
	VpBAlWzFt0DKOt34JZIVrdALipvTJEc9gFobNXx4QsjlA3T0vwIGEY/5eYK9Rb2u/Qql0ow1IVctN
	J6qu/WKPQ6NW92IrhvuHn8AEY3/ekp4F8oyAFKaBzbGu0PMJD3ryoKG6Tw8gUdR+4jqHFeBZSKY24
	WTBbXWgUidI/PLWNvDv24oT9U+k2UOGYbHYWgBO9QlfoRL1zEJOYYSsnO6yUDexpMVAADkTCpO2H3
	HriGgEfNeMaqLdgYQ4LYrIrB8CnwKLXKvXh6SWikxHFvDSsi15TGCODvuam08r5ze98YMRVA7Vr/Z
	Zl9RO/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMugp-00000000Ugk-2EDG;
	Tue, 12 May 2026 21:30:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMugo-00000000UgX-2ZfB
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 21:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB52660128
	for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 21:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE34C4AF0B
	for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778621453;
	bh=E4de2yJLbPlG+G4Xke/Sqplwk8ZyhA8kD3ynAicpMcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=poCD6UHQSQ0V1KWO1+D0bqL36p1rxQceY6vzgw3Nterodo1SakAgvi7SlkyxTnxyd
	 1bSoRwGoDntmuHXyyYxrGwXWuwj/n64/Napoc3FK9QyHj2sUaMENwhXrY1UvgOaJNp
	 EqStv5QDmT1bWunICSRdkdQ0ojoYgkmmxH/Zi5rSWpER/hhnkOMWn3N4YGV9oFiXIm
	 xjpOfwpt8lUUldBnxDQb+Rn7W/xfVwYTEM0umseXuJDDM4Nff+dHw+f92bIWhtJ1WV
	 6IskvCwsQIT/1f2X3sDubwQ+UBwd3PpArxm0XctFsWFxOTvQhC8DbVNIxdKwcDL9SV
	 1S51jIbJB4BLA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393c40246afso62900201fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 14:30:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cLyRwI4FJHUIwLse7jtMVosMJuFV/rG1fs3YMfaqUiwNHJMyicj4WTyVQ8moOeeHNAV/oJzBynW/LWWRPww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxNLJgvyTM0cYitJZvWHB+kaJkouC+3MLaQYp7ZWHe5y6n5JR7
	1DR56qOYVjU/FD9BtdgTXKiZtrXRO38YS7jA9nXJSBfR3p7KvS1Wi7guUE6Bza25Q5VzDQqcBfQ
	CoSgToW3SyG8u/o4/b8dpILvWYCH9r8w=
X-Received: by 2002:a05:651c:41ca:b0:38e:af87:8dee with SMTP id
 38308e7fff4ca-3944b5e861amr1589261fa.22.1778621451654; Tue, 12 May 2026
 14:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260505055252.2558613-1-jb.tsai@mediatek.com>
In-Reply-To: <20260505055252.2558613-1-jb.tsai@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 12 May 2026 16:30:39 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpTJLsU_TB+6Cvm1Nhdqkpb7fR0x2WvFBuJMx=M4YrOew@mail.gmail.com>
X-Gm-Features: AVHnY4Lu3a-eF3cWb90dimr7Dumz8Hes-hAWpwnScfeLfC8Xde4ar-Ji9XMwUk0
Message-ID: <CAGp9LzpTJLsU_TB+6Cvm1Nhdqkpb7fR0x2WvFBuJMx=M4YrOew@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7925: Add coredump callback in pci_driver
To: JB Tsai <jb.tsai@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Deren.Wu@mediatek.com, 
	Sean.Wang@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, 
	Leon.Yen@mediatek.com, litien.chang@mediatek.com, jeff.hsu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, May 5, 2026 at 12:53=E2=80=AFAM JB Tsai <jb.tsai@mediatek.com> wrot=
e:
>
> From: Jeff Hsu <Jeff.Hsu@mediatek.com>
>
> Register coredump callback(mt7925_coredump) in pci_driver,
> it can let platform can trigger core dump to collect the
> log and recover back after coredump complete without debugfs
>
> Some platform not have debugfs
>
> Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c |  1 +
>  drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index 37cdf3e8a067..cd502166a7f9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -1014,6 +1014,7 @@ int mt7925_mcu_chip_config(struct mt792x_dev *dev, =
const char *cmd)
>         return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(CHIP_CONFIG),
>                                  &req, sizeof(req), false);
>  }
> +EXPORT_SYMBOL_GPL(mt7925_mcu_chip_config);
>
>  int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index c4161754c01d..5b3e62e5f157 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -610,6 +610,17 @@ static int mt7925_pci_restore(struct device *device)
>         return _mt7925_pci_resume(device, true);
>  }
>
> +static void mt7925_coredump(struct device *dev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(device);

There is a build error on this line.

../drivers/net/wireless/mediatek/mt76/mt7925/pci.c: In function
=E2=80=98mt7925_coredump=E2=80=99:
../drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:43: error:
=E2=80=98device=E2=80=99 undeclared (first use in this function)
  682 |         struct pci_dev *pdev =3D to_pci_dev(device);
      |                                           ^~~~~~
../include/linux/container_of.h:20:33: note: in definition of macro
=E2=80=98container_of=E2=80=99
   20 |         void *__mptr =3D (void *)(ptr);
         \
      |                                 ^~~
../drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:32: note: in
expansion of macro =E2=80=98to_pci_dev=E2=80=99
  682 |         struct pci_dev *pdev =3D to_pci_dev(device);
      |                                ^~~~~~~~~~
../drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:43: note: each
undeclared identifier is reported only once for each function it
appears in
  682 |         struct pci_dev *pdev =3D to_pci_dev(device);
      |                                           ^~~~~~
../include/linux/container_of.h:20:33: note: in definition of macro
=E2=80=98container_of=E2=80=99
   20 |         void *__mptr =3D (void *)(ptr);

> +       struct mt76_dev *mdev =3D pci_get_drvdata(pdev);
> +       struct mt792x_dev *dev_792x =3D container_of(mdev, struct mt792x_=
dev, mt76);
> +
> +       mt792x_mutex_acquire(dev_792x);
> +       mt7925_mcu_chip_config(dev_792x, "assert");
> +       mt792x_mutex_release(dev_792x);
> +}
> +
>  static const struct dev_pm_ops mt7925_pm_ops =3D {
>         .suspend =3D pm_sleep_ptr(mt7925_pci_suspend),
>         .resume  =3D pm_sleep_ptr(mt7925_pci_resume),
> @@ -626,6 +637,7 @@ static struct pci_driver mt7925_pci_driver =3D {
>         .remove         =3D mt7925_pci_remove,
>         .shutdown       =3D mt7925_pci_shutdown,
>         .driver.pm      =3D pm_sleep_ptr(&mt7925_pm_ops),
> +       .driver.coredump =3D mt7925_coredump,
>  };
>
>  module_pci_driver(mt7925_pci_driver);
> --
> 2.45.2
>
>

