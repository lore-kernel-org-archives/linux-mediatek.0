Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106C3F5512F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEABoQ7+57HrA/w0WLFeMh01TpiX3SIdxuXWpX5zEQI=; b=zkJzSZ4HsSqxokg0yX+HDOPaXn
	85D4K6rixahx6zAvYYv676QX9fBlTPg9tjIpX9tclHI6CZ0nZ+pBQX+LLAuEgSGYaPZfndzBGXQyn
	uMHCz66B7fJgYAPGsUDH9HXypBmGvLJctZj4fCJg4RSzya928OFWghFrKN3/BpEBnJd/C6uyIm5ri
	uVkRbx0Ow3Djf6GB8IQLVTTWR4Cs2HVVih/aDph9Z1mY9QEldN08UDNZPBfsbJMxjDCJ5lL4FvfPl
	K8G1NwtCUJiVN1xOXWj+XyXOeT7TjR5tZeKRWsf44UxwbE0bPKfSm5N+C9KivnFpE2Yii1IHYmjii
	dqfDwIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTgO-00000006hyb-0zDh;
	Mon, 09 Mar 2026 06:01:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTgN-00000006hyU-0hQ2
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 06:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 024EE600CB
	for <linux-mediatek@lists.infradead.org>; Mon,  9 Mar 2026 06:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABB1C2BCAF
	for <linux-mediatek@lists.infradead.org>; Mon,  9 Mar 2026 06:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773036093;
	bh=KXcTs6U6Oyy4Mzw5G5nY+hEIG0IC6g/zn8nwIXRrghI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CO3laPOpHfeW/X1LWS/bCZEHgQDQ4fT6myVVz6nJ10zN1filAvxhnvKhNXfoiJ1I1
	 4N18CoCBw5Uw+DePHB4j1npsocUKr4bXUCmfEnZhTaWtWCDuc17R7qzqFAhxmUSI4r
	 x+bfo9IZYyXFF1kEq0TZB6S0KBY/1xO2HO8V9FQgC8eXf9Inuep89gXPHwTQJkffSG
	 xcbZLMozjyzmQ+Bo4tfgXvg7kDpCKl/E9dAO2W+S/7nMuMw0l0d5hCipQy1jtadykJ
	 srnraxAjzv2TUVsa79r9zIDIvufOauj2+YsVNp04LsHadPzq9HQjUny3H1bFKzkSoj
	 GpmYzgQ/5qY2w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so6932429e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2026 23:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXv6pJy6CdPoYP1UKqnIVTk4lqGdKfnBOeJFSX6wCYO/20lj4JZkGhWJf5KC+mgFB9JuSb2Fe5Q7BX9GUjsiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvhu5R3ywXHcstrPXxR2okPXum6u6QW+JcAaUo5UOEJUbP2SC4
	BjSjVmiH4axm8vh+CrbugXUWV4rlpKJer/tYcTVvVTBJI0yO+rzwffDeHOKScT6RhZJ0LIp6CSz
	Xj0yx+qRlLq6Krij9DAyM9tuWp9BOLyg=
X-Received: by 2002:a05:6512:39ce:b0:5a1:25cb:6d61 with SMTP id
 2adb3069b0e04-5a13ccaf984mr3443568e87.14.1773036091908; Sun, 08 Mar 2026
 23:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CANAPQzi_eC2n_mfxrcZ46tpCDB1_RkkbpnVd2Y=P=Ua4iPU2gQ@mail.gmail.com>
In-Reply-To: <CANAPQzi_eC2n_mfxrcZ46tpCDB1_RkkbpnVd2Y=P=Ua4iPU2gQ@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 9 Mar 2026 01:01:20 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzq0-SuKksxOJ9+phScF4ecZpk+TUtppR7agTXi9DpoNzw@mail.gmail.com>
X-Gm-Features: AaiRm51ycX53Mb_ypP1Vf-IfdSZo7wUGRFHpASNYbdEa-ZrgFY8BPtQhY3AdTGU
Message-ID: <CAGp9Lzq0-SuKksxOJ9+phScF4ecZpk+TUtppR7agTXi9DpoNzw@mail.gmail.com>
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

On Fri, Feb 27, 2026 at 3:58=E2=80=AFAM bryam vargas
<bryamestebanvargas@gmail.com> wrote:
>
> [PATCH 2/2] mt76: mt7921u: add USB reset on SEFI chip recovery
> From 86976b5908219204f7719d947fd6c5f1c5e11c7f Mon Sep 17 00:00:00 2001
> From: bryam <bryamestebanvargas@gmail.com>
> Date: Fri, 27 Feb 2026 04:30:01 -0500
> Subject: [PATCH 2/2] mt76: mt7921u: add USB reset on SEFI chip recovery
>
> The MT7921U chip is susceptible to Single Event Functional Interrupts
> (SEFIs) caused by cosmic radiation, particularly at high altitudes.
> When a SEFI occurs, the chip becomes unresponsive and requires a USB
> reset to recover.
>
> Add usb_queue_reset_device() calls in the SEFI detection path to
> trigger automatic recovery instead of leaving the interface hung.
>
> Tested-on: Minisforum NAB9 (MT7921U USB adapter) at 2400m altitude,
>            Bogot=C3=A1, Colombia. Cosmic radiation causes periodic SEFI
>            events; USB reset restores connectivity without intervention.
>
> Signed-off-by: Bryam Vargas <bryamestebanvargas@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 12 ++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt792x_usb.c | 10 ++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> index 100bdba..8c8c78f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> @@ -86,6 +86,7 @@ static int mt7921u_mcu_init(struct mt792x_dev *dev)
>
>  static int mt7921u_mac_reset(struct mt792x_dev *dev)
>  {
> +    struct usb_interface *intf =3D to_usb_interface(dev->mt76.dev);
>      int err;
>
>      mt76_txq_schedule_all(&dev->mphy);
> @@ -100,6 +101,17 @@ static int mt7921u_mac_reset(struct mt792x_dev *dev)
>      mt76u_stop_rx(&dev->mt76);
>      mt76u_stop_tx(&dev->mt76);
>
> +    /* When the chip enters a latched state (SEFI - Single Event
> +     * Functional Interrupt, e.g. from cosmic radiation at altitude),
> +     * all register writes over USB become silent no-ops.
> +     * usb_queue_reset_device() electrically resets the chip via the
> +     * USB hub regardless of internal state -- identical to probe().
> +     * Async variant required to avoid deadlock in workqueue context.
> +     */
> +    dev_warn(dev->mt76.dev,
> +         "mt7921u: scheduling USB reset for chip recovery\n");
> +    usb_queue_reset_device(intf);

Hi,

usb_queue_reset_device() is asynchronous. After scheduling the reset,
the driver continues the normal reset flow and still performs reset
operations on the same device, which creates  race conditions.

Also, mt792xu_init_reset() also assumes the USB bus is still
functioning, since it relies on normal USB transactions to reset
WFSYS.

A USB reset should be triggered only after detecting USB transaction
errors or after repeated mt792xu_init_reset() failures.
In this case then we could try triggering a USB reset in software to
see if the USB bus can recover.

Thanks.

> +
>      mt792xu_wfsys_reset(dev);
>
>      clear_bit(MT76_MCU_RESET, &dev->mphy.state);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> index 76272a0..cfd385e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> @@ -269,6 +269,8 @@ EXPORT_SYMBOL_GPL(mt792xu_wfsys_reset);
>
>  int mt792xu_init_reset(struct mt792x_dev *dev)
>  {
> +    struct usb_interface *intf =3D to_usb_interface(dev->mt76.dev);
> +
>      set_bit(MT76_RESET, &dev->mphy.state);
>
>      wake_up(&dev->mt76.mcu.wait);
> @@ -277,6 +279,14 @@ int mt792xu_init_reset(struct mt792x_dev *dev)
>      mt76u_stop_rx(&dev->mt76);
>      mt76u_stop_tx(&dev->mt76);
>
> +    /* Same rationale as mt7921u_mac_reset(): if the chip is in a
> +     * latched state (SEFI), register writes over USB are no-ops.
> +     * Schedule a USB port reset before software reset sequence.
> +     */
> +    dev_warn(dev->mt76.dev,
> +         "mt7921u: scheduling USB device reset (init_reset path)\n");
> +    usb_queue_reset_device(intf);
> +
>      mt792xu_wfsys_reset(dev);
>
>      clear_bit(MT76_RESET, &dev->mphy.state);
> --
> 2.43.0
>

