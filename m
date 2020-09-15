Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B03C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 07:30:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BF62080C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 07:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0M8SnjM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BF62080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xPS3dPsogKq9UKoXMahO0yhIzZvWDDfwKtaxDxZ5RmA=; b=b0M8SnjMQJYvZIzWguRgWqhKM
	Q0WeZFDt34Cz3OSNAFQMU4CSsWcmttzfQXxytB3/hucixwD7sbZ7T5KTWl8b2I8CApuCNPAK7tAtH
	uozMDjkFoQ29oVOjhEvpUApZwdejX5Ni9t1XaHietZF1I2cGs9L+q7+Kbn2PxpJZx5GUtOeL0rKeD
	Fpt00qyPMSn08dg+SEAgZc7POvfeLHUfa+TWbkwuFU/YN/kgjULcDBYw3reuyxPQSwna1RyHbOBu6
	mAE7AoNXCN/8H8rKJ9pJTsPUurANe3TThWQkdLly4xX7/M2ikgJwhEtfkSrZC8CrM5go5FHsC5nbs
	atxalWT4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI5Pv-0001SK-5P; Tue, 15 Sep 2020 07:30:19 +0000
Received: from a.mx.secunet.com ([62.96.220.36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI5Pq-0001RC-8v; Tue, 15 Sep 2020 07:30:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 7483920482;
 Tue, 15 Sep 2020 09:30:08 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zv7Y5ak262BW; Tue, 15 Sep 2020 09:30:07 +0200 (CEST)
Received: from cas-essen-02.secunet.de (202.40.53.10.in-addr.arpa
 [10.53.40.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 388E9200AC;
 Tue, 15 Sep 2020 09:30:07 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Sep 2020 09:30:07 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 15 Sep
 2020 09:30:06 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
 id 6E4F33184337; Tue, 15 Sep 2020 09:30:06 +0200 (CEST)
Date: Tue, 15 Sep 2020 09:30:06 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: mtk81216 <lina.wang@mediatek.com>
Subject: Re: [PATCH] xfrm:fragmented ipv4 tunnel packets in inner interface
Message-ID: <20200915073006.GR20687@gauss3.secunet.de>
References: <20200909062613.18604-1-lina.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909062613.18604-1-lina.wang@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_033014_420724_A04FB9ED 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, Sep 09, 2020 at 02:26:13PM +0800, mtk81216 wrote:
> In esp's tunnel mode,if inner interface is ipv4,outer is ipv4,one big 
> packet which travels through tunnel will be fragmented with outer 
> interface's mtu,peer server will remove tunnelled esp header and assemble
> them in big packet.After forwarding such packet to next endpoint,it will 
> be dropped because of exceeding mtu or be returned ICMP(packet-too-big).

What is the exact case where packets are dropped? Given that the packet
was fragmented (and reassembled), I'd assume the DF bit was not set. So
every router along the path is allowed to fragment again if needed.

> When inner interface is ipv4,outer is ipv6,the flag of xfrm state in tunnel
> mode is af-unspec, thing is different.One big packet through tunnel will be
> fragmented with outer interface's mtu minus tunneled header, then two or 
> more less fragmented packets will be tunneled and transmitted in outer 
> interface,that is what xfrm6_output has done. If peer server receives such
> packets, it will forward successfully to next because length is valid.
> 
> This patch has followed up xfrm6_output's logic,which includes two changes,
> one is choosing suitable mtu value which considering innner/outer 
> interface's mtu and dst path, the other is if packet is too big, calling 
> ip_fragment first,then tunnelling fragmented packets in outer interface and
> transmitting finally.
> 
> Signed-off-by: mtk81216 <lina.wang@mediatek.com>

Please use your real name to sign off.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
