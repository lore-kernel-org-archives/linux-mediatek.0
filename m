Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDBAD206AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 07:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOMYLzkxXlztr2X9JVmFvqxwZU+iOw3BliPLuajBLvI=; b=FnC6AZHqkmzDDhXzgfd8QNo6re
	8YCLeV+CcHpOXEJCdOH+5H1pc56Wol9d9DnJ7JeX9XY1b0DV6yMemn13vS0mqnaDda3PoHIcFaCGi
	jD3jSwxBoElMI8BZS9krTHJeXPZc3I7DxdsYZfZb4+3IEF5VAzqcmEbiceDi1mbK4zB+SAFfcBVJw
	zPjdNSZv9XpA7j2MkwEQ/1mART5mgsH7W1WofSRaDVU5t1kE/ClOPXo4O10kZfNyVzLCZ2ynqYdf1
	R1YtjUWzmSw0r+AjF1WQDsOU1Vx2EDokFHokKM6SutaIDNRCaRH4gibqdkszUSUrDif7aSo1ldCEY
	xYQ0kVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ykt-0000000AsmI-3Zvv;
	Wed, 16 Oct 2024 07:47:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yh6-0000000As44-3hVh
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 07:43:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so1070725a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1729064623; x=1729669423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOMYLzkxXlztr2X9JVmFvqxwZU+iOw3BliPLuajBLvI=;
        b=Pd7wuIWWTiKMGuTC2g08GjrfAcgl0+Uhhs8o/Miw1ULwwD9tXB29HaAHXcf3UBhXSC
         b3hnBx8hvJco61u10+9jcvEp+LBaEE1ufLiCOTg9oP8mLVav3IRjMtsaIvI+YR+hYsaM
         /Bt2G8NDoHpbrXWt2OSsL2xdbkoBCYoN7WPu7ZEZ5fNG0UR9pgLn/7SLJtWdsXh1VAm4
         hI3Gc/woSxTaktihvSBueMi0wQwnqCjPsJxZ5k/626ZcqUxP5GJ+T0ckANlDP4IhuT8a
         eaeb+/6zR0QYciExAMLHCKZ/9+0Xi3P1FdxhdRfxOR4mtXwMoYLD8ta7pT2efOVa0a6L
         PjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064623; x=1729669423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOMYLzkxXlztr2X9JVmFvqxwZU+iOw3BliPLuajBLvI=;
        b=pFdZOKL5tH391Hy9eyFf/iox/D5CW59alEI246kmi19bQIvHe/6TtZE4a0F63vKq+G
         xSx3Fj/+4cUPL2+FVcrVMwSl2yHkSC52ON3ZlKEVipqwNXet9CRxbBxxiM2x60VrrpQX
         y7Xi1AJwQa8fuRbPpIBaU40SpEbMoiqRmY1lkRLmL/lMS7HSrBaxHy37ldDo0+l0CIn9
         82aG+TWqjIhTXDJTiTwIjXhcWv46XfVidng8bbSJvtHYTy0q1IJkSjQSQ2B6C6aFvJSn
         q6YeCvOHZ9oLQokDrG/TXyOfUOzARJiHhw4iDJf4gR6fZcJ6xbV283FE+9mf12BFW+f5
         iCTg==
X-Forwarded-Encrypted: i=1; AJvYcCW8LfSk/DdfcUPYhshiDAAroapT8vgi0Yz5qVQtHQ3dC3RIPWbPIyb55/tQfDm6AvTRtfZU07zyEw7pOxoQvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIplL62WOatKDG9gsWECHg5/TmT40gaWKKWa5G/Whsqthzjiaq
	4ouhAOnoNYgDyloYhF2NwCB5ecQVPc/b2C9k0h8RIaJK38bv2uoZPBeD+1NV9c8=
X-Google-Smtp-Source: AGHT+IHtkc3sEYisRvH1Z62l5rcBJzJB6v43M6C+fulzoVqkC6uCMW4XNujhBsdtaO8gPsiHnusJdA==
X-Received: by 2002:a17:907:9706:b0:a99:facf:cfc with SMTP id a640c23a62f3a-a99facf0e10mr1044501566b.17.1729064622648;
        Wed, 16 Oct 2024 00:43:42 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2973fba2sm149241266b.47.2024.10.16.00.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 00:43:42 -0700 (PDT)
Message-ID: <ea4de936-9a84-4910-960b-65c5cc2dfcdd@blackwall.org>
Date: Wed, 16 Oct 2024 10:43:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 06/12] net: core: dev: Add
 dev_fill_bridge_path()
To: Eric Woudstra <ericwouds@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <a0db4efa-2328-4935-9eb6-3344fcbc4b07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_004344_965235_1C4AF569 
X-CRM114-Status: GOOD (  22.57  )
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

On 14/10/2024 21:34, Eric Woudstra wrote:
> 
> 
> On 10/14/24 8:59 AM, Nikolay Aleksandrov wrote:
>> On 13/10/2024 21:55, Eric Woudstra wrote:
>>> New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
>>> It handles starting from a bridge port instead of the bridge master.
>>> The structures ctx and nft_forward_info need to be already filled in with
>>> the (vlan) encaps.
>>>
>>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>>> ---
>>>  include/linux/netdevice.h |  2 +
>>>  net/core/dev.c            | 77 ++++++++++++++++++++++++++++++++-------
>>>  2 files changed, 66 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>>> index e87b5e488325..9d80f650345e 100644
>>> --- a/include/linux/netdevice.h
>>> +++ b/include/linux/netdevice.h
>>> @@ -3069,6 +3069,8 @@ void dev_remove_offload(struct packet_offload *po);
>>>  
>>>  int dev_get_iflink(const struct net_device *dev);
>>>  int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
>>> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
>>> +			 struct net_device_path_stack *stack);
>>>  int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>>>  			  struct net_device_path_stack *stack);
>>>  struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
>>> diff --git a/net/core/dev.c b/net/core/dev.c
>>> index cd479f5f22f6..49959c4904fc 100644
>>> --- a/net/core/dev.c
>>> +++ b/net/core/dev.c
>>> @@ -713,44 +713,95 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
>>>  	return &stack->path[k];
>>>  }
>>>  
>>> -int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>>> -			  struct net_device_path_stack *stack)
>>> +static int dev_fill_forward_path_common(struct net_device_path_ctx *ctx,
>>> +					struct net_device_path_stack *stack)
>>>  {
>>>  	const struct net_device *last_dev;
>>> -	struct net_device_path_ctx ctx = {
>>> -		.dev	= dev,
>>> -	};
>>>  	struct net_device_path *path;
>>>  	int ret = 0;
>>>  
>>> -	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
>>> -	stack->num_paths = 0;
>>> -	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
>>> -		last_dev = ctx.dev;
>>> +	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
>>> +		last_dev = ctx->dev;
>>>  		path = dev_fwd_path(stack);
>>>  		if (!path)
>>>  			return -1;
>>>  
>>>  		memset(path, 0, sizeof(struct net_device_path));
>>> -		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
>>> +		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
>>>  		if (ret < 0)
>>>  			return -1;
>>>  
>>> -		if (WARN_ON_ONCE(last_dev == ctx.dev))
>>> +		if (WARN_ON_ONCE(last_dev == ctx->dev))
>>>  			return -1;
>>>  	}
>>>  
>>> -	if (!ctx.dev)
>>> +	if (!ctx->dev)
>>>  		return ret;
>>>  
>>>  	path = dev_fwd_path(stack);
>>>  	if (!path)
>>>  		return -1;
>>>  	path->type = DEV_PATH_ETHERNET;
>>> -	path->dev = ctx.dev;
>>> +	path->dev = ctx->dev;
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
>>> +			 struct net_device_path_stack *stack)
>>> +{
>>> +	const struct net_device *last_dev, *br_dev;
>>> +	struct net_device_path *path;
>>> +	int ret = 0;
>>> +
>>> +	stack->num_paths = 0;
>>> +
>>> +	if (!ctx->dev || !netif_is_bridge_port(ctx->dev))
>>> +		return -1;
>>> +
>>> +	br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
>>> +	if (!br_dev || !br_dev->netdev_ops->ndo_fill_forward_path)
>>> +		return -1;
>>> +
>>> +	last_dev = ctx->dev;
>>> +	path = dev_fwd_path(stack);
>>> +	if (!path)
>>> +		return -1;
>>> +
>>> +	memset(path, 0, sizeof(struct net_device_path));
>>> +	ret = br_dev->netdev_ops->ndo_fill_forward_path(ctx, path);
>>> +	if (ret < 0)
>>> +		return -1;
>>> +
>>> +	if (!ctx->dev || WARN_ON_ONCE(last_dev == ctx->dev))
>>> +		return -1;

* ^^^^^^^^^ here

>>> +
>>> +	if (!netif_is_bridge_master(ctx->dev))
>>
>> hmm, do we expect ctx->dev to be a bridge master? Looking at
>> br_fill_forward_path, it seems to be == fdb->dst->dev which
>> should be the target port
> 
> It would indeed be very unlikely. It was a left-over from code I wrote,
> thinking that here I could handle cascaded bridges (via vlan-device). I
> dropped that, since conntrack does not follow this flow.
> 
> So would it be better to only make sure that ctx->dev is not a bridge
> master?
> 
> 	if (netif_is_bridge_master(ctx->dev))
> 		return -1;
> 
> 	return dev_fill_forward_path_common(ctx, stack);
> 

I think you misunderstood me, I don't think ctx->dev can ever be a bridge
device because ctx->dev gets set to fdb->dst and fdbs that point to the bridge
itself have fdb->dst == NULL but ctx->dev is checked against NULL earlier*
so the bridge dev check doesn't make sense to me.

>>> +		return dev_fill_forward_path_common(ctx, stack);
>>> +
>>> +	path = dev_fwd_path(stack);
>>> +	if (!path)
>>> +		return -1;
>>> +	path->type = DEV_PATH_ETHERNET;
>>> +	path->dev = ctx->dev;
>>>  
>>>  	return ret;
>>>  }
>>> +EXPORT_SYMBOL_GPL(dev_fill_bridge_path);
>>> +
>>> +int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>>> +			  struct net_device_path_stack *stack)
>>> +{
>>> +	struct net_device_path_ctx ctx = {
>>> +		.dev	= dev,
>>> +	};
>>> +
>>> +	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
>>> +
>>> +	stack->num_paths = 0;
>>> +
>>> +	return dev_fill_forward_path_common(&ctx, stack);
>>> +}
>>>  EXPORT_SYMBOL_GPL(dev_fill_forward_path);
>>>  
>>>  /**
>>


