Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE77C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 09:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF15613ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 09:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF15613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bobCdGsLTmJRHc4e+Bfm5onNpTqqjNEBg9nGcFBe1Nw=; b=xAcAcwbIsJs/xL
	nfMAoi7ZexdKTQQ94uV6uPBwEjatCmTdUVNKP81yZ+laDQv0pjWtMb8jPFFqtVoEasQbnvk50TsCw
	op47yPMkVs0NB3xjsHpOjhR8oCB2V2BFFYBL/JlYRC/yeI/QdUan75jZF9OxxT3xISBaqvY4p0den
	iuDX3qwScAzEO2xVLpbLKdCkrqTcveIII2jgz6MmFqj7O/wI/lJMGeieOUtDmVglz7lOwXnDNSVwu
	BqB8g7GyADBona28PM2c9lnPysvHR10Wn16onOEZF//CxWsedcxHTqifd+77bbAi/JSnHIEti9JfN
	88Ms/hApza99DyEQBkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCiJ-004XLQ-Tr; Thu, 27 May 2021 09:54:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCiF-004XJE-W7; Thu, 27 May 2021 09:54:02 +0000
X-UUID: adfd4e5258514d618a21cad7cbb67a07-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UG82Zx0u8Lp+Mb9aUfFVOp7l7pjVcgLf+byTViN+wmc=; 
 b=oN3ywjZGK0TB4wa5gno7fljOMEQZzvm6dFf7qLxihlyyYSnLAO9zhsbW8y9HQAJDMYTmHqJ+wJDvniNWVo5g8RmnC4IoiYJpyICvMJq0TaAtxwv44D7XNybWAm0/B+iKLrW6AwW8OxIYv/H+IJUmfDmMR0cTAvUTL+upJFd96u8=;
X-UUID: adfd4e5258514d618a21cad7cbb67a07-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 956848221; Thu, 27 May 2021 02:53:54 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 02:43:51 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 27 May 2021 17:43:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 May 2021 17:43:39 +0800
Message-ID: <1622108619.5918.3.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] usb: common: add helper to get
 role-switch-default-mode
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Felipe Balbi <balbi@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 27 May 2021 17:43:39 +0800
In-Reply-To: <YK9KG5c96VmdHfF3@kroah.com>
References: <1621933165-9661-1-git-send-email-chunfeng.yun@mediatek.com>
 <1621933165-9661-2-git-send-email-chunfeng.yun@mediatek.com>
 <YK9KG5c96VmdHfF3@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E3B543BEFB4730A1515935146F529F28626AA0ABC9D3B9CAB6FCA92BBBE1221B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_025401_473724_A760072D 
X-CRM114-Status: GOOD (  22.20  )
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

On Thu, 2021-05-27 at 09:28 +0200, Greg Kroah-Hartman wrote:
> On Tue, May 25, 2021 at 04:59:24PM +0800, Chunfeng Yun wrote:
> > Add helper to get "role-switch-default-mode", and convert it
> > to the corresponding enum usb_dr_mode
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/common/common.c | 20 ++++++++++++++++++++
> >  include/linux/usb/otg.h     |  1 +
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > index fff318597337..78a625a4e526 100644
> > --- a/drivers/usb/common/common.c
> > +++ b/drivers/usb/common/common.c
> > @@ -207,6 +207,26 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_get_dr_mode);
> >  
> > +/**
> > + * usb_get_role_switch_default_mode - Get default mode for given device
> > + * @dev: Pointer to the given device
> > + *
> > + * The function gets string from property 'role-switch-default-mode',
> > + * and returns the corresponding enum usb_dr_mode.
> > + */
> > +enum usb_dr_mode usb_get_role_switch_default_mode(struct device *dev)
> > +{
> > +	const char *str;
> > +	int ret;
> > +
> > +	ret = device_property_read_string(dev, "role-switch-default-mode", &str);
> > +	if (ret < 0)
> > +		return USB_DR_MODE_UNKNOWN;
> > +
> > +	return usb_get_dr_mode_from_string(str);
> > +}
> > +EXPORT_SYMBOL_GPL(usb_get_role_switch_default_mode);
> > +
> >  /**
> >   * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
> >   * @epd: The descriptor of the endpoint
> > diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> > index a86ee6aad51b..bde313c97fb6 100644
> > --- a/include/linux/usb/otg.h
> > +++ b/include/linux/usb/otg.h
> > @@ -121,5 +121,6 @@ enum usb_dr_mode {
> >  };
> >  
> >  extern enum usb_dr_mode usb_get_dr_mode(struct device *dev);
> > +extern enum usb_dr_mode usb_get_role_switch_default_mode(struct device *dev);
> 
> What other code outside of the dwc3 driver will ever need to call this?
I prepare a series of pathes for mtu3, and will support
"role-switch-default-mode" property

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
