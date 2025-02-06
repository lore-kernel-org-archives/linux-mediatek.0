Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D692C02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uw/h4QDTlZnL53fcJ2QvA+6Beq+Nqrk3rFi+DoZZ9Nk=; b=prsamKmSTRAA3o6bmmyJO21pJx
	1RuIRDDLN6v0Dep/BOqnq7L7HNCv+1rYNrJLmxalDByBdpgWfX7GVsPK51l7/dyU1XZczDx7MiPsk
	ZgkOHwELc9FK7grHZ9pL5pJPZW8ct6wZs2xKWBtRjnvaXarKPO2mc03b3aDZqzopPgucGMrY6kKjr
	YmvhUS1apO/4AMaVQJENvjhl6jLSZaE6s5JGEA2yY/c4NuysqO4hkmuEEMF5I+64J3sW3OhYlrfKV
	E6b5gWD+f3pKS26wQGwVo5HAK+lT4BuUPYtUHHdT75hHxPAARD57JKDyVIC+ezYRiosJ7jml5e4oX
	UIybQYHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg39O-00000006dS9-1Tb3;
	Thu, 06 Feb 2025 14:46:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg31b-00000006cAA-3R8E
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:38:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dce4a5d8a0so1696363a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852718; x=1739457518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uw/h4QDTlZnL53fcJ2QvA+6Beq+Nqrk3rFi+DoZZ9Nk=;
        b=YwQENesNEFrsF9yRTG5byUGuA6lTVKSdBgY4x23nVy4hdGWaJWNgDAhq8M/udIFJzo
         Jsoiy5plnOlWv6kGguu14YmaA1CgDyjMTjs+V2TpGhugTCfVrQa2X3XC2KZz0mXVZ94Z
         Pqnwh1BY2ECgGajkyZOBrg7ChM7zCwS7SpJJZmkxvm8tWh8Ru44lZX4Ug9gMB+iuw3GQ
         h9RhJCd3onxw1kgvJgQoqBOeVsR61yHHk9H9ndiZ1Abx2VD+dyjWjgDzyhd5IUp9Lv3l
         yeKqyDmfGuX8b44w+NX02KcGDVRuPvnJS4qDg6SyhEaE2RsyUsUkrATXfIsHwFAHvUBo
         2/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852718; x=1739457518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw/h4QDTlZnL53fcJ2QvA+6Beq+Nqrk3rFi+DoZZ9Nk=;
        b=gqPihTiaw0N/DwmXorYd/AZl8yx7AZ4GTRiN+SWP2dXQ8C5iGgjPY7dxwC/YXlFJmc
         QuRyL89KJuziI7x/rYVvdc3z1/BVMZoICV/SSqRDrTeROhYiNGpZUejxOQwdTeLPSsNy
         UfxDdpyP1giJ/9pDQirTja1EQINFMWNDdDNqXoaYVwxVrQifpNDeKGdGO7f5creyT8Em
         +qaSUyDexxCNGj5LtYt2Tt4oYkeS14MyH8rAn6Zhwn2hPz96uw8x4d21nYsxTSjpmn3m
         TWNkZHlzGqy4CjzY6q22BhVKCQhduKVc3KTS8ZAXJ9DqZc/cS6uSHA9TeBBAiHS8BSFa
         myxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq76wvTU2Ys5+wbTHrUye7YpV4nNDq4FWnH3Hwna2kj3Z3byQxGgxlvlle4refjavqR9AIanRRArAnzY6f9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlRMbB01RLALl+U8OtECe6H9+Msc/3HT4jfmBuslbF132C4UvQ
	W2PIOtijdpqy4uBoQffHQ4l5++rxGrwm9fzdtNzhjx9PNHMsCzgAjNNrGXYXYYA=
X-Gm-Gg: ASbGncvSx8KEZY7b9wE2bfsVfs8emJ0Ag57I3fXaWJr/HFHfU/EcfIYFqAjhzLoejFx
	ExsVvAlyMRmQo6OBPLFhhX81U3NXX2tAS+sbsB0aIGfY38Dod06WGnRbgniwk8n2Ei3ynEMiXEY
	XXUb7u/xlsXFZ3htKAMTEAlMJz33C91o5KSjPGx1ebp1xrzIxMdsKwV5u5RVSqZoPhFwPiizKCe
	HEOckHpHI0RB8iLDyPZXi+RmJ65LuXPtq7dyhnst5wcXnnx036illnZjFkQV/hiRdDoJm2wy19v
	ahWHtIssUvoZVeGmaumqOg30uYLKWLTWVo+uv8/V9gM2JGM=
X-Google-Smtp-Source: AGHT+IE870Ofos2AH3n3TMWHfx6tIRQtGQ55FfR3imiLRJSMot66fT9h5iAgoSCOr6Lm1A/3Jqz+PQ==
X-Received: by 2002:a05:6402:4486:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5dcdb762a5fmr17852032a12.24.1738852718101;
        Thu, 06 Feb 2025 06:38:38 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e7196sm106659366b.89.2025.02.06.06.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:38:37 -0800 (PST)
Message-ID: <2f58633a-83a4-4128-9a1a-bd0612793bbf@blackwall.org>
Date: Thu, 6 Feb 2025 16:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 02/14] netfilter: flow: remove hw_outdev,
 out.hw_ifindex and out.hw_ifidx
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
 <20250204194921.46692-3-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-3-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063839_850190_D3B23A09 
X-CRM114-Status: GOOD (  10.18  )
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
> Now always info->outdev == info->hw_outdev, so the netfilter code can be
> further cleaned up by removing:
>  * hw_outdev from struct nft_forward_info
>  * out.hw_ifindex from struct nf_flow_route
>  * out.hw_ifidx from struct flow_offload_tuple
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/net/netfilter/nf_flow_table.h | 2 --
>  net/netfilter/nf_flow_table_core.c    | 1 -
>  net/netfilter/nf_flow_table_offload.c | 2 +-
>  net/netfilter/nft_flow_offload.c      | 4 ----
>  4 files changed, 1 insertion(+), 8 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


