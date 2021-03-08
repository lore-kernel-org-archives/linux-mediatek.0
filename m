Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EB2C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:03:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3B46513A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3B46513A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MbAW3Q4ykmGNf36a1oAyCgHj0fs9HJw4z3MZ3AnsZvI=; b=ddjOhJ6QIhDMd79auj9/nXXo+
	Ec/uYRgzzwPksZroVkMenlWaViwXL6WgEBkJpYmDsQ9eFJN22l11HnHY/AyPTNIK3/zmllgd1guVM
	2xR7aiNskOtF8rqpsttId4gWCpD/860wehbbfKPW8swBhtn56l0/AAE7srcHPkY1R3oOUM+cSYpky
	a//sNunE7czV+O/v42c6kKEhDKlDDDhH4lGQOU/ZmYg22Vk8CrI0wCeg2WNddSuoIMLA1rZNIOiWc
	KemHQDQdKCF2KZytBRzu+E5yz9L2GuYOyxy/BmDS8Urrl2F7wywv30AmZ1q7zEXICCEjhcsbPsT/b
	/YY1XEdeg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ5ET-00EUp6-RH; Mon, 08 Mar 2021 02:02:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ5E9-00EUj1-Pu; Mon, 08 Mar 2021 02:02:39 +0000
X-UUID: caab08c26d424f15ae401fa15a01b606-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h9EFUsdAxVRzuiXK7xWjWP87blcUdQUpQQm0u2fICNw=; 
 b=n491iP+jrdJnh4XyGzeRmrVX+IfLITLtfny/ydVs9HrILSLBFDWlqCK7A23M0cEleivwuUud5MMgbgmYfU5Cz5HxUTJlOA24qdIVw7kNeoifj9KbOICD5nFq2RsCWa/bBOF2Qc6fHx45czldN8cra/pgj1ildZXcSZdmNwjwbLo=;
X-UUID: caab08c26d424f15ae401fa15a01b606-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1452693021; Sun, 07 Mar 2021 18:02:26 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:02:25 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n1.mediatek.inc
 (172.21.101.129) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Mar 2021 10:02:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:02:23 +0800
Message-ID: <1615168943.32109.8.camel@mhfsdcap03>
Subject: Re: [PATCH 16/17] usb: common: add function to get interval
 expressed in us unit
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman
 <mathias.nyman@intel.com>, Ikjoon Jang <ikjn@chromium.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Date: Mon, 8 Mar 2021 10:02:23 +0800
In-Reply-To: <YEJSjJnjXl7f/BP9@kroah.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-16-git-send-email-chunfeng.yun@mediatek.com>
 <20210305153312.GA38200@rowland.harvard.edu> <YEJSjJnjXl7f/BP9@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_020236_406953_4C55193F 
X-CRM114-Status: GOOD (  25.20  )
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

On Fri, 2021-03-05 at 16:47 +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 05, 2021 at 10:33:12AM -0500, Alan Stern wrote:
> > On Fri, Mar 05, 2021 at 05:02:54PM +0800, Chunfeng Yun wrote:
> > > Add a new function to convert bInterval into the time expressed
> > > in 1us unit.
> > > 
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > 
> > > --- a/drivers/usb/common/common.c
> > > +++ b/drivers/usb/common/common.c
> > > @@ -165,6 +165,39 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(usb_get_dr_mode);
> > >  
> > > +unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
> > > +				 enum usb_device_speed speed)
> > > +{
> > > +	unsigned int interval = 0;
> > > +
> > > +	switch (usb_endpoint_type(epd)) {
> > > +	case USB_ENDPOINT_XFER_CONTROL:
> > > +		/* uframes per NAK */
> > > +		if (speed == USB_SPEED_HIGH)
> > > +			interval = epd->bInterval;
> > > +		break;
> > > +	case USB_ENDPOINT_XFER_ISOC:
> > > +		interval = 1 << (epd->bInterval - 1);
> > > +		break;
> > > +	case USB_ENDPOINT_XFER_BULK:
> > > +		/* uframes per NAK */
> > > +		if (speed == USB_SPEED_HIGH && usb_endpoint_dir_out(epd))
> > > +			interval = epd->bInterval;
> > > +		break;
> > > +	case USB_ENDPOINT_XFER_INT:
> > > +		if (speed >= USB_SPEED_HIGH)
> > > +			interval = 1 << (epd->bInterval - 1);
> > > +		else
> > > +			interval = epd->bInterval;
> > > +		break;
> > > +	}
> > > +
> > > +	interval *= (speed >= USB_SPEED_HIGH) ? 125 : 1000;
> > > +
> > > +	return interval;
> > > +}
> > > +EXPORT_SYMBOL_GPL(usb_decode_interval);
> > 
> > > --- a/include/linux/usb/ch9.h
> > > +++ b/include/linux/usb/ch9.h
> > > @@ -90,6 +90,17 @@ extern enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev);
> > >   */
> > >  extern const char *usb_state_string(enum usb_device_state state);
> > >  
> > > +/**
> > > + * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
> > > + * @epd: The descriptor of the endpoint
> > > + * @speed: The speed that the endpoint works as
> > > + *
> > > + * Function returns the interval expressed in 1us unit for servicing
> > > + * endpoint for data transfers.
> > > + */
> > > +unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
> > > +				 enum usb_device_speed speed);
> > 
> > As a general rule, I believe people expect to find the kerneldoc for a 
> > function next to the function's definition, not next to the declaration 
> > in a header file.
> 
> I was going to make the same review comment, but if you look above this
> in that file, there's other kernel doc information in the .h file, so
> this does match with the style of the file :(
> 
> We can fix that all up later.
I'll prepare a patch

Thank you
> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
