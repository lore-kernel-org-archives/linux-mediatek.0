Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A4BD1813B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlOnxyLsKzjPmX7mgEUAeOELC286PF6R2i4tL7ZkhEQ=; b=jdIZrnJCcIkOq/Q2DSVOj7GyBz
	9E/ybHt/w3F/1in5CNbbnbcy/HUKwF6vymbF2P0eESb07CQSVOapcH/45+MfIr7tSDm/5OzzEQ/PV
	cw+TSWMv/6/4hYBnI8IwjW/PWYWLKk07o/MTAkvKZx4MXlBXrSduLrw8l3uvawBm8ZhhN7QclYGbC
	qWBFMgcqWnF2wjKwT72pQ+S1GPQopsxzkqZTUQ9eQ7wSc/wcPpzaa1fxjZuzAUSDymSlJbPtbJZeH
	scMj3tYAaSx1H67boKmMemlsRbg6CIoCOWi4BjfGQHWNWmtQRogJuC8jot/WrwAaVX0HyzGZYRn6h
	oqFl7zzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Put-00000006CAY-19Sf;
	Mon, 14 Oct 2024 18:35:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PtS-00000006Bvf-2Z5h;
	Mon, 14 Oct 2024 18:34:12 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a994cd82a3bso686271366b.2;
        Mon, 14 Oct 2024 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728930849; x=1729535649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlOnxyLsKzjPmX7mgEUAeOELC286PF6R2i4tL7ZkhEQ=;
        b=jYl9MUZTauQkwOaTh75oDSs1GDn/mpm6/pUZSAOUKkRulGdtkTTGqoxzl/L4ZZwbxK
         +vifXLOXjBqccYNdiFbMf5gX89uj1a9z2xClA7pHqgdx/zzloxxYAk8NtOYl6ol01EAb
         AD3sc93//OozMo7nlW/743nJ03vubRkURaVMRS/EnbuNHCZue5ZwB2QoqMUn6KMWCgdZ
         HdqSA6mwuCAHJBK2wvCfP1KPDsOSPh2LedEfC/rrrk1NgJxIBiq59n4sFVoDbOvhDaix
         pm0+ElXQSkcwkbyiLKO/iLq1VGYBY7CFSV/GajXhlBeb9oxNPHrqcHNzsqVtCmq3xSwG
         y5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728930849; x=1729535649;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlOnxyLsKzjPmX7mgEUAeOELC286PF6R2i4tL7ZkhEQ=;
        b=BuD1FOk8lfFAMlK6xg5C2tHS18aTL9KpuEC3ygtlQcHEFRFvSPGUtmLae2uFymDWi/
         20u19pSvDYLRDngjrM8kH6BV+36bnpElAhXgmMTdnxaiSx6OXU4FKxiz8bpoYdcRb00H
         cbq/QxfTVgiqzKu+A8j2xKDQVZpA66pj4uFCXHRUSQSCAfVt3g2ZitRkQMUlYRQezLib
         Q7J6xgn2Nzbr1zi/GB5Yal7xwOXgFDY4Riy/DmH7arHL8Sr0pNcsaT9R+VlnxdMRq+2R
         iOLsIkqRzYn74Uyp6re9VBiJyjKiMJnvOvS//T3CpJfsxl6i2Zq0vDGwgC36dc407yCI
         3Buw==
X-Forwarded-Encrypted: i=1; AJvYcCUo6wPc01RxY0i+gMpc1kg+gol1JH8QyqUDAOyUObf65VQ1aqQ8zpqKVCUb7EyGZy/ojcwBntjA0GzoX+J2B9A=@lists.infradead.org, AJvYcCX70+N/JPhQi/SS0qp/0t0xyy32rdsc01shlAzkVqrB3+DhRUOmrRQouf08qHHyzSgyNyBFlaPAX9ffPB1G1SmB@lists.infradead.org
X-Gm-Message-State: AOJu0YyeDjKSBlYnDkbdT/+rVkMdphjlqDWV9h9kWpbvNkPTy2tkq47L
	wjHFxF1jQ8/3jpdp2RhabxTVGnqgR9Zm7712Y8yP+Y4Q0wEzFfyk
X-Google-Smtp-Source: AGHT+IHKZO+fC56r4LaVpTKQzX/+/pa5l07qojFohlY7OCNXpmf0sPt3hbXHuNvHiBIPoGLRAmVB1g==
X-Received: by 2002:a17:907:97cd:b0:a99:dfb3:dcb4 with SMTP id a640c23a62f3a-a99dfb3df63mr790057066b.39.1728930848857;
        Mon, 14 Oct 2024 11:34:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a04223e3csm261266766b.52.2024.10.14.11.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 11:34:08 -0700 (PDT)
Message-ID: <a0db4efa-2328-4935-9eb6-3344fcbc4b07@gmail.com>
Date: Mon, 14 Oct 2024 20:34:07 +0200
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
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <c3678626-7f5c-4446-9b4d-2650ddf5d5a6@blackwall.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_113410_941585_9567FB43 
X-CRM114-Status: GOOD (  20.54  )
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



On 10/14/24 8:59 AM, Nikolay Aleksandrov wrote:
> On 13/10/2024 21:55, Eric Woudstra wrote:
>> New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
>> It handles starting from a bridge port instead of the bridge master.
>> The structures ctx and nft_forward_info need to be already filled in with
>> the (vlan) encaps.
>>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>> ---
>>  include/linux/netdevice.h |  2 +
>>  net/core/dev.c            | 77 ++++++++++++++++++++++++++++++++-------
>>  2 files changed, 66 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>> index e87b5e488325..9d80f650345e 100644
>> --- a/include/linux/netdevice.h
>> +++ b/include/linux/netdevice.h
>> @@ -3069,6 +3069,8 @@ void dev_remove_offload(struct packet_offload *po);
>>  
>>  int dev_get_iflink(const struct net_device *dev);
>>  int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
>> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
>> +			 struct net_device_path_stack *stack);
>>  int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>>  			  struct net_device_path_stack *stack);
>>  struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
>> diff --git a/net/core/dev.c b/net/core/dev.c
>> index cd479f5f22f6..49959c4904fc 100644
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -713,44 +713,95 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
>>  	return &stack->path[k];
>>  }
>>  
>> -int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>> -			  struct net_device_path_stack *stack)
>> +static int dev_fill_forward_path_common(struct net_device_path_ctx *ctx,
>> +					struct net_device_path_stack *stack)
>>  {
>>  	const struct net_device *last_dev;
>> -	struct net_device_path_ctx ctx = {
>> -		.dev	= dev,
>> -	};
>>  	struct net_device_path *path;
>>  	int ret = 0;
>>  
>> -	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
>> -	stack->num_paths = 0;
>> -	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
>> -		last_dev = ctx.dev;
>> +	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
>> +		last_dev = ctx->dev;
>>  		path = dev_fwd_path(stack);
>>  		if (!path)
>>  			return -1;
>>  
>>  		memset(path, 0, sizeof(struct net_device_path));
>> -		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
>> +		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
>>  		if (ret < 0)
>>  			return -1;
>>  
>> -		if (WARN_ON_ONCE(last_dev == ctx.dev))
>> +		if (WARN_ON_ONCE(last_dev == ctx->dev))
>>  			return -1;
>>  	}
>>  
>> -	if (!ctx.dev)
>> +	if (!ctx->dev)
>>  		return ret;
>>  
>>  	path = dev_fwd_path(stack);
>>  	if (!path)
>>  		return -1;
>>  	path->type = DEV_PATH_ETHERNET;
>> -	path->dev = ctx.dev;
>> +	path->dev = ctx->dev;
>> +
>> +	return ret;
>> +}
>> +
>> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
>> +			 struct net_device_path_stack *stack)
>> +{
>> +	const struct net_device *last_dev, *br_dev;
>> +	struct net_device_path *path;
>> +	int ret = 0;
>> +
>> +	stack->num_paths = 0;
>> +
>> +	if (!ctx->dev || !netif_is_bridge_port(ctx->dev))
>> +		return -1;
>> +
>> +	br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
>> +	if (!br_dev || !br_dev->netdev_ops->ndo_fill_forward_path)
>> +		return -1;
>> +
>> +	last_dev = ctx->dev;
>> +	path = dev_fwd_path(stack);
>> +	if (!path)
>> +		return -1;
>> +
>> +	memset(path, 0, sizeof(struct net_device_path));
>> +	ret = br_dev->netdev_ops->ndo_fill_forward_path(ctx, path);
>> +	if (ret < 0)
>> +		return -1;
>> +
>> +	if (!ctx->dev || WARN_ON_ONCE(last_dev == ctx->dev))
>> +		return -1;
>> +
>> +	if (!netif_is_bridge_master(ctx->dev))
> 
> hmm, do we expect ctx->dev to be a bridge master? Looking at
> br_fill_forward_path, it seems to be == fdb->dst->dev which
> should be the target port

It would indeed be very unlikely. It was a left-over from code I wrote,
thinking that here I could handle cascaded bridges (via vlan-device). I
dropped that, since conntrack does not follow this flow.

So would it be better to only make sure that ctx->dev is not a bridge
master?

	if (netif_is_bridge_master(ctx->dev))
		return -1;

	return dev_fill_forward_path_common(ctx, stack);

>> +		return dev_fill_forward_path_common(ctx, stack);
>> +
>> +	path = dev_fwd_path(stack);
>> +	if (!path)
>> +		return -1;
>> +	path->type = DEV_PATH_ETHERNET;
>> +	path->dev = ctx->dev;
>>  
>>  	return ret;
>>  }
>> +EXPORT_SYMBOL_GPL(dev_fill_bridge_path);
>> +
>> +int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>> +			  struct net_device_path_stack *stack)
>> +{
>> +	struct net_device_path_ctx ctx = {
>> +		.dev	= dev,
>> +	};
>> +
>> +	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
>> +
>> +	stack->num_paths = 0;
>> +
>> +	return dev_fill_forward_path_common(&ctx, stack);
>> +}
>>  EXPORT_SYMBOL_GPL(dev_fill_forward_path);
>>  
>>  /**
> 

