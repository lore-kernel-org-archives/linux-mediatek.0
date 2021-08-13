Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2266C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 08:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 813306109E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 08:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 813306109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6BDquf+F594Dhtip5HrCQLiUhWoYc+tjNwenzV+s6Q=; b=1GvqTgfGV2zE5X
	o7mDkZ9ULkI0F4U5zPLBnIbAkor2S0pUelSIluFkHXEX3dqR0sxVJ1lqSQmuxaEtBV+0+EhKSeb+6
	mDe8nH5qC/7dit5TFcpQPiOe7bNBuMo1C18oUKds7tTA8w7ZjtzgJlIb2TJxHWi1WHebGgvZX0IUc
	QUl8iwHpsvFNJX5viok2L4lVPLIqknMrsQR7DmLTTLFF60Rs42dZAmqIvTw4akvEOXYiQOtALRqp2
	qraTco/jm2qY9tWnxJFsxr5AeLGq4Oqfa5IVglecUJz8XvFzTqs6akd12S+gi5+cWV+6yOY8G1GC8
	x1hqdL4X+xkGfYvTSweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mESQc-00CDVt-Ia; Fri, 13 Aug 2021 08:20:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mESQW-00CDUK-3h; Fri, 13 Aug 2021 08:20:33 +0000
X-UUID: 8bcf9096dec24702a4b7b48fd053797e-20210813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wU1JtTZVI3blUl1aK1IxSm9dWJZeuXhAazPC30pjDfk=; 
 b=Q878bHIuUN9CaORIm+qs3JfsCHqcFOVM4LX7ItK7qL3BIq1ZtTxLMg2FkT2WxuTHSZ94cgeAyNQSA4tzIXK8ffz820JUf+CMXvCjVxNnFK8qzSFN3VTlDe7fS6qD7FxU5kVaiAw1u6Q201QXDBuvRhQ2kWiv4JopGA9BG0sV7kE=;
X-UUID: 8bcf9096dec24702a4b7b48fd053797e-20210813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1135911335; Fri, 13 Aug 2021 01:20:21 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 01:10:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Aug 2021 16:10:06 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 16:10:05 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next v3] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
Date: Fri, 13 Aug 2021 16:07:40 +0800
Message-ID: <20210813080740.31571-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <4624cc10-1fc8-12cd-e9e1-9585f5b496a0@gmail.com>
References: <4624cc10-1fc8-12cd-e9e1-9585f5b496a0@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_012029_606234_14D70B52 
X-CRM114-Status: GOOD (  23.14  )
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

On Wed, 2021-08-11 at 12:05 -0600, David Ahern wrote:
> On 8/11/21 7:56 AM, David Ahern wrote:
>> On 8/10/21 6:33 AM, Rocco Yue wrote:
>>> On Mon, 2021-08-09 at 16:43 -0600, David Ahern wrote:
>>>>
>>>> Since this MTU is getting reported via af_info infrastructure,
>>>> rtmsg_ifinfo should be sufficient.
>>>>
>>>> From there use 'ip monitor' to make sure you are not generating multiple
>>>> notifications; you may only need this on the error path.
>>>
>>> Hi David,
>>>
>>> To avoid generating multiple notifications, I added a separate ramtu notify
>>> function in this patch, and I added RTNLGRP_IPV6_IFINFO nl_mgrp to the ipmonitor.c
>>> to verify this patch was as expected.
>>>
>>> I look at the rtmsg_ifinfo code, it should be appropriate and I will use it and
>>> verify it.
>>>
>>> But there's one thing, I'm sorry I didn't fully understand the meaning of this
>>> sentence "you may only need this on the error path". Honestly, I'm not sure what
>>> the error patch refers to, do you mean "if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu)" ?
>>>
>> 
>> looks like nothing under:
>>     if (ndopts.nd_opts_mtu && in6_dev->cnf.accept_ra_mtu) {
>> 
>>     }
>> 
>> is going to send a link notification so you can just replace
>> inet6_iframtu_notify with rtmsg_ifinfo in your proposed change.
>> 
> 
> Taking a deeper dive on the code, you do not need to call rtmsg_ifinfo.
> Instead, the existing:
> 
>         /*
>          *      Send a notify if RA changed managed/otherconf flags or
> timer settings
>          */
>         if (send_ifinfo_notify)
>                 inet6_ifinfo_notify(RTM_NEWLINK, in6_dev);
> 
> is called too early. For one the RA can change the MTU and that is done
> after this notify.
> 
> I think if you moved this down to the out:
> 
> out:
>         /*
>          *      Send a notify if RA changed managed/otherconf flags or
> timer settings
>          */
>         if (send_ifinfo_notify)
>                 inet6_ifinfo_notify(RTM_NEWLINK, in6_dev);
> 
> and then set send_ifinfo_notify when the mtu is *changed* by the RA you
> should be good.

Hi David,

Thanks for your suggestion,
this looks like a better choice without adding a separate notification function,
I will modify it and push the next iteration .

Best Regards,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
