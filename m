Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FA3C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CskGljhlS+dFvWiKSxszSoI29O/aUyZvjfgF/tWKzJs=; b=T0MpNskdi+cHXGZE1gxEhIIaEb
	kr9G7Ia3OltMbK8nY9sOIC8sPHiMuyZ/7k94L/pw3nYkge2hEnflgmirqAhGWQqLk7hUXCvR5HQtJ
	CPjPAa2MQv9XEFOzTWZaHxFIM6CrI3HAPzJAwfBMUJmYOrH/L3BUb5l1D6dm+5Dj4WMfwU6osdrOI
	zHNkT3O67L0Qb82sXIPWzIYHtKGiZV51eJ3btHju0K7IzCbxfz68fkfQ+4YU5aol9jBzF/QQrKJrN
	XFJ7avqSpqD0ANLQxlG83ocyx1JwmOsM4Pqo+2yuy342d0D96ptTWNFfBDN/1N3NECJckCf1YI2JU
	AqvwRDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXLV-00GXbT-HO; Wed, 28 Sep 2022 13:43:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXLG-00GXW9-Eo; Wed, 28 Sep 2022 13:43:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AEC86601FFC;
	Wed, 28 Sep 2022 14:43:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664372593;
	bh=Av/PH6kVhiIAtYUMsFAbHa4P+77I27U8HuG+9Mk9/bw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d9tOE73f5N7QYoN5O7LrOr8s52r3Xlx1RhKU80LLOuMfdeu8KhnI8UCrMBL4j7p3o
	 r50UPhG+kkdyKoHINKIplmXyqlOXi9bjgdBoR6N3EjdNjMRq4X3PuuM8D/IO36hyQ+
	 Rd9SmKPXBYK7KO4BJjafKztwOndX8j8fY8l6YEij1lOmrORxrYuS5Ffvd/Ovhn6N7L
	 ve1/nUgSYHNKIsEI9zFOrY/+s6/KJd+iqoADU4sg8PYO4c83swVIlnEInAb6VahFF8
	 9U/mtbW/FpK6uiUUDGosUF3cth3GsopyztXtkWySH1VfceclPI4R9BOK9t4Th4suyy
	 Nt0VgoGJiKcUA==
Message-ID: <6d312360-55b7-ebd5-be86-14f6943e273f@collabora.com>
Date: Wed, 28 Sep 2022 15:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] usb: mtu3: fix ep0's stall of out data stage
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Min Guo <min.guo@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Stable@vger.kernel.org
References: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_064314_797573_628A12A9 
X-CRM114-Status: GOOD (  27.94  )
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

Il 28/09/22 11:17, Chunfeng Yun ha scritto:
> It happens when enable uvc function, the flow as below:
> the controller switch to data stage, then call
>      -> foward_to_driver() -> composite_setup() -> uvc_function_setup(),
> it send out an event to user layer to notify it call
>      -> ioctl() -> uvc_send_response() -> usb_ep_queue(),
> but before the user call ioctl to queue ep0's buffer, the host already send
> out data, but the controller find that no buffer is queued to receive data,
> it send out STALL handshake.
> 
> To fix the issue, don't send out ACK of setup stage to switch to out data
> stage until the buffer is available.
> 
> Cc: <Stable@vger.kernel.org>
> Reported-by: Min Guo <min.guo@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/mtu3/mtu3.h            |  4 ++++
>   drivers/usb/mtu3/mtu3_gadget_ep0.c | 22 +++++++++++++++++++---
>   2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
> index 2d7b57e07eee..6b64ad17724d 100644
> --- a/drivers/usb/mtu3/mtu3.h
> +++ b/drivers/usb/mtu3/mtu3.h
> @@ -318,6 +318,9 @@ static inline struct ssusb_mtk *dev_to_ssusb(struct device *dev)
>    *		for GET_STATUS and SET_SEL
>    * @setup_buf: ep0 response buffer for GET_STATUS and SET_SEL requests
>    * @u3_capable: is capable of supporting USB3
> + * @delayed_setup: delay the setup stage to avoid STALL handshake in
> + *		out data stage due to the class driver doesn't queue buffer
> + *		before the host send out data
>    */
>   struct mtu3 {
>   	spinlock_t lock;
> @@ -360,6 +363,7 @@ struct mtu3 {
>   	unsigned connected:1;
>   	unsigned async_callbacks:1;
>   	unsigned separate_fifo:1;
> +	unsigned delayed_setup:1;
>   
>   	u8 address;
>   	u8 test_mode_nr;
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> index e4fd1bb14a55..f7a71cc83e15 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -162,6 +162,19 @@ static void ep0_do_status_stage(struct mtu3 *mtu)
>   	mtu3_writel(mbase, U3D_EP0CSR, value | EP0_SETUPPKTRDY | EP0_DATAEND);
>   }
>   
> +/* delay sending out ACK of setup stage to wait for OUT buffer queued */
> +static void ep0_setup_stage_send_ack(struct mtu3 *mtu)
> +{
> +	void __iomem *mbase = mtu->mac_base;
> +	u32 value;
> +
> +	if (mtu->delayed_setup) {
> +		value = mtu3_readl(mbase, U3D_EP0CSR) & EP0_W1C_BITS;
> +		mtu3_writel(mbase, U3D_EP0CSR, value | EP0_SETUPPKTRDY);
> +		mtu->delayed_setup = 0;
> +	}
> +}
> +
>   static int ep0_queue(struct mtu3_ep *mep0, struct mtu3_request *mreq);
>   
>   static void ep0_dummy_complete(struct usb_ep *ep, struct usb_request *req)
> @@ -628,8 +641,9 @@ static void ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
>   			csr | EP0_SETUPPKTRDY | EP0_DPHTX);
>   		mtu->ep0_state = MU3D_EP0_STATE_TX;
>   	} else {
> -		mtu3_writel(mtu->mac_base, U3D_EP0CSR,
> -			(csr | EP0_SETUPPKTRDY) & (~EP0_DPHTX));
> +		mtu3_writel(mtu->mac_base, U3D_EP0CSR, csr & ~EP0_DPHTX);
> +		/* send ACK when the buffer is queued */
> +		mtu->delayed_setup = 1;

I don't think that you need this variable: you're calling the function
ep0_setup_stage_send_ack() only when ep0_state == MU3D_EP0_STATE_RX in
ep0_queue()...

..so you'll never get a call to ep0_setup_stage_send_ack() with delayed_setup == 0!

Regards,
Angelo

>   		mtu->ep0_state = MU3D_EP0_STATE_RX;
>   	}
>   }
> @@ -804,9 +818,11 @@ static int ep0_queue(struct mtu3_ep *mep, struct mtu3_request *mreq)
>   
>   	switch (mtu->ep0_state) {
>   	case MU3D_EP0_STATE_SETUP:
> -	case MU3D_EP0_STATE_RX:	/* control-OUT data */
>   	case MU3D_EP0_STATE_TX:	/* control-IN data */
>   		break;
> +	case MU3D_EP0_STATE_RX:	/* control-OUT data */
> +		ep0_setup_stage_send_ack(mtu);
> +		break;
>   	default:
>   		dev_err(mtu->dev, "%s, error in ep0 state %s\n", __func__,
>   			decode_ep0_state(mtu));




