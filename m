Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D40C9832A
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=; b=o8hZkZWwS0i5VFL/lEA29+3Xwr
	eRBBAYDyfszlzhIxWZOk0f3SXNdKZ51kGziwK6KzFnz5EoUnH9fOSPrScZNpBet0weF6uDgMb8Yat
	SIRKX8cBvYzfju5vAbL95cenOIhwByfscsuJ02zWOuEJ1W1uB8SQwIQd0YIf5jE+TklI6XScpRWA9
	gbGefO1ZVpOSxVi600r6tmE2L5nI9qkmMfNu8vPtGTuqYsFC+hUAiuoNI+iEP30lxgdLCLpOkFT9R
	RmohPkO/wedYv2YOlBFpeygsOz3j9VigHlqoAuQHJvaONJPfsycYnzf2RSksGqpIpWGefFe8B7SxX
	UAEUjLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZlF-00000003wMh-2nZO;
	Tue, 29 Sep 2026 15:28:53 +0000
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZlC-00000003wLb-2TBv
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 15:28:52 +0000
Received: by mail-yx2-x0c.google.com with SMTP id 00721157ae682-8ab42612328so9366427b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2026 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695729; x=1791300529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=;
        b=KSVEumxGPeQJkmd58a4lO0WxPAE+GYWlc6pjH8tZx5GI8icRbPJ+LL9vM0olsK6YAT
         +gUvSUD1G7chHWkkGYTIJpO8aCAhcMUWlvisu5wP//EMm3aYRtQW97wyjTsSG7h/x49z
         GiuH0IfxqESZNJfOzvH/YdoplZgOY7sUQVkWlLSRRcPIYrfGDIhzyYmxyLlrZCldmYwd
         LWvhKC4ZCPxE5EcjCHMqvPU82MHfNGANKcYHMCVlwC+/ayGYaEGa+gnQW9WOqDUy/GJ7
         ImarDDTRA+bHmIK2xlqkIkDWxtrD2aLcgzR0x0rJbzlFr34m3O3PhrUmnxhRGuzbZ6pR
         YwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695729; x=1791300529;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=;
        b=mq1hocUGa9b5G8nmObEeuRg1WMUW/kXqALlSNFH3taa3s8yMnsfHB0FKgm6OEdF6SH
         ppSZNUvpmdq4HRJsiO42lxuh1myJXHBCS7UOWEYbbQG4hum8M3H5btRdlhe9oljFYcKU
         9qKlryEXxvC/ulSI/G5xc/WlBmo7WtQxwO8urZ3/YsIls028Fhv0PtIXalpK7AOzMACI
         dmd8yFREbYe9U7MY1mtaC6NVQxRxs9p8jlxkcfcCrNZay3CHYDxgvs59Y8o1n3WDafow
         dpeWpUOKfJ9bv1EfU75u+UAAbBWoFztGAcMmBPrJtoN+5QNb1DETD9OW3f1ZhYZjG+XC
         pG2A==
X-Forwarded-Encrypted: i=1; AKwUvBzD7b11qbNai5f9JfsRuXj68jatGXXRf4gGEocVyN3zyNL1GCrEBeUHIo9ZJDikVTyXMBjRjaEzHHuBnB8PVg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKhQ2zQkyhGuDZlexPzbh7SYV6WkCGKhLzwb982QMR5aVFY8aF7
	IF9zlMJbwSes1s/gkEuWlcbmvE/olAk9ZXin6s1lRzyiIoPuSpHLvLOG
X-Gm-Gg: AYBFou0exXyKvmM77v5ZjgT34N/56eeNaTm7Lol8Amtyt5+niys0eOjsGBrpJh+bI8H
	j0c+0koecY+BY9GBJUymp6pKMR2LnA4E3jRcu2+BnKr1o3rlc9exVDK5zR/JKcnZd+LurBsprOD
	q2N5hN3KDG3eIN9cAtJlMMUbUCNRZfMidLwLM8fcEE8Wv15ODV1idMACHEkCin/7//jJDWGYDSn
	dFdZERDzLo8V96qnYUYxf5aSTBcofpGZjlKBDBXx9aOug4eY/RmoJBCHOaN4df7JpSAenPXqW4E
	okLgl4WZO+7sTKN0dPH5+FNH/cVzVt5kHFa92MYp44u7Etlb5pXNf+ZNa3hIGmGN0BhzQ/h19Jo
	kWUQNDx1ZrNCosDt+lSIzW77Mci6IF1o6dCSePFqHu66MGrWLTD75YhORDdu79aHp9ll4lwr1VO
	UZeveKuNL9e2ndusvJwS1gmiGssTaGvQhCWQTeBBuRtQaLL4gZCNXR76EoSoAWIjcVAK4EmAHLq
	83te7up9L5l7Evk0VQoVhxrDZfSJ70UkYeUed/mUgzsfaigIWg2
X-Received: by 2002:a05:690c:e3c3:b0:868:505e:b96d with SMTP id 00721157ae682-8a64c3432b4mr71353467b3.2.1790695728518;
        Tue, 29 Sep 2026 08:28:48 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm60998327b3.24.2026.09.29.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:28:47 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:28:47 -0400
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
Message-ID: <willemdebruijn.kernel.20906a8caa141@gmail.com>
In-Reply-To: <20260929100256.23192-1-shiming.cheng@mediatek.com>
References: <20260929100256.23192-1-shiming.cheng@mediatek.com>
Subject: Re: [PATCH] net: gro: mark frag_list GRO packets as SKB_GSO_DODGY
 when a list element exceeds gso_size
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_082850_649690_A4CD6A4A 
X-CRM114-Status: GOOD (  21.38  )
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
> When RX LRO (or similar offload) is enabled, the TCP/IPv4 GRO path may
> aggregate traffic using frag_list. The resulting skb is later segmented=

> via the frag_list segmentation path (skb_segment_list()).
> =

> However, some drivers can hand GRO/LRO-aggregated frames to the stack
> where individual frag_list elements are already larger than skb_shinfo(=
p)
> ->gso_size (i.e., an element itself contains multiple MSS worth of
> payload) and may be non-linear (nr_frags > 0). This shape is not
> naturally produced by the software GRO aggregation logic for devices
> without LRO, and can lead to unexpected behavior in the frag_list
> segmentation path.

Did you observe this with a specific driver?

We don't want to have to support every crazy driver scheme. The right
approach may be to fix the driver.

To understand the geometry: the driver passes a GSO skb with frag_list,
where frag_list members may be any size, not just gso_size? I.e., these
do not conform to SKB_GSO_FRAGLIST rules?

I don't recall immediately what the acceptable behavior for regular
GSO skbs with frag_list is. But for starters such a driver should not
advertiserr SKB_GSO_FRAGLIST.

> =

> Detect this condition during frag_list aggregation and mark the
> aggregated packet as SKB_GSO_DODGY when a list element=E2=80=99s length=
 exceeds
> gso_size. This forces a more conservative segmentation/linearization
> behavior downstream and avoids relying on assumptions that do not hold
> for LRO-produced aggregates.
> =

> No change for normal software GRO aggregation: the new check only
> triggers when skb_shinfo(p)->gso_size is set and a frag_list element
> length exceeds that size.
> =

> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>
> ---
>  net/core/gro.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/net/core/gro.c b/net/core/gro.c
> index 29b4d02bf519..e70ecf19b0a7 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -259,6 +259,9 @@ int skb_gro_receive_list(struct sk_buff *p, struct =
sk_buff *skb)
>  	skb_shinfo(p)->flags |=3D skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;=

>  =

>  	NAPI_GRO_CB(skb)->same_flow =3D 1;
> +	/* frag_list element larger than gso_size (already coalesced before l=
ist-append) */
> +	if (skb_shinfo(p)->gso_size && skb->len > skb_shinfo(p)->gso_size)
> +		skb_shinfo(p)->gso_type |=3D SKB_GSO_DODGY;
>  =

>  	return 0;
>  }
> -- =

> 2.45.2
> =




