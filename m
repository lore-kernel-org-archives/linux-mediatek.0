Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A32C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 02:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiPeyVYQaEiVqx7WKQEaIVABISxwCwD67P0r37Z1zdw=; b=z4Cip90W3jKrKOdpYbv4RnsMNQ
	sB8gIAC0F4C8afdkGX4gl0xYRS8xJWO2si4GZ7bAmawuYlc+qLmkA3r4sO5s1XP90G0wx7tUbOEo1
	+K93uimLBNMW7TcXojIjeLPWhyrH+9JqadJadeTz/XmF0xCp/7X6tE7GEEcHNjqB4BIAr+ydCmJ1F
	y2Of5LCE6bmgrQnYfiBYJ4zTV4NQurz63F4c2FCy/mqPfQ78f205KZC0vW3Ca+x6ilQGXatZ2aSHF
	ioBd26cA+jGoyAoMNbjwvNORobzMW2ELwsmv2+kREPp1f/S8n8x1PY0TGVl4lt77HvPagGkhBsYPV
	8fPAEGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheAc-00000000nZd-0o8l;
	Thu, 09 Jul 2026 02:07:22 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheAa-00000000nYo-0Hxj
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 02:07:21 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-80cbb0688c8so21107477b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 19:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783562839; x=1784167639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DiPeyVYQaEiVqx7WKQEaIVABISxwCwD67P0r37Z1zdw=;
        b=FZC6jaIWPR/HC3TBgXdMzhFT8Y776dWdq2WiBMm9xtK3iPNQBjF2EWXQMgFDbr2Tog
         2osViER/wz4muOPV7ZyldttUUxELrTwuhna2N6xslXow+ndBCqpRbDGDF8F3Kmf+nhQ8
         lkyZ+4dqpu24ad6/rIRQaQrlCDi7U6k1vr2luXqR0K+HJfijYG/taAPpnM+B2dCqu5t6
         ZWnrAEXL7JhCKcZCqVZKdPCefxGAB1Qo8FB6CgD3J64XL9iz/pAeungxQB9/8TptwppZ
         nM6ViedMm9MlL/iITYyu9CefsXSa+5oL61X+qchaY5u+NqpT+PQzrYPMUBWbhguPsFzR
         OWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783562839; x=1784167639;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiPeyVYQaEiVqx7WKQEaIVABISxwCwD67P0r37Z1zdw=;
        b=s78Wyz7qzzuygN8TjIixzzduSCsB3a+hJKTBRzLNQT8bCrTZqTcRaqfh6lvQCfthaT
         3XGNWvT9e7seqanYn4JyWgCiTVTpyJCN/yV5w81QhSN0KuDjsXKuSZIMPurbLOX5kXQ8
         Ta0RWFfc5yb1ZAsBGyGghVPHP1Vgbj4s1iTKbHE+S4me9tdNB5lb0TwgvKJiKzSBFzQH
         8o0XDt9ITelicx/rdadG4UoROpJLM8UXzV9yjh0jXr2tZrNhgC58+LahvFSS8QZ3HzhU
         rapn027sI6FIkvdK8Lt3FlWNqkMmjllcfkguP/wUtPL5XZ038dk19lsFCtn2Y8fTIaKR
         zJMA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1u59Ja4DayYZwY47Os9T7sBsaBPv6k7odcbCWNCwoRW4V6s6VXWH5wGi9fqZ4ZImw2GZpD6izppZqLL+vMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWszGFqudB90GLgynHcOxf3+zzpHkHbMAcNeoCseyXDOEyaEjf
	Vp8N/oRy1yT8frUGMh0n/7sEft6rEo7TZ4YMEe3tcip/C4G8DLwhntrp
X-Gm-Gg: AfdE7clqNCcuL5xSKvobuf31qZ+mKEWecahjuuQ97C70KrmhBYsKKre7UoAlw91dYpM
	vKF4I8mKlRKTztA3oLZ59iAgranFCLVx+luEg/F+oY+3QG9BodL6rWj3IYomhXq9WI1wfYzEf3T
	nlP8Ad9WWGWhBciXsubAyNse3/BUp/d4qAT01FStsbndrBJpBKIUTupHfeYn2yCD4ps/LAygC8K
	FT1hO6XGIkpDr5xHBtfpPoVY7/SrQ9bpZm56c5K42TOuKwGuQR8fSE8vpAFPeFqynsyz7yaBa9R
	ysb1FrxCxa1V5sE/btnuoz45j7+xFXEqOpEQ71ef7DYv/la7RFwR2o/SZ89xYcAYRsfFXBDZt1w
	Hoz+NHHKN7efHGgUHzS+UDMy6uPir6IQoQgIRETU6QvUjr63gzSnpCuskxS3nvCVH1dVLFVYMqb
	uMyTQ4fL5IOU/PhnD59BVdIYrdkfP9jPiQq9Pmef7T1SPsk0YnmxyVD7MuwAbLTMOMig==
X-Received: by 2002:a05:690c:4b90:b0:814:608a:acb4 with SMTP id 00721157ae682-81dbeb5f73emr38829227b3.27.1783562838726;
        Wed, 08 Jul 2026 19:07:18 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be904a4sm6869687b3.7.2026.07.08.19.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 19:07:18 -0700 (PDT)
Date: Wed, 08 Jul 2026 22:07:17 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Shiming Cheng <shiming.cheng@mediatek.com>, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 willemb@google.com, 
 daniel.zahka@gmail.com, 
 alice@isovalent.com, 
 sd@queasysnail.net, 
 eilaimemedsnaimel@gmail.com, 
 imv4bel@gmail.com, 
 nbd@nbd.name, 
 dsahern@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org, 
 steffen.klassert@secunet.com, 
 lena.wang@mediatek.com, 
 shiming.cheng@mediatek.com
Message-ID: <willemdebruijn.kernel.2801a1401793d@gmail.com>
In-Reply-To: <20260709014704.3625-1-shiming.cheng@mediatek.com>
References: <20260709014704.3625-1-shiming.cheng@mediatek.com>
Subject: Re: [PATCH v7] net: gro: fix double aggregation of flush-marked skbs
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_190720_266200_A60C3033 
X-CRM114-Status: GOOD (  13.79  )
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

Reminder to mark patches [PATCH net v7]

(or PATCH net-next when targeting that tree)

Shiming Cheng wrote:
> Commit 0ab03f353d36 ("net-gro: Fix GRO flush when receiving a GSO
> packet.") added a flush check to skb_gro_receive(), but
> skb_gro_receive_list() lacks the same validation.
> 
> As a result, packets marked with NAPI_GRO_CB(skb)->flush may still be
> re-aggregated.
> 
> This allows already-GRO'd packets with existing frag_list to be
> re-aggregated into a new GRO session, corrupting the frag_list chain
> structure. When skb_segment() attempts to unpack these malformed packets,
> it encounters invalid state and triggers a kernel panic.
> 
> Scenario (Tethering/Device forwarding):
>   1. Driver: Generated aggregated packet P1 via LRO with frag_list
>   2. Dev A: Receives aggregated fraglist packet and flush flag set
>   3. Dev A: Re-enters GRO, skb_gro_receive_list() is called
>   4. Missing flush check allows re-aggregation despite flush flag
>   5. Frag_list chain becomes corrupted (loops or dangling refs)
>   6. Dev B: TX path calls skb_segment(), crashes on corrupted frag_list
> 
> Root cause in skb_segment():
>   The check at line ~4891:
>     if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
>         (skb_headlen(list_skb) == len || sg)) {
> 
>   When frag_list is corrupted by double aggregation, when list_skb is
>   a NULL pointer from skb->next, skb_headlen(list_skb) dereference
>   NULL/corrupted pointers occurs.
> 
> Call Trace:
>  skb_headlen(NULL skb)
>  skb_segment
>  tcp_gso_segment
>  tcp4_gso_segment
>  inet_gso_segment
>  skb_mac_gso_segment
>  __skb_gso_segment
>  skb_gso_segment
>  validate_xmit_skb
>  validate_xmit_skb_list
>  sch_direct_xmit
>  qdisc_restart
>  __qdisc_run
>  qdisc_run
>  net_tx_action
> 
> Fix: Add NAPI_GRO_CB(skb)->flush validation to the early-return check in
> skb_gro_receive_list(), matching the defensive programming pattern of
> skb_gro_receive().
> 
> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

