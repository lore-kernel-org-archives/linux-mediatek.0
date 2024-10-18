Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74337D3DEAB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+C37RFzcILnMsZFYBuRVkaO1NAcl0ehLYM/0ikIXvM=; b=q2vjkOO1j/o8xv
	caB2VdAba2sfZdHmc+5gSv6M8SPKA8QIdilq3nfAr402YrRvGDISz2MPIujFK4vLc4JvxAjXefN4W
	pzfTA/UC7V/waB1irSlRVaQrCUqzlKYENEZgFQrpi6pyA0fGfkV/EUi2eMnCvL92YbKVdnDip9r7D
	KP0mqMS3Mn0QvVnPxwOX1zYFe6kbEda3E5zMA7JnxVG2pY4o+Ji7ggLc+BGsxR/khkloedcaAFvJS
	PT+cgnj29kpojeO1wAqv6ijXZcqwcq7ItkUhULSw4cxcL6IfRuLF0/eqGAd0YT7cM7sDIy7JYldiK
	k9nNuoYTHH4LPWlkF8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1sA6-00000001iNO-1xSv;
	Fri, 18 Oct 2024 18:57:22 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1s6U-00000001hw2-2u58;
	Fri, 18 Oct 2024 18:53:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539e6c754bdso2570117e87.2;
        Fri, 18 Oct 2024 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729277616; x=1729882416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+C37RFzcILnMsZFYBuRVkaO1NAcl0ehLYM/0ikIXvM=;
        b=gqDvQJue/CAUp4+4DAN4Rfvmz6NkOJW+P1bsCuWtGcPBsIIWlsEBgJ20l7DIYJkEfA
         jzawso7Y1WpnzGCAiUdioLhwNO9hwCRBLS5GsVDWasby9vxfoX5PY7enqV2Hs0i9SRuN
         1lZu5Ul5tl+qavqQosCAcBw2Tt+UXPE/h+oS+KhcHLIcWxG0Uv60+L7ZsD4QOLYXZXKd
         4/V4LlWWOm1QVDU23vAiOJEXOD3byY1KhRyMKi56TvIvvm+sLycdA1HBlhyMLWRDzO5v
         BQL22UeUAQws9tP6LogtvbKbZvKWtB5HSaDYaRQOWeJ2f3cmgNr+OQ8pzjnSTxNsm+oh
         fy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729277616; x=1729882416;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+C37RFzcILnMsZFYBuRVkaO1NAcl0ehLYM/0ikIXvM=;
        b=YzrjkrJcRqpfUamf9I0X8iWrG8r/3a953SCbBqzDLi0qF0z+8w8sUF1qn6bamEeANm
         lYMPWz46VNOgSkHQPHDC2unJRI13E/knALXrbw2JJhweGlsRBLtakZ1koEOYNrY25uTe
         /BpPAbh/JcjllOqEyR1O3mHAb1g6Kg/sR73vvHXWzMF20mV11ftagSmq6QfDVKrDOYCV
         d7zLyYgwX9+UW2+x8dIbXUByo3EAu1HVbi9Ja7CGmeWe4OO6K//sqppw2R9zkXJUqS0f
         GurpNeiZ6A5b8lQRuuweYgVuDvWsp4Xf0o3cu5twvngwBpcHhTVGIblBe5LpTr1GfDrl
         ZmOg==
X-Forwarded-Encrypted: i=1; AJvYcCUWc7t9ps8bzpeLYwRA8sHtMOzq7cxASuLhhEU/4Dc9FsHRJowA4Eydx1x8Kw9pGkw70Nsd/TOBvq1gX5+Q8xE=@lists.infradead.org, AJvYcCW28jp8mN4aCmpkVGdaKA4AsPeOeBJEoqoiTfQZvBwbt+9HIxvR2Oufimrp6iBUiFBBbDmWx1vp891d3FqNleML@lists.infradead.org
X-Gm-Message-State: AOJu0Ywydy2B5/tkKEeCZxkDRhu4f73Q0ASJ0FbQrzBfTIELSLCKDm7+
	X1aC6aMtqDBPBleJNWzbQ2TEyi6M2TLCT6qe6l02EYWUcUibZ6Nb
X-Google-Smtp-Source: AGHT+IFTECmpui4bEAd6LfXlK56bk60zCpZroN7QeGRG8HvefwSVsCLjpZDdolPkBbtIu2/ZZR22ag==
X-Received: by 2002:a05:6512:2352:b0:539:fc45:a292 with SMTP id 2adb3069b0e04-53a154fa754mr2044964e87.43.1729277616138;
        Fri, 18 Oct 2024 11:53:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b08c3easm1036170a12.50.2024.10.18.11.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 11:53:35 -0700 (PDT)
Message-ID: <56c3d435-e93c-405c-9bf5-e9ea9c038d13@gmail.com>
Date: Fri, 18 Oct 2024 20:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 02/12] netfilter: bridge: Add conntrack
 double vlan and pppoe
To: Vladimir Oltean <olteanv@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-3-ericwouds@gmail.com>
 <20241018131754.ikrrnsspjsu5ppfz@skbuf>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <20241018131754.ikrrnsspjsu5ppfz@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_115338_771609_12B95684 
X-CRM114-Status: GOOD (  22.77  )
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
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/18/24 3:17 PM, Vladimir Oltean wrote:
> On Sun, Oct 13, 2024 at 08:54:58PM +0200, Eric Woudstra wrote:
>> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
>> packets that are passing a bridge.
>>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>> ---
> 
> Whatever you choose to do forward with these patches, please squash this
> build fix here (you can drop my authorship info and commit message):

Thanks, I had already fixed the errors from patchwork.kernel.org->checks
for the next version of the rfc patch. This is indeed one of them.

> From e73315196c3143de2af2fe39e3b0e95391849d6c Mon Sep 17 00:00:00 2001
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Date: Fri, 18 Oct 2024 13:59:27 +0300
> Subject: [PATCH] netfilter: bridge: fix build failures in nf_ct_bridge_pre()
> 
> clang-16 fails to build, stating:
> 
> net/bridge/netfilter/nf_conntrack_bridge.c:257:3: error: expected expression
>                 struct ppp_hdr {
>                 ^
> net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
>                 data_len = ntohs(ph->hdr.length) - 2;
>                                  ^
> net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
> net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
> net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
> net/bridge/netfilter/nf_conntrack_bridge.c:265:11: error: use of undeclared identifier 'ph'
>                 switch (ph->proto) {
>                         ^
> 
> net/bridge/netfilter/nf_conntrack_bridge.c:278:3: error: expected expression
>                 struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
>                 ^
> net/bridge/netfilter/nf_conntrack_bridge.c:283:17: error: use of undeclared identifier 'vhdr'
>                 inner_proto = vhdr->h_vlan_encapsulated_proto;
>                               ^
> 
> One cannot have variable declarations placed this way in a switch/case
> statement, a new scope must be opened.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  net/bridge/netfilter/nf_conntrack_bridge.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
> index fb2f79396aa0..31e2bcd71735 100644
> --- a/net/bridge/netfilter/nf_conntrack_bridge.c
> +++ b/net/bridge/netfilter/nf_conntrack_bridge.c
> @@ -253,7 +253,7 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
>  		return NF_ACCEPT;
>  
>  	switch (skb->protocol) {
> -	case htons(ETH_P_PPP_SES):
> +	case htons(ETH_P_PPP_SES): {
>  		struct ppp_hdr {
>  			struct pppoe_hdr hdr;
>  			__be16 proto;
> @@ -273,7 +273,8 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
>  			return NF_ACCEPT;
>  		}
>  		break;
> -	case htons(ETH_P_8021Q):
> +	}
> +	case htons(ETH_P_8021Q): {
>  		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
>  
>  		data_len = 0xffffffff;
> @@ -281,6 +282,7 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
>  		outer_proto = skb->protocol;
>  		inner_proto = vhdr->h_vlan_encapsulated_proto;
>  		break;
> +	}
>  	default:
>  		data_len = 0xffffffff;
>  		break;

