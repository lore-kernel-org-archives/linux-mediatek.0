Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDA8FED2D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23Ic/hKVv9oY/4cvkBBxx823MXWtc/zvm2VwAwnaS/8=; b=FpL6C5+flsJp7Pt2RjJT3r+ZSG
	+vLDjZrnV1rP/9wLE2qL8HTFAejYUvvQ/nrvMDnxnwZR257N/58Oatfsqv85Yq8YqOImxsVPRGvwP
	pIefnhttP72T+v5Bb3GX+ZetZmo+X4aj/LOa7npxpFYimYFgjOR06XuGtzGebFLQi06CLtKxlzWTa
	cZRJUZlDw+maaLril/JHZnb8WR3wSaOCpn5YEcEahsozucgd3st95+WStVGF8vPXtLlOX4m4FIMLE
	OR0x93/VckWo8cvm/K1Qdg2rbjhMeC3fC4kRdN3Bt/4qKZ/K4zDVVS5OrMjMj5ZokYSDHE4pGnkqw
	2cgFNhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Yw3-0000000DPKe-1sAW;
	Thu, 12 Mar 2026 05:50:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Yw2-0000000DPKV-3p63
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 05:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 833FA6012B
	for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 05:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37316C2BC86
	for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 05:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773294613;
	bh=6F7t77PxDq8N561gKh1imDxoARZYGBgIE79pCpKfkHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ifCWnVcoYMzfeA6zTLlgaRSaFOv8z9+6rEOn45wcvG/khsQ7dWU142s/xMsZoIU5B
	 aKE3VbK/ql+cO7eIGQ4JYJQ+Sd/UwV+oCFal85KhVv285hwAHCLm88HgQpaO6RFHee
	 BmTPIKd8+7ZMFqLY3KuWuEUVJu4IoyaDn6hREW58opjU1cpY7+b0XbBEZNeBbaEJRk
	 7KUS9JufIxicnJAq6SIApKX7Y4BPuqeXHMywkcNLbE1W16/ovihbei/wblmwaf5S8H
	 mr/bQhLGj6yXzV5TJ2MzmBcG6WAwjYjHGu5r06D5KTMtv3aBrsct64NdER/iZ6jKDf
	 PaRJNt/v5Vb5g==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a67221fe8so5836961fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 22:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXe2LWhBhNAyWEzfXVrawISbKKbJycePwyIoyBN5xOa4Fq9CCaJNIco3bO9YEcRSh3f+nGFhVk5VTnc2fmIkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPlKj6eTcyC9spiK5n3curwFzYVzqnECM/EFADXeUQxOxC+nf4
	A8lttQG8RKpP3f2WpwYSMILg4RCvdSYeiTYjL5AO9SXgQl3MX1QG/QiLt8xhNhPClrWRshdrdKY
	6ISecNCrKEOWJmw0PX/H5U+yv6GrQ1Wo=
X-Received: by 2002:a05:651c:54d:b0:38a:523a:7fb0 with SMTP id
 38308e7fff4ca-38a67dabe6emr17052151fa.1.1773294611350; Wed, 11 Mar 2026
 22:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
 <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
 <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com>
 <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com> <CANAPQzgXN2UOjuwV1fRofN2syxG933kSaB9S7DyFAykHHMRzew@mail.gmail.com>
In-Reply-To: <CANAPQzgXN2UOjuwV1fRofN2syxG933kSaB9S7DyFAykHHMRzew@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 12 Mar 2026 00:49:59 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzr4KsXEXbj+4h+Lk2fKU7z6BqtL5krzZmu-_So2-bN4_Q@mail.gmail.com>
X-Gm-Features: AaiRm52znYzAgFJKKpRtzCRTboww-dJRwApa8DOZinSIs5CtoHWw7jRHQKlVyfs
Message-ID: <CAGp9Lzr4KsXEXbj+4h+Lk2fKU7z6BqtL5krzZmu-_So2-bN4_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: bryam vargas <bryamestebanvargas@gmail.com>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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

On Wed, Mar 11, 2026 at 3:58=E2=80=AFPM bryam vargas
<bryamestebanvargas@gmail.com> wrote:
>
> From 9fabc33e722f321b4048ada6d4667ddacbb1495a Mon Sep 17 00:00:00 2001
> From: bryam <bryamestebanvargas@gmail.com>
> Date: Mon, 9 Mar 2026 12:25:37 -0500
> Subject: [PATCH v2 2/2] mt76: mt7921u: trigger USB reset only on wfsys ti=
meout
>
> Instead of unconditionally scheduling a USB device reset at the start
> of the reset sequence, trigger it only when mt792xu_wfsys_reset()
> returns -ETIMEDOUT, which indicates the chip is in a latched state
> (SEFI - Single Event Functional Interrupt) where register writes over

how do you know that `-ETIMEDOUT` means the chip entered a latched
state or a SEFI condition?

> USB become silent no-ops.
>
> This avoids the race condition where usb_queue_reset_device() was
> scheduled asynchronously while the driver continued normal reset
> operations on the same device.
>
> Tested-on: Minisforum NAB9 (MT7921U USB adapter) at 2400m altitude,
>            Bogota, Colombia. Cosmic radiation causes periodic SEFI
>            events; USB reset restores connectivity without intervention.
>
> Signed-off-by: Bryam Vargas <bryamestebanvargas@gmail.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/usb.c   | 32 +++++++++----------
>  .../net/wireless/mediatek/mt76/mt792x_usb.c   | 16 ++++------
>  2 files changed, 23 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> index 8c8c78f..44c7437 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> @@ -86,33 +86,33 @@ static int mt7921u_mcu_init(struct mt792x_dev *dev)
>
>  static int mt7921u_mac_reset(struct mt792x_dev *dev)
>  {
> -    struct usb_interface *intf =3D to_usb_interface(dev->mt76.dev);
>      int err;
>
>      mt76_txq_schedule_all(&dev->mphy);
>      mt76_worker_disable(&dev->mt76.tx_worker);
> -
>      set_bit(MT76_RESET, &dev->mphy.state);
>      set_bit(MT76_MCU_RESET, &dev->mphy.state);
> -
>      wake_up(&dev->mt76.mcu.wait);
>      skb_queue_purge(&dev->mt76.mcu.res_q);
> -
>      mt76u_stop_rx(&dev->mt76);
>      mt76u_stop_tx(&dev->mt76);
>
> -    /* When the chip enters a latched state (SEFI - Single Event
> -     * Functional Interrupt, e.g. from cosmic radiation at altitude),
> -     * all register writes over USB become silent no-ops.
> -     * usb_queue_reset_device() electrically resets the chip via the
> -     * USB hub regardless of internal state -- identical to probe().
> -     * Async variant required to avoid deadlock in workqueue context.
> -     */
> -    dev_warn(dev->mt76.dev,
> -         "mt7921u: scheduling USB reset for chip recovery\n");
> -    usb_queue_reset_device(intf);
> -

I also cannot find these changes in the current codebase. What tree
did you build this patch on?

> -    mt792xu_wfsys_reset(dev);
> +    err =3D mt792xu_wfsys_reset(dev);
> +    if (err =3D=3D -ETIMEDOUT) {
> +        /* Chip is in a latched state (SEFI - Single Event Functional
> +         * Interrupt, e.g. from cosmic radiation at altitude).
> +         * Register writes over USB become silent no-ops; schedule an
> +         * electrical USB reset via the hub as last resort.
> +         * usb_queue_reset_device() is async to avoid deadlock in
> +         * workqueue context.

The comment does not make sense to me. A timeout in
`mt792xu_wfsys_reset()` is not sufficient evidence to conclude the
device is in a latched state, and definitely not enough to attribute
it to SEFI or cosmic radiation.

> +         */
> +        struct usb_interface *intf =3D to_usb_interface(dev->mt76.dev);
> +
> +        dev_warn(dev->mt76.dev,
> +             "mt7921u: wfsys reset timed out, scheduling USB reset\n");
> +        usb_queue_reset_device(intf);

That is not the way I suggested. This also still keeps the same
fundamental problem from v1. usb_queue_reset_device() is asynchronous
and you are still injecting a USB-level reset into an ongoing reset
flow to interfere with the MAC reset recovery path. Gating it on
-ETIMEDOUT changes when it happens, but does not eliminate the race
itself.

I do not think we should add this recovery path without first
understanding the actual failure. In some cases this may not even be a
device reset issue, but a USB bus/topology stability issue,  Suggest
file a bug with complete logs and reproduction details first.

> +        goto out;
> +    }
>
>      clear_bit(MT76_MCU_RESET, &dev->mphy.state);
>      err =3D mt76u_resume_rx(&dev->mt76);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> index cfd385e..4737384 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> @@ -269,7 +269,6 @@ EXPORT_SYMBOL_GPL(mt792xu_wfsys_reset);
>
>  int mt792xu_init_reset(struct mt792x_dev *dev)
>  {
> -    struct usb_interface *intf =3D to_usb_interface(dev->mt76.dev);
>
>      set_bit(MT76_RESET, &dev->mphy.state);
>
> @@ -279,15 +278,14 @@ int mt792xu_init_reset(struct mt792x_dev *dev)
>      mt76u_stop_rx(&dev->mt76);
>      mt76u_stop_tx(&dev->mt76);
>
> -    /* Same rationale as mt7921u_mac_reset(): if the chip is in a
> -     * latched state (SEFI), register writes over USB are no-ops.
> -     * Schedule a USB port reset before software reset sequence.
> -     */
> -    dev_warn(dev->mt76.dev,
> -         "mt7921u: scheduling USB device reset (init_reset path)\n");
> -    usb_queue_reset_device(intf);
> +    if (mt792xu_wfsys_reset(dev) =3D=3D -ETIMEDOUT) {
> +        struct usb_interface *intf =3D to_usb_interface(dev->mt76.dev);
> +
> +        dev_warn(dev->mt76.dev,
> +             "mt792xu: wfsys reset timed out, scheduling USB reset\n");
> +        usb_queue_reset_device(intf);
> +    }
>
> -    mt792xu_wfsys_reset(dev);
>
>      clear_bit(MT76_RESET, &dev->mphy.state);
>
> --
> 2.43.0

