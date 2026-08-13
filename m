Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2344C5AD5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 02:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnmgta/wS6M8HYTbflNWe4vYMLIDSzI2C2egQNuOXpM=; b=FQlCQOPOGaqp+P9nHsyXIZ1/MW
	x3sTC54Hl0nJRDLnIxC4w6Wlw8R+ET47cDl9kjO6uabIOZGqXP+PP47DciiknstgacNkt+N3+JckJ
	7HRBfnhjpr1+3C+YGG62GaRt5zD9S4a/Ih//Mzx6LYTb7WwYfT7v8m7R8AgQELTqlmiPx9Fwdh2NN
	Vp9I/HYRLjd9tkzPIXkLmkKjC+ez38UrXgZF/MHPxgDp5H6k46QRO2XNA6QJlU3dal5Pw3BYZe05v
	j4Bnplcx7UUd09tZV9XfZFWMtnOl1CIukRuYSecUbj+r4DiEYetrlwth80NqETll65yF9U4mSD0UC
	tFw3QjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLCW-0000000HHhO-1kfH;
	Thu, 13 Aug 2026 02:29:48 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLCT-0000000HHg5-1oIE
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 02:29:47 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6688acd1a51so2655029d50.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 19:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786588184; x=1787192984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnmgta/wS6M8HYTbflNWe4vYMLIDSzI2C2egQNuOXpM=;
        b=VEmWudQsoA2Pu/TTylnLJlcpBUZO6T7jz2hdPjIynfJHjWe8dLekvSLCWEqXi7drjN
         xO7wRb/XMIhOMoLOQs3WE+KUYkBCnG75gsZvSur1/msctbBtkDXFJOHwO2NjE3DyKKu5
         7uP8Mka5zYdCFXg6VmT2n1QTydVTqqTQmgGVS7X4lMzaFhXktanGly/qHyVZ6TES6CG4
         SEt8iTF3w/lAtDxWUi7bVw3NELZTqx70Mk4o1j56NZ4g3kDfLD2apMaFFpRrSXkDaQWK
         O2UxjkXhgDLjxiPAhhHepcDhhElyU2zJCddslV8IDBipintlHwyjBCm0KrWw3dzOcT6H
         K2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786588184; x=1787192984;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnmgta/wS6M8HYTbflNWe4vYMLIDSzI2C2egQNuOXpM=;
        b=k+mLLREn3zVwayLQ46WG4x6NUdOXXM2wyWlbF3Qj/9n9o1TaPrCPwYm358GmKjMl1q
         drTsqOpgt8ngWass3dmKIAoGppSvEXsR3wkn1ohTaMOPZpEwFLMXHJs+74a+fl38ENT2
         PCBJhKT+J5C8NLvzAURGqSw7QoByV55j5L9qX8gvns4VVCiDOUPlNfZ7Peyu62MyfmbJ
         LtX2P+xYr4knxOEajZtSxrTO0Dw4DVmQHbHOt+prjJQedr+lPl8Vte/zGVMo804nysOw
         frQBAXheSOpbOBSwvwdIYM9MUHwGV+JAvwJWCUHor3IFpdcfv+tA68vFSMrwvigBte5k
         c/fA==
X-Forwarded-Encrypted: i=1; AHgh+RptGwhRJSfFKioL8UKLx6CaL7JxWxhWBVI4P1Du65TG//XrVDQDDVl8sGuY4UXCqa9Czje/XMAHGH9TwK/nQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzthMzvxd3zGzhvHFn1CB+fkmlsP6ozplO+7GFE3fON6pKlfqS1
	8/J7mQxDI0a/uGkqpWXIdX3PfeW8gn2+dOCYM8VH7Te9PJo1jQI99HRG
X-Gm-Gg: AR+sD11DF/ySeWIQvRwEtcUYSFiFrC9rmrmY+Ra8giY0RDLT8LmhMoYlsIPfHK+4tBK
	tu6JwdSgzLEhHAXWhFY1+PTC0uTuyVDC/gEmsbQcGEL+ie7KdPXkbYYKpqBcnLf2nnu5OL5uxa1
	X+hu0gQzB/dSB1quHVZQMwMHVIp9qZHo3aygJKYYA/bnRK80nLs/GEqHoCKRWj6CQkIvlhSYyXg
	3ejBvHosqsX8Ix1XBrgT+3LSPz658Or68KqcPYGNmMMAxiXl9p68emMD2LnwP2AI23M5JeW9Efa
	FRTOt4X/rjIcS7SKlRbtYSkepRdouOUKPhD0UAffgZl0YPE/E3lAqzPs/OHysOirhWC9EbMeWxC
	g1Qh5UZhuScqVKAryPfVy50xlJjlXdZOzfI1uUsCxYUmttZKnQQhT3xU/Qxcw6xkyRHeanka9q4
	+M+LPYzWl1B48E+x6To3xDdJnTQtU+1eawutc+VtXmov+RY37m2tC0GQplTtIK8zAgx9IuhY2R6
	lITrNDMlBqvpMFbxyfb5phxUpru/yPw0SDsg/2cuhcLnyc=
X-Received: by 2002:a05:690e:4288:10b0:66c:4be4:89ef with SMTP id 956f58d0204a3-66c514f1295mr1042206d50.14.1786588183813;
        Wed, 12 Aug 2026 19:29:43 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8346f704851sm4472597b3.48.2026.08.12.19.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:29:42 -0700 (PDT)
Date: Wed, 12 Aug 2026 22:29:42 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: zhaoping.shu@mediatek.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 ncardwell@google.com, 
 kuniyu@google.com, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 willemb@google.com, 
 alice@isovalent.com, 
 sd@queasysnail.net, 
 eilaimemedsnaimel@gmail.com, 
 imv4bel@gmail.com, 
 hw.he@mediatek.com, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: haijun.liu@mediatek.com, 
 xiayu.zhang@mediatek.com, 
 lambert.wang@mediatek.com, 
 Iven.Yang@mediatek.com, 
 Zhaoping Shu <zhaoping.shu@mediatek.com>
Message-ID: <willemdebruijn.kernel.1372b82f50882@gmail.com>
In-Reply-To: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
References: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
Subject: Re: [PATCH net v3] net: gro: Fix nesting of TCP GSO SKBs in 
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_192945_480752_E21C8658 
X-CRM114-Status: GOOD (  27.26  )
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

zhaoping.shu@ wrote:
> From: HW He <hw.he@mediatek.com>
> 
> A device supports GRO_HW, and the device driver enables the
> NETIF_F_GRO_FRAGLIST feature. During a tethering test,
> skb_gro_receive_list() reaggregates the GSO packet. However,
> skb_segment_list() cannot segment this packet back into
> the original packets, which leads to IP fragmentation or packet drop.
> 
> Scenario (Tethering/Forwarding):
> 1.Driver submits a single TCP packet, P1. P1 is kept in the
> gro_list as the first packet.
> 
> 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> multiple TCP packets by HW_GRO, and its non-linear data is stored in
> frags[].
> 
> 3. P1 and P2 match the GRO rules, and since there is no local socket,
> they are aggregated by skb_gro_receive_list(). The resulting skb,
> P3, has a frag_list entry that still contains frags[]:
> P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
>                                     [ frag[1] ]
>                                     [ frag[2] ]
>                                     ...
> 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> skb_segment_list() to segment P3. However, skb_segment_list() only
> segments the entries in frag_list. It does not segment the frags[]
> inside P2, so P3 is not restored to the original packets, which leads
> to IP fragmentation or packet drop in the following path.
> 
> When NETIF_F_GRO_HW is enabled, do not set NAPI_GRO_CB(skb)->is_flist.
> Fall through to the regular skb_gro_receive() path instead of
> skb_gro_receive_list().
> 
> Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
> Signed-off-by: HW He <hw.he@mediatek.com>
> Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
> ---
> [2]: https://patchwork.kernel.org/patch/14706032
> [1]: https://patchwork.kernel.org/patch/14702209
> ---
>  net/ipv4/tcp_offload.c   | 7 +++----
>  net/ipv6/tcpv6_offload.c | 3 ++-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index 3b1fdcd3cb29..641c47fb1ea2 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -395,9 +395,6 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
>  	struct net *net;
>  	int iif, sdif;
>  
> -	if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
> -		return;
> -

Interesting that ipv4 and ipv6 diverge here. Nice to try to make them
more alike.

>  	p = tcp_gro_lookup(head, th);
>  	if (p) {
>  		NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
> @@ -430,7 +427,9 @@ struct sk_buff *tcp4_gro_receive(struct list_head *head, struct sk_buff *skb)
>  	if (!th)
>  		goto flush;
>  
> -	tcp4_check_fraglist_gro(head, skb, th);
> +	if (unlikely((skb->dev->features & NETIF_F_GRO_FRAGLIST) &&
> +		     !(skb->dev->features & NETIF_F_GRO_HW)))

Would it be better to test skb_is_gso(skb) and only skip fraglist GRO
for HW-GRO skbs, rather than disabling it for all skbs?

If treating the features as mutually exclusive, another option would
be to replace these datapath checks with disabling one at configuration
time, in netdev_fix_features.



