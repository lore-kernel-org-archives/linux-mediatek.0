Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E56D3CCA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 03:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFqFy9RQ3dA/nnw7r8tpBx+hUWY1mAD76Qmk6/4Ilf8=; b=zH9j1eYCQNCyS0H/BTUU4bU2Si
	1cx+7sakT9eNr/mBY6WOC5qucr07uqXnoEc8/mDyENDlIeCj/96xDhFLqtKwZiM/BP0GQhY7/VUfx
	PQzSXVCUfVXHL/6u7/WUQ11kZYIpa+tN/5oyc2bD2eJ9qm8w+eGPc9nUHcTl5lnj29T9Ec0n8Eq9d
	zrtjVZf+X+Xn1iLjd2h18ZuOvEX4k5Y65assyO6hXvFkiWIQfMiqM8kSGvZuC6N8a8IPMTNzKfyx5
	ErSCZgvB3cGOlRcy4VoHk7Tf4HlA4mOfjrfxz1qt7IlawjgnFLxZULNHxBG7t4T+KG8AwOyV3XEoa
	mEwQiqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDuW-0000000BfAR-2pme;
	Thu, 15 Jan 2026 03:20:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDuU-0000000BfA4-2bHt;
	Thu, 15 Jan 2026 03:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF50A6013D;
	Thu, 15 Jan 2026 03:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65A0C4CEF7;
	Thu, 15 Jan 2026 03:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768447233;
	bh=NZBpd9t2dldHK6s4UhFBzTXNvxgBqXHlaYvR/qr30rY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aj+jOaiB7zFl09qMBn2aj2Ned+uil/px7IejjD39h0g5I02X/RboOjclmd+RDbmwe
	 NmpA6fmbjMjr47OeguoANjamUlCczqurohFhWRDClOZYOOIoT3JKxHjnd9ZNlhNcJg
	 iOvZmEAGazei5Rv2DiRJ7NVyCVMsCTTC85d8G2d1la+TuMiqnlrfYExjz3Q7dWWIOK
	 agwrzvr/UNPzCePYlbO1JJKGDULq63pdtMlg4cpLwfEDJoS73Al9QZ2ZtNKhMF2Vk4
	 jHeJP4ekef8FBgyG8RVSybt6GqgD8U7wP3FlMOtQ/vin8soqNXi+s2F8RksZMG2ASd
	 kvrxJeCGTwulA==
From: Jakub Kicinski <kuba@kernel.org>
To: jibin.zhang@mediatek.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	matthias.bgg@gmail.com,
	horms@kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	ncardwell@google.com,
	pabeni@redhat.com,
	edumazet@google.com,
	kuniyu@google.com,
	netdev@vger.kernel.org,
	dsahern@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v2] net: fix segmentation of forwarding fraglist GRO
Date: Wed, 14 Jan 2026 19:20:30 -0800
Message-ID: <20260115032030.1539127-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111112355.21504-1-jibin.zhang@mediatek.com>
References: <20260111112355.21504-1-jibin.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least pausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: fix segmentation of forwarding fraglist GRO

This patch adds checks for frag_list presence and protocol consistency
when handling SKB_GSO_FRAGLIST packets in GSO segmentation. This ensures
XLAT-converted packets fall back to skb_segment instead of skb_segment_list.

> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index fdda18b1abda..6c2c10f37f87 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -107,7 +107,9 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
>  	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
>  		struct tcphdr *th = tcp_hdr(skb);
>
> -		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
> +		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
> +		    skb_has_frag_list(skb) &&
> +		    (skb->protocol == skb_shinfo(skb)->frag_list->protocol))
>  			return __tcp4_gso_segment_list(skb, features);

Should tcp6_gso_segment() in net/ipv6/tcpv6_offload.c receive the same
treatment? Looking at that function, it has the identical pattern before
this patch:

    if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
        struct tcphdr *th = tcp_hdr(skb);

        if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
            return __tcp6_gso_segment_list(skb, features);

        skb->ip_summed = CHECKSUM_NONE;
    }

If an IPv4 packet is GRO-aggregated with fraglist and then converted by
XLAT to IPv6, the same protocol mismatch could occur when it reaches
tcp6_gso_segment(). Paolo raised this point in the v1 review:
https://lore.kernel.org/all/aab6c515-12e4-48ca-8220-c0797dae781f@redhat.com/

[ ... ]
-- 
pw-bot: cr

