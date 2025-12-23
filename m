Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C5CE6F090
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tnt9HsgJu0ejswucQziIfqB6VQPJ8jxDsIeAyekFBzs=; b=MwGAnJjpBClYbjj4FCaxhy2RNo
	tJvzrMJG0KuarJMW8sCkmFba31I101eR30ludLqtrSC3Hhktn3BVe3gWrduOXlhAk2AtfFL/DkVWz
	SFPlSrPc3lM514/sC/XmTXuhPeA1mTFW2aK+/7iNriGmy3M4d/cvBi2XSmdLNdl2JBKwmsN3byfQ9
	ljSQ1DbkDYwl5BVVEhRv2MYiiferOpTFN+fBJGPqQwLrtUS1HlJ0cRvqaSNUhPy1o9QVt39raLCgL
	nKDh7TeWwtFh/R1/4lKycKYPXO9uk4lHbCCsGXtHdS9AMlPOQXVr1WAVB8I3EwJK5HOZDmBu1FrMN
	JzXUzQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY38P-0000000FaZI-21X3;
	Tue, 23 Dec 2025 14:13:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY38L-0000000FaY4-3zDK
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Dec 2025 14:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766499184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tnt9HsgJu0ejswucQziIfqB6VQPJ8jxDsIeAyekFBzs=;
	b=iC155lAPbIaJvhFdQj7fTWN3fVW5+Jlclfae4pYbEKVf3C290HYtpJBDAIEKpXzgwK4RG7
	U3CFb4aUU27JFvszIavEzoY38oWIZO9an4L8Q4SX5mHVnL5nlQGffFVlR3E10sA6mOaf68
	3C8OkPrA/H+sRUWcxq0NCnG9V1cFJMo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-DSVZX89KNHmyBnXZ8msURw-1; Tue, 23 Dec 2025 09:13:02 -0500
X-MC-Unique: DSVZX89KNHmyBnXZ8msURw-1
X-Mimecast-MFC-AGG-ID: DSVZX89KNHmyBnXZ8msURw_1766499182
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47a97b719ccso28837025e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 06:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499182; x=1767103982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tnt9HsgJu0ejswucQziIfqB6VQPJ8jxDsIeAyekFBzs=;
        b=WemntbTrgpKmwrrehahrt7VVFq5ADvaLZpI31SP/vdGW43LwUlUPhDDj7sNK3z4yGm
         Ji6naauLLYjzsub+87XF+x4UnkGk8AqPllEyXbfhqa/l8H0E07jcbRg6YH2iUtPB3+2A
         aBYWxn19Qr850ftsB7W/c0EEaTJIZihintRRpl6Jm4dvJCfaGQNEIg5YnPYa+XvfJyhP
         CfCH1Q8Yg3s+avfX52/xHf+cuUaNdJRVFZW9DAU3qJ+7HV13eV8aJhdb09+CSzbmBNYt
         ehvTxFVE1hWIixSUdCZrJxx3HAKEZt3c/MCnY6bLt9NVUounoyuu1vfqC3apbzzpqkND
         Sllg==
X-Forwarded-Encrypted: i=1; AJvYcCXMyGtFWBZGQxaBErcfjYxI1+v9Sv74UXIKN/5/+vpAXyL8cl2bTKMS+3tihBXgOg86DNs/O1s5qLgKGWWMfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFLlLu3SFUy3oSo5H5zf8Z9LckQyfD/ggdnMfeXCkmkB297wHy
	jjzIBBC6rbWI689+3A5MHxSBgTCRZySt68TbYV4871BcjJVDUOy6SwaiL/3HmJ9AhK+XdNs1QWW
	78iVhuddRse93kULc4wqBHQ2OXftSSZllFcjCOtmtFy/4DF+ksFt+vN9lFdAc31a1fFsf4XPsfA
	==
X-Gm-Gg: AY/fxX6Ele5MSKA4mlPE7HvwXz/DZ1kJr1yUXZXG9CMAnF/4dpe0baUFh1JLrAZn37z
	4EmNtCCZpZ7KtGtidwSNBHlOfNHkDa3gbofF4Hj2C43oKVhVkphDRxSWMLuEfNjJJMxCGrmCzcQ
	hQhyqn3ByXDJK8Crrb4RKrkX6CubdPcSpDfX6HEgNKw7U6J7V3SlOKg8dZl7yBO5vupsdo9we/g
	7Ifbvh8trKxXDLATIG3REUp3G0QtivIKJ9AwHra2JL1UMHw+eHkWiCz3bK6gJ7SKfomqX0koOWq
	0oyyKFlkhj+5/Ns17cZzh578ghPst9KhRzL1lG/qvwFr8RhMdHcNTVYBECE2VUPmkFCiLMN/+LD
	X1iCM8zfxp6lM
X-Received: by 2002:a05:600c:a00b:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-47d1957e4e0mr139227785e9.21.1766499181641;
        Tue, 23 Dec 2025 06:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd2F5z4wbLe3efZdpRSf3+bxZeFuR7kdHFUh/07zOmiOvBJ9uVUehgrpT1q45jZN+DWyz2Gg==
X-Received: by 2002:a05:600c:a00b:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-47d1957e4e0mr139227375e9.21.1766499181248;
        Tue, 23 Dec 2025 06:13:01 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d192e88f5sm238919555e9.0.2025.12.23.06.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:13:00 -0800 (PST)
Message-ID: <aab6c515-12e4-48ca-8220-c0797dae781f@redhat.com>
Date: Tue, 23 Dec 2025 15:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: fix segmentation of forwarding fraglist GRO
To: Jibin Zhang <jibin.zhang@mediatek.com>, Eric Dumazet
 <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: wsd_upstream@mediatek.com, shiming.cheng@mediatek.com,
 defa.li@mediatek.com
References: <20251217035548.8104-1-jibin.zhang@mediatek.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251217035548.8104-1-jibin.zhang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pYBjrVbqYU2_rtsad9jwmOayD_Qmvg8aCanEum1S3VA_1766499182
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_061306_065436_419F50EB 
X-CRM114-Status: GOOD (  20.74  )
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

On 12/17/25 4:55 AM, Jibin Zhang wrote:
> This patch enhances GSO segment checks by verifying the presence
> of frag_list and protocol consistency, addressing low throughput
> issues on IPv4 servers when used as hotspots
> 
> Specifically, it fixes a bug in GSO segmentation when forwarding
> GRO packets with frag_list. The function skb_segment_list cannot
> correctly process GRO skbs converted by XLAT, because XLAT only
> converts the header of the head skb. As a result, skbs in the
> frag_list may remain unconverted, leading to protocol
> inconsistencies and reduced throughput.
> 
> To resolve this, the patch uses skb_segment to handle forwarded
> packets converted by XLAT, ensuring that all fragments are
> properly converted and segmented.
> 
> Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>

This looks like a fix, it should target the 'net' tree and include a
suitable Fixes tag.

> ---
>  net/ipv4/tcp_offload.c | 3 ++-
>  net/ipv4/udp_offload.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index fdda18b1abda..162a384a15bb 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -104,7 +104,8 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
>  	if (!pskb_may_pull(skb, sizeof(struct tcphdr)))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
> +	if ((skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(skb) &&
> +	    (skb->protocol == skb_shinfo(skb)->frag_list->protocol)) {
>  		struct tcphdr *th = tcp_hdr(skb);
>  
>  		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index 19d0b5b09ffa..704fb32d10d7 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -512,7 +512,8 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
>  		return NULL;
>  	}
>  
> -	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
> +	if ((skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(gso_skb) &&
> +	    (gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol)) {
>  		 /* Detect modified geometry and pass those to skb_segment. */
>  		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
>  			return __udp_gso_segment_list(gso_skb, features, is_ipv6);

I guess checks should be needed for ipv6.

Also it looks like this skips the CSUM_PARTIAL preparation, and possibly
break csum offload.

Additionally I don't like the ever increasing stack of hacks needed to
let GSO_FRAGLIST operate in the most diverse setups, the simpler fix
would be disabling such aggregation.

/P


