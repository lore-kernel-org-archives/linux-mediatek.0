Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D936AC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+LREjqj7QKR0h0vN+5yo9g4950/7tRNrphjJDSrz5U=; b=oMuaQmdvWvmeWvS42VAYHoV+Cq
	flKVo4UxMbqJXkt7cJoJ9OOYjScZ0ZAod5OmLw2Lvd9c4ZkGc6gpbmQmVV+YKXDZ6WUf0UyX7cADG
	ZiRyalZ26+Dcakfzy3zzNYVT/Le3Mcz/wBFfi5XcJ+Y71XXRneDEO3/1NZmxFwI75I9lwzgmLnHQh
	gBpG6gJTdZNmlYnIc8LJfrM+HlTnSU+PffCZGM2UA/o2OLCN7tnJGQ+ClEVYzujJGZI+pAjlnP70G
	tSPuukpu812h5cCytDnMJex1CFqQ9Sx0p61457RzM2WnxrHLjeO3eXSKoUlqFrU0gouft5YiZlQv+
	FdUyX2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Xi-0000000FGXe-0ajA;
	Tue, 07 Jul 2026 15:17:02 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Xg-0000000FGWr-2F4o
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 15:17:01 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-664a09bc459so5811011d50.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783437419; x=1784042219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+LREjqj7QKR0h0vN+5yo9g4950/7tRNrphjJDSrz5U=;
        b=jU4ak5GbCKZ3p3CiRzK3DLQYS+eQ088yfEbcTm0yj+4l8isJElgXkWYf+2uN84EniO
         mlt0p4SLJ8tGPr1WB/JOfPM4rNGsOTxs1MVUWpWL4Ei5QQ0lZUjCOTsCbDRMe8ufGkcB
         NTsmkOdEFJC2EfDdg4TN7KvXlS+oFPma2SQes5eB1mNzATe9hw4RZ+65xCQFeaKJN5Ow
         7IgyvPOveQj4MlgjmgwFk5lvaTdkP9pOU2qrFJXsnQM48TzM58/vhyjxGndOzq5QsKyB
         CdL9Cdif/24BfKylvfP/BI+YCt+j1cXUOlcwXAKmcF8fxTQlwOGe/fZqCe2wulPrtBC2
         XQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437419; x=1784042219;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+LREjqj7QKR0h0vN+5yo9g4950/7tRNrphjJDSrz5U=;
        b=VWWBfFAI3JZhbtrFGYiJpGd+n2qs7A+4TNvqFy4U6NeGoDcZQRLko5VEBe/XQhqsaz
         rkLeOSz4AdfBRfT6AxX5luk61yPX1nf5L9q4jHUNV2g91qGjZtEKJijr3D34/OY3bHZH
         7Q9qMzxHI/sgpuWr5KP4cvXjDEgV+dejZyxNI2/OMFnjVoAmeraQyXTDvwYVRr2w9Es0
         6bYqeR6GKKU1p0C4D78kRgXx1YYQAw3R3zyWQZRllJn+LY2qS0RtZrzGWgAaTYWtmmCH
         SxVCSEeP+fG6sxpxeEEgjY1He1cTh/clPEs5AwqzlkhCoFtcSCHbXZFa1/fw4eQ5HL5r
         QJRg==
X-Forwarded-Encrypted: i=1; AHgh+RpPr+b4qun9RW132kvAfgQ3cghfNOgESfEA8elqO4vBvZ0IycsBvAxAWE84Q/TLaLKZXA4VkQeJ4a9NU6kqJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL8NWXWWZQ5M0wWE/r6pU82/xFIuyW95Z3pONchukS7m3PLPcm
	PdyBCrbQg45Y2Sl+JkMZ7c+G/Cmzlf3e/ptmcH0zFyCXn9vpH/GQFw99
X-Gm-Gg: AfdE7cnr2Vqh42Oz/iUUnrfrLwyY3Nvwxhqz643smaHptL28rIkh+b6/NBujw9THQuP
	ARZPaaNA/jTaB6IdWziZLG4ZJomcKO5J9nUdAM9ruKXTAC+gVM3dXIx7zkEbNasn8ybcCyOTyCt
	+pcrjUq6gtg2jC/MzArfrz9Yzx3S4OOJ6mO4M/bmI4TEJxNS7mSXFNrWeq8co+Tvb+nT2jhG7b3
	O9fPDXdCFD+aQKr8NAPfSxjh9eDoaewgmeq9sQUe2U8gZfZVAC1UkuwayU0+kNIuzl34wJGug4k
	nfpPECcOh+AfK3EfPPhSKy7aPNCNt+UkUIGNwZbzwhoJoQqXsp5sylXHRh43RBf/3PqN95kO5Pz
	ouOkSj5AclggVGPrdEQq5lNcDJQzQOCgM7NUalCAKuqEVJx6Y0JdH59qjtcI9yyj8tTtshrHR+H
	AWWYxG7hixANTYfXp0NAx8Ged9aUtUcHr6uRIIFg5hXCLuV9V1EzTV4ZlDUeX6krYF4g==
X-Received: by 2002:a05:690e:1189:b0:667:8dc9:2321 with SMTP id 956f58d0204a3-6678dc92498mr1718562d50.29.1783437419315;
        Tue, 07 Jul 2026 08:16:59 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b049939sm70583417b3.32.2026.07.07.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:16:58 -0700 (PDT)
Date: Tue, 07 Jul 2026 11:16:57 -0400
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
Message-ID: <willemdebruijn.kernel.39a3b0237ed2@gmail.com>
In-Reply-To: <20260707021425.483-1-shiming.cheng@mediatek.com>
References: <20260707021425.483-1-shiming.cheng@mediatek.com>
Subject: Re: [PATCH v6] net: gro: fix double aggregation of flush-marked skbs
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_081700_576158_EFAB7CCB 
X-CRM114-Status: GOOD (  22.79  )
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

Shiming Cheng wrote:
> The skb_gro_receive_list() function is missing a critical safety check
> that exists in the skb_gro_receive() implementation. Specifically, it
> does not validate NAPI_GRO_CB(skb)->flush before allowing packet
> aggregation, as of commit 0ab03f353d36 ("net-gro: Fix GRO flush
> when receiving a GSO packet.").

It does not check .. as of commit .. ?

No, skb_gro_receive checkos NAP_GRO_CB(skb)->flush as of that commit.
 
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
> ---
>  net/core/gro.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/gro.c b/net/core/gro.c
> index 35f2f708f010..b413f4a6462b 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -229,7 +229,9 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
>  
>  int skb_gro_receive_list(struct sk_buff *p, struct sk_buff *skb)
>  {
> -	if (unlikely(p->len + skb->len >= 65536))
> +	/* make sure to check flush flag and to not merge */
> +	if (unlikely(p->len + skb->len >= 65536 ||
> +		     NAPI_GRO_CB(skb)->flush))
>  		return -E2BIG;
>  
>  	if (!pskb_may_pull(skb, skb_gro_offset(skb))) {
> -- 
> 2.45.2
> 



