Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1464CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 01:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C525F613D0
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 01:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C525F613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLZHGd3QuY3wFdCUgKZOMDqmLGkeX381u2Cqpbyy21I=; b=HqNQQLYRPHe/um
	TSQJZq3dcZxFtSOD3Mnp4eO2UzmpCtChAV86JWOcMNEjW2SMNb5j5nmh5RfwlwNUWm72IlDKVhzrQ
	LvAx68DGfRI3TkFXNUDqTOlPteCo+S+ZMc6ZiKTyg68XEpKhBnk6x8zCoaS/N/96Ri1TWkmkf0AUw
	baBkiC4Qpdun8htYW1TdtMavF58Oztdhi51X8fnaBHLkanxSNhjPuzOQWNDTItr4fzpkNvDC8fzrf
	Bk6owC3qDU2snV2Jwic18ErXhznefxezs3sz3Rt+XIsyiCg7AZ0F0WCXwck1Ov0NaNZK0wwsaTk1N
	xr18vkl5oQp5ROOrqBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW7di-00GPit-79; Fri, 01 Oct 2021 01:47:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW7de-00GPhg-LH; Fri, 01 Oct 2021 01:47:05 +0000
X-UUID: 5e0f1d6715ee4625b6eb666a950c4591-20210930
X-UUID: 5e0f1d6715ee4625b6eb666a950c4591-20210930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-ch.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1860689144; Thu, 30 Sep 2021 18:46:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 18:36:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 1 Oct 2021 09:36:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Oct 2021 09:36:54 +0800
Message-ID: <a891e733157ca7e631ca120ebae15557a6f05738.camel@mediatek.com>
Subject: Re: [PATCH] r8152: stop submitting rx for -EPROTO
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Hayes Wang <hayeswang@realtek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@google.com"
 <hsinyi@google.com>, nic_swsd <nic_swsd@realtek.com>
Date: Fri, 1 Oct 2021 09:36:54 +0800
In-Reply-To: <7dc4198f05784b6686973500150faca7@realtek.com>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
 <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
 <7dc4198f05784b6686973500150faca7@realtek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_184702_751595_70290278 
X-CRM114-Status: GOOD (  21.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-09-30 at 02:41 +0000, Hayes Wang wrote:
> Jason-ch Chen <jason-ch.chen@mediatek.com>
> > Sent: Wednesday, September 29, 2021 5:53 PM
> 
> [...]
> > Hi Hayes,
> > 
> > Sometimes Rx submits rapidly and the USB kernel driver of
> > opensource
> > cannot receive any disconnect event due to CPU heavy loading, which
> > finally causes a system crash.
> > Do you have any suggestions to modify the r8152 driver to prevent
> > this
> > situation happened?
> 
> Do you mind to try the following patch?
> It avoids to re-submit RX immediately.
> 
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 60ba9b734055..bfe00af8283f 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -767,6 +767,7 @@ enum rtl8152_flags {
>  	PHY_RESET,
>  	SCHEDULE_TASKLET,
>  	GREEN_ETHERNET,
> +	SCHEDULE_NAPI,
>  };
>  
>  #define DEVICE_ID_THINKPAD_THUNDERBOLT3_DOCK_GEN2	0x3082
> @@ -1770,6 +1771,14 @@ static void read_bulk_callback(struct urb
> *urb)
>  		rtl_set_unplug(tp);
>  		netif_device_detach(tp->netdev);
>  		return;
> +	case -EPROTO:
> +		urb->actual_length = 0;
> +		spin_lock_irqsave(&tp->rx_lock, flags);
> +		list_add_tail(&agg->list, &tp->rx_done);
> +		spin_unlock_irqrestore(&tp->rx_lock, flags);
> +		set_bit(SCHEDULE_NAPI, &tp->flags);
> +		schedule_delayed_work(&tp->schedule, 1);
> +		return;
>  	case -ENOENT:
>  		return;	/* the urb is in unlink state */
>  	case -ETIME:
> @@ -2425,6 +2434,7 @@ static int rx_bottom(struct r8152 *tp, int
> budget)
>  	if (list_empty(&tp->rx_done))
>  		goto out1;
>  
> +	clear_bit(SCHEDULE_NAPI, &tp->flags);
>  	INIT_LIST_HEAD(&rx_queue);
>  	spin_lock_irqsave(&tp->rx_lock, flags);
>  	list_splice_init(&tp->rx_done, &rx_queue);
> @@ -2441,7 +2451,7 @@ static int rx_bottom(struct r8152 *tp, int
> budget)
>  
>  		agg = list_entry(cursor, struct rx_agg, list);
>  		urb = agg->urb;
> -		if (urb->actual_length < ETH_ZLEN)
> +		if (urb->status != 0 || urb->actual_length < ETH_ZLEN)
>  			goto submit;
>  
>  		agg_free = rtl_get_free_rx(tp, GFP_ATOMIC);
> @@ -6643,6 +6653,10 @@ static void rtl_work_func_t(struct work_struct
> *work)
>  	    netif_carrier_ok(tp->netdev))
>  		tasklet_schedule(&tp->tx_tl);
>  
> +	if (test_and_clear_bit(SCHEDULE_NAPI, &tp->flags) &&
> +	    !list_empty(&tp->rx_done))
> +		napi_schedule(&tp->napi);
> +
>  	mutex_unlock(&tp->control);
>  
>  out1:
> 
> 
> Best Regards,
> Hayes

Hi,

This patch has been verified.
It did avoid Rx re-submit immediately.

Thanks,
Jason


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
