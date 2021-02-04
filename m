Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2B1C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 06:08:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49CFA64F55
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 06:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49CFA64F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OV5xTlJaR+njNHlX++sqr943S1XJsKPCaDnB9TY0DTU=; b=FVShTEmF1MToWtKoavkW9dBGE
	D4fkIY00JkkomZI0IttKgP2jk00YHyZEa3t19EipI12Hmp1+U52FJ/NrfaNM5ksrEWGwhyxDu9xQf
	Ja6mQ4CuT+mdxcj/KnJtYNmT7ojUzdmYSJXTXY7E4RWnzh1j33pQPfpuXwNyHGdkJsO2XEyW6978o
	kCfSgUnt/HXzDDMbO/Pn27wg8PB3cMvzHU7ZBjptIgbhiusbB3OIsYJIqYBHgQFBLNsGQz3Pc3sPn
	is5+y5Cxn6asG6bR6hR+/Z3AiHPSxkYFyNd0pEHat2yyL5zloZapGocOpFa427mrpPhQuAB2AsFZb
	ErXbKLwow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7XoT-0007uF-6j; Thu, 04 Feb 2021 06:08:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XoQ-0007tH-ET; Thu, 04 Feb 2021 06:08:20 +0000
X-UUID: d675b338c2854f2a9cc3893ca9f25fb4-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t6RPjM2F6rX0V5s+oFdIpwF28ACM2OPkJJOxrttt0D8=; 
 b=WD1gX0mzXoL6pY7raMd8sh3D9TBPjc1as9Jw4rMTqcN3ug8AdgaSQiqwTm2gWXAVDQ/3HxI/TTwz6OLq16RW8f/DvkiVIh/lkVooQ0/q/ccpY0jbla0bGdsevSPdrXkVbPI/9u26pU35eP98UpVwChw8mmUpQ063HbR7ha+YPys=;
X-UUID: d675b338c2854f2a9cc3893ca9f25fb4-20210203
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2035603681; Wed, 03 Feb 2021 22:08:13 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 22:08:06 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 14:08:04 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Feb 2021 14:08:03 +0800
Message-ID: <1612418761.1817.19.camel@mbjsdccf07>
Subject: Re: [PATCH net-next 2/2] net: ipv6: don't generate link local
 address on PUREIP device
From: rocco.yue <rocco.yue@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Thu, 4 Feb 2021 14:06:01 +0800
In-Reply-To: <20210129190737.78834c9d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20210128055809.31199-1-rocco.yue@mediatek.com>
 <20210129190737.78834c9d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 81B556792E76126E0A36B0F82BE0A3CD8BE620CEAA982C008E497034BD4E62B92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_010819_249177_06310326 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: wsd_upstream@mediatek.com, netdev@vger.kernel.org,
 "rocco.yue" <rocco.yue@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-01-29 at 19:07 -0800, Jakub Kicinski wrote:
> On Thu, 28 Jan 2021 13:58:09 +0800 Rocco Yue wrote:
> > PUREIP device such as ccmni does not need kernel to generate
> > link-local address in any addr_gen_mode, generally, it shall
> > use the IPv6 Interface Identifier, as provided by the GGSN,
> > to create its IPv6 link-ocal Unicast Address.
> > 
> > Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> 
> There is no ccmni driver in the tree - is this for non-upstream
> driver?

ccmni is the name of MediaTek mobile interface, currently, it is
non-upstream driver and we plan to upstream these driver codes this
year.

Honestly, the reason why upstreamed this patch is not only that it can
be used by ccmni, but also I observed that the current Linux kernel does
not generate ipv6 link-local address only when addr_gen_mode ==
IN6_ADDR_GEN_MODE_NONE. We hope kernel can add a device type so that no
ipv6 link-local address can be generated in any addr_gen_mode.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
