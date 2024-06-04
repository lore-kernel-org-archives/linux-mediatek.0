Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B2EC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lQ0d0Nz+HbLsf7tMKwA36s0niKRTo9V+v6ebXU5h6Q=; b=oUE+GkCURP0jvPbpGfBmDzyOyV
	iM9JbtJ4e3LqDVhQXlDI+TJoaiFVhe1SdTjRYhHvqfbCvhT4fuiao2cWJJs9MQBtIiBPEkXS8HhJc
	CNROu9g8R1tkAmeOGzTLYqyJ0MVgsiiwfcZuu4zNGqPdcqfazv9iGfREoJgmLYDEWixPoqtC6o2Fk
	0iWwr/tl6fDZLHV7uADpEkgAetSguEcsf3dxkDwnmWup8ivaliN1WdGPWF882t0NL7zi0SEf7jYkZ
	fpuYPRymzQVBCIYq4EExyaMMXY1h9XR5bwY/EbWLTuIs/vadiTlErLfHiYm6HOP2/dqnPe3ftaxFX
	FOb0Vnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdKD-000000049F8-0mcX;
	Tue, 04 Jun 2024 23:12:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdKA-000000049Ek-1ZQo
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 23:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AB8D614E7
	for <linux-mediatek@lists.infradead.org>; Tue,  4 Jun 2024 23:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30F4C4AF09
	for <linux-mediatek@lists.infradead.org>; Tue,  4 Jun 2024 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717542732;
	bh=Nncx+VVQYs0qKAe+KYVC/Kq04OFO3sM0r6o5Yfj4L+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TGmqu/JbAds/BOUP6NJv9uDpQdDc/BI2Phd0s9JNPrcmBLG2b00Ut5yLxZHbL7SSB
	 krisyQgobjXaZorWf4l7kqFMtC+Od9Zts3EgMdfjex8DS3FmGHFvSdyAojCYOrl0ox
	 bW3YgkUNt/eCOBfMRZxWUmcKMDnyOT4z5w42AYSLicrupkQ023phB9VeWrRXzrm5j6
	 bN6d4b4NkRj3xE3WVZWNKCvVIcEtd+0+g2LrdApNE85ph2nWB1gwLoDqzFxTtqBvNH
	 H9oFsM9keKhxve5qd7O18oO+7T0TDa3+pkPg7ZaHuIW4d+tFXpH0QfGBWRyGUK+mk1
	 QAZeW5Wu62EUQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a2e8ddb04so789784a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 16:12:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3jV6++u0/+s32wtMGE2E/Uvh92NimJuwvVUWw2/Ha+WVV2Wzol3FqdwKeZT9O3Nzi/ydJHxChsXr0c6aSCLpPs0bUTydP+2kUCY1i+0C0sFwW
X-Gm-Message-State: AOJu0Yws/DuXVp4lhsQ0kWKrMR4iYjnD22CKnQ/k1B5FHTZ4T1Tf3LlZ
	W9Ur7m3uG2vIvf0ejGidndVMtMie/81BKVXemgLTcBuaqL/CZjy2Pd7VhlDlh2AJOW9fvcRXtpe
	+DjmA/aWUG+rBtHGuuZEGHIyB19s=
X-Google-Smtp-Source: AGHT+IFBy/YLm3dKndSIi0drXsYIFEcFE6IgO+ZhYtbwCYfAKF4s8Yf1d2uOu0EPT0ChXDxKpI637E40N+LOAI1+bGE=
X-Received: by 2002:a17:907:90d5:b0:a68:5676:275d with SMTP id
 a640c23a62f3a-a69a026fc59mr36867566b.6.1717542731220; Tue, 04 Jun 2024
 16:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240523112131.31437-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240523112131.31437-1-mingyen.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 4 Jun 2024 16:11:58 -0700
X-Gmail-Original-Message-ID: <CAGp9LzrPUUjo8xLNdUddu=GCd2T8PP=Cw_+MKQCw23Emeg=n6Q@mail.gmail.com>
Message-ID: <CAGp9LzrPUUjo8xLNdUddu=GCd2T8PP=Cw_+MKQCw23Emeg=n6Q@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt792x: fix scheduler interference in drv
 own process
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com, 
	Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, 
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
	ch.yeh@mediatek.com, posh.sun@mediatek.com, Quan.Zhou@mediatek.com, 
	Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Michael Lo <michael.lo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_161214_565780_8B7913E5 
X-CRM114-Status: GOOD (  21.70  )
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

On Thu, May 23, 2024 at 4:21=E2=80=AFAM Mingyen Hsieh
<mingyen.hsieh@mediatek.com> wrote:
>
> From: Michael Lo <michael.lo@mediatek.com>
>
> Add some time to wait for LP engine to complete its operation
> before polling pmctrl register.
>
> Signed-off-by: Michael Lo <michael.lo@mediatek.com>
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The new patch is an improvement over v1 as it avoids unnecessary
waiting in specific cases, such as when users are forced to disable
ASPM or when the host doesn't support ASPM as I suggested in v1. Thus,

Acked-by: Sean Wang <sean.wang@mediatek.com>

> ---
> v2: change funcion and variable naming.
> ---
>
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  3 +++
>  .../net/wireless/mediatek/mt76/mt7925/pci.c   |  3 +++
>  drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
>  .../net/wireless/mediatek/mt76/mt792x_core.c  |  4 ++++
>  drivers/net/wireless/mediatek/mt76/pci.c      | 23 +++++++++++++++++++
>  6 files changed, 35 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 11b9f22ca7f3..4168104fa141 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -1081,6 +1081,7 @@ bool ____mt76_poll_msec(struct mt76_dev *dev, u32 o=
ffset, u32 mask, u32 val,
>
>  void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs);
>  void mt76_pci_disable_aspm(struct pci_dev *pdev);
> +bool mt76_pci_aspm_supported(struct pci_dev *pdev);
>
>  static inline u16 mt76_chip(struct mt76_dev *dev)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index f768e9389ac6..ca54ae7deb54 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -339,6 +339,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>         bus_ops->rmw =3D mt7921_rmw;
>         dev->mt76.bus =3D bus_ops;
>
> +       if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
> +               dev->aspm_supported =3D true;
> +
>         ret =3D mt792xe_mcu_fw_pmctrl(dev);
>         if (ret)
>                 goto err_free_dev;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index 07b74d492ce1..2449b3e6c396 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -373,6 +373,9 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>         bus_ops->rmw =3D mt7925_rmw;
>         dev->mt76.bus =3D bus_ops;
>
> +       if (!mt7925_disable_aspm && mt76_pci_aspm_supported(pdev))
> +               dev->aspm_supported =3D true;
> +
>         ret =3D __mt792x_mcu_fw_pmctrl(dev);
>         if (ret)
>                 goto err_free_dev;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wi=
reless/mediatek/mt76/mt792x.h
> index 20578497a405..c2c42e5d650a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
> @@ -190,6 +190,7 @@ struct mt792x_dev {
>         bool fw_assert:1;
>         bool has_eht:1;
>         bool regd_in_progress:1;
> +       bool aspm_supported:1;
>         wait_queue_head_t wait;
>
>         struct work_struct init_work;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/n=
et/wireless/mediatek/mt76/mt792x_core.c
> index a405af8d9052..588b24edfdd9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> @@ -766,6 +766,10 @@ int __mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev)
>
>         for (i =3D 0; i < MT792x_DRV_OWN_RETRY_COUNT; i++) {
>                 mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);
> +
> +               if (dev->aspm_supported)
> +                       usleep_range(2000, 3000);
> +
>                 if (mt76_poll_msec_tick(dev, MT_CONN_ON_LPCTL,
>                                         PCIE_LPCR_HOST_OWN_SYNC, 0, 50, 1=
))
>                         break;
> diff --git a/drivers/net/wireless/mediatek/mt76/pci.c b/drivers/net/wirel=
ess/mediatek/mt76/pci.c
> index 4c1c159fbb62..b5031ca7f73f 100644
> --- a/drivers/net/wireless/mediatek/mt76/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/pci.c
> @@ -45,3 +45,26 @@ void mt76_pci_disable_aspm(struct pci_dev *pdev)
>                                            aspm_conf);
>  }
>  EXPORT_SYMBOL_GPL(mt76_pci_disable_aspm);
> +
> +bool mt76_pci_aspm_supported(struct pci_dev *pdev)
> +{
> +       struct pci_dev *parent =3D pdev->bus->self;
> +       u16 aspm_conf, parent_aspm_conf =3D 0;
> +       bool result =3D true;
> +
> +       pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &aspm_conf);
> +       aspm_conf &=3D PCI_EXP_LNKCTL_ASPMC;
> +       if (parent) {
> +               pcie_capability_read_word(parent, PCI_EXP_LNKCTL,
> +                                         &parent_aspm_conf);
> +               parent_aspm_conf &=3D PCI_EXP_LNKCTL_ASPMC;
> +       }
> +
> +       if (!aspm_conf && (!parent || !parent_aspm_conf)) {
> +               /* aspm already disabled */
> +               result =3D false;
> +       }
> +
> +       return result;
> +}
> +EXPORT_SYMBOL_GPL(mt76_pci_aspm_supported);
> --
> 2.18.0
>
>

