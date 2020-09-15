Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5EDC31E49
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 09:32:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A4BB2080C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 09:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nTTuroRL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A4BB2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eKVCqmY8qFQyyt5jbFG6Kr/0LTClx5qUdKwSx17f71k=; b=nTTuroRLU000JswO3oMpL9Av7
	rVGtfiZ/CrA+ZmAlZF6DwVIt15vgjMQoGEdiIaaI667jgJzh+TK/71meumbZHnyftnt7q+33l/Ee1
	rvtxgcKCVy1OE5bJBMvpRhNt9/kQ8NXSBFNxDAmPw5570+1cSLKjioXIDqZqvBD3ySmpZm00s5HFv
	CSaUK2fB31mn+9lWloJlsk3pPnAOjC6NPE6MnJkXxhqSHIrbBSRkJENc0OEGM4rD6ZhAbkky2IWQP
	QGnvMLWfYXkoDlsX9Be/bviXeFbyvwy/mTsdbftcdaydYag+AwcAJKEZ0uE9xFJloIQtoGlsy/mui
	Y5NYArXmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI7KQ-0007zP-4W; Tue, 15 Sep 2020 09:32:46 +0000
Received: from a.mx.secunet.com ([62.96.220.36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI7KD-0007w0-Fq; Tue, 15 Sep 2020 09:32:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id A9BE82009B;
 Tue, 15 Sep 2020 11:32:31 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryAbER4iKljS; Tue, 15 Sep 2020 11:32:31 +0200 (CEST)
Received: from cas-essen-02.secunet.de (202.40.53.10.in-addr.arpa
 [10.53.40.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 44B442006F;
 Tue, 15 Sep 2020 11:32:31 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Sep 2020 11:32:31 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 15 Sep
 2020 11:32:30 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
 id 6E819318436D; Tue, 15 Sep 2020 11:32:30 +0200 (CEST)
Date: Tue, 15 Sep 2020 11:32:30 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: lina.wang <lina.wang@mediatek.com>
Subject: Re: [PATCH] xfrm:fragmented ipv4 tunnel packets in inner interface
Message-ID: <20200915093230.GS20687@gauss3.secunet.de>
References: <20200909062613.18604-1-lina.wang@mediatek.com>
 <20200915073006.GR20687@gauss3.secunet.de>
 <1600160722.5295.15.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600160722.5295.15.camel@mbjsdccf07>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_053233_703338_6DF2724E 
X-CRM114-Status: GOOD (  12.48  )
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

On Tue, Sep 15, 2020 at 05:05:22PM +0800, lina.wang wrote:
> 
> Yes, DF bit is not set.

...

> Those two packets are fragmented to one big udp packet, which payload is 1516B.
> After getting rid of tunnel header, it is also a udp packet, which payload is
> 1466 bytes.It didnot get any response for this packet.We guess it is dropped
> by router. Because if we reduced the length, it got response.

If the DF bit is not set, the router should fragment the packet. If it
does not do so, it is misconfigured. Do you have access to that router?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
