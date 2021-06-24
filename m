Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5427DC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:24:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2121A613EB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2121A613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ma+hGaa/Gdw+k7JoBFuQb11gsE7VQ7caclSPr+DL/BA=; b=nDhuyTXSWjd8/c
	h+etlrJE0hk+Ghv05EwZY0vtpQt+Ra37XSGSvo0A9AmCySRLPHOQs9+aTokRxS6OEn+mAQ7Qc4S8U
	+hZ2ZHxGYsV912nA+590L/Oj2a+IXRM51iQeMfiGItvycqsbEiBNxtnR2CYW6c2wgyAugI6kHGXaO
	6jq0ajxAg78jxWDzKzR9aKmhVRJBGoKi6rY01/EVCp3Z6wg0bcYdyDM0//Zsc0fko6cLBoi/TQqHy
	tWkZem5nm/2PFMFjOOqjiJ5w/jvN+cj4rKA/LURdOOvC28FxZGMqVsBWtY6zFZyEGsUXDj5QBelVy
	rDCH5E1xtDcwyCgavnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwOOd-00EaND-00; Thu, 24 Jun 2021 12:23:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwOOL-00EaJ5-TL; Thu, 24 Jun 2021 12:23:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 937C861209;
 Thu, 24 Jun 2021 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624537413;
 bh=JTsUy6jEymu4qp5qGCh4JVhR5yjdg1Lz3myy2L5OZJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QvClQ3g2Htt0PFAENbaUhP8J94m0ztjO+UjJ/8v1MDWqUWSbTiiXYg2gxvP15Coxm
 FkDdN64l6rzNumPsxbxhBgsv6hJ1RtC9K7lOnuO9v1B0756lA6iqnGwQ3TneWrbSOG
 Ty5Nr9Krggxb5ET4emDq8Dfm/J67T2CioXuvCGqA=
Date: Thu, 24 Jun 2021 14:23:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bpf@vger.kernel.org,
 wsd_upstream@mediatek.com, chao.song@mediatek.com,
 kuohong.wang@mediatek.com
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Message-ID: <YNR5QuYqknaZS9+j@kroah.com>
References: <YNNv1AxDNBdPcQ1U@kroah.com>
 <20210624115349.2264-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624115349.2264-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_052333_986827_EC323A95 
X-CRM114-Status: GOOD (  31.60  )
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

On Thu, Jun 24, 2021 at 07:53:49PM +0800, Rocco Yue wrote:
> >> +/* exposed API
> >> + * receive incoming datagrams from the Modem and push them to the
> >> + * kernel networking system
> >> + */
> >> +int ccmni_rx_push(unsigned int ccmni_idx, struct sk_buff *skb)
> > 
> > Ah, so this driver doesn't really do anything on its own, as there is no
> > modem driver for it.
> > 
> > So without a modem driver, it will never be used?  Please submit the
> > modem driver at the same time, otherwise it's impossible to review this
> > correctly.
> > 
> 
> without MTK ap ccci driver (modem driver), ccmni_rx_push() and
> ccmni_hif_hook() are not be used.
> 
> Both of them are exported as symbols because MTK ap ccci driver
> will be complied to the ccci.ko file.

But I do not see any code in this series that use these symbols.  We can
not have exports that no one uses.  Please add the driver to this patch
series when you resend it.

> In addition, the code of MTK's modem driver is a bit complicated,
> because this part has more than 30,000 lines of code and contains
> more than 10 modules. We are completeing the upload of this huge
> code step by step. Our original intention was to upload the ccmni
> driver that directly interacts with the kernel first, and then
> complete the code from ccmni to the bottom layer one by one from
> top to bottom. We expect the completion period to be about 1 year.

Again, we can not add code to the kernel that is not used, sorry.  That
would not make any sense, would you want to maintain such a thing?

And 30k of code seems a bit excesive for a modem driver.   Vendors find
that when they submit code for inclusion in the kernel tree, in the end,
they end up 1/3 the original size, so 10k is reasonable.

I can also take any drivers today into the drivers/staging/ tree, and
you can do the cleanups there as well as getting help from others.

1 year seems like a long time to do "cleanup", good luck!

> > +++ b/drivers/net/ethernet/mediatek/ccmni/ccmni.h
> > 
> > Why do you have a .h file for a single .c file?  that shouldn't be
> > needed.
> 
> I add a .h file to facilitate subsequent code expansion. If it's
> not appropriate to do this here, I can add the content of .h into
> .c file.

If nothing other than a single .c file needs it, put it into that .c
file please.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
