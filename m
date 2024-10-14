Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F35CF259D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/x9sCHASM4Rf3zEKoLCrNEGmjLCGHbguwi/XAkNj6o=; b=ii4DGItn9GJYwrcbJYurGvcL4h
	Ka/SiMbmacxqMLF5zKJo6i2i3keP1m+RiL+8l9NZCmRXe6vSr7BiP+43MKdSaIkAJcMfwKGWl6NO0
	0KyJMFp4ukweHmKu4wAoMmOpZVlrft6wtOJ/0+EVfWFWVsqMAGMk/e36sK3IbMMLi4Nd3OD57smy7
	Inu+9syx8yRRLyRdqDhb6jyw1dRhjNxHX+OoPv2KRQRI0T32S3TLziltiL96jZ9MtigxCklwWljNS
	jNqkAksuc1DQaM7ve5mSWl5ooRYJPByYijhfqdgwpL5BF6eOYjSkFusH4aUo+XJj0j4rDcJVRrbBO
	jNvhhxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Eis-00000003v75-0oQI;
	Mon, 14 Oct 2024 06:38:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EhR-00000003uu0-22Ut
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 06:37:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so891133a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 23:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1728887819; x=1729492619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/x9sCHASM4Rf3zEKoLCrNEGmjLCGHbguwi/XAkNj6o=;
        b=K2q+6sDgKM/JBfqFd/vC7aNDBGliGnmCKvxMObGa8qBocRvoSIE2cvLWP4N/IQOsgg
         Vv8lu2ZZXjGYb/CZY2UVBHNDsw3M5/mGwwjdo8Cc0CD0HkqvgVS08WSRxhu8AfhZw7tN
         tnXVTAC6BN55v1w8nLniMxDQkAB5tsdBb1pvH+WnQ7BEbGt8adBaM10Y/MJuZPP+rKKw
         FA1SlYMT6Z7TJ/AJAz5uqKIo/LD+I7pbUIntnnDGsSul7olcEm/c/Yx9/CtYItwBCro2
         ke+ZcXcCf1xmicQHLzAqNBCbnPXseCoK9DIG/8+iX0QGH/Lf20vM+f4JXpaGzktzBePJ
         +C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728887819; x=1729492619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/x9sCHASM4Rf3zEKoLCrNEGmjLCGHbguwi/XAkNj6o=;
        b=WvMJtCwxkc/cpCXP8GyaDtW4OoLzYcHLJNetD0/suOZuKBYHflclwqDiCNmB+XaG3y
         C0X5r36HJIkCTE1GPRtJz6K+8P3ksL+BD0Fno9kQ2k5JEOCfGDInhH/F/L7IuHM2g/i7
         3Fn77nSlqe1OqKB/8T9NM9DFETzJOSMM63KlNenwULxjyaKa5Mg+BAmocRmCaVuo1UbI
         0EWzquwYBS9SodL8OOo9lL5GdZLW+Uayc+UD2EPc9gGWaADjGAyIjPSln8rorMsI/8vc
         VinSquAiejo0XrBYQs5Csyu8MGzsPPvFZU0Toa6YSDoswWXTrxPCBRT5gWIexhrb8dvo
         tRUw==
X-Forwarded-Encrypted: i=1; AJvYcCX9d0XOTHNJlK9E5aGiuukwUWmiNdmtHEtzhOXy+FQDuxLEQ27GRNxvXNOeDJxvjMzFzSSKCUZ1kbDvSZmbtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp23XdOne2rL8oK9/qdP6yNyNDIbNT2Y7NTrPLPVTe5qln+7EJ
	7N/ZCnWpUKIKrzIeF2thihs47n+XqBZY0fJfRYRU8HUJopScIPt8wDGEQtJ5TwQ=
X-Google-Smtp-Source: AGHT+IHOmz4mXDYoNl9wKMY13pPq7T3XsGapXwSYgN3NOm+dxPajvUmbY2eZ6VnNrvCAhA5bOXjuSw==
X-Received: by 2002:a17:907:ea2:b0:a9a:33c:f6e1 with SMTP id a640c23a62f3a-a9a033cf8b4mr405516566b.5.1728887819334;
        Sun, 13 Oct 2024 23:36:59 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99fcb57647sm206072266b.129.2024.10.13.23.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:36:58 -0700 (PDT)
Message-ID: <6c0154a9-b21d-4f1d-af74-19690dad68a6@blackwall.org>
Date: Mon, 14 Oct 2024 09:36:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 04/12] bridge:
 br_vlan_fill_forward_path_pvid: Add port to port
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
 <20241013185509.4430-5-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241013185509.4430-5-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_233701_654438_1A7A8D33 
X-CRM114-Status: GOOD (  15.79  )
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
> Lookup vlan group from bridge port, if it is passed as argument.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/br_private.h | 1 +
>  net/bridge/br_vlan.c    | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
> index d4bedc87b1d8..8da7798f9368 100644
> --- a/net/bridge/br_private.h
> +++ b/net/bridge/br_private.h
> @@ -1581,6 +1581,7 @@ bool br_vlan_can_enter_range(const struct net_bridge_vlan *v_curr,
>  			     const struct net_bridge_vlan *range_end);
>  
>  void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
> +				    struct net_bridge_port *p,
>  				    struct net_device_path_ctx *ctx,
>  				    struct net_device_path *path);
>  int br_vlan_fill_forward_path_mode(struct net_bridge *br,

You haven't updated the !CONFIG_BRIDGE_VLAN_FILTERING version of this helper.

> diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
> index 9c2fffb827ab..1830d7d617cd 100644
> --- a/net/bridge/br_vlan.c
> +++ b/net/bridge/br_vlan.c
> @@ -1441,6 +1441,7 @@ int br_vlan_get_pvid_rcu(const struct net_device *dev, u16 *p_pvid)
>  EXPORT_SYMBOL_GPL(br_vlan_get_pvid_rcu);
>  
>  void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
> +				    struct net_bridge_port *p,
>  				    struct net_device_path_ctx *ctx,
>  				    struct net_device_path *path)
>  {
> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>  		return;
>  
> -	vg = br_vlan_group(br);
> +	if (p)
> +		vg = nbp_vlan_group(p);
> +	else
> +		vg = br_vlan_group(br);
>  
>  	if (idx >= 0 &&
>  	    ctx->vlan[idx].proto == br->vlan_proto) {


