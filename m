Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA1109E557
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 06:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tsk6WcmjilhlRbKr/BTGP/KUx0eEmXYmNNzIrwH8c7A=; b=pC80sS9d88SG2CqTLpOvJNCk3D
	SZTRTHU6gHazJTIZe7Gh9S1B3FOoAfdnB7LyHiBZ3sQQiMVy9NfDRVyURjg3/xAi/yWbG4LMi1YH7
	AP21DztqLe+wBMar2wR7QFlmmjwl+96EYhRLk9BQn5lXYaZcP5ME4bOZesHLYPoZJ2I/PJjstWm45
	Cs0Rgr7OQJOefzr4B8NzrK2JIcs0OXh14SqqrzJpI7i1+ffnGY0NfRobBJMj9Pv6byNtIn6pCAJGi
	eKuptLHiusMS3pyv4wtCD6pL58BkYDUOfgF3ptQQiGOjRMPNN1+WkL7s1Wwi2xyFgo9XtukIeUwVY
	Jn7zYoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dzt-00000004mqz-1bkz;
	Thu, 26 Mar 2026 06:15:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dzo-00000004mpZ-3JqQ
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 06:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F12D544536
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 06:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75C7C2BCB9
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 06:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774505707;
	bh=qNPDzY1c3zPMJCL6JgWJwXs7dJyiTLP5CKNIBdYLW2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KrdoafSQp/PoGdrRZrHSdDIbUO3qnqh4298eJxgPd58fUG9mGedPkOEWKbzYL/fSz
	 knapw+oWNpV6otfvqTOA97un0IcFxNztV3IRnO3egICzYCtMXekXIiBraTfbVJzlDM
	 LwQ6oacGYegjnPHUDC+4oMISal/9t8FfaKFVSgy9bNm18pjET6KRT81yN9ZHnOHUlq
	 ypHTL+I6NvrJM7EIZFeeT6XyzOKtZElOSTFqKHPjuACyxhw/uF8+2rmHBXEq/5jDiX
	 x8xsfl2J1V4Jf5hA/RD/lLS8VXequw9rbvU4f55++hwT9mN//ge+ArmHLcWKl7XOik
	 GXxvbCLQe0awQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ad26e3992so4466601fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 23:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVy5sgvzQTElOYmj5uelTqjr6vOtI2xp4edzjgwh/IprX0ZFq/pFln1YXjcakpvmp08qfOrOdijaY/JDLu/Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YykLki5E3ErMCLbY7cB2SQgWQzjiQbBgvYgYZjgyI2g1EoX2zmU
	ZNZ+Ac8/vf7KsflWdlwJhbY6mcWBoTqPBtx7/4QsI4gGNVlg+qbHTmo52uWZ2FnOgpHtyRWcCZJ
	TXb4NakUwQrrhcNtygFNXvNmOigkeVs4=
X-Received: by 2002:a05:651c:4081:b0:389:f13f:8082 with SMTP id
 38308e7fff4ca-38c4320f5e3mr14222931fa.37.1774505705946; Wed, 25 Mar 2026
 23:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me> <20260325-mt7927-wifi-support-v2-v3-12-5ca66c97a755@jetm.me>
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-12-5ca66c97a755@jetm.me>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 01:14:56 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpdV3TEK2LNrjotgJX10a-WyAb_8P_kpTNYVtUta2Q2MQ@mail.gmail.com>
X-Gm-Features: AQROBzB7OndRY6rEIWjHQOhEVzDIfM5J7pucQeFuRa7TwBdAyjB6Crc6NPXHqfI
Message-ID: <CAGp9LzpdV3TEK2LNrjotgJX10a-WyAb_8P_kpTNYVtUta2Q2MQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] wifi: mt76: mt7925: disable ASPM and runtime PM
 for MT7927
To: Javier Tia <floss@jetm.me>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu <deren.wu@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_231508_868126_6A2B6EE4 
X-CRM114-Status: GOOD (  21.29  )
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

Hi, Javier

On Wed, Mar 25, 2026 at 5:13=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> Disable PCIe ASPM unconditionally for MT7927. The CONNINFRA power
> domain and WFDMA register access are unreliable with PCIe L1 active,
> causing throughput to drop from 1+ Gbps to ~200 Mbps.
>
> Disable runtime PM and deep sleep for MT7927. The combo chip shares
> a CONNINFRA power domain between WiFi (PCIe) and BT (USB).
> SET_OWN/CLR_OWN transitions on the LPCTL register crash the BT
> firmware, requiring a full power cycle to recover. PM enablement will
> be addressed in a follow-up once safe power state transitions are
> determined.
>
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/init.c | 6 +++++-
>  drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 9 +++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/init.c
> index c4c99380f5b5..89140fc6a2b6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> @@ -243,7 +243,11 @@ int mt7925_register_device(struct mt792x_dev *dev)
>         dev->pm.idle_timeout =3D MT792x_PM_TIMEOUT;
>         dev->pm.stats.last_wake_event =3D jiffies;
>         dev->pm.stats.last_doze_event =3D jiffies;
> -       if (!mt76_is_usb(&dev->mt76)) {
> +       /* MT7927: runtime PM disabled. The combo chip shares a CONNINFRA
> +        * power domain between WiFi (PCIe) and BT (USB). SET_OWN/CLR_OWN
> +        * transitions on the LPCTL register crash BT firmware.
> +        */

I think this level of detail is better kept in the commit message. For
the code itself, a short comment should be enough, or even no comment
if the condition is already clear enough.

> +       if (!mt76_is_usb(&dev->mt76) && !is_mt7927(&dev->mt76)) {
>                 dev->pm.enable_user =3D true;
>                 dev->pm.enable =3D true;
>                 dev->pm.ds_enable_user =3D true;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index 393d9f408b84..693e08f35d68 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -530,7 +530,13 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 goto err_free_pci_vec;
>
> -       if (mt7925_disable_aspm)
> +       is_mt7927_hw =3D (pdev->device =3D=3D 0x6639 || pdev->device =3D=
=3D 0x7927);
> +
> +       /* MT7927: CONNINFRA power domain and WFDMA register access are
> +        * unreliable with PCIe L1 active, causing throughput to drop
> +        * from 1+ Gbps to ~200 Mbps. Disable ASPM unconditionally.
> +        */

Ditto

> +       if (mt7925_disable_aspm || is_mt7927_hw)
>                 mt76_pci_disable_aspm(pdev);
>
>         ops =3D mt792x_get_mac80211_ops(&pdev->dev, &mt7925_ops,
> @@ -562,7 +568,6 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>         dev =3D container_of(mdev, struct mt792x_dev, mt76);
>         dev->fw_features =3D features;
>         dev->hif_ops =3D &mt7925_pcie_ops;
> -       is_mt7927_hw =3D (pdev->device =3D=3D 0x6639 || pdev->device =3D=
=3D 0x7927);
>         dev->irq_map =3D is_mt7927_hw ? &mt7927_irq_map : &irq_map;
>         dev->dma_config =3D is_mt7927_hw ? &mt7927_dma_cfg : &mt7925_dma_=
cfg;
>         mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
>
> --
> 2.53.0
>
>

