Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36B3C0219C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjndcfyqjqX0suK3BJwJI5MpJWEUcpM/zhKh9Jt/IFw=; b=uguGQ+IR0f8szdfjNHr+vt3S8N
	uPBQbInRYF80LclnMgMQIQhvaKpKqxiOmMBmkTehFHyRR+zc4wx9q2TrlTCyMXa/jP5wFZIGtNgMS
	WgY9NTJnibCoDwQQMpRY3u7o3U1lfF/f9mJb+p66lRMnAWJFIXeRpJ3fkxvcuGrdwQnmbK6DVyHlX
	JGuMgctXkEOP+dezvaKg/YRfGOipCPS4Cg/hsHVvYwhb3FIrcdceVCdF8wySvQzs4422pluxePWb8
	Mz4AzzvAUoTmQkBwHroqJgFXf6efxTVwdoBM+rH85+w9PKMssC0XwO5YxRxoBPSvVUJrOww/FYGWG
	LxzN89lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2qB-00000006ZM5-35pV;
	Thu, 06 Feb 2025 14:26:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2kW-00000006YIW-1sd8
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:21:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ab737e5674bso184826266b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851658; x=1739456458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjndcfyqjqX0suK3BJwJI5MpJWEUcpM/zhKh9Jt/IFw=;
        b=RYZv5uAtpg1E5NXqVAPNMC2+IA7QuOGZfGK/bltwdL36jlnZj8kn34VL76yyqhaWeI
         CNf8D/QFqBYxIOo9IkmdXPNHWwlMSXC3adp04/7KcGQh2kToEO5vr+8D2EDU5mk4cHo1
         L/vIKXP6q6d0di9qlkZUw9IRIYjJ7xb1yeJCcfVHne2Zacu59hx2/eTN5KrSuoKr+ycE
         UnxaFDPEOHjTdOK4g7YgqPti1zQog6LGx2tqQE5K20H9WwiAf8Lky9VKeRLggWfreo2I
         rO62OkjcpR7NbTz6k+DPqpFfoYpMc8dvLfHywvCbtqg4b9iGeMy9KMnpXq9AWr+GrG9C
         Gxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851658; x=1739456458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjndcfyqjqX0suK3BJwJI5MpJWEUcpM/zhKh9Jt/IFw=;
        b=hIeXihsBAqBrVYKe7Lz6yrLsqD2XMxgkBdQbDuM8y9owcmFmTDj/XA9FIFLZNXK00Z
         uf//kvBDkrh5kZYtqVsD0mMpbngfiB0Q+z+4foZWmq82zMv08VmEdr0REGcbgHlNhzZb
         1H3JFwK5lozl4UhtAggThHZEK3IAqrfpkPz6qJKLVrdcSrbjZJzSeOFHbB5UIbXRtUvk
         dhcxkj//dYG19nPipl0vvQ8jMeP1PDBRJIibZpXREPhxdHnzqlityBiHiVV38qVx5OuR
         AfLoMdd3xmC+U0TuSzJFDdx/LqTUYLVMU7g38GhXasNH+HJwUpd/lAjWmfB58j4dwJ8x
         zNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgT90Fsi9j/c83i3vCfHKEc84omuPn7vF5+zPEQt9c/SsuQQNaCeDhT4CUnMvmF8DUfmW0y6qs6EzJCpdBYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb4tYjpv/mgTmGePMENsut6+RvJ7F0sT2Whia3bM5pbpauaAvk
	ESUsH4AM4G/SSh6wb8J/zjApDG3SgRjYQDhyfde+qBvsRp00OAFBHWM0+e9i038=
X-Gm-Gg: ASbGnctjPpmsRxx+USDTgCe5W2cMIZGsQpRD6hD/x2qgr4X1ynZHkRl/J4wklzpbPQq
	/oGe2T2LKwU9unkX4uDNHrRBF3Qda4lICgQzeXyPYWcqsQyM/z5qVc7kskLsOZN/naERHXCK15q
	km8ol2z4NNU2NqrCvjJGU1hYnT26d1CH0njs1EcdWVPZlPekUHWAX27JUH89prRVwxaJWhfI5Gl
	u/iB4zVGdSPF6J4ujEewoG3dJa+0ZcqFbl51fcsOsXy0lxkBfCzaIRG25gO+2mR0M9vU0X3RiBa
	JIzD1dOwxJ6CI9TLxjJKaoEknYBwJ4tG7VA9+prSzUsQdkM=
X-Google-Smtp-Source: AGHT+IEtj41Y5GMmmjFUnay2iogZtTrhXfr7uhOofHHSDx3vmcnEYXA/d41IrDMa8vkMQ4WmCAfDEQ==
X-Received: by 2002:a17:907:7e8e:b0:ab7:4262:686b with SMTP id a640c23a62f3a-ab75e2f2a97mr822408166b.40.1738851657921;
        Thu, 06 Feb 2025 06:20:57 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ade9sm931494a12.25.2025.02.06.06.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:20:57 -0800 (PST)
Message-ID: <5de3c769-68b8-4f59-8a76-1b81d51040b1@blackwall.org>
Date: Thu, 6 Feb 2025 16:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 03/14] netfilter: bridge: Add conntrack double
 vlan and pppoe
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
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
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-4-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-4-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062100_487528_94AB5582 
X-CRM114-Status: GOOD (  19.06  )
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

On 2/4/25 21:49, Eric Woudstra wrote:
> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets that are passing a bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/netfilter/nf_conntrack_bridge.c | 81 ++++++++++++++++++----
>  1 file changed, 69 insertions(+), 12 deletions(-)
> 
> diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
> index 816bb0fde718..6411bfb53fad 100644
> --- a/net/bridge/netfilter/nf_conntrack_bridge.c
> +++ b/net/bridge/netfilter/nf_conntrack_bridge.c
> @@ -242,53 +242,110 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
>  {
>  	struct nf_hook_state bridge_state = *state;
>  	enum ip_conntrack_info ctinfo;
> +	int ret, offset = 0;
>  	struct nf_conn *ct;
> -	u32 len;
> -	int ret;
> +	__be16 outer_proto;
> +	u32 len, data_len;
>  
>  	ct = nf_ct_get(skb, &ctinfo);
>  	if ((ct && !nf_ct_is_template(ct)) ||
>  	    ctinfo == IP_CT_UNTRACKED)
>  		return NF_ACCEPT;
>  
> +	switch (skb->protocol) {
> +	case htons(ETH_P_PPP_SES): {
> +		struct ppp_hdr {
> +			struct pppoe_hdr hdr;
> +			__be16 proto;
> +		} *ph = (struct ppp_hdr *)(skb->data);
> +
> +		offset = PPPOE_SES_HLEN;
> +		if (!pskb_may_pull(skb, offset))
> +			return NF_ACCEPT;

You should reload ph because pskb_may_pull() may change the skb and it can
become invalid

> +		outer_proto = skb->protocol;
> +		switch (ph->proto) {
> +		case htons(PPP_IP):
> +			skb->protocol = htons(ETH_P_IP);
> +			break;
> +		case htons(PPP_IPV6):
> +			skb->protocol = htons(ETH_P_IPV6);
> +			break;
> +		default:
> +			nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
> +			return NF_ACCEPT;
> +		}
> +		data_len = ntohs(ph->hdr.length) - 2;
> +		skb_pull_rcsum(skb, offset);
> +		skb_reset_network_header(skb);
> +		break;
> +	}
> +	case htons(ETH_P_8021Q): {
> +		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
> +
> +		offset = VLAN_HLEN;
> +		if (!pskb_may_pull(skb, offset))
> +			return NF_ACCEPT;

ditto about vhdr, should be reloaded after the may pull

> +		outer_proto = skb->protocol;
> +		skb->protocol = vhdr->h_vlan_encapsulated_proto;
> +		data_len = U32_MAX;
> +		skb_pull_rcsum(skb, offset);
> +		skb_reset_network_header(skb);
> +		break;
> +	}
> +	default:
> +		data_len = U32_MAX;
> +		break;
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
>  
>  static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,


