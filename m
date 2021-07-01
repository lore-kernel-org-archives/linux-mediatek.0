Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2956FC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 03:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26F761476
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 03:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E26F761476
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuzEzXYcOcHw/dmSSJyAlHIujHMalL2YiUMgX0A/gP8=; b=rrLRUa8KR0bebY
	wtJkYlUkxhAl28XbuoThS2WifPggKFPStRPI37bohAbW4mwwI/I3e37N4d4j6E7lQxon81ArqX+x8
	SzqTNKmQXTdVzDBv3s8AkiPfJI7WsuUl8IrRjhT/mxRsb2Unag2jIzQFmXY5a6D3wUvJ1Mr+15SZE
	aQPLTx8LfAz43rtk+i0GXxPgLwULj9JppGtYlItn+fW63IMlmx+661D1JoNfHJ4CbI7B6TtEUOTmI
	B+SuhKi5PFHPlPX5W41lbi5ah2c8pIk6GCuG984ReLLoCjuTB4hHhxot5a6/xLe5g1N7XaOqkyAYy
	bgZkLT4dP6tNTWEsyTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lynmu-00G1pl-22; Thu, 01 Jul 2021 03:54:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lynmh-00G1or-Fh; Thu, 01 Jul 2021 03:54:41 +0000
X-UUID: 7e768edbb5e14cda987c43cc0921049c-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KN3oAAemHHFvCF9v/HX+SJ0J3X1Or7LX10jsEdOq/N0=; 
 b=vEpbwynGSIWXaK1XyMpfZO+IJWT0jRN2PpA8Fbkprn6htTyGOGFH0/F5Ezm+dYWNhWTQ6eCr7TGNWbHy2qMWwyIOVNC2hmqymmseZYHe/+3Cr/KkZeGtV1vdgo25KizzesU7KPVK8W1o459zxQkQ5iTy1Dzs1VoLsx6daUBtc7w=;
X-UUID: 7e768edbb5e14cda987c43cc0921049c-20210630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 94610807; Wed, 30 Jun 2021 20:54:36 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 20:54:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 11:54:34 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 11:54:33 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <rocco.yue@gmail.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, <zhuoliang.zhang@mediatek.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
Date: Thu, 1 Jul 2021 11:39:20 +0800
Message-ID: <20210701033920.5167-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <3c0e5c52-4204-ae1e-526a-5f3a5c9738c2@gmail.com>
References: <3c0e5c52-4204-ae1e-526a-5f3a5c9738c2@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_205439_574807_F7CA5B3B 
X-CRM114-Status: GOOD (  14.71  )
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

On Wed, 2021-06-30 at 21:03 -0600, David Ahern wrote:
On 6/30/21 7:59 PM, Rocco Yue wrote:
>> This patch provides an ipv6 proc file named
>> "disable_gen_linklocal_addr", its absolute path is as follows:
>> "/proc/sys/net/ipv6/conf/<iface>/disable_gen_linklocal_addr".
>> 
>> When the "disable_gen_linklocal_addr" value of a device is 1,
>> it means that this device does not need the Linux kernel to
>> automatically generate the ipv6 link-local address no matter
>> which IN6_ADDR_GEN_MODE is used.
>> 
> 
> doesn't this duplicate addr_gen_mode == 1 == IN6_ADDR_GEN_MODE_NONE?
> 

Hi David,

Thanks for your review.

This patch is different with IN6_ADDR_GEN_MODE_NONE.

When the addr_gen_mode == IN6_ADDR_GEN_MODE_NONE, the Linux kernel
doesn't automatically generate the ipv6 link-local address.

But when the addr_gen_mode == IN6_ADDR_GEN_MODE_STABLE_PRIVACY, the
Linux kernel will still automatically generate an ipv6 link-local
address.

Among global mobile operators, some operators have already request
MT (Mobile Terminal) to support RFC7217, such as AT&T. In this case,
addr_gen_mode will be set to IN6_ADDR_GEN_MODE_STABLE_PRIVACY to
support RFC7217. This means that the device not only needs the IID
assigned by the GGSN to build the ipv6 link-local address to trigger
the RS message, but also needs to use the stable privacy mode to build
the ipv6 global address after receiving the RA.

After this patch, when the "disable_gen_linklocal_addr" value of a device
is 1, no matter in which addr_gen_mode, the Linux kernel will not automatically
generate an ipv6 link-local for this device.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
