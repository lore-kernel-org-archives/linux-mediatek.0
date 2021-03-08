Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97A7C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:01:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754FC6514A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754FC6514A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WDVQqfkOQWCumUQSXc0XxwO+9smARpt/79xfNefMNy4=; b=ViLjIZBepp1c2GzrEwM2uFXQU
	G/KTo1YLqc0WD+kiI3os2s4sc/V7KryTakxcsGaVHI5g4FQximZxkeSBNw1pxseTr/B2qpfV7AXr/
	IvuL4YPuEhVyEDa1kl2ESbQa7akUg6wBuMFM8cf/XT9Xmr4B/fZhbMH+0ksqd4e9sosViZ4ag5xfd
	K8ZfDyOKy+WsTWV5WbLP2J9HKLdyLBUokL9LQzYrE4cm8TOw3YkO7lOxkP9ZbTZuKRK9y05MgHqaX
	kUFZYUXpLQCb0AcHfwuzP4/Y2u8GerCIjxJSRywAJ0r9VWM5YOBGGbb+MaXxDTqNSKdliP590TceP
	yWYu/u9mQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ5Cg-00EUJC-TV; Mon, 08 Mar 2021 02:01:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ5CJ-00EUC9-CE; Mon, 08 Mar 2021 02:00:44 +0000
X-UUID: 98f7d3afff8c415c86ed8798dcc1e105-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6qYg+DJBSG1Du8y4MYkkOeqRrd9rwS5CN17jsGP6xzU=; 
 b=WA6IpcBHguky+rMLAFcyeVeWfUfnqQYsRTb61ouCgT1I0ZyCZePG80OX9mfkEuH61webF2JR7kblsyqAwLYBVgnRR6TuJQkIfPfOXB4TsBGTJ/4vYovdhyD7mruRBO+S5rJJBhN+k4ZwSNlS88y6kVXiEGZMfT45EsTO46FcwVY=;
X-UUID: 98f7d3afff8c415c86ed8798dcc1e105-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2017903374; Sun, 07 Mar 2021 18:00:30 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 17:59:05 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Mar 2021 09:58:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 09:58:36 +0800
Message-ID: <1615168716.32109.6.camel@mhfsdcap03>
Subject: Re: [PATCH 16/17] usb: common: add function to get interval
 expressed in us unit
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Date: Mon, 8 Mar 2021 09:58:36 +0800
In-Reply-To: <20210305153312.GA38200@rowland.harvard.edu>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-16-git-send-email-chunfeng.yun@mediatek.com>
 <20210305153312.GA38200@rowland.harvard.edu>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AA76056FEB5929E229E6F99F439BC3A0267241E9DCA4D6CBEACABBBCC2768C852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_020040_653665_61FA62BD 
X-CRM114-Status: GOOD (  19.07  )
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

On Fri, 2021-03-05 at 10:33 -0500, Alan Stern wrote:
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
Got it, thanks

> 
> Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
