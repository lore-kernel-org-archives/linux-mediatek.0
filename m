Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1EAC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 15:33:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030C86507C
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 15:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030C86507C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rTfaJLm2dUCNemcHZq/mFpFZ7AS3nXy54JDXMQOHeO8=; b=p7+kuCrei0eg+qwrSmNhe3mmS
	BRZ478M35Qm72RVL4P5SR921QgkvA589hKV3v2xUuH0V2xkuAc3Ehoykb00fNcz7vNsh2aDaUPi3p
	cHqV/7PyeJQ2nYzbqPbwkIWXNVLy+vCBlR052sZLXHWj8IMvCm8oeCe67YLfWZy1w7mpe8obSd34u
	CqAXM0zYiueq8CTbRr9f3/onBVE18frlx6CUtL6bOds730GFfOkqPXff1LPI5hPiDpFmWm09tXEa/
	AR4y2pLMYamo1iUk5H+V0ilGzhMpcsl01n2HKOsXO4xtYLQgwOHZIXHQlJ7dpINbR70vbIJUwutPZ
	ZRwflAdqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lICSW-00FSoU-Mq; Fri, 05 Mar 2021 15:33:44 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by desiato.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lICS3-00FSjU-SG
 for linux-mediatek@lists.infradead.org; Fri, 05 Mar 2021 15:33:24 +0000
Received: (qmail 39139 invoked by uid 1000); 5 Mar 2021 10:33:12 -0500
Date: Fri, 5 Mar 2021 10:33:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ikjoon Jang <ikjn@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 16/17] usb: common: add function to get interval
 expressed in us unit
Message-ID: <20210305153312.GA38200@rowland.harvard.edu>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-16-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614934975-15188-16-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_153316_790672_03C01BD5 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, Mar 05, 2021 at 05:02:54PM +0800, Chunfeng Yun wrote:
> Add a new function to convert bInterval into the time expressed
> in 1us unit.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---

> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -165,6 +165,39 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(usb_get_dr_mode);
>  
> +unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
> +				 enum usb_device_speed speed)
> +{
> +	unsigned int interval = 0;
> +
> +	switch (usb_endpoint_type(epd)) {
> +	case USB_ENDPOINT_XFER_CONTROL:
> +		/* uframes per NAK */
> +		if (speed == USB_SPEED_HIGH)
> +			interval = epd->bInterval;
> +		break;
> +	case USB_ENDPOINT_XFER_ISOC:
> +		interval = 1 << (epd->bInterval - 1);
> +		break;
> +	case USB_ENDPOINT_XFER_BULK:
> +		/* uframes per NAK */
> +		if (speed == USB_SPEED_HIGH && usb_endpoint_dir_out(epd))
> +			interval = epd->bInterval;
> +		break;
> +	case USB_ENDPOINT_XFER_INT:
> +		if (speed >= USB_SPEED_HIGH)
> +			interval = 1 << (epd->bInterval - 1);
> +		else
> +			interval = epd->bInterval;
> +		break;
> +	}
> +
> +	interval *= (speed >= USB_SPEED_HIGH) ? 125 : 1000;
> +
> +	return interval;
> +}
> +EXPORT_SYMBOL_GPL(usb_decode_interval);

> --- a/include/linux/usb/ch9.h
> +++ b/include/linux/usb/ch9.h
> @@ -90,6 +90,17 @@ extern enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev);
>   */
>  extern const char *usb_state_string(enum usb_device_state state);
>  
> +/**
> + * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
> + * @epd: The descriptor of the endpoint
> + * @speed: The speed that the endpoint works as
> + *
> + * Function returns the interval expressed in 1us unit for servicing
> + * endpoint for data transfers.
> + */
> +unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
> +				 enum usb_device_speed speed);

As a general rule, I believe people expect to find the kerneldoc for a 
function next to the function's definition, not next to the declaration 
in a header file.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
