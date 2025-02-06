Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273DC02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFMFd8yvXqVnAGCGrRETRe/V8KRYdG7T8ArDcX9VBwI=; b=Qtm4n1UsajUg1NnYxutBh/l1ZX
	elDT0iN7iJoBajS6zmY3Ukb0J3YII04mADSbX+hLActX4r5PYN5Q1vWiUftU31aFieTMmHtMR94PT
	gACqKj1CaN4l6LaNf33HwfqmuFFFAwfRQDqEgOMlZCL0BlybFt245jQFpu3L/UA7/gEnwAx0aWJeI
	b04MzWO1a2G2+upWBZcwqcyF8/uQ3XWcGGAbRFz+Z/zIOdPCqgBUXeBK9yGo5/LzghOhWKbl7a/LQ
	/yZ1NvalofGKLRe21OjAgsWvkKKgr4MXmmV1K+CMwotTPbzNn7etqBKABhoTR1x9Ny0G1Xs4UeSPZ
	gXZdvamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2zz-00000006bqL-1bhi;
	Thu, 06 Feb 2025 14:36:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2mh-00000006Yjl-21l0
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:23:16 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5de34b72ce8so687085a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851794; x=1739456594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFMFd8yvXqVnAGCGrRETRe/V8KRYdG7T8ArDcX9VBwI=;
        b=zdE2MWGffMnq7DVpjWNXmykwnZXhoE9gGgswuXoTn7r6JspB1+PHEfoAWkZcVgM5vs
         96tr/K1+OB6FHEPHvyca1iKnoIC9CMhnGQ+NJP672qBqnOnuGEnTOSUJVjCJTDgV2n3N
         du0e0lFBWtJhZCZCXQeFN5d9T1gPN8EK1TQ00ARY9Pr2yCHSYWsLR4qje3NyCqkuJnmY
         LfNrXxPgQXZCfEW0Ds2+9+szrjYKCZNDhyvoAmAknMFSW9xqbNZRyLWXR88VLsfBQBkK
         F4P52TV08j9tNnCuBw95+VMIorXHf2+mxOKPjcpWSci2BEe0bJ5Z1YyilISGORd5Wkb/
         ArpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851794; x=1739456594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFMFd8yvXqVnAGCGrRETRe/V8KRYdG7T8ArDcX9VBwI=;
        b=MlNT76JotHL/I76gn+G6iC15eEc5XMdwssHkyC3lko7/fzx9lmcznvMdyFY6gFDXn0
         n3nOIy93Kqx3U+9vsnustR1FYJwhiuK9m49Io/sbh6mhAxnE5kEZ3G5I5vA762bip4Nf
         2lLJVKQuP068n/7vQWQKAPDfLOwsc2u4QfPHCOQ31hC60xA39SUSvGxkBqQjUj0u8dqX
         vbA+KsYdzDIXsFEP1OxWv/euTOBBN2zFGaVhV/lSq6kuANrQBz6Bgdjc6jC0ajY0GlcL
         xIxwwkDUEBFBWbAvKvaI3e698ND9u7jEvOXoiczKRDN9rUFsKvCAQfc1S9kJdYLy9rQU
         L+8g==
X-Forwarded-Encrypted: i=1; AJvYcCW4CJzW+wqPH3qcRpcXXfZf2taMKv3aFzUEgJeFvrpmeDvE2GkV0vYfbhUt8mJm6iAgZlLYqP+CJ61MupzEqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXRVWaiChs/cN57EQIpoSu97KTRAv9KMJw0uY/UNeCyV4TyDYH
	ANgxqKrQ6Ect5tuhX5I+5TllR1II+IuB15YRAZanu/XRwHUhIJraqddynKLmJPo=
X-Gm-Gg: ASbGncstvoDYCTKMJt6DgxMp89DNxT1Z93vmOSEBw9rssPrfYVaRRBmzmL9BQC7fInC
	X2+JYOE08sfmY9c4jrXM6E5gJWvCxjOIT4kJcpGVVXIsRDOdP4YO40ZIAPxBpfqnPCb8PYivfiH
	NYr/9wQi4xIxWIy/LJrX5SuBVLAY44i/ycQttwE6pMkcq1vtmTy3g/GAGMH0XNU4VyJXdinoovx
	rdMAU6/bZemi596GcrTErsnDqQwK1P/2QfccECbAABDFtHVYIceUC31Zii+IVTcx5AJpIEN7tAQ
	+ua1zX2Z4AB2AtVZBI9wo9RLki1cD2c6PhqLkv2ZYp7RiA0=
X-Google-Smtp-Source: AGHT+IFFyvQfINAl6lz2A01y9ohntI7gR0hYfp3ILlqctgCUIUMFbzNkfcNhO1QK5iS0p6NSxCJe9w==
X-Received: by 2002:a17:907:8694:b0:ab7:b93:f77d with SMTP id a640c23a62f3a-ab75e245be1mr816768366b.3.1738851793676;
        Thu, 06 Feb 2025 06:23:13 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f486c7sm106211766b.23.2025.02.06.06.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:23:13 -0800 (PST)
Message-ID: <5de6707a-6a77-41d1-8964-19667a0e91b2@blackwall.org>
Date: Thu, 6 Feb 2025 16:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 06/14] net: core: dev: Add
 dev_fill_bridge_path()
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
 <20250204194921.46692-7-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-7-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062315_527103_64FC6B45 
X-CRM114-Status: UNSURE (   9.47  )
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
> New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
> It handles starting from a bridge port instead of the bridge master.
> The structures ctx and nft_forward_info need to be already filled in with
> the (vlan) encaps.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/linux/netdevice.h |  2 ++
>  net/core/dev.c            | 66 +++++++++++++++++++++++++++++++--------
>  2 files changed, 55 insertions(+), 13 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

