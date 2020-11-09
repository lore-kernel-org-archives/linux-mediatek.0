Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD53C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 19:38:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC4E206A1
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 19:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQllCaAY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QPGXaCvV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC4E206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mZPVvVD0TSG7ztjBLLEpzZkCWeOdUXWRrS6HrxqIyP4=; b=AQllCaAYuBHq2f7jiGQ2yyhY+
	0fRhY7FvStI++83f4R4k1g1qTjDyWGkm3jOtN1DMG7OVa5DT2AewOEIJZz+KUD8tAYc0ToD5GS9Td
	uns82AKYjp0Am7V0XdxmznY5VE3qrG/Xf3VQgWH8HwzCXoEi4O/XYQJkE1bcx5y/1+hgLoGGIO3xv
	ZH4RZR9/3sn+dVXrLJBOEDWuRXTFwIWf2tXN+4uEXSmoMKRwAZ0FJer1ykSZKAVDLmEByLlE4MmvE
	Edc7NvyL9bDIzNKgaaWVS92nROT3iUcaqGSwA/S0xlBbj6DQJAQCIXaQSUBNmvdavO5R1W4gDFwkf
	vyFF0vYew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcCzr-00064x-J2; Mon, 09 Nov 2020 19:38:35 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcCzp-00063t-7a
 for linux-mediatek@lists.infradead.org; Mon, 09 Nov 2020 19:38:34 +0000
Received: by mail-il1-x143.google.com with SMTP id a20so9366881ilk.13
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2020 11:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k8+EMc4+ZzXJqSUvzL7W5Ni2fcnDgXtP+EcVau6OBrM=;
 b=QPGXaCvVRB4KlRGmWhDbpfdbGn0ZC8kDinWCv2x+JjrJI6PBwoifTda0X4VKf0rNxQ
 G5f1FH27nqN/xBqw4zPvuraKnoNs0119PH5Heq2ppu/7EDCFk0nx0e/UQH7St5Jyp2Y+
 HIUq6T9oY6yloWEntf74siPKEd6n/qnVKbzM0A/ZiDBKevfaRPikMMkh3VtAfnmFEr3v
 B1M9cwtK8iHS0GXtivOLEs9X4osprzrKbe5U54/Vs4hicBCtMTmZVDx0rWX9QXher2ip
 pM6IrJuAtFPR717tRAZeWwiPNDB8Mb2uK6IhnaEJl1n+zPiUdkYuxf5yNEiL5w5T2gkH
 JhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8+EMc4+ZzXJqSUvzL7W5Ni2fcnDgXtP+EcVau6OBrM=;
 b=ZlkUdA6DyFMHL260I1cHJJWi9Sf8eDJPAdD6QOSOP7YS6ayum1bYFBZ8d2GPeqSiqy
 chWsNVOt6Hih1kHR2VFKG9BRH4862rqpD7vL1zhB26i91n5Go+bpikEXgXxnVtW+0pKx
 PLEPD8HBAFnrHv888XcDvJzeT6C+YKD7bZM8zjdsE6u0B5iuQhzc8j038PPefPfOaXH0
 KsPtaaHWvXW6Y8mWiAnG1S2BtnXrfyi96KAN0flqQFo7+/TiFhw8tIEmGjonX90pZnc5
 ljjbSYbGVEc8w0ExwA0rFmr9toCj2SE7TyZOOSMsKIiJUesGbQigu8/MW1Rf/QAJhJeG
 3EQQ==
X-Gm-Message-State: AOAM531SVR6BNAF5fbJT9JruOlYmYggA5bcZnHJwitV2SHrtlKUQSGy7
 lXto5ul9DCm3EQb4y89/GukAvPK9vk7TLD0nYZg5OQ==
X-Google-Smtp-Source: ABdhPJw0MeG4P26hzsMF6D4SWQfdhHemZQG3avMmoyM+7Vf54D1B9HL4wVsscgX4reE8l0z4nuZgBbBlWbHxr9kgPTQ=
X-Received: by 2002:a92:9e8b:: with SMTP id s11mr10932147ilk.61.1604950709307; 
 Mon, 09 Nov 2020 11:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20200909062613.18604-1-lina.wang@mediatek.com>
 <20200915073006.GR20687@gauss3.secunet.de>
 <CAKD1Yr1VsueZWUtCL4iMWLhnADypUOtDK=dgqM2Y2HDvXc77iw@mail.gmail.com>
 <20201109095813.GV26422@gauss3.secunet.de>
In-Reply-To: <20201109095813.GV26422@gauss3.secunet.de>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 9 Nov 2020 11:38:16 -0800
Message-ID: <CANP3RGfuOGoB1msF1evzsgKf5qZZbNDCHDzvgPBHRGyepDuu+g@mail.gmail.com>
Subject: Re: [PATCH] xfrm:fragmented ipv4 tunnel packets in inner interface
To: Steffen Klassert <steffen.klassert@secunet.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_143833_335799_7E40349A 
X-CRM114-Status: GOOD (  30.36  )
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
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
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

On Mon, Nov 9, 2020 at 1:58 AM Steffen Klassert
<steffen.klassert@secunet.com> wrote:
>
> On Thu, Nov 05, 2020 at 01:52:01PM +0900, Lorenzo Colitti wrote:
> > On Tue, Sep 15, 2020 at 4:30 PM Steffen Klassert
> > <steffen.klassert@secunet.com> wrote:
> > > > In esp's tunnel mode,if inner interface is ipv4,outer is ipv4,one big
> > > > packet which travels through tunnel will be fragmented with outer
> > > > interface's mtu,peer server will remove tunnelled esp header and assemble
> > > > them in big packet.After forwarding such packet to next endpoint,it will
> > > > be dropped because of exceeding mtu or be returned ICMP(packet-too-big).
> > >
> > > What is the exact case where packets are dropped? Given that the packet
> > > was fragmented (and reassembled), I'd assume the DF bit was not set. So
> > > every router along the path is allowed to fragment again if needed.
> >
> > In general, isn't it just suboptimal to rely on fragmentation if the
> > sender already knows the packet is too big? That's why we have things
> > like path MTU discovery (RFC 1191).
>
> When we setup packets that are sent from a local socket, we take
> MTU/PMTU info we have into account. So we don't create fragments in
> that case.
>
> When forwarding packets it is different. The router that can not
> TX the packet because it exceeds the MTU of the sending interface
> is responsible to either fragment (if DF is not set), or send a
> PMTU notification (if DF is set). So if we are able to transmit
> the packet, we do it.
>
> > Fragmentation is generally
> > expensive, increases the chance of packet loss, and has historically
> > caused lots of security vulnerabilities. Also, in real world networks,
> > fragments sometimes just don't work, either because intermediate
> > routers don't fragment, or because firewalls drop the fragments due to
> > security reasons.
> >
> > While it's possible in theory to ask these operators to configure
> > their routers to fragment packets, that may not result in the network
> > being fixed, due to hardware constraints, security policy or other
> > reasons.
>
> We can not really do anything here. If a flow has no DF bit set
> on the packets, we can not rely on PMTU information. If we have PMTU
> info on the route, then we have it because some other flow (that has
> DF bit set on the packets) triggered PMTU discovery. That means that
> the PMTU information is reset when this flow (with DF set) stops
> sending packets. So the other flow (with DF not set) will send
> big packets again.

PMTU is by default ignored by forwarding - because it's spoofable.

That said I wonder if my recent changes to honour route mtu (for ipv4)
haven't fixed this particular issue in the presence of correctly
configured device/route mtus...

I don't understand if the problem here is locally generated packets,
or forwarded packets.

It does seem like there is (or was) a bug somewhere... but it might
already be fixed (see above) or might be caused by a misconfiguration
of device mtu or routing rules.

I don't really understand the example.

>
> > Those operators may also be in a position to place
> > requirements on devices that have to use their network. If the Linux
> > stack does not work as is on these networks, then those devices will
> > have to meet those requirements by making out-of-tree changes. It
> > would be good to avoid that if there's a better solution (e.g., make
> > this configurable via sysctl).
>
> We should not try to workaround broken configurations, there are just
> too many possibilities to configure a broken network.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
