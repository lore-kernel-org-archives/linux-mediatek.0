Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57FCC49EA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 16:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688F161410
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 16:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 688F161410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sK9DyOT/M1fN4RDyOwKFmpwdoK4FHwJgNYT6fxaWTTk=; b=Dx92RqemgLKOAR
	QiNuBsTvlKv9qRv9DtiIzD1YIhLqsQ1udGNDH5la4/yG0iobhNLQLL/gkdijYQ8o5OEj3q/cpExXv
	CoKlyX9FjbW2Hy+ORIKcUrg/2xhCHB7ArkehCgtFGF0LkaMBLjDTnuarETu7UEnHQsQr6ACXlG8HO
	jp0ltedpG4PQJBrbwQk4RUUeoizaYvE/99a33sgB3cHRcRdwhXSjPUXiQ+j3jwPkrg3pBKkzUtZ35
	mEZNNL9EJAckv9JcMoGHgP9aq8+KHUeegI5hc+GTgJrct84t3F0zDBkvAoEwRCeXMTjda2AmgTYsN
	+OPxwgQErEH+Ed/v39TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwSa5-00FYs0-Lj; Thu, 24 Jun 2021 16:51:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwSZr-00FYpJ-1D; Thu, 24 Jun 2021 16:51:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C31D96140A;
 Thu, 24 Jun 2021 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624553502;
 bh=8VJ9gHpfNusEy0hnsToOzf7TUZAq4xvU5hO1AlbgRro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pq5SVqGhwbOimMrJsmsORyiGbAYYOTTL6ujg1C56oBKp9zZJhsWzg/zNRpvAVCL1t
 W4iw9z/Znfp6VjndwmcbTgWTviXGQA7kExYTPH2HiU0L1F8rrW9y0rnTUy5BrHlqM5
 FZL8G89I7CwqGIIunZk2ANNGuue/yUF6qRZvGEro=
Date: Thu, 24 Jun 2021 18:51:39 +0200
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
Subject: Re: [PATCH 4/4] drivers: net: mediatek: initial implementation of
 ccmni
Message-ID: <YNS4GzYHpxMWIH+1@kroah.com>
References: <YNR5QuYqknaZS9+j@kroah.com>
 <20210624155501.10024-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624155501.10024-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_095143_155129_B895F557 
X-CRM114-Status: GOOD (  37.66  )
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

On Thu, Jun 24, 2021 at 11:55:02PM +0800, Rocco Yue wrote:
> On Thu, 2021-06-24 at 14:23 +0200, Greg KH wrote:
> On Thu, Jun 24, 2021 at 07:53:49PM +0800, Rocco Yue wrote:
> >> 
> >> without MTK ap ccci driver (modem driver), ccmni_rx_push() and
> >> ccmni_hif_hook() are not be used.
> >> 
> >> Both of them are exported as symbols because MTK ap ccci driver
> >> will be compiled to the ccci.ko file.
> > 
> > But I do not see any code in this series that use these symbols.  We can
> 
> will delete these symbols.
> 
> > not have exports that no one uses.  Please add the driver to this patch
> > series when you resend it.
> > 
> 
> I've just took a look at what the Linux staging tree is. It looks like
> a good choice for the current ccmni driver.
> 
> honstly, If I simply upload the relevant driver code B that calls
> A (e.g. ccmni_rx_push), there is still a lack of code to call B.
> This seems to be a continuty problem, unless all drivers codes are
> uploaded (e.g. power on modem, get hardware status, complete tx/rx flow).

Great, send it all!  Why is it different modules, it's only for one
chunk of hardware, no need to split it up into tiny pieces.  That way
only causes it to be more code overall.

> >> In addition, the code of MTK's modem driver is a bit complicated,
> >> because this part has more than 30,000 lines of code and contains
> >> more than 10 modules. We are completeing the upload of this huge
> >> code step by step. Our original intention was to upload the ccmni
> >> driver that directly interacts with the kernel first, and then
> >> complete the code from ccmni to the bottom layer one by one from
> >> top to bottom. We expect the completion period to be about 1 year.
> > 
> > Again, we can not add code to the kernel that is not used, sorry.  That
> > would not make any sense, would you want to maintain such a thing?
> > 
> > And 30k of code seems a bit excesive for a modem driver.   Vendors find
> > that when they submit code for inclusion in the kernel tree, in the end,
> > they end up 1/3 the original size, so 10k is reasonable.
> > 
> > I can also take any drivers today into the drivers/staging/ tree, and
> > you can do the cleanups there as well as getting help from others.
> > 
> > 1 year seems like a long time to do "cleanup", good luck!
> > 
> 
> Thanks~
> 
> Can I resend patch set as follows:
> (1) supplement the details of pureip for patch 1/4;
> (2) the document of ccmni.rst still live in the Documentation/...
> (3) modify ccmni and move it into the drivers/staging/...

for drivers/staging/ the code needs to be "self contained" in that it
does not require adding anything outside of the directory for it.

If you still require this core networking change, that needs to be
accepted first by the networking developers and maintainers.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
