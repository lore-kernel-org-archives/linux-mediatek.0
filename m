Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241BDCFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbvyoL9Luo/70/PTVBa7h557couwK2dRn3xz6x5mHho=; b=F8mnHG68VQaUJ4K2zRgbKvqdL0
	5/dQ45W1p6IUuEv6W62WZvl47WU+wuYj7j8svXFLbUF+Nzblf6TZ62Y2FjulmXqE5iOCgs28qNAPj
	hQR8tLTeRJ5+N/29vmIqnZ1kGGAIIHNUufgxccWynnjOBbIVVz8/AWmRyTevwpgz8PekksVv9QjLn
	BbxDYhvhp0yVHnBguJd8TFzDPuEtteaWzbrkrTg4hVrSFaCMcMAQEX+TPjxi7+jm0LOCJJcneSxW8
	GSvkwyj6NwRS+oPI3gpsPRfSi6A3DEZD99l8jb6BxROctiQk5DktxG1xWWcGBYjWOBJ6Oa9ky3QZi
	okMdEMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0F58-00000003yfd-0ZDx;
	Mon, 14 Oct 2024 07:01:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0F3e-00000003yK0-2dIt
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 07:00:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a99ebb390a5so273786966b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 23:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1728889197; x=1729493997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbvyoL9Luo/70/PTVBa7h557couwK2dRn3xz6x5mHho=;
        b=zLpDqKN8rGcbnYsJfBjpMoZb6hLDDDB7PhXA+kFcerN/siYqqn6aI1xXgn/9gpIzI6
         fpesFNn60Pve98nVXeRCXsNqIHAwaB4a2wYuO2SfXaF4AOPH59EdSqt8YrzMmN54bgph
         0tqkzXoyvq6hHmlV2RHJO3mv5UBJ2WM80iu9CE/zCst1cfFMfzeKznVtgjPgJ9E1Rgzb
         6tVreWjIMVoUm1VQMVbd8BYFouBSWqccaPm+FBIp5yCYVgLAmioNuJpBgb/9v2GCm/u4
         L8jnNh7puS63nzQB00/ltSAy6JeiBBs5+9cpbmT8f72zY1U0ffvbOBrpqtfjJ8eRx1To
         LdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889197; x=1729493997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbvyoL9Luo/70/PTVBa7h557couwK2dRn3xz6x5mHho=;
        b=n8hcs4YbSLohRrWh7dILRb3XFT+ciUyc0RNC/tfZTXayOnto00s6YLeMAKFKolFveR
         HBZaDoNjyALlhH5+PdPb5ZU+H8BbyBektVjRu0XsFrnA+slYilgAXeIIsOGFc9tGgJxh
         z32S71o0eeBvPWSsn0AioFbdam9Js9XEUN7oHhPHwDKKsoFw+hOyIg1nackwYhZN9XRl
         jZqTx/hvE8KRmNy1aKrIjduVKl/b86uoazghamyepA6zyid/UL5ymYZ/D2ZAAV9jlf79
         aR2IGm6skNEVLuThGUzv7Qy1wp8XzkAjQ0iYZFVDPYNsKEhv4xbZT71I29F2YRyGX0iv
         P1/A==
X-Forwarded-Encrypted: i=1; AJvYcCUUaToG1a/RWu0m25XMEAjaWdD+/9BzQM/C3Q5zxhMmFMgpOYHo/sDWYQv9wYDKC/3Te+MzcXDsUBwR0n6RRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysxMI7qgV8u1itDVWTP4hcDbk6BXHd+eARryq4BdvSt+bu6Dnv
	gMK2HIofg7sXubLwCGbeIazQRkUoYj8DxIFEy9gNNQ4p3G9d1/LgVPZCEYiouq4=
X-Google-Smtp-Source: AGHT+IGOUfK99ago/evOrlGj0pi4YFg7EEKNgJdbazY59vps+t6ylGtngYjJWYkKZ58+i22OdP1stg==
X-Received: by 2002:a17:906:eec7:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a99a0eb9349mr1327215166b.4.1728889196586;
        Sun, 13 Oct 2024 23:59:56 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a13f42e8bsm62471966b.58.2024.10.13.23.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:59:56 -0700 (PDT)
Message-ID: <c3678626-7f5c-4446-9b4d-2650ddf5d5a6@blackwall.org>
Date: Mon, 14 Oct 2024 09:59:54 +0300
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
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241013185509.4430-7-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_235958_682249_A21DA8E3 
X-CRM114-Status: GOOD (  20.69  )
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

On 13/10/2024 21:55, Eric Woudstra wrote:
> New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
> It handles starting from a bridge port instead of the bridge master.
> The structures ctx and nft_forward_info need to be already filled in with
> the (vlan) encaps.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/linux/netdevice.h |  2 +
>  net/core/dev.c            | 77 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 66 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index e87b5e488325..9d80f650345e 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -3069,6 +3069,8 @@ void dev_remove_offload(struct packet_offload *po);
>  
>  int dev_get_iflink(const struct net_device *dev);
>  int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
> +			 struct net_device_path_stack *stack);
>  int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
>  			  struct net_device_path_stack *stack);
>  struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
> diff --git a/net/core/dev.c b/net/core/dev.c
> index cd479f5f22f6..49959c4904fc 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -713,44 +713,95 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
>  	return &stack->path[k];
>  }
>  
> -int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
> -			  struct net_device_path_stack *stack)
> +static int dev_fill_forward_path_common(struct net_device_path_ctx *ctx,
> +					struct net_device_path_stack *stack)
>  {
>  	const struct net_device *last_dev;
> -	struct net_device_path_ctx ctx = {
> -		.dev	= dev,
> -	};
>  	struct net_device_path *path;
>  	int ret = 0;
>  
> -	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
> -	stack->num_paths = 0;
> -	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
> -		last_dev = ctx.dev;
> +	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
> +		last_dev = ctx->dev;
>  		path = dev_fwd_path(stack);
>  		if (!path)
>  			return -1;
>  
>  		memset(path, 0, sizeof(struct net_device_path));
> -		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
> +		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
>  		if (ret < 0)
>  			return -1;
>  
> -		if (WARN_ON_ONCE(last_dev == ctx.dev))
> +		if (WARN_ON_ONCE(last_dev == ctx->dev))
>  			return -1;
>  	}
>  
> -	if (!ctx.dev)
> +	if (!ctx->dev)
>  		return ret;
>  
>  	path = dev_fwd_path(stack);
>  	if (!path)
>  		return -1;
>  	path->type = DEV_PATH_ETHERNET;
> -	path->dev = ctx.dev;
> +	path->dev = ctx->dev;
> +
> +	return ret;
> +}
> +
> +int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
> +			 struct net_device_path_stack *stack)
> +{
> +	const struct net_device *last_dev, *br_dev;
> +	struct net_device_path *path;
> +	int ret = 0;
> +
> +	stack->num_paths = 0;
> +
> +	if (!ctx->dev || !netif_is_bridge_port(ctx->dev))
> +		return -1;
> +
> +	br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
> +	if (!br_dev || !br_dev->netdev_ops->ndo_fill_forward_path)
> +		return -1;
> +
> +	last_dev = ctx->dev;
> +	path = dev_fwd_path(stack);
> +	if (!path)
> +		return -1;
> +
> +	memset(path, 0, sizeof(struct net_device_path));
> +	ret = br_dev->netdev_ops->ndo_fill_forward_path(ctx, path);
> +	if (ret < 0)
> +		return -1;
> +
> +	if (!ctx->dev || WARN_ON_ONCE(last_dev == ctx->dev))
> +		return -1;
> +
> +	if (!netif_is_bridge_master(ctx->dev))

hmm, do we expect ctx->dev to be a bridge master? Looking at
br_fill_forward_path, it seems to be == fdb->dst->dev which
should be the target port

> +		return dev_fill_forward_path_common(ctx, stack);
> +
> +	path = dev_fwd_path(stack);
> +	if (!path)
> +		return -1;
> +	path->type = DEV_PATH_ETHERNET;
> +	path->dev = ctx->dev;
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(dev_fill_bridge_path);
> +
> +int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
> +			  struct net_device_path_stack *stack)
> +{
> +	struct net_device_path_ctx ctx = {
> +		.dev	= dev,
> +	};
> +
> +	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
> +
> +	stack->num_paths = 0;
> +
> +	return dev_fill_forward_path_common(&ctx, stack);
> +}
>  EXPORT_SYMBOL_GPL(dev_fill_forward_path);
>  
>  /**


