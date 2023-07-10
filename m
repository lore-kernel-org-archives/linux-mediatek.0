Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D23FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 06:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17ZTBQO+oBIkGul7D/WlB+X7l0VA0KwA6SIv/f89u7w=; b=jYlgpyJ9Y2ESKpMeo7XhcXFVDW
	EYF3BrN58+xFcTeJAOBC8rBI95R7wm6/k01DiC58ULkfK72nsFEqV7py/cu81rOjQB1YHz7CJ3haw
	xU0Cbe96yvvRoP2xk3KCd8/cbQT1oE/S6aehD+0kV0mlHYZn6wggeXopRVdUphtkchwl4kikfY64q
	hBLrF7mdTHr20FVIbNTlbEbkgo91hYWtlRDyhRc++XZT8Wzaz8CHnmn5CxZvsp9Jb+9seGxgabZwK
	IrmJpbl9p7FA3gzXmFdbw/ADaQdm5JxK/NbejwFX4XGHEF6DpgN08mM3JSI9Zo0Er2MIppRsFIsC3
	ZGzCsNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkLa-00AZC8-1f;
	Mon, 10 Jul 2023 06:26:10 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkLW-00AZ7C-2U;
	Mon, 10 Jul 2023 06:26:09 +0000
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688970360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17ZTBQO+oBIkGul7D/WlB+X7l0VA0KwA6SIv/f89u7w=;
	b=pIXKjmxfNRP61MN4/M43OLwfOt2eCDwrovK9XTBHcMsO31DUfzfvU6suXBII6V3BYD44tR
	1mHUSXcarif+DmleFeC9TIxyD7nNl1T41VZjSwY7CXiuBrPAlN5Hh2AZurhW0lfoaIyaG5
	1xj9DgiPLk6f94v/WTAJotVjCsOM/bLTjoFOkYdiI7MGQh0PG2TadiZdbDX2vvcGjEVoMy
	Y6ydVdRi0Wl/yf0D0ZYMmrGNKOvbYzS6k7Hs5BRQ+B9VLx7sKjZaYgHKg7rFl3+2dErdzm
	67ihNd2LivbVVOQPKvRAjm1saYUzLjcHXhq8Y0FLBarhLR+/fRYqKqDr5sOzuA==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7416C0005;
	Mon, 10 Jul 2023 06:25:58 +0000 (UTC)
Date: Mon, 10 Jul 2023 08:25:58 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Yu Hao <yhao016@ucr.edu>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: mtu3: Fix possible use-before-initialization bug
Message-ID: <20230710082558.2f82d607@bootlin.com>
In-Reply-To: <CA+UBctBqtSvyBWf9ZwKbecTrh9_6sCDm_TyU-ncb+6h5y19K5g@mail.gmail.com>
References: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
	<20230705080625.02b2bac5@bootlin.com>
	<CA+UBctBqtSvyBWf9ZwKbecTrh9_6sCDm_TyU-ncb+6h5y19K5g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_232607_278083_EF095BC2 
X-CRM114-Status: GOOD (  19.86  )
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

Hi Yu,

On Sun, 9 Jul 2023 17:48:15 -0700
Yu Hao <yhao016@ucr.edu> wrote:

> Hi Hervé,
> 
> Thanks for the comments. How about this patch?
> ---
>  drivers/usb/mtu3/mtu3_gadget_ep0.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> index e4fd1bb14a55..af2884943c2a 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -600,7 +600,7 @@ static void ep0_tx_state(struct mtu3 *mtu)
>         mtu3_readl(mtu->mac_base, U3D_EP0CSR));
>  }
> 
> -static void ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
> +static int ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
>  {
>     struct mtu3_request *mreq;
>     u32 count;
> @@ -608,6 +608,8 @@ static void ep0_read_setup(struct mtu3 *mtu,
> struct usb_ctrlrequest *setup)
> 
>     csr = mtu3_readl(mtu->mac_base, U3D_EP0CSR) & EP0_W1C_BITS;
>     count = mtu3_readl(mtu->mac_base, U3D_RXCOUNT0);
> +   if (count == 0)
> +       return -EINVAL;

'count' should be tested against sizeof(*setup). Indeed, we need to have a
setup data packet in the fifo.

What do you think about:
if (count < sizef(*setup))
	return -EINVAL;

> 
>     ep0_read_fifo(mtu->ep0, (u8 *)setup, count);
> 
> @@ -642,7 +644,8 @@ __acquires(mtu->lock)
>     struct mtu3_request *mreq;
>     int handled = 0;
> 
> -   ep0_read_setup(mtu, &setup);
> +   if (ep0_read_setup(mtu, &setup))
> +       return -EINVAL;

Forward the error code to the caller ?

ret = ep0_read_setup(mtu, &setup)
if (ret < 0)
	return ret;


>     trace_mtu3_handle_setup(&setup);
> 
>     if ((setup.bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD)
> @@ -764,7 +767,9 @@ irqreturn_t mtu3_ep0_isr(struct mtu3 *mtu)
>             break;
>         }
> 
> -       ep0_handle_setup(mtu);
> +       if (ep0_handle_setup(mtu))
> +           break;
> +

Ok

>         ret = IRQ_HANDLED;
>         break;
>     default:

Be careful, your patch is wrongly indented.
tabs replaced by 4 spaces. You need to keep tabs.

Regards,
Hervé Codina

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

