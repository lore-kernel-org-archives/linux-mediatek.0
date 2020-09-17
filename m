Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65EFC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:47:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B53A21D41
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TC5vUf28"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B53A21D41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jVzhXH/wPLRYQAuUEbqhyxeDo5Z+jkAjKxd2ynWgfCA=; b=TC5vUf28o56az2gb1a+ypljG3
	yWiCLQmilq8AgWFhLEQZwWE1IDRfqon82wM7fTNDKFZV5yIQTcuAN8ZxLpYf2KZo6JIpbYXFZWbX4
	xl+qg1lJZwkPZavpNpwvQd67Wbgm5eLYHB3g0AuyaS3jHyTXmW4NkM2TZiJhI1nG26FLp1MxGhJiM
	42pw6KSeH3HkCWV14pUZDtjlTMl6NFe1RH5h9mH+M+9dWilY0BwwGTvroxnDiEBNVWpSNSvY07+w6
	aTraVF1PUbLDdHZ0nbk/EkuLfQ+qsk97SXJpoGplFPCWnv7ChND79iWBgmQmW8oyoy78yUPuqXKlZ
	WA+lAys+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIod2-0008Ry-Qv; Thu, 17 Sep 2020 07:46:52 +0000
Received: from a.mx.secunet.com ([62.96.220.36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIocx-0008PH-SX; Thu, 17 Sep 2020 07:46:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 7647320538;
 Thu, 17 Sep 2020 09:46:38 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CU7cPT3beQvm; Thu, 17 Sep 2020 09:46:38 +0200 (CEST)
Received: from mail-essen-02.secunet.de (unknown [10.53.40.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id F391E20504;
 Thu, 17 Sep 2020 09:46:37 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mail-essen-02.secunet.de (10.53.40.205) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 17 Sep 2020 09:46:37 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 17 Sep
 2020 09:46:37 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)	id 1D4813184337;
 Thu, 17 Sep 2020 09:46:37 +0200 (CEST)
Date: Thu, 17 Sep 2020 09:46:37 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: lina.wang <lina.wang@mediatek.com>
Subject: Re: [PATCH] xfrm:fragmented ipv4 tunnel packets in inner interface
Message-ID: <20200917074637.GV20687@gauss3.secunet.de>
References: <20200909062613.18604-1-lina.wang@mediatek.com>
 <20200915073006.GR20687@gauss3.secunet.de>
 <1600160722.5295.15.camel@mbjsdccf07>
 <20200915093230.GS20687@gauss3.secunet.de>
 <1600172260.2494.2.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600172260.2494.2.camel@mbjsdccf07>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_034648_026146_A0852062 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Jakub
 Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 08:17:40PM +0800, lina.wang wrote:
> We didnot get the router's log, which is some operator's.Actually, after
> we patched, there is no such issue. Sometimes,router will return
> packet-too-big, most of times nothing returned,dropped silently

This looks like a broken router, we can't fix that in the code.

> On Tue, 2020-09-15 at 11:32 +0200, Steffen Klassert wrote:
> > On Tue, Sep 15, 2020 at 05:05:22PM +0800, lina.wang wrote:
> > > 
> > > Yes, DF bit is not set.
> > 
> > ...
> > 
> > > Those two packets are fragmented to one big udp packet, which payload is 1516B.
> > > After getting rid of tunnel header, it is also a udp packet, which payload is
> > > 1466 bytes.It didnot get any response for this packet.We guess it is dropped
> > > by router. Because if we reduced the length, it got response.
> > 
> > If the DF bit is not set, the router should fragment the packet. If it
> > does not do so, it is misconfigured. Do you have access to that router?
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
