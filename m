Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBEDD2A52F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxA07k9oSO8dTce0PP8TNRQBmoWhoKL9GFOP9Oqykdw=; b=UoXZeLlgNGCpumEK6+XWB2dhl4
	pIZwWzwsPfH3TwzQzVkcOdY3xYAQQITeCmTwdp1BeAg0nKWWnBgsEaIuw2qjRG0LzL2PY4LQrRcXx
	ChmtNuscCzopNeUwTJO1vMyE5ml1uej9qkGVsj0vSMkqFK5mwSi6/MPMW5T+SBkN7kI9HIm6Ny+0y
	k7CCNgQCCCVkhF3eabT+gIA/RzQ04DjDh77LLlApIWzpcIwf3i5h8PKk2z+XZPQv8vYq4pA8itKFA
	3CIex6db+4+pI0w9kpcBQnnfzRbOc+GazvsKFvANmHQXkRB9JOtuP7DCX+2LQxnm7Hw2SFuhTtOW0
	OwGtgIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t16Wr-0000000CM6n-1hX6;
	Wed, 16 Oct 2024 16:05:41 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t16Ou-0000000CKf5-21pK;
	Wed, 16 Oct 2024 15:57:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539fe76e802so2694629e87.1;
        Wed, 16 Oct 2024 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729094246; x=1729699046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxA07k9oSO8dTce0PP8TNRQBmoWhoKL9GFOP9Oqykdw=;
        b=mn85wMOpVu5VFtKmB/iP9FKfRa3/2MgRqun+3SD2RZv7oQRdgp5BKJctTIINPGHYrS
         wf0M1aB/cLKD3Bn4k52S1cqLFobug4QcTz6WOt5/lUqmaLqQSbSd4NpkhM/yQYAvzIs5
         mxGzeg9dAZoYbX4x/MktOC0mEsHuk892LWXOZr668K3P1xpdzQ1vqToth/AWuCJdsZ1F
         mECfMyi/qpS9jyp/oOOJAfzg8sZJMrgYiqYuZlI32j4WZ2fSOHz1UcIzf0rSl/v/QuWd
         wRPMt7RyYwe4EXZDvvZ6+w+FAWXoMzHtWforcNFZCMhgkwm3x+2TDcEz78QohuXKzEnE
         auEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094246; x=1729699046;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxA07k9oSO8dTce0PP8TNRQBmoWhoKL9GFOP9Oqykdw=;
        b=CuqEf8PFc5FEf80cChaRp+x/k2aE9l3N8q/dGrT+8c4GHgpKJa5VPRzDrz7QvPkBeU
         acUrOIziii7VEwEwkO2AZb0FPouJSsQDfrsIdv3TrSjty+rzicS1gfzwWlbNCcEPdbh0
         iqO6pOIWdgbVdjCA8eU2NH6ukVwzDa969K9r3SLByfsuMSBDXVT+AiIKMS34qz4oZRg8
         wUt7su44HtLZKprYn94z3VQyNOpieggElFgSVYKebjNJeVqV4lpc7i2V+uy3psPq3ab6
         XG7DpfoM8706Q69zzbIpcL1PjGePBFZTC+fONkMC6xhwLiLgbxotNVaL2rBaRNIlPCSo
         lmTw==
X-Forwarded-Encrypted: i=1; AJvYcCVOt7B5RFM68w7tDukjM4HnbNQuckMnSs/tq5wNvq2TG6ZNh4MdUuE+fl+XLjNSUPCn6SzCejW0PTqwSBE5PJ9i@lists.infradead.org, AJvYcCVS1wN2kKcxE11uP2ZQHak7UNRqVjJzJVYM7ieghRg47c3O8b2GHi+dImoYjrJe4O0y+GfWGv4GgEqgMgUmxCM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWTeBSVrpKneKZwNClzeP2oKNrvxdPsMD+QsZY52hsBVbhsnCE
	r202bwcftKIEP+yRcHsnil3Pdc8SvXW9mc3T32ELlM/tJnRmPqPU
X-Google-Smtp-Source: AGHT+IEi/7qYhNCOFZfgn/p4Iqu9Z2zyKn6pf3/u84hhnrnCvkNEdqd/86Jf01yV6NLUAKDt1wtaMg==
X-Received: by 2002:a05:6512:e9d:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-539e54051famr8422705e87.0.1729094246042;
        Wed, 16 Oct 2024 08:57:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2988c56csm197630466b.209.2024.10.16.08.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 08:57:25 -0700 (PDT)
Message-ID: <77aba461-2d32-4c4d-8877-c16f656a0610@gmail.com>
Date: Wed, 16 Oct 2024 17:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 06/12] net: core: dev: Add
 dev_fill_bridge_path()
To: Nikolay Aleksandrov <razor@blackwall.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-7-ericwouds@gmail.com>
 <c3678626-7f5c-4446-9b4d-2650ddf5d5a6@blackwall.org>
 <a0db4efa-2328-4935-9eb6-3344fcbc4b07@gmail.com>
 <ea4de936-9a84-4910-960b-65c5cc2dfcdd@blackwall.org>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <ea4de936-9a84-4910-960b-65c5cc2dfcdd@blackwall.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_085728_561185_DD39012F 
X-CRM114-Status: GOOD (  21.71  )
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



On 10/16/24 9:43 AM, Nikolay Aleksandrov wrote:
> On 14/10/2024 21:34, Eric Woudstra wrote:
>>
>>
>> On 10/14/24 8:59 AM, Nikolay Aleksandrov wrote:
>>> On 13/10/2024 21:55, Eric Woudstra wrote:
>>>> New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
>>>> It handles starting from a bridge port instead of the bridge master.
>>>> The structures ctx and nft_forward_info need to be already filled in with
>>>> the (vlan) encaps.
>>>>
>>>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>>>> ---
>>>>  include/linux/netdevice.h |  2 +
>>>>  net/core/dev.c            | 77 ++++++++++++++++++++++++++++++++-------
>>>>  2 files changed, 66 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>>>> index e87b5e488325..9d80f650345e 100644
>>>> --- a/include/linux/netdevice.h
>>>> +++ b/include/linux/netdevice.h
>>>> @@ -3069,6 +3069,8 @@ void dev_remove_offload(struct packet_offload *po);
>>>>  
>>>>  int dev_get_iflink(const struct net_device *dev);
>>>>  int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
>>>> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
>>>> +			 struct net_device_path_stack *stack);
>>>>  int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>>>>  			  struct net_device_path_stack *stack);
>>>>  struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
>>>> diff --git a/net/core/dev.c b/net/core/dev.c
>>>> index cd479f5f22f6..49959c4904fc 100644
>>>> --- a/net/core/dev.c
>>>> +++ b/net/core/dev.c
>>>> @@ -713,44 +713,95 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
>>>>  	return &stack->path[k];
>>>>  }
>>>>  
>>>> -int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>>>> -			  struct net_device_path_stack *stack)
>>>> +static int dev_fill_forward_path_common(struct net_device_path_ctx *ctx,
>>>> +					struct net_device_path_stack *stack)
>>>>  {
>>>>  	const struct net_device *last_dev;
>>>> -	struct net_device_path_ctx ctx = {
>>>> -		.dev	= dev,
>>>> -	};
>>>>  	struct net_device_path *path;
>>>>  	int ret = 0;
>>>>  
>>>> -	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
>>>> -	stack->num_paths = 0;
>>>> -	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
>>>> -		last_dev = ctx.dev;
>>>> +	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
>>>> +		last_dev = ctx->dev;
>>>>  		path = dev_fwd_path(stack);
>>>>  		if (!path)
>>>>  			return -1;
>>>>  
>>>>  		memset(path, 0, sizeof(struct net_device_path));
>>>> -		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
>>>> +		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
>>>>  		if (ret < 0)
>>>>  			return -1;
>>>>  
>>>> -		if (WARN_ON_ONCE(last_dev == ctx.dev))
>>>> +		if (WARN_ON_ONCE(last_dev == ctx->dev))
>>>>  			return -1;
>>>>  	}
>>>>  
>>>> -	if (!ctx.dev)
>>>> +	if (!ctx->dev)
>>>>  		return ret;
>>>>  
>>>>  	path = dev_fwd_path(stack);
>>>>  	if (!path)
>>>>  		return -1;
>>>>  	path->type = DEV_PATH_ETHERNET;
>>>> -	path->dev = ctx.dev;
>>>> +	path->dev = ctx->dev;
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
>>>> +			 struct net_device_path_stack *stack)
>>>> +{
>>>> +	const struct net_device *last_dev, *br_dev;
>>>> +	struct net_device_path *path;
>>>> +	int ret = 0;
>>>> +
>>>> +	stack->num_paths = 0;
>>>> +
>>>> +	if (!ctx->dev || !netif_is_bridge_port(ctx->dev))
>>>> +		return -1;
>>>> +
>>>> +	br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
>>>> +	if (!br_dev || !br_dev->netdev_ops->ndo_fill_forward_path)
>>>> +		return -1;
>>>> +
>>>> +	last_dev = ctx->dev;
>>>> +	path = dev_fwd_path(stack);
>>>> +	if (!path)
>>>> +		return -1;
>>>> +
>>>> +	memset(path, 0, sizeof(struct net_device_path));
>>>> +	ret = br_dev->netdev_ops->ndo_fill_forward_path(ctx, path);
>>>> +	if (ret < 0)
>>>> +		return -1;
>>>> +
>>>> +	if (!ctx->dev || WARN_ON_ONCE(last_dev == ctx->dev))
>>>> +		return -1;
> 
> * ^^^^^^^^^ here
> 
>>>> +
>>>> +	if (!netif_is_bridge_master(ctx->dev))
>>>
>>> hmm, do we expect ctx->dev to be a bridge master? Looking at
>>> br_fill_forward_path, it seems to be == fdb->dst->dev which
>>> should be the target port
>>
>> It would indeed be very unlikely. It was a left-over from code I wrote,
>> thinking that here I could handle cascaded bridges (via vlan-device). I
>> dropped that, since conntrack does not follow this flow.
>>
>> So would it be better to only make sure that ctx->dev is not a bridge
>> master?
>>
>> 	if (netif_is_bridge_master(ctx->dev))
>> 		return -1;
>>
>> 	return dev_fill_forward_path_common(ctx, stack);
>>
> 
> I think you misunderstood me, I don't think ctx->dev can ever be a bridge
> device because ctx->dev gets set to fdb->dst and fdbs that point to the bridge
> itself have fdb->dst == NULL but ctx->dev is checked against NULL earlier*
> so the bridge dev check doesn't make sense to me.

I see, thanks. I'll drop the check in v2.

>>>> +		return dev_fill_forward_path_common(ctx, stack);
>>>> +
>>>> +	path = dev_fwd_path(stack);
>>>> +	if (!path)
>>>> +		return -1;
>>>> +	path->type = DEV_PATH_ETHERNET;
>>>> +	path->dev = ctx->dev;
>>>>  
>>>>  	return ret;
>>>>  }
>>>> +EXPORT_SYMBOL_GPL(dev_fill_bridge_path);
>>>> +
>>>> +int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>>>> +			  struct net_device_path_stack *stack)
>>>> +{
>>>> +	struct net_device_path_ctx ctx = {
>>>> +		.dev	= dev,
>>>> +	};
>>>> +
>>>> +	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
>>>> +
>>>> +	stack->num_paths = 0;
>>>> +
>>>> +	return dev_fill_forward_path_common(&ctx, stack);
>>>> +}
>>>>  EXPORT_SYMBOL_GPL(dev_fill_forward_path);
>>>>  
>>>>  /**
>>>
> 

