Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3EDC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 15:48:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 084566508D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 15:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 084566508D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NRiWTkbHHVxmj4KR/fhEAGHDurpQf9CXTh+qbbmDzD8=; b=N9cDiaVupz4UXXfxEckAO9iMu
	g3xAEFy5jzdPhWabXAHL9mC7k8ZVJlNwIxci9qmUxPwlLEGdfpkEgjFN16oYeNyXiGlPG8w/55S/G
	lGF9GkqtGvFblEL5XFIguEX/58avcorMjZSclAvao4WFtLXYz63AdzEghDUSmZs83ECWRK4O7qvW6
	MAZ5ztoXv+6eC1nIl1sXsohjbqRrs2mF8TagXBvkyPhehcPAPIV2bDyCJM6VlPB35VfhectHH8xzv
	JGEDsZfnuwL7BYMb4jc80R86jr2rFV6jNvW3KlA19GOhnNO+yHjSA0sLcLUWNrED33LPo6g5oCvG6
	PEcjSi6iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lICgJ-00FVef-4n; Fri, 05 Mar 2021 15:47:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lICfw-00FVYu-9x; Fri, 05 Mar 2021 15:47:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2287E65092;
 Fri,  5 Mar 2021 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614959253;
 bh=LZDg8chHQnKxfnvQXDeCl73wwlxc/LGrLyawbsjqJf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=omTvdzTY3BcKun81+mXyUYLEpAeBVUVnSBThuBapVwZCkNmXK4WW8PkqxFhfHDmmw
 8roqNBSvRa44hJVXudK5M1B55J5S9eTdcfoGDzXutRfkK2DaY5PKEEpa4GN7NcgBeK
 HJlkUnOoh+cwHrsB/zOgohz9hpzvD0tCIbkaDUyM=
Date: Fri, 5 Mar 2021 16:47:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 16/17] usb: common: add function to get interval
 expressed in us unit
Message-ID: <YEJSjJnjXl7f/BP9@kroah.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-16-git-send-email-chunfeng.yun@mediatek.com>
 <20210305153312.GA38200@rowland.harvard.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305153312.GA38200@rowland.harvard.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_154739_550928_C3458314 
X-CRM114-Status: GOOD (  20.21  )
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

On Fri, Mar 05, 2021 at 10:33:12AM -0500, Alan Stern wrote:
> On Fri, Mar 05, 2021 at 05:02:54PM +0800, Chunfeng Yun wrote:
> > Add a new function to convert bInterval into the time expressed
> > in 1us unit.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> 
> > --- a/drivers/usb/common/common.c
> > +++ b/drivers/usb/common/common.c
> > @@ -165,6 +165,39 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_get_dr_mode);
> >  
> > +unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
> > +				 enum usb_device_speed speed)
> > +{
> > +	unsigned int interval = 0;
> > +
> > +	switch (usb_endpoint_type(epd)) {
> > +	case USB_ENDPOINT_XFER_CONTROL:
> > +		/* uframes per NAK */
> > +		if (speed == USB_SPEED_HIGH)
> > +			interval = epd->bInterval;
> > +		break;
> > +	case USB_ENDPOINT_XFER_ISOC:
> > +		interval = 1 << (epd->bInterval - 1);
> > +		break;
> > +	case USB_ENDPOINT_XFER_BULK:
> > +		/* uframes per NAK */
> > +		if (speed == USB_SPEED_HIGH && usb_endpoint_dir_out(epd))
> > +			interval = epd->bInterval;
> > +		break;
> > +	case USB_ENDPOINT_XFER_INT:
> > +		if (speed >= USB_SPEED_HIGH)
> > +			interval = 1 << (epd->bInterval - 1);
> > +		else
> > +			interval = epd->bInterval;
> > +		break;
> > +	}
> > +
> > +	interval *= (speed >= USB_SPEED_HIGH) ? 125 : 1000;
> > +
> > +	return interval;
> > +}
> > +EXPORT_SYMBOL_GPL(usb_decode_interval);
> 
> > --- a/include/linux/usb/ch9.h
> > +++ b/include/linux/usb/ch9.h
> > @@ -90,6 +90,17 @@ extern enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev);
> >   */
> >  extern const char *usb_state_string(enum usb_device_state state);
> >  
> > +/**
> > + * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
> > + * @epd: The descriptor of the endpoint
> > + * @speed: The speed that the endpoint works as
> > + *
> > + * Function returns the interval expressed in 1us unit for servicing
> > + * endpoint for data transfers.
> > + */
> > +unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
> > +				 enum usb_device_speed speed);
> 
> As a general rule, I believe people expect to find the kerneldoc for a 
> function next to the function's definition, not next to the declaration 
> in a header file.

I was going to make the same review comment, but if you look above this
in that file, there's other kernel doc information in the .h file, so
this does match with the style of the file :(

We can fix that all up later.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
