Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB95C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47B1A61186
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47B1A61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ACRf7+VM0jNo1AH1OxbjDgaP5J5VykaMdPw9zY1pJ4=; b=hhoNMnBMUzeH9G
	xuCyiB8cMZsMy92m/YPEIFJyHIX8TZ0NFUIxhXQaHfULIsZpoxWswFPpvNbJF3CafMtGTUyJ3g7Ug
	4/SzvZ2T/H1zOHJS90hcqqXrd6pgeIZ0/xAaTE28yKWMgfHjBeMycjjoNRfOpdCCpzRgcXxW4ChNY
	7yejQmNOHlKHWefRRRENQTqcLzfEOTdLXtDWdicj42AY6/aQ6jFroEfbxt5uSfjt7TNJ05vQscKOj
	6OIPd/AT77ZqU+k6yq1Eouowo2jn3vfegr0evyBnE+0HiRZUU5H1w+hkl5WBGtlCuE98rnFGn9i/6
	b6/wBqwvjkpZ6zebqrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCrz-004bKU-26; Thu, 27 May 2021 10:04:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCq3-004aOV-FG; Thu, 27 May 2021 10:02:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6573261248;
 Thu, 27 May 2021 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622109723;
 bh=dFD8ud/4DwoZRZKPqGaOszuuLnJUDxlCzgH3slyHjBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e74Z8OXps2QibaOu9PZ/b9VNpip5dsFf7SE0/YWdycwZEIStl08VMt8njkQhpZR+B
 P86W0faR6FGXysDIPjDOOoHOu0B/fLJ5A+143tsuWHMQcUTiinK3wU8o7DipAkr+kz
 +2u4KHVtvpHWKtHUt5+FFPzqYBA/XXony6E710l4=
Date: Thu, 27 May 2021 12:01:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] usb: common: add helper to get
 role-switch-default-mode
Message-ID: <YK9uFwkb5+Y6Babz@kroah.com>
References: <1621933165-9661-1-git-send-email-chunfeng.yun@mediatek.com>
 <1621933165-9661-2-git-send-email-chunfeng.yun@mediatek.com>
 <YK9KG5c96VmdHfF3@kroah.com> <1622108619.5918.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622108619.5918.3.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_030203_576797_1FB4497C 
X-CRM114-Status: GOOD (  21.95  )
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

On Thu, May 27, 2021 at 05:43:39PM +0800, Chunfeng Yun wrote:
> On Thu, 2021-05-27 at 09:28 +0200, Greg Kroah-Hartman wrote:
> > On Tue, May 25, 2021 at 04:59:24PM +0800, Chunfeng Yun wrote:
> > > Add helper to get "role-switch-default-mode", and convert it
> > > to the corresponding enum usb_dr_mode
> > > 
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >  drivers/usb/common/common.c | 20 ++++++++++++++++++++
> > >  include/linux/usb/otg.h     |  1 +
> > >  2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > > index fff318597337..78a625a4e526 100644
> > > --- a/drivers/usb/common/common.c
> > > +++ b/drivers/usb/common/common.c
> > > @@ -207,6 +207,26 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(usb_get_dr_mode);
> > >  
> > > +/**
> > > + * usb_get_role_switch_default_mode - Get default mode for given device
> > > + * @dev: Pointer to the given device
> > > + *
> > > + * The function gets string from property 'role-switch-default-mode',
> > > + * and returns the corresponding enum usb_dr_mode.
> > > + */
> > > +enum usb_dr_mode usb_get_role_switch_default_mode(struct device *dev)
> > > +{
> > > +	const char *str;
> > > +	int ret;
> > > +
> > > +	ret = device_property_read_string(dev, "role-switch-default-mode", &str);
> > > +	if (ret < 0)
> > > +		return USB_DR_MODE_UNKNOWN;
> > > +
> > > +	return usb_get_dr_mode_from_string(str);
> > > +}
> > > +EXPORT_SYMBOL_GPL(usb_get_role_switch_default_mode);
> > > +
> > >  /**
> > >   * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
> > >   * @epd: The descriptor of the endpoint
> > > diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> > > index a86ee6aad51b..bde313c97fb6 100644
> > > --- a/include/linux/usb/otg.h
> > > +++ b/include/linux/usb/otg.h
> > > @@ -121,5 +121,6 @@ enum usb_dr_mode {
> > >  };
> > >  
> > >  extern enum usb_dr_mode usb_get_dr_mode(struct device *dev);
> > > +extern enum usb_dr_mode usb_get_role_switch_default_mode(struct device *dev);
> > 
> > What other code outside of the dwc3 driver will ever need to call this?
> I prepare a series of pathes for mtu3, and will support
> "role-switch-default-mode" property

Ok, how about we wait until at least 2 drivers need it before accepting
this change.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
