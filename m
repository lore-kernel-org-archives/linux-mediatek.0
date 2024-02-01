Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1021C47DDB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNk53kronNKo1IDT9xXa0XZMYPgC1dyFPW6QZvmsczU=; b=oZ6LIYdDGGzVIzVkBNnKBJro2v
	ogVxW1P3+HG2UWQ6Zd8TUDhu792XT/1J45f2KFgPlOR6ATynZCzMYklOvaBH96YILlPLclsSYvwi6
	EvLqPx1SSWcaaaaU7MQ9cL6bY3oEeftU2A/0IVxRQDN3UX8fl3M5XtHQtJfQVNrCGSD0JutdNPDwy
	EO/6GoLGXFriwdKDYe4spsCxveCEJyK+zw/5i67Q2b+hZUgWjilP5ZhBI4n0KKYmwtJ/LYG1OsPn0
	Qbpp5WSkLtVLrLWUPwvYsdRuNzAKbhuqKpp01or2TA5RRnynfLauS2g3pDEY1528SHT9nkpagXckV
	c8YNtpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSgq-000000078TL-1RZu;
	Thu, 01 Feb 2024 08:44:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSgm-000000078Rg-3huN;
	Thu, 01 Feb 2024 08:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706777090;
	bh=SSQaV5ATZoNLfZMtApEWvimSypLVgmPZGof4nD6i2Ug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WjjoW9JBQ/fZUHJOjUjU61p5G9EkjthjuRCB5LQMUULNJh8H64A90Bl7mp74QIvfz
	 S+T0fFQGSiFLomQVbcFQoEx/+VvZFHsBPuFJ4QLy0apX0JwoIci2A22pzZurwrLXia
	 n0xqROZmqgeUnrw1+2fGmxYBVUpUy1w23LVYZHN2pSrFe5HRAYQgBYExBrQ5m5f9Yj
	 pACvv9BeXYrz6Fl8JGpIwqHGythw+CnDtOJGHScYooQ6RREdE2teY5v47fyytMjr0x
	 hiWKGtMV5AkoJLxzv0lYO7ewGils76Iw3Jn+RQ80p3CmUzACL6QwtWDhJDBrIgdaO3
	 LAwYe/oaMNOeg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A91F3780022;
	Thu,  1 Feb 2024 08:44:49 +0000 (UTC)
Message-ID: <7cf660b8-240f-442e-be55-2e6e6521338b@collabora.com>
Date: Thu, 1 Feb 2024 09:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Avoid to call mbox_client_txdone on
 txdone_irq mode
To: Pin-Chuan Liu <flash.liu@mediatek.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, cylen.yao@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240201045253.14390-1-flash.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240201045253.14390-1-flash.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_004453_106907_98463A15 
X-CRM114-Status: GOOD (  17.00  )
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

Il 01/02/24 05:52, Pin-Chuan Liu ha scritto:
> On txdone_irq mode, tx_tick is done from mbox_chan_txdone.
> Calling to mbox_client_txdone could get error message
> and return directly, add a check to avoid this.
> 
> Signed-off-by: Pin-Chuan Liu <flash.liu@mediatek.com>
> Change-Id: Iacbe0d36ef9cc16974c013c3e94c47dc79eae52b

Change-Id is something internal to you and has no meaning upstream.
Please remove it.

> ---
>   drivers/firmware/arm_scmi/mailbox.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
> index b8d470417e8f..f6fe801c2e34 100644
> --- a/drivers/firmware/arm_scmi/mailbox.c
> +++ b/drivers/firmware/arm_scmi/mailbox.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/err.h>
>   #include <linux/device.h>
> +#include <linux/mailbox_controller.h>
>   #include <linux/mailbox_client.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
> @@ -275,7 +276,12 @@ static void mailbox_mark_txdone(struct scmi_chan_info *cinfo, int ret,
>   	 * Unfortunately, we have to kick the mailbox framework after we have
>   	 * received our message.
>   	 */
> -	mbox_client_txdone(smbox->chan, ret);
> +
> +	/*
> +	 * With txdone_irq mode, kick can be done by mbox_chan_txdone.
> +	 */

Besides, you need one single line for this comment

Regards,
Angelo

> +	if (!(smbox->chan->mbox->txdone_irq))
> +		mbox_client_txdone(smbox->chan, ret);
>   }
>   
>   static void mailbox_fetch_response(struct scmi_chan_info *cinfo,



