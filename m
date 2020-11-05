Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A961FC4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:52:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3044D20867
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:52:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="atNppLrR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QXWnLjhf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3044D20867
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zoijzZuab/9XGT4Sruwos6jWplr3ufUUP0kq5qqZowc=; b=atNppLrRPQjKoIwsWaUiEtz2p
	74IRg/AyecjgG6jAaTgvjS7Yd7eN9ACG/y1/HADJkrbIlQIXHbZb4xBftEvpGJDR5HPuZ/V5qva0H
	CxXv9lbp0Zs1yfR/zKrdfBXim7OdXDLXlA7FgkJn9sbn6D9q9/r9peTkpULxQYkbj1fTKuYQNtDec
	of2Y6stiug1ww657gMAXpHe4VgGGLtGQujdWwMxBoFIiSsPRY1eiNUyxN0x07QFqqNKzuoXVn6FpO
	loAce3UjUNu2QHDF5C+eZ+zR9RMyX0K8zPF4BGo6qYOMURIyjg4PK1Sjwa9UTBSSiYQx763OTes4g
	LIMaLFAJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXG2-0000vS-Gz; Thu, 05 Nov 2020 04:52:22 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaXFy-0000ro-Me
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 04:52:19 +0000
Received: by mail-il1-x144.google.com with SMTP id x20so247192ilj.8
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2020 20:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GFKnx/vpZwo9U/6MPDhCzbjPU6Vx1O0lBliYS2CeHn4=;
 b=QXWnLjhfdNunSpS4ejd1MnneScMJz/j5iSbKnduG62upL58nWyBexHnlAn3XsnrS9W
 sN8pa5y834luUu/QEpApzyqTuWcoyh6kPFXhLCaTigaZHagRt4jgfSIwJ4a0qh7e632r
 2H2zAG+VhoAoMQs87oYPtuFGXhzmH7YnftidaH7Q/XtzCWamL4m48cqWPWQPj9AMPbQi
 R+1toM2wEjP7eJaplhGWJ6CbeTA5xxBTncpZoH5lH7Fl3zdZ8n8zITcFjpT+eGY7eF+d
 cajccXK7E2JtTsFQt99EWv0EVLqv2jWufMY/41rvI6e08dj4SyHXao5AXKqcL8/hshba
 wGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GFKnx/vpZwo9U/6MPDhCzbjPU6Vx1O0lBliYS2CeHn4=;
 b=Se/wKA9e8HwsTB63BeNK0pMF2CDnY6XdCoq3NpEFYD+ynbvjiRAtzwwoqJ6wn2TKCH
 ZSCPdVD4+yk01k5B4OK+/DOJ+ODfcBhFuSGltP+EaXpvi3XXoNDYPQOY9sk+0Q/HVCwe
 +tWwjlB3EdMIeUQ/Mu4vgJhTFdsA70h3jmwOaGgS+P2D9Vk1+ld2o+NgWPLDeO2mOFyW
 GnLf5XBM/gS7H+7t9nIVw55oOcYfXE/0V+RBT6zIve/c6oTyL9pVlQ3skkEJRVekHwF9
 ETXAK3AqiYu5z/hCRav35+i67F4dOA4AtQIl7fM8XsE8G+C5V90lnGLmHDUgIFqiHrY/
 zrGw==
X-Gm-Message-State: AOAM531fVk9sDDs9x3LrlbYR1c4H9bNMgnfS+u41BE8ZHUHPiVFTWcnx
 znhmFjOnaAtHsORHLpAErzGq5K+UQbCIgPhteVHBDA==
X-Google-Smtp-Source: ABdhPJz1SWWD5W+3pRNN441tb9Wq4qGpIBbin32Bf9e9S1YzVmfQZT4mO5VQPrcHJzdSuYAHBQGsyLCwYUJWrpjdpNA=
X-Received: by 2002:a92:d081:: with SMTP id h1mr601565ilh.187.1604551933340;
 Wed, 04 Nov 2020 20:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20200909062613.18604-1-lina.wang@mediatek.com>
 <20200915073006.GR20687@gauss3.secunet.de>
In-Reply-To: <20200915073006.GR20687@gauss3.secunet.de>
From: Lorenzo Colitti <lorenzo@google.com>
Date: Thu, 5 Nov 2020 13:52:01 +0900
Message-ID: <CAKD1Yr1VsueZWUtCL4iMWLhnADypUOtDK=dgqM2Y2HDvXc77iw@mail.gmail.com>
Subject: Re: [PATCH] xfrm:fragmented ipv4 tunnel packets in inner interface
To: Steffen Klassert <steffen.klassert@secunet.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_235218_861549_6022FC23 
X-CRM114-Status: GOOD (  11.54  )
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
 linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Greg Kroah-Hartman <gregkh@google.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 4:30 PM Steffen Klassert
<steffen.klassert@secunet.com> wrote:
> > In esp's tunnel mode,if inner interface is ipv4,outer is ipv4,one big
> > packet which travels through tunnel will be fragmented with outer
> > interface's mtu,peer server will remove tunnelled esp header and assemble
> > them in big packet.After forwarding such packet to next endpoint,it will
> > be dropped because of exceeding mtu or be returned ICMP(packet-too-big).
>
> What is the exact case where packets are dropped? Given that the packet
> was fragmented (and reassembled), I'd assume the DF bit was not set. So
> every router along the path is allowed to fragment again if needed.

In general, isn't it just suboptimal to rely on fragmentation if the
sender already knows the packet is too big? That's why we have things
like path MTU discovery (RFC 1191). Fragmentation is generally
expensive, increases the chance of packet loss, and has historically
caused lots of security vulnerabilities. Also, in real world networks,
fragments sometimes just don't work, either because intermediate
routers don't fragment, or because firewalls drop the fragments due to
security reasons.

While it's possible in theory to ask these operators to configure
their routers to fragment packets, that may not result in the network
being fixed, due to hardware constraints, security policy or other
reasons. Those operators may also be in a position to place
requirements on devices that have to use their network. If the Linux
stack does not work as is on these networks, then those devices will
have to meet those requirements by making out-of-tree changes. It
would be good to avoid that if there's a better solution (e.g., make
this configurable via sysctl).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
