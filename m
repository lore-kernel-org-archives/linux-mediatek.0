Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E4BC00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:42:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842C22083B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:42:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WWGqxM6j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mj7WaTYL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842C22083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kk/No3ILd4d/bNSgf/0l+9hgbtOWB5Rosws18cXkzDk=; b=WWGqxM6jL1Suqx6dofoLrKHk2
	hmIN+5Qh8DxYx0//ID36dqAkNgtcdF827MCdSpYsXIg0gdE9xmO6qGkappQKe86WcPV1XMGPR8795
	1o7slD1RifnMM4Uy33ucjtgP8uvHye7UiWrugcU922NGwzZah9ifeIbWzLbRDzjlBupc46juXVLh6
	ps2eaq/pCIYEjGqkGaNOFC1C7bOH9myj8iqasIBSmKaOWpN5Y4DD+l5OyU37qi7FNygJcujCF1X/5
	Ripam7Ri/Z3dv/1KOm2CKwXK5kFQlED4rn32PlgWZTjZ2Vu300DYr/Xwnz1xeg7fFOUCljvA2Cbla
	du4su+BFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaX69-000659-Hy; Thu, 05 Nov 2020 04:42:09 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaX5y-0005wF-Oj
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 04:42:00 +0000
Received: by mail-io1-xd43.google.com with SMTP id u62so475762iod.8
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2020 20:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Duq9dQW5Jzdb3ujMdT0fiNUQPULoX6VzrLszCWfIuRA=;
 b=mj7WaTYLQl8Z8R2+cxErwAk6QYCYtuk0BSwcy4Vo6G0ibhWEaIHAlS9ZYRLPxt+FCx
 Ehwxe3anN94g13po/UTX3cYHwWT4ZbCnWjCnCH9k2rHZXv4p+2T1zSd7KTQhEGsiNqDL
 z/BB4MVSBP/8yJStYTBVtCP72D+noVuyGO1qFuFka+VAnKVKL7lF5R7BrKeFDZdfiZOn
 sHHoU8m7LaCUdbERPUlYZ0YudsrKxdNhNthytEuK4SJiXAsU99bI537BL0UE9YN0cWNy
 sDTdTQWAMMIEftHdjNxEL+SE6RyqW9gln7MNiTb2LiXaDtzkU65EEilv3cmgskHuQ5vN
 JKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Duq9dQW5Jzdb3ujMdT0fiNUQPULoX6VzrLszCWfIuRA=;
 b=WZZjMkAKrEe/gKZvRn+F/dHrxBM2Ek4IY4+jgcoQBvh4dzmzR5mp6kOtG0Vrdx9jqq
 QuzY3EtKwPguvYNvsiXa1aBrjP3gP8znymODQJPfNsprSgQPJacTR8EIOdxOazf+h7Sv
 SLykYR+LKUsepGipdkMJkQiKETPKdtv72lpIt4JunJ8oYDZF/8HITT/tv2ekjQkpYXOx
 gjAqPiRnpFW5eymp5F4IEK8wfnJRKel4bJDp12QHEgJv/d+lKrBV6Q2a6hqeznuCj5Ws
 LGaiwKolFnCsZsl1oBHgIXJkGJMhi2PDQK7ucz4zhB4z6KS7B7b7GMWFtf5B1f+u9AvE
 vv8Q==
X-Gm-Message-State: AOAM532swadr39ZxrHp5zmzrcPDZoCAUJQH8tre7nzc6f5BuSEV/61Nl
 /h/z8HHbr7Xzk3/E1yTqYyLRkAZks9i6NK1LgQ+hcg==
X-Google-Smtp-Source: ABdhPJx1PyyQdfrnX4KUFq0a8rT1VNgnT1Ph8zJ9ue/a9y+4slW5/MkhfLkG8nrxOVPwFfwBEqkdYaKGgzycLmiPxEY=
X-Received: by 2002:a02:cc77:: with SMTP id j23mr722712jaq.20.1604551314784;
 Wed, 04 Nov 2020 20:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20200909062613.18604-1-lina.wang@mediatek.com>
 <20200915073006.GR20687@gauss3.secunet.de>
 <1600160722.5295.15.camel@mbjsdccf07>
 <20200915093230.GS20687@gauss3.secunet.de>
 <1600172260.2494.2.camel@mbjsdccf07>
 <20200917074637.GV20687@gauss3.secunet.de>
 <1600341549.32639.5.camel@mbjsdccf07>
 <1604547381.23648.14.camel@mbjsdccf07>
In-Reply-To: <1604547381.23648.14.camel@mbjsdccf07>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Wed, 4 Nov 2020 20:41:43 -0800
Message-ID: <CANP3RGfvadfLabY9vVFxcWioEBUURRSx3GHgbO2KHO180wX=bw@mail.gmail.com>
Subject: Re: [PATCH] xfrm:fragmented ipv4 tunnel packets in inner interface
To: "lina.wang" <lina.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_234158_992736_1C079507 
X-CRM114-Status: GOOD (  25.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Linux NetDev <netdev@vger.kernel.org>,
 Kernel hackers <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Greg Kroah-Hartman <gregkh@google.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 4, 2020 at 7:53 PM lina.wang <lina.wang@mediatek.com> wrote:
>
> Besides several operators donot fragment packets even DF bit is not set,
> and instead just drop packets which they think big, maybe they have a
> consideration--- fragmentation is expensive for both the router that
> fragments and for the host that reassembles.
>
> BTW, ipv6 has the different behaviour when it meets such scenary, which
> is what we expected,ipv4 should follow the same thing. otherwise,
> packets are drop, it is a serious thing, and there is no hints. What we
> do is just fragmenting smaller packets, or is it possible to give us
> some flag or a sysctl to allow us to change the behaviour?
>
> On Thu, 2020-09-17 at 19:19 +0800, lina.wang wrote:
> > But it is not just one operator's broken router or misconfigured
> > router.In the whole network, it is common to meet that router will drop
> > bigger packet silently.I think we should make code more compatible.and
> > the scenary is wifi calling, which mostly used udp,you know, udp
> > wouldnot retransmit.It is serious when packet is dropped
> >
> > On Thu, 2020-09-17 at 09:46 +0200, Steffen Klassert wrote:
> > > On Tue, Sep 15, 2020 at 08:17:40PM +0800, lina.wang wrote:
> > > > We didnot get the router's log, which is some operator's.Actually, after
> > > > we patched, there is no such issue. Sometimes,router will return
> > > > packet-too-big, most of times nothing returned,dropped silently
> > >
> > > This looks like a broken router, we can't fix that in the code.
> > >
> > > > On Tue, 2020-09-15 at 11:32 +0200, Steffen Klassert wrote:
> > > > > On Tue, Sep 15, 2020 at 05:05:22PM +0800, lina.wang wrote:
> > > > > >
> > > > > > Yes, DF bit is not set.
> > > > >
> > > > > ...
> > > > >
> > > > > > Those two packets are fragmented to one big udp packet, which payload is 1516B.
> > > > > > After getting rid of tunnel header, it is also a udp packet, which payload is
> > > > > > 1466 bytes.It didnot get any response for this packet.We guess it is dropped
> > > > > > by router. Because if we reduced the length, it got response.
> > > > >
> > > > > If the DF bit is not set, the router should fragment the packet. If it
> > > > > does not do so, it is misconfigured. Do you have access to that router?

I'm afraid I don't really understand the exact scenario from the
description of the patch.

However... a few questions come to mind.
(a) why not set the DF flag, does the protocol require > mtu udp frames
(b) what is the mtu of the inner tunnel device, and what is the mtu on
the route through the device?
- shouldn't we be udp fragmenting to the route/device mtu?
maybe stuff is simply misconfigured...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
