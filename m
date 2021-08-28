Return-Path: <SRS0=5qoa=NT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE7BC432BE
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 04:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1326760F6C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 04:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1326760F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCBOzOsTV+Aa4aaZtW9/V9Gbg+MDLdh13P1N+mpFoKo=; b=2sO6Szzz5Uz5am
	HNzYaNyVXAL/G2KY5EEMAuEmJXFCppw7SyY0h1qnQ+Ium+PEfPbqc5mYT9S1zy/UWFgmKJ5GsLEV8
	2MQhnJj82tFrltbNCex3PVmGlAfOILwjQW9k6GsGsk2f3I/VLYzvaqvxvuI8iXcpLYLliRJfqZ/BA
	Dn3aqi6BdGC4PApvVnykeq3f14JosvYUlPihq+FWT10r5OE4G6flo6Mr0T+0i6auYEPPQiPXBGSSd
	g5F7pAPZUjkOkdUpbx1gxjAvsEgMXw1QzrQMR4JSrLmKExhc4DCcQ61Q+ejgO3fL7GBnLGfOAL2ZG
	9pJMd4QeR2VkD78j1OGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJpcH-00DgXM-PH; Sat, 28 Aug 2021 04:06:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJpc5-00DgWO-4T; Sat, 28 Aug 2021 04:06:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1DDD60F44;
 Sat, 28 Aug 2021 04:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630123591;
 bh=dIBeOi1GGKjlDfEsJVaGO8duIxg15L1z3VVcvy4vXzE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SmW4tzyXz+NvXu1cKRLsrojCzh5PwOcGfKfayoE2RN80DPEOehNEQ8jG4NgBJgK+w
 ZO7+DiLMd/KKcbniBeJkHNR5qXZhvE/KZ2owroHZfpa3wvWBOen6YGgMbUJ1Pg5Dyp
 BxxbTNK0Zl8CPmw7rL9ME50i0AvM/RlxdnrNQx6+Alx+xjH93FkVsNshG4KEFFJCZT
 twmxXgk9P5FVx87iPyLmqm+PbpcSwUaGhPmDWYDz1Y9b9b3g9KWnNME4BAnxfuK9iR
 1wpoyZx3yuy7ishYDCN4eYb2MQg/xRXQThgw+b3/OE/hGWyTNndNQK5jGY0bVO9u+S
 rUM413WD/8bhA==
Date: Fri, 27 Aug 2021 21:06:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Ahern <dsahern@gmail.com>, Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com,
 chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
Subject: Re: [PATCH net-next v6] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value
Message-ID: <20210827210629.6858ceb9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <88523c38-f0b4-8a63-6ca6-68a3122bef79@gmail.com>
References: <20210827150412.9267-1-rocco.yue@mediatek.com>
 <88523c38-f0b4-8a63-6ca6-68a3122bef79@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_210637_255768_22206929 
X-CRM114-Status: GOOD (  23.54  )
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

On Fri, 27 Aug 2021 09:41:53 -0700 David Ahern wrote:
> On 8/27/21 8:04 AM, Rocco Yue wrote:
> > The kernel provides a "/proc/sys/net/ipv6/conf/<iface>/mtu"
> > file, which can temporarily record the mtu value of the last
> > received RA message when the RA mtu value is lower than the
> > interface mtu, but this proc has following limitations:
> > 
> > (1) when the interface mtu (/sys/class/net/<iface>/mtu) is
> > updeated, mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) will
> > be updated to the value of interface mtu;
> > (2) mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) only affect
> > ipv6 connection, and not affect ipv4.
> > 
> > Therefore, when the mtu option is carried in the RA message,
> > there will be a problem that the user sometimes cannot obtain
> > RA mtu value correctly by reading mtu6.
> > 
> > After this patch set, if a RA message carries the mtu option,
> > you can send a netlink msg which nlmsg_type is RTM_GETLINK,
> > and then by parsing the attribute of IFLA_INET6_RA_MTU to
> > get the mtu value carried in the RA message received on the
> > inet6 device. In addition, you can also get a link notification
> > when ra_mtu is updated so it doesn't have to poll.
> > 
> > In this way, if the MTU values that the device receives from
> > the network in the PCO IPv4 and the RA IPv6 procedures are
> > different, the user can obtain the correct ipv6 ra_mtu value
> > and compare the value of ra_mtu and ipv4 mtu, then the device
> > can use the lower MTU value for both IPv4 and IPv6.
> > 
> > Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
>
> Reviewed-by: David Ahern <dsahern@kernel.org>

Applied, thank you!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
