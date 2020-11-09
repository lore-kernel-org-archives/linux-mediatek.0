Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E570C4741F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 09:58:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F3E20789
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 09:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PniVS6Vg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0F3E20789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w99pZVTD9PZjxqdhJSwA0Vdnp5XyqCafnXFw8WaHpdk=; b=PniVS6Vg+znzEadFLTQ6VHR4C
	12hBkrVJh1bk6sE1/Ne3blU5zl1ZUw0C/iCq6K/+Dr3idq/aufa66AJPc6m+3TiMZRa069S9x/KAn
	pnGK6+QEJFACtwByu9zxQzfDAxWNekfHqkVmsPfftF00XRNIjuOK67v+VV/rOkUne3aaR7iHqZFom
	RhyZTIcfSIki6SLbzPnR+HbGRIUOcu+SMDU3Oodsvn2gtGfFWr1wf7TfC5S/C4boiRtLdzzRT7cdj
	nOy59UVEi+fkKHejjwRj0PTFJIyyRbSPBWuRgbzt7sEp9I8x8oreIwu8dN1oJ22pV9uqKFPZSayVZ
	YZEMpwQbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc3wS-0003H7-OT; Mon, 09 Nov 2020 09:58:28 +0000
Received: from a.mx.secunet.com ([62.96.220.36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc3wI-0003Ci-LJ; Mon, 09 Nov 2020 09:58:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id A47A3200BC;
 Mon,  9 Nov 2020 10:58:15 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHvVf0SRTQlv; Mon,  9 Nov 2020 10:58:15 +0100 (CET)
Received: from mail-essen-01.secunet.de (unknown [10.53.40.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 035C820078;
 Mon,  9 Nov 2020 10:58:15 +0100 (CET)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mail-essen-01.secunet.de (10.53.40.204) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 9 Nov 2020 10:58:14 +0100
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 9 Nov 2020
 10:58:14 +0100
Received: by gauss2.secunet.de (Postfix, from userid 1000)	id BA61131844B0;
 Mon,  9 Nov 2020 10:58:13 +0100 (CET)
Date: Mon, 9 Nov 2020 10:58:13 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Lorenzo Colitti <lorenzo@google.com>
Subject: Re: [PATCH] xfrm:fragmented ipv4 tunnel packets in inner interface
Message-ID: <20201109095813.GV26422@gauss3.secunet.de>
References: <20200909062613.18604-1-lina.wang@mediatek.com>
 <20200915073006.GR20687@gauss3.secunet.de>
 <CAKD1Yr1VsueZWUtCL4iMWLhnADypUOtDK=dgqM2Y2HDvXc77iw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKD1Yr1VsueZWUtCL4iMWLhnADypUOtDK=dgqM2Y2HDvXc77iw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_045818_910060_3A36B8DC 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, mtk81216 <lina.wang@mediatek.com>,
 Linux NetDev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Hideaki
 YOSHIFUJI <yoshfuji@linux-ipv6.org>, linux-mediatek@lists.infradead.org,
 Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Greg Kroah-Hartman <gregkh@google.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 05, 2020 at 01:52:01PM +0900, Lorenzo Colitti wrote:
> On Tue, Sep 15, 2020 at 4:30 PM Steffen Klassert
> <steffen.klassert@secunet.com> wrote:
> > > In esp's tunnel mode,if inner interface is ipv4,outer is ipv4,one big
> > > packet which travels through tunnel will be fragmented with outer
> > > interface's mtu,peer server will remove tunnelled esp header and assemble
> > > them in big packet.After forwarding such packet to next endpoint,it will
> > > be dropped because of exceeding mtu or be returned ICMP(packet-too-big).
> >
> > What is the exact case where packets are dropped? Given that the packet
> > was fragmented (and reassembled), I'd assume the DF bit was not set. So
> > every router along the path is allowed to fragment again if needed.
> 
> In general, isn't it just suboptimal to rely on fragmentation if the
> sender already knows the packet is too big? That's why we have things
> like path MTU discovery (RFC 1191).

When we setup packets that are sent from a local socket, we take
MTU/PMTU info we have into account. So we don't create fragments in
that case.

When forwarding packets it is different. The router that can not
TX the packet because it exceeds the MTU of the sending interface
is responsible to either fragment (if DF is not set), or send a
PMTU notification (if DF is set). So if we are able to transmit
the packet, we do it.

> Fragmentation is generally
> expensive, increases the chance of packet loss, and has historically
> caused lots of security vulnerabilities. Also, in real world networks,
> fragments sometimes just don't work, either because intermediate
> routers don't fragment, or because firewalls drop the fragments due to
> security reasons.
> 
> While it's possible in theory to ask these operators to configure
> their routers to fragment packets, that may not result in the network
> being fixed, due to hardware constraints, security policy or other
> reasons.

We can not really do anything here. If a flow has no DF bit set
on the packets, we can not rely on PMTU information. If we have PMTU
info on the route, then we have it because some other flow (that has
DF bit set on the packets) triggered PMTU discovery. That means that
the PMTU information is reset when this flow (with DF set) stops
sending packets. So the other flow (with DF not set) will send
big packets again.

> Those operators may also be in a position to place
> requirements on devices that have to use their network. If the Linux
> stack does not work as is on these networks, then those devices will
> have to meet those requirements by making out-of-tree changes. It
> would be good to avoid that if there's a better solution (e.g., make
> this configurable via sysctl).

We should not try to workaround broken configurations, there are just
too many possibilities to configure a broken network.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
