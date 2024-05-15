Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB585C25B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jma/wmR/AAqqjGKey/ctSoVg24QcxAyKc4t4ngWEG98=; b=zlxyLMwtlKZeXhm86jKLVB2O+R
	i766+We9Lq6dLeV9YJBSLO8/Q5kI8Ojw4mOu0O/+9rtQBjRHRtvmbHgQl/uXZjdOgqT30YQ2CMwG9
	3VcfE3QC0Jq+LQdkdNOAJkfBTGkFhJzahWSRZzfKX9VExPs5DbY7h9t89YcdStc+IvuzMiOtmrlqO
	NVlIyfU6gpgQaLWA/BCmztMCI41UVn4i06QQaVDyDXXXY4GzhOsNFc3eEtoletdL3Z/8unO22ee0S
	1yeI3TbV/sGHo5neREj1jdvGMxHlm5yLdSIxKpxEFx1/ZZ4hs+311GZ5d9++CBXXv+jl8+dX0OOgw
	KSt3YB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7O1a-000000039ao-1DEu;
	Wed, 15 May 2024 23:27:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7O1W-000000039a4-2ZC1
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 23:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9603CE0AB7
	for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 23:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B32C32781
	for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715815619;
	bh=Dly9VJssQKlGr4nuNsuWgUhzWU16eHtlmaSmjqzEbtM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q4F8ysOfkr92N1KApuAXQfMKIJBEOMG4NHZAuxp3HDd325XnEyrFYls3ZOiQ5mtcF
	 ybv0ZXtaCjkurb9PmrzV9BmEJWb7D9VqIPHBG9GJfGYlz/iJqh7VnDn1pFwT2Z0VXY
	 vZYvjErDad16ZZsuNly4sNQ0LjP4GeTmIVBm4irqZq1NTyr8KKY76+GwPY3v3PyHl8
	 1trFgtQArp2eliFaSbBxolncwiektGIgVoBGlQNEsyOoZSPZHy8O2Qhej5VJicSCHZ
	 +tsfLTbKE9nzDLR2O1qEh1iwHkSwPCGRCXK04UxI/eEr+qNq17uMkCwZBfJ0qqGfaN
	 lnjf7kmSdvSWg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-575070cff74so73578a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 16:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWai0wXn6ZNaRsRqLZgHT83yEfVtW1P24fLfadf2dHAzp/qgf5PWKeMx0+dL40jEE0VfZ1gnDon+q9EiX5AprqxTLlod6o2WmvsMlvZyEtazS3W
X-Gm-Message-State: AOJu0YygzBFHwML/y6rp5H7p/wPnAAoOLaiguxMFWshfEvMwuDJKWH4P
	1A9qO4ylk3B3xbxnMNQOudI6zNKNRNEM2ijHZU+zFuI0t2VPJZT/sfAOMioqGYxLUZ/uCBW7cOE
	ZELrhx9fP1JdR4BMvbpfnLKhJooI=
X-Google-Smtp-Source: AGHT+IG9Xw6qhwjkVuZfgDD8lRq6KGIE3S0/7KdscGUUPCpx9YHwTsEyoDV+3UrO5ntqcmGMtzVO+O95aJyPT3TM4ZA=
X-Received: by 2002:a17:906:f591:b0:a5a:5bf2:b889 with SMTP id
 a640c23a62f3a-a5a5bf2b8b4mr1196952966b.0.1715815617724; Wed, 15 May 2024
 16:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240515015155.24931-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240515015155.24931-1-mingyen.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 15 May 2024 16:26:45 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzprjai3iyab9WERsEm+Y8o6SgASKmL4tsimhSyjY-nG_Q@mail.gmail.com>
Message-ID: <CAGp9Lzprjai3iyab9WERsEm+Y8o6SgASKmL4tsimhSyjY-nG_Q@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt792x: fix scheduler interference in drv own process
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
X-CRM114-CacheID: sfid-20240515_162703_040623_370E7181 
X-CRM114-Status: GOOD (  20.38  )
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

Hi, Mingyen

On Tue, May 14, 2024 at 6:52=E2=80=AFPM Mingyen Hsieh
<mingyen.hsieh@mediatek.com> wrote:
>
> From: Michael Lo <michael.lo@mediatek.com>
>
> Add some time to wait for LP engine to complete its operation
> before polling pmctrl register.
>
> Signed-off-by: Michael Lo <michael.lo@mediatek.com>
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 3 +++
>  drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 3 +++
>  drivers/net/wireless/mediatek/mt76/mt792x.h      | 1 +
>  drivers/net/wireless/mediatek/mt76/mt792x_core.c | 6 ++++++
>  4 files changed, 13 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index f768e9389ac6..0f7d5a92f3d0 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -339,6 +339,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>         bus_ops->rmw =3D mt7921_rmw;
>         dev->mt76.bus =3D bus_ops;
>
> +       if (mt7921_disable_aspm)
> +               dev->disable_aspm =3D true;
> +
>         ret =3D mt792xe_mcu_fw_pmctrl(dev);
>         if (ret)
>                 goto err_free_dev;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index 07b74d492ce1..e7039e312538 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -373,6 +373,9 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>         bus_ops->rmw =3D mt7925_rmw;
>         dev->mt76.bus =3D bus_ops;
>
> +       if (mt7925_disable_aspm)
> +               dev->disable_aspm =3D true;
> +
>         ret =3D __mt792x_mcu_fw_pmctrl(dev);
>         if (ret)
>                 goto err_free_dev;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wi=
reless/mediatek/mt76/mt792x.h
> index 20578497a405..8f913336a668 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
> @@ -190,6 +190,7 @@ struct mt792x_dev {
>         bool fw_assert:1;
>         bool has_eht:1;
>         bool regd_in_progress:1;
> +       bool disable_aspm:1;
>         wait_queue_head_t wait;
>
>         struct work_struct init_work;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/n=
et/wireless/mediatek/mt76/mt792x_core.c
> index a405af8d9052..a11e5438a36e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> @@ -766,6 +766,12 @@ int __mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev)
>
>         for (i =3D 0; i < MT792x_DRV_OWN_RETRY_COUNT; i++) {
>                 mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);
> +
> +               if (!dev->disable_aspm) {
> +                       /* wait for LP engine to complete its operation *=
/
> +                       usleep_range(2000, 3000);
> +               }
> +

I think we can reduce the extra delay on platforms that don't support
ASPM. Basically, if the platform doesn't support ASPM, we can get rid
of the wait.

>                 if (mt76_poll_msec_tick(dev, MT_CONN_ON_LPCTL,
>                                         PCIE_LPCR_HOST_OWN_SYNC, 0, 50, 1=
))
>                         break;
> --
> 2.25.1
>
>

