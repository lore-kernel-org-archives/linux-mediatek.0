Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A50FC49EA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 16:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46FA61375
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 16:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46FA61375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGf2J28F4NdrOUzdF9fhMsDMsGRnAucS1UrqJTyzos8=; b=DUQIDP1dxIXgGb
	o+sxLVAkbem4jxmmenzNosiZnRJa8RO6Vi9gUVXeE7B8X9uw2YOjhR0lLAWfop3do/jt2O8u21ew0
	BhxuurJ4vxFt40LyipwUgTyFsG/AM2zdymajTg5Qab4q3gR+4LSEpIoMfUI+nLj3coL5AQ1nzbjky
	kjz6dI9lZsyK7UvVNM21aL7Q/ngzEt8Jsp3+nomzAvRf8+eDe+ggOBs7UB7qhrD/1Q6Vl4219J16G
	zEjtOaVXUSEBCh6GY/kNpTJX2WjnG3+Q/gxkFxEBCuvIk5cozCD3lqB3SiQqA+9vmcAraGhq2rlY8
	XmXGQXXmkIhXbNw3eEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwRvp-00FPtY-Do; Thu, 24 Jun 2021 16:10:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwRvf-00FPpb-FZ; Thu, 24 Jun 2021 16:10:19 +0000
X-UUID: 27d1da0932df42558431e6a0cdad20b8-20210624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QO/ljf86DE4pJWm8BNSgl5S3nuQFCPPAsACCpEiDi84=; 
 b=r90dQHTi2mK9amlnsPjFqwAyk24yPcQJqAZqCUVELMJSEj8iRFtnw7vehNey0YpNxmDz43lQmChI6b/i8RipctjNJwfijVR0FstIW2QNDyRsnrQYiulX6EwBhFeaSoOGRFr9Jujqf+B7g3ghGKRpI8QWtc2HhAmqpCQk0YKCVYo=;
X-UUID: 27d1da0932df42558431e6a0cdad20b8-20210624
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1757504386; Thu, 24 Jun 2021 09:10:07 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 09:10:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Jun 2021 00:09:58 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 00:09:56 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <bpf@vger.kernel.org>, <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH 4/4] drivers: net: mediatek: initial implementation of
 ccmni
Date: Thu, 24 Jun 2021 23:55:02 +0800
Message-ID: <20210624155501.10024-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YNR5QuYqknaZS9+j@kroah.com>
References: <YNR5QuYqknaZS9+j@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_091011_601037_3E825FF1 
X-CRM114-Status: GOOD (  32.42  )
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

On Thu, 2021-06-24 at 14:23 +0200, Greg KH wrote:
On Thu, Jun 24, 2021 at 07:53:49PM +0800, Rocco Yue wrote:
>> 
>> without MTK ap ccci driver (modem driver), ccmni_rx_push() and
>> ccmni_hif_hook() are not be used.
>> 
>> Both of them are exported as symbols because MTK ap ccci driver
>> will be compiled to the ccci.ko file.
> 
> But I do not see any code in this series that use these symbols.  We can

will delete these symbols.

> not have exports that no one uses.  Please add the driver to this patch
> series when you resend it.
> 

I've just took a look at what the Linux staging tree is. It looks like
a good choice for the current ccmni driver.

honstly, If I simply upload the relevant driver code B that calls
A (e.g. ccmni_rx_push), there is still a lack of code to call B.
This seems to be a continuty problem, unless all drivers codes are
uploaded (e.g. power on modem, get hardware status, complete tx/rx flow).

>> In addition, the code of MTK's modem driver is a bit complicated,
>> because this part has more than 30,000 lines of code and contains
>> more than 10 modules. We are completeing the upload of this huge
>> code step by step. Our original intention was to upload the ccmni
>> driver that directly interacts with the kernel first, and then
>> complete the code from ccmni to the bottom layer one by one from
>> top to bottom. We expect the completion period to be about 1 year.
> 
> Again, we can not add code to the kernel that is not used, sorry.  That
> would not make any sense, would you want to maintain such a thing?
> 
> And 30k of code seems a bit excesive for a modem driver.   Vendors find
> that when they submit code for inclusion in the kernel tree, in the end,
> they end up 1/3 the original size, so 10k is reasonable.
> 
> I can also take any drivers today into the drivers/staging/ tree, and
> you can do the cleanups there as well as getting help from others.
> 
> 1 year seems like a long time to do "cleanup", good luck!
> 

Thanks~

Can I resend patch set as follows:
(1) supplement the details of pureip for patch 1/4;
(2) the document of ccmni.rst still live in the Documentation/...
(3) modify ccmni and move it into the drivers/staging/...

>>> +++ b/drivers/net/ethernet/mediatek/ccmni/ccmni.h
>>> 
>>> Why do you have a .h file for a single .c file?  that shouldn't be
>>> needed.
>> 
>> I add a .h file to facilitate subsequent code expansion. If it's
>> not appropriate to do this here, I can add the content of .h into
>> .c file.
> 
> If nothing other than a single .c file needs it, put it into that .c
> file please.

will do.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
