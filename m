Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E803CCF2590
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJyb8Bc81miKQbLjUTUq/NpdzgBcv4rRrfPYMdCJ8WE=; b=3our0mfkwrGe313Hk6rVmQBTOE
	PMV+Vn2PZSf5TLvYEeVMCJx500Vl0Ng37J2pz/cFQNC3XkZQMgepFq/KImcUnzKlvd1yU2XYH2egr
	7s85ktwFM3uB9ru4gDDzKD6ticc1Ou/hB6Yj93+nYBs93fp8vl99wsrl6/yVoB+NEPCMfAyKnpJKG
	/t4gZTZqpUFxmlwX/kJHk3cdfvH/vGJuO5Gk2fTPypzcBTfAlWjr1xZntT8oPN6DJq0K0XDY0AUNc
	AFV5jX7kh50r6BCtNBkZle/Brml0L8DueMXV2ENhkaGnjAe196iQyhDuRRgC8iuFi5euNcGNvfBmM
	HbaP10fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Ed5-00000003u3y-2Nqa;
	Mon, 14 Oct 2024 06:32:31 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Eau-00000003tf8-2aMn
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 06:30:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso3835909a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 23:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1728887414; x=1729492214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJyb8Bc81miKQbLjUTUq/NpdzgBcv4rRrfPYMdCJ8WE=;
        b=oEZdF11X+ZTkFZLFc496FYMukTax99lpwxHcAjrpPNdZzk1T+bzvEgwWtiAiEMw95V
         OUkDfzuqDEmcrQMfelfr25oIp9Jd4aC2TYXAoZ5HOCG3Kb0V9TlR4xO1jV0Gc+Cx/Gk0
         Pmx1drX/jA9fPRAOfuiaYPYcYF5CE1ti3KvTGqjmOPZyY5LiRN7Gt0F915B3vbi0vMZS
         7kLx4w3M+nrdpFGurYkuuHKzLT9SfFUTzMUyGSrB3sqXMZs3ZlMobNIberzOOAvXNtqq
         JLv0GhzgxD9uuz1fhePILPm5wcuTEU+e/hM1ZZVAQvuCb/Ehab/wgp0ctrkdXj91eE9E
         Fuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728887414; x=1729492214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJyb8Bc81miKQbLjUTUq/NpdzgBcv4rRrfPYMdCJ8WE=;
        b=OrduLqN0giEi0qKcCDL0Y7lCyZUf5zbv0Loi06rcDPB6+AHFQiRrASVpA6SLWePch6
         1PSfoJBBpdwSzHEnQm80ABRWXj0TmizV3jTyRHtALsrp3JDKrMla2MNhducvMGrwbdeS
         vkI6Fr+C0aRs5QD5UVUegWcO3z5IbqAJr9AkqTWZQrKMTTN5/H84EoJU4qerGhbZXOIZ
         NobpWRLYRRoJ1CozSWJBEUVmTMoyZw88CCuzduCx187p4UwSZu92uZLV8aYpLrS2xZV5
         QSzzWK2A3uOcH7ZhO+pglkIUZLlMdVeh8lP85NfNCGJwk3s1ayw86rKENYHJWRxwkQL2
         SC/A==
X-Forwarded-Encrypted: i=1; AJvYcCVEldeUwXgzmlWEOq0mgKurZxFMdv3p87OWBRM2mZZR+ALlmZJ7IEgIiUkHcjRN4YOImU4zzINnBONZ2XMwzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0G3eNZzX56OtAC0lrBg9Vtfi825uvAPi4i6m4r7TcFxM967hd
	bmTGLiAkY1sxjId5/Cch68nLBsAxB2e89xfB+Ix713JpPtwo+sYh5LwycwkC3EU=
X-Google-Smtp-Source: AGHT+IFIRcBU0W5yzI+xWDzvWEmzUxkcMqg4gm1s6fiPZ1qxh06hlXKcpE9+hLiy8wzVE/ywprsQkw==
X-Received: by 2002:a05:6402:4409:b0:5c9:85ce:d9e3 with SMTP id 4fb4d7f45d1cf-5c985cedd76mr14840a12.16.1728887414349;
        Sun, 13 Oct 2024 23:30:14 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711bdbasm4517929a12.38.2024.10.13.23.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:30:13 -0700 (PDT)
Message-ID: <524ff98e-a7d2-4228-b1cf-4465b6ac1ce8@blackwall.org>
Date: Mon, 14 Oct 2024 09:30:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 05/12] bridge: br_fill_forward_path add
 port to port
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
 <20241013185509.4430-6-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241013185509.4430-6-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_233016_721117_5877ABB0 
X-CRM114-Status: GOOD (  15.88  )
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
> If handed a bridge port, use the bridge master to fill the forward path.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/br_device.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
> index 26b79feb385d..e242e091b4a6 100644
> --- a/net/bridge/br_device.c
> +++ b/net/bridge/br_device.c
> @@ -384,15 +384,25 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
>  				struct net_device_path *path)
>  {
>  	struct net_bridge_fdb_entry *f;
> -	struct net_bridge_port *dst;
> +	struct net_bridge_port *src, *dst;
> +	struct net_device *br_dev;

reverse xmas tree order

>  	struct net_bridge *br;
>  
> -	if (netif_is_bridge_port(ctx->dev))
> -		return -1;
> +	if (netif_is_bridge_port(ctx->dev)) {
> +		br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
> +		if (!br_dev)
> +			return -1;
> +
> +		br = netdev_priv(br_dev);
>  
> -	br = netdev_priv(ctx->dev);
> +		src = br_port_get_rcu(ctx->dev);
>  
> -	br_vlan_fill_forward_path_pvid(br, ctx, path);
> +		br_vlan_fill_forward_path_pvid(br, src, ctx, path);
> +	} else {
> +		br = netdev_priv(ctx->dev);
> +
> +		br_vlan_fill_forward_path_pvid(br, NULL, ctx, path);
> +	}
>  
>  	f = br_fdb_find_rcu(br, ctx->daddr, path->bridge.vlan_id);
>  	if (!f)


