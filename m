Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C66C02199
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0JkQI3U6f+a8v60Ya7beYBhUDwWewUAZsXtUyTx0ac=; b=gYvCqN2tlhJwAe62ue9N62AbHD
	zkpjjZLcfzIQwPqPf8Nfma3O2ALJI9sBubcLbaZdGf7jFen8++YY+mASKa+wv5xiVa7PKLi3LXrIW
	BmQGRTSOhkFqynMiJXujglErjudMX7XO0JnNn/X05EB3lIGuvYYY3KXNvx7T9+xT/3jtJ2fWTxydD
	z5RKGWHJP5a6b137ruWv2wIJSmhpgcl0EFyeIgWElUyrfSxOTtedjtYcuSSRy1sJGw4GEcAMY1+cs
	kejRwzedFaIcOKp0KKCEAJDBCqOKFUbHTOKkPCWi2v/N+X/CiWRMAFHtqFnMUm8yLLeN+ophwGQgi
	Ji90d0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg39O-00000006dSR-2nXC;
	Thu, 06 Feb 2025 14:46:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg322-00000006cF9-2pDv
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:39:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dce3adbc31so1716824a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852745; x=1739457545; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0JkQI3U6f+a8v60Ya7beYBhUDwWewUAZsXtUyTx0ac=;
        b=h3wjT/Mcz+dvQp8q4dicDmYSJJLnQLUvev/qFS7gCHK1KXeQdWjwmZX95ZbNLtP0m4
         7tZ1xwloOQI3HfA4zBKLOv4wswY8Oh5i+haTmsPaLiVqC0vHfKt2sgoC7e5PgiIcbcnJ
         wbw70elyTvDv2y1mtMMyAwN4VrqJ6Uq2lf+xySEueV87b0ygcekmbLMra9ZdGeW9X+wy
         1DnFnuces12nGhVzKq+2J2OAbNWl4e+TWXZcNkPGqlcX1f4TYOok6wpoF5VRfgQIFkqP
         ZdUgxwa683PCN6cWyQm7MWe+PTT6Dxy5Ymv9a8OMeHoMMNhYO2BEqW6/NijWia2Ma1yj
         vUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852745; x=1739457545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0JkQI3U6f+a8v60Ya7beYBhUDwWewUAZsXtUyTx0ac=;
        b=rp9EMlCPccI3168Bgo4I8zo/qSSHxkdMFPsc9JnxGSNZdygbFaKO25xJ4dCwBoehZz
         HVdW7auq3R+q6+Ff+TqI2V/ZiagK75QdQkmkcpea4LOmshaGKO6YreDRdDnWdTIQBg4I
         UfKH8qQCbqoZnyy/Z2z0TzryEQ7N/HEL8kpS+Inm9f1iyzKT5QAjojQO+x9hAGl9CcA8
         xKd4kMlkQFM2wRTELV26lxAPZO0W+s121fOIQ6376p4ZcGrNSMafjwDX3AMJg3gWrdiP
         Sw3TEwP2q7BEYvvOS6S1SJ2GamirRgEyrFWqRMH+gXps3tZk+NT2Vdv4aZbF0XA3qceQ
         ub4g==
X-Forwarded-Encrypted: i=1; AJvYcCVhXrZPIkVYLemNiQeFSTypRa2a0btcc3qncsylHHslgfju0AR/sB/W7qbCBLNpfjH/Qrr+5/jR4GXTBot1mA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjVqn+zbhwjQ3mV6Hl/aJMxkWvjdLISEOwun/MEU2sZ4L2XPGu
	B4jeQ9Kuz7sjj3IwG9FJcKEtBJ8r1bjWK+1Xb9KqtKyTJ3c/hnN8La0+HTpdkgU=
X-Gm-Gg: ASbGncvlp7EgLpu290nwQMuizAdTo5XE0i1y9qZ7ghWMZRYUN00ZrXdhQCY+hYc9qqD
	rQGbTn3Z6CrB1o858s+EnXISbnLSXvpLAweWA0NEakMqpnwzfdVMHVfQxrQrCo4Ud1RwpJ5weC1
	WlM0kydEiv73//qIO+0yKww47Kx4rqYntCSSzeJLq8FXCa0vUvvb4UBqu9MVHmr2RRvK8F22Wzl
	Q0OkOPEuT6oEYYHeM8cOLv0Iujr88Lg21cV+BCh9nGhOgH7N18M6c9x5TTe/ZEb2oLzX4nlABCg
	3SAXDWnDqovAZtr6qPF8yRZA5GwNegYDCoS+A0TxMYJUvFo=
X-Google-Smtp-Source: AGHT+IFfccbgqNHY4pVflwA0HY/1yvIqL3O/a0V1EXaUtiholMev7dwDOL+lRjcs6CbBMFf4cXAhig==
X-Received: by 2002:a05:6402:2812:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5dcdb762d40mr15968196a12.23.1738852744810;
        Thu, 06 Feb 2025 06:39:04 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339349sm107647866b.146.2025.02.06.06.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:39:04 -0800 (PST)
Message-ID: <98c8cbec-28f4-4814-bce4-e07101553f92@blackwall.org>
Date: Thu, 6 Feb 2025 16:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 04/14] netfilter: nft_chain_filter: Add bridge
 double vlan and pppoe
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
 <20250204194921.46692-5-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-5-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063906_717633_03AF38DA 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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
> This adds the capability to evaluate 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets in the bridge filter chain.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_chain_filter.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


