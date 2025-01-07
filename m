Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D61E77197
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHxjC6h0Kfucr4tH2PqzFsx9yRATfufXfuxgz/uTgy0=; b=WNXn9hqYW2Vw0h18vSv4LB/pIq
	ACkZQ+9cgJMhDB1CcFxJop+OLQDL9XSYKdu/mHF3ZpLdyYc+ApP+cwq4Q4BA8ClP3sECWdlFpHE8a
	rA/GvpPVkoUpY4KrvljZh4UXGQt93NXrAOmw6Qj7hS4D989mY2mQx4uK5FAS2k0wvTv6hRYxpl4ma
	hat17XAgNUddUdbCKn31s/RNCRGY2RQADPr85OPGCaHxiY8+g3p9L32lq7+L7CS49GqOp5pxnyv8B
	M4BkroDnj/Juf0juZnqq39z4xCb5JbFLPNc8dg+ZHHoM8Fxud9obzthbfu00tA/DuSeG1pQbshIpe
	BWmwVSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV60P-000000049A8-3LMr;
	Tue, 07 Jan 2025 09:36:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5xu-000000048X8-2R1w
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jan 2025 09:33:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaeec07b705so1749652166b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 01:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1736242412; x=1736847212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHxjC6h0Kfucr4tH2PqzFsx9yRATfufXfuxgz/uTgy0=;
        b=LQYcjmcYUrVqVJ52ICswox7+AEqygOQXcfi1PoK+XyjY7c8LwCWCtkj161WYtypHIf
         kZVg9uzjqo8Pk6gqsb8kSWRakBM4fpOiPbu8wTM7rp87jF2M6bKzaOtFNMZ3FGJyvqif
         HB1eBEeT/dnpKP+Tm4mAZvLfEmb+BbXOn0K0RfnIsFxs+JpGW2JoWJ/OYDPfYGNdDkUH
         ZDmLS1iQYZpkhpqXD295jd2YDr3QfP4a/bNHsXbXs5EO6SwZs8uQSyGGnBeKRhI5PSYb
         DhPFOBRE0ixb0aiA85a4jdC/eVZOj5Z6vSLuWYUHPm+Wk59VAiX+vLBAPLPX7psq6sE1
         9rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242412; x=1736847212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHxjC6h0Kfucr4tH2PqzFsx9yRATfufXfuxgz/uTgy0=;
        b=n/KjgK/y0IqAKnO7R8DMgOugJbO45LX0NiQE0njZwAq8Ag675fuebMnC8ddL/MVrCF
         jkLUW6a9PPBkTw6LtKJlsXTxTpFqhL3cTOWbTnlSi0pJiDotRlczvrVVIWIZdDIGOcx6
         BFikc69ht7CWjooBoR+B9aED9Kmbya1YskcvJfNNnKdiHwsweXyCuO1yq8chlD1wbEDI
         p6tSk3nNUZ+CG8Qaz/aJRKgdM+qGs/ZnPn04VeHDbnM0iAdNuMISAM0UvXh0aCQ4Y0Yg
         QaPhbOozCf+L8umhtvrm1REdpx6ZeyuPG7SpmSWcung8oOAaK1KGfMgKS2Pe3J6zNfyI
         Tf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsX4OVdATm9WQkUbxX2FP9mc6yVB2z0BXWogB0oi6orqh3/LPW/JGKLRJQGjQsAKZibB1bg0r5q+7Ia3MCWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YycxpHSocRWPrs8epw7Wec7v8l/izbMVyDEEYikoY+CjlENO/pb
	rTUvTmLOY0bB6P5z1SPA9nL3E7XvBI6U69glm7IVvvzEz7zYfiHAjNk0i7kN6s0=
X-Gm-Gg: ASbGncthFhF2+Y/a5DibP2Z2eQ2gQbCgggc/elFW7js+ZPc5ncOXY+LrJiSiee5UtjZ
	JzaUUkFiLI9cnrS1LAMZEtQ637xq9xyQiKyeAjp9WjCq9gBeuWd59Px5EC8DOgg02rfKgdcekyj
	ANXJu/e9g5veg1AgQefiFaJqR+0RspHz/eTnL3eLnj8hfv4hT3f8N263VCYcH7E106/k5w+cO8I
	ui4ykJ148iyC0uUIhRvNIWtD6zN6m5vqhq4GFO8ikEWe0fPTBU6OwyBaCJ9lia923j5iYS+Z8nT
	2ZJ97M/zpZR3
X-Google-Smtp-Source: AGHT+IGa/DGsAatcdI0vhBgT7pEyChI9fpmymNYGz7BLnI1zVom6ss0TkBiupaXLIbc8eDhgvofItg==
X-Received: by 2002:a17:907:724f:b0:aae:ebfe:cedb with SMTP id a640c23a62f3a-aaeebfecfc4mr3325114266b.51.1736242412236;
        Tue, 07 Jan 2025 01:33:32 -0800 (PST)
Received: from [192.168.0.123] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm2354283266b.47.2025.01.07.01.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 01:33:31 -0800 (PST)
Message-ID: <2b2488d5-8e34-429b-98f2-0ddb0cce87eb@blackwall.org>
Date: Tue, 7 Jan 2025 11:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 02/13] netfilter: bridge: Add conntrack double
 vlan and pppoe
To: Eric Woudstra <ericwouds@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Ahern <dsahern@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250107090530.5035-1-ericwouds@gmail.com>
 <20250107090530.5035-3-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250107090530.5035-3-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_013334_614900_2579CF3C 
X-CRM114-Status: GOOD (  20.34  )
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

On 1/7/25 11:05, Eric Woudstra wrote:
> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets that are passing a bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/netfilter/nf_conntrack_bridge.c | 88 ++++++++++++++++++----
>  1 file changed, 75 insertions(+), 13 deletions(-)
> 
> diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
> index 816bb0fde718..31e2bcd71735 100644
> --- a/net/bridge/netfilter/nf_conntrack_bridge.c
> +++ b/net/bridge/netfilter/nf_conntrack_bridge.c
> @@ -241,56 +241,118 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
>  				     const struct nf_hook_state *state)
>  {
>  	struct nf_hook_state bridge_state = *state;
> +	__be16 outer_proto, inner_proto;
>  	enum ip_conntrack_info ctinfo;
> +	int ret, offset = 0;
>  	struct nf_conn *ct;
> -	u32 len;
> -	int ret;
> +	u32 len, data_len;
>  
>  	ct = nf_ct_get(skb, &ctinfo);
>  	if ((ct && !nf_ct_is_template(ct)) ||
>  	    ctinfo == IP_CT_UNTRACKED)
>  		return NF_ACCEPT;
>  

In all cases below I think you should make sure the headers are present
in the linear part of the skb, either do pskb_may_pull() or use
skb_header_pointer(). This is executed in the PRE bridge hook, so nothing
has been pulled yet by it.

> +	switch (skb->protocol) {
> +	case htons(ETH_P_PPP_SES): {
> +		struct ppp_hdr {
> +			struct pppoe_hdr hdr;
> +			__be16 proto;
> +		} *ph = (struct ppp_hdr *)(skb->data);
> +
> +		data_len = ntohs(ph->hdr.length) - 2;
> +		offset = PPPOE_SES_HLEN;
> +		outer_proto = skb->protocol;
> +		switch (ph->proto) {
> +		case htons(PPP_IP):
> +			inner_proto = htons(ETH_P_IP);
> +			break;
> +		case htons(PPP_IPV6):
> +			inner_proto = htons(ETH_P_IPV6);
> +			break;
> +		default:
> +			return NF_ACCEPT;
> +		}
> +		break;
> +	}
> +	case htons(ETH_P_8021Q): {
> +		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
> +
> +		data_len = 0xffffffff;
> +		offset = VLAN_HLEN;
> +		outer_proto = skb->protocol;
> +		inner_proto = vhdr->h_vlan_encapsulated_proto;
> +		break;
> +	}
> +	default:
> +		data_len = 0xffffffff;
> +		break;
> +	}
> +
> +	if (offset) {
> +		switch (inner_proto) {
> +		case htons(ETH_P_IP):
> +		case htons(ETH_P_IPV6):
> +			if (!pskb_may_pull(skb, offset))
> +				return NF_ACCEPT;
> +			skb_pull_rcsum(skb, offset);> +			skb_reset_network_header(skb);
> +			skb->protocol = inner_proto;
> +			break;
> +		default:
> +			return NF_ACCEPT;
> +		}
> +	}
> +
> +	ret = NF_ACCEPT;
>  	switch (skb->protocol) {
>  	case htons(ETH_P_IP):
>  		if (!pskb_may_pull(skb, sizeof(struct iphdr)))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		len = skb_ip_totlen(skb);
> +		if (data_len < len)
> +			len = data_len;
>  		if (pskb_trim_rcsum(skb, len))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		if (nf_ct_br_ip_check(skb))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		bridge_state.pf = NFPROTO_IPV4;
>  		ret = nf_ct_br_defrag4(skb, &bridge_state);
>  		break;
>  	case htons(ETH_P_IPV6):
>  		if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		len = sizeof(struct ipv6hdr) + ntohs(ipv6_hdr(skb)->payload_len);
> +		if (data_len < len)
> +			len = data_len;
>  		if (pskb_trim_rcsum(skb, len))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		if (nf_ct_br_ipv6_check(skb))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		bridge_state.pf = NFPROTO_IPV6;
>  		ret = nf_ct_br_defrag6(skb, &bridge_state);
>  		break;
>  	default:
>  		nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
> -		return NF_ACCEPT;
> +		goto do_not_track;
>  	}
>  
> -	if (ret != NF_ACCEPT)
> -		return ret;
> +	if (ret == NF_ACCEPT)
> +		ret = nf_conntrack_in(skb, &bridge_state);
>  
> -	return nf_conntrack_in(skb, &bridge_state);
> +do_not_track:
> +	if (offset) {
> +		skb_push_rcsum(skb, offset);
> +		skb_reset_network_header(skb);
> +		skb->protocol = outer_proto;
> +	}
> +	return ret;
>  }
> -
>  static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
>  				    const struct nf_hook_state *state)
>  {


