Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F912C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 02:17:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BDFD64E20
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 02:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BDFD64E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1fJZsLFP5uuK4SGsODNeIz3p//j6FnRqjUknRpKqlc=; b=OOIQd28SeJ85bf0yurp4VMr9R
	FTcS4OM68MvtyKgkvQCZbWBRR2pMHuksyPYaEI6ziqUvO+TznQnbF9oJw/8yjMV37AYetn1LQXW5o
	h1kFUFe7zxf9dniRs/fXsSlAd7/xuTnBjjbHR6s5uOUTOlpXWmtMwCodcAgft67T6SlfDEiHuS/0v
	1nbUOCMy5yb0M82SHcbTMW6j5XAkHSj3idduaCOEfXKpWXqRZ2EkNaNsCAA2aYXrdrNW2pLmURLGe
	9slP9bC39pih8q/iFuO8iGenJc119lwolLXuQyiuo72YsDdz9+14Ievd0vkNQDJ+QgYHBOHZIHAjw
	BCw7wMV0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENGi-0005BT-Ax; Tue, 23 Feb 2021 02:17:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENGe-0005Ai-UZ; Tue, 23 Feb 2021 02:17:42 +0000
X-UUID: 85e04f219803416e8e6579a9bbcd5143-20210222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q3FCuT+t2COGvgTUPc9vno7qSrDgCIGhgTXtgSV5dWU=; 
 b=e/66fnI7TNBawCj02XYcGd+uSWj5psKQHS/goVUBqB1/TcMVpaTCKsocF3KM/6hWiHK1Ub4LnUW5IHDbNDQM/3txl2qcpnJiHYCWJFcbyUOScT094/ttCWGpeJuH4idzXzDREFVkcsLz0zoYrhKyOSsu+CaMFcJXRV9dszpOuqA=;
X-UUID: 85e04f219803416e8e6579a9bbcd5143-20210222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2032482151; Mon, 22 Feb 2021 18:17:31 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Feb 2021 18:07:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 10:07:26 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Feb 2021 10:07:26 +0800
Message-ID: <1614045791.6614.3.camel@mbjsdccf07>
Subject: Re: [PATCH net-next 2/2] net: ipv6: don't generate link local
 address on PUREIP device
From: rocco.yue <rocco.yue@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 23 Feb 2021 10:03:11 +0800
In-Reply-To: <1612418761.1817.19.camel@mbjsdccf07>
References: <20210128055809.31199-1-rocco.yue@mediatek.com>
 <20210129190737.78834c9d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <1612418761.1817.19.camel@mbjsdccf07>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4915F04F6E7638880F5BC5B2ADB99DAFB2599228CEE1732FF9175AB3AB726FB62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_211741_201671_85A02D18 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: wsd_upstream@mediatek.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-02-04 at 14:06 +0800, rocco.yue wrote:
> On Fri, 2021-01-29 at 19:07 -0800, Jakub Kicinski wrote:
> > On Thu, 28 Jan 2021 13:58:09 +0800 Rocco Yue wrote:
> > > PUREIP device such as ccmni does not need kernel to generate
> > > link-local address in any addr_gen_mode, generally, it shall
> > > use the IPv6 Interface Identifier, as provided by the GGSN,
> > > to create its IPv6 link-ocal Unicast Address.
> > > 
> > > Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> > 
> > There is no ccmni driver in the tree - is this for non-upstream
> > driver?
> 
> ccmni is the name of MediaTek mobile interface, currently, it is
> non-upstream driver and we plan to upstream these driver codes this
> year.
> 
> Honestly, the reason why upstreamed this patch is not only that it can
> be used by ccmni, but also I observed that the current Linux kernel does
> not generate ipv6 link-local address only when addr_gen_mode ==
> IN6_ADDR_GEN_MODE_NONE. We hope kernel can add a device type so that no
> ipv6 link-local address can be generated in any addr_gen_mode.

Hi Jakub,

gentle ping for this patch set.

Thanks
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
