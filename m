Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC48AC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:37:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34DC6103C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A34DC6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2kIWXy+MdEUKdeq4ykioFt3N1cbCvZ4TS6Ck0TDj28=; b=0oKpCNwgMAcB7b
	d3S0ihW5NwOuialvHYQSbDGfV6P+7/iGEHlxgaY1JpBmXmLrWuGLfpzYywRyOBH4Rr5iePCA/f5fM
	IrWF8C+hCRFlf4ldPAacKeuY0J50XRZv+HI4Z2Ev6WNOUokR1+4UwhIgXKH6Babqw5Rb3xxRlqbVT
	89wXAnsIHrcRvuAnJ4zOeB93s6dDgftW3GjBIBRKo+J7Ogtl60QaKNUEuyPrT6MGbRfF54lf3xO+8
	X3M7B38IJb4W6MrNeIeBVCQIq3iFtamhAI2ZsewDqyJEYNXqhSYPYrqFP02wIXV7wdmyo7iOjBU3+
	vtFQT+5YDI5PlhoBgOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8oQj-0025zI-Os; Wed, 28 Jul 2021 18:37:21 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8oQW-0025yI-Mv; Wed, 28 Jul 2021 18:37:10 +0000
Received: by mail-ej1-x630.google.com with SMTP id v21so6198895ejg.1;
 Wed, 28 Jul 2021 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yyaUGEWG0nIXC1gfOxeCELARCR9thAOctZo/zZH4m2s=;
 b=mMgX8Hy4SlhLEBjNSXVKoHOlfH6TcnwFisily75X9FC0sDhF7GniXL34l6fQBMmITV
 dmsMsow3QVsCp1sZYlGDb8S0Znrp0GhLwolUuTo6pGxCjaxde1H+gEbl7seSnXG8RykC
 RAmNrxdE7XwSTEXxDJFsvmq3KlROTZoe/nVEtpQaFsMB0mJstomNpoOxDrofBU8TgDo/
 OYMNdoPeJhzxe0pmR2r/E5W8M1HArgNWXrqyw29DySuHfGzHMKhcS2+xnPohWrEpOwkE
 qh5jDsK/W7AMWP1R4YVXLk9u7ormGvbn4cQ2rifzOISSzVIw3DO8b9R0H0gqToCQbylK
 rzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yyaUGEWG0nIXC1gfOxeCELARCR9thAOctZo/zZH4m2s=;
 b=itFJp72syumxLaAw05rzehJzHUyMdKHTA2OM0Me8WU4zWJri1Pgpy7055o2uDhV4eH
 ckI5nJDZEsryOVUqCZJJ176OemlFVYBM9p+a6iEIc6fJY3PBa4sATxkJJNDXpMaAU18y
 IXUjgMztKd3/hfk05Ux0KCR00uWkFfNLjgHPHcC4uts57Ezcy2kIAlyzExk2YM4C8Irk
 Q8vkIqvdZmud/mIhbxcyIlqNsNmZqN//COFavIgTJz8MQnIuXCluLQt1ixNCQvIFg2P6
 4q1HsJAJYpHEYKp0XbcaX+II8BW+lIxPgbQz6FFfTycQ8cC/tBOENukN5Y7o4YxMhAMq
 hZrA==
X-Gm-Message-State: AOAM530n7UICnMf8s3P53du/jOA85ZOY5LsQmmI3u/AdmaF3V3lOZSk6
 coCk1glPcEyg41WLEvjfMoc=
X-Google-Smtp-Source: ABdhPJxTW797pWzpE94KJHIVp9j8MwGdZkIprfCl79F/7ws+z7OqANa4jht9R/NsoaujTu84CigPdw==
X-Received: by 2002:a17:906:350c:: with SMTP id
 r12mr851290eja.44.1627497426801; 
 Wed, 28 Jul 2021 11:37:06 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id dn18sm229654edb.42.2021.07.28.11.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:37:06 -0700 (PDT)
Date: Wed, 28 Jul 2021 21:37:05 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 1/2] net: dsa: tag_mtk: skip address learning on
 transmit to standalone ports
Message-ID: <20210728183705.4gea64qlbe64kkpl@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728175327.1150120-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_113708_816486_00181687 
X-CRM114-Status: GOOD (  29.61  )
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

On Thu, Jul 29, 2021 at 01:53:25AM +0800, DENG Qingfang wrote:
> Consider the following bridge configuration, where bond0 is not
> offloaded:
> 
>          +-- br0 --+
>         / /   |     \
>        / /    |      \
>       /  |    |     bond0
>      /   |    |     /   \
>    swp0 swp1 swp2 swp3 swp4
>      .        .       .
>      .        .       .
>      A        B       C
> 
> Address learning is enabled on offloaded ports (swp0~2) and the CPU
> port, so when client A sends a packet to C, the following will happen:
> 
> 1. The switch learns that client A can be reached at swp0.
> 2. The switch probably already knows that client C can be reached at the
>    CPU port, so it forwards the packet to the CPU.
> 3. The bridge core knows client C can be reached at bond0, so it
>    forwards the packet back to the switch.
> 4. The switch learns that client A can be reached at the CPU port.
> 5. The switch forwards the packet to either swp3 or swp4, according to
>    the packet's tag.
> 
> That makes client A's MAC address flap between swp0 and the CPU port. If
> client B sends a packet to A, it is possible that the packet is
> forwarded to the CPU. With offload_fwd_mark = 1, the bridge core won't
> forward it back to the switch, resulting in packet loss.
> 
> To avoid that, skip address learning on the CPU port when the destination
> port is standalone, which can be done by setting the SA_DIS bit of the
> MTK tag, if bridge_dev of the destination port is not set.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  net/dsa/tag_mtk.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index cc3ba864ad5b..8c361812e21b 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -15,8 +15,7 @@
>  #define MTK_HDR_XMIT_TAGGED_TPID_8100	1
>  #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
>  #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
> -#define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
> -#define MTK_HDR_XMIT_SA_DIS		BIT(6)
> +#define MTK_HDR_XMIT_SA_DIS_SHIFT	6
>  
>  static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>  				    struct net_device *dev)
> @@ -50,7 +49,8 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>  	 * whether that's a combined special tag with 802.1Q header.
>  	 */
>  	mtk_tag[0] = xmit_tpid;
> -	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;

Why stop AND-ing with MTK_HDR_XMIT_DP_BIT_MASK if you were doing that
before? If it's not needed (probably isn't), it would be nice to split
that up.

> +	mtk_tag[1] = BIT(dp->index) |
> +		     (!dp->bridge_dev << MTK_HDR_XMIT_SA_DIS_SHIFT);
>  
>  	/* Tag control information is kept for 802.1Q */
>  	if (xmit_tpid == MTK_HDR_XMIT_UNTAGGED) {
> -- 
> 2.25.1
> 

Otherwise this is as correct as can be without implementing TX
forwarding offload for the bridge (which you've explained why it doesn't
map 1:1 with what your hw can do). But just because a port is under a bridge
doesn't mean that the only packets it sends belong to that bridge. Think
AF_PACKET sockets, PTP etc. The bridge also has a no_linklocal_learn
option that maybe should be taken into consideration for drivers that
can do something meaningful about it. Anyway, food for thought.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
