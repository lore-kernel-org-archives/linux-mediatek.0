Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DCCC02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=; b=MiCzWG+llmUk8b2DJ7qyA9x83P
	8l1TpNtgdQkPTB1x79YixkpCudeQWrvXOvpEJ+Ahp52FyUq/N6bYL6r8CLTbP3cupp2hqLV5lUaUJ
	+QvUouRlEoI/YmQeRwogEYWPNNPJrvsyYSYqjYfmqvFavlh9vUO5v+43IoElIobjLXD1Jn9zB/QVh
	eAiMNkQhcYATlqKQTkaBn+H31g5BT50z3zzC6VtiTwehhkVqVyWtHTMJpm6xnXPxZbL58LHQMH7fy
	gAXHQfB+dVVIFBCNUsLih7yFWjRiLXzDDYjHu1EJC7BH2fAxc3JaDwgqTBhroMiVaweUQ5Z7jpqJl
	dtD1AV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3DQ-00000006e79-2gng;
	Thu, 06 Feb 2025 14:50:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg32d-00000006cNW-3418
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:39:44 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab744d5e567so182864466b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852782; x=1739457582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=;
        b=rjPebRG8YpinCDjqqcF3BLneuf9nSJUi3D4tJ8/L11MTudfdmSKhTYFrMKF9jGBzDz
         w3F1QbntJGKkovNAuvep1lOKjR5iVjvgF5FMY26bm01Nw16u299SaFvMUI4mo2QjV3Im
         3SP5dMqf7C7SNIe96+gH9Mge8c6TAAtD7GiUmp405JP09rHqAONrnNJI7V18FE7xuM3M
         2ND/joaLDj9OFP7dnePlw3uzATMn0rieuYV44ESjOHW5Nh+WNmEDmVQRpescKQqAFsMH
         9u4+EvKEor5L9iHuZhx3ErXypqgSTQMuNqFz+2y3REnRNDC6ve2FqU4xZzY5UZmfXzBf
         Tqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852782; x=1739457582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=;
        b=tJpDUWeo+l5uapQkXw4Uab/ht/4N0/yYDm/rEH7fpOuFZVD6KAVaYrUPaiBi4Z/OE2
         vm7aKI7c7ojwd8LtM78sz7KUSRZkL8PFEIpE4JWmlbLtTFMDWCbf+xXFJqanmK+gugie
         pmK/qGCAr/EhF4Rbg/r+Lx6S92nSp0O3qwuCzuByTXerHd/4unZJJiE3teIc5GO2OB+9
         dfaaUjc/WQv9N4Hbbs7zf3P1V/vpCGsDkuu0oqjiMPh7UVe48hwLff0EAURE+NTVqihI
         ds2G/hu4GOlgR9eL6xytims+9tVF8lswzErM66wdfX/0IgheMW8LUxGFlXVrX91E2ylS
         F2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbjwI8qtjWK7I2mKs6Q0trna868Uk+3WTnVFWpsTTeB7aqQZ9KNWhXI9fZGAUL8IQYtiQzi+qs4EF/wVxVRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd481fcKylgo8Lpa3us0YwxeG6Ghc5ePKW9OBmlvatjPGt/f+O
	vMLysH7P2NwSE1KxvEaEfd22IOtfdqS8ao4HfeCz6jjzePUpsZEjXvKtXQE+iuY=
X-Gm-Gg: ASbGncv3t4OOK2EKtpXCLg7jEQeh9W9K0Vk9ZQMrL+1k/YGvIrFc6ONQWIaqtLaBs9L
	EEc/OsW/xJkWMWwi2HDKTxUl/EuPkcuk9HDq4BkqzAx6awblP6aiHti6rwZZ8SCtpbVaZLmXZP5
	5OJoo9p/hbP/yS/HJe9V09ZiAdDWFzgGdfVU/Z2lFx696oFxF6A99uKCyQ8+WV5CGJK/161N5m8
	gpYnWAxt2NdEZn7L0zG5BHxs5uq1GVzvlRiuE+5bdg4ntETj6PXfVm8KI7V79z2FkIYTwf0P/8c
	SHIunpTG+jNVxoGXCJeIrJR34dUd9ern66MQVMfFvY4c8Jc=
X-Google-Smtp-Source: AGHT+IGWp5+1BVne358ySyNOgZ1qVjbCgfUJUnYbiNP8cDVB4maBnu+CTyhvHYo+RSuyGyXRNdH4eA==
X-Received: by 2002:a17:907:9611:b0:ab3:61e2:8aaf with SMTP id a640c23a62f3a-ab76e9dbe8amr395071966b.25.1738852782052;
        Thu, 06 Feb 2025 06:39:42 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70e7sm108777266b.87.2025.02.06.06.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:39:41 -0800 (PST)
Message-ID: <46b7042c-8284-4523-b54f-38f97e70075a@blackwall.org>
Date: Thu, 6 Feb 2025 16:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 08/14] netfilter: nf_flow_table_inet: Add
 nf_flowtable_type flowtable_bridge
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
 <20250204194921.46692-9-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-9-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063943_760843_7CDB68F3 
X-CRM114-Status: UNSURE (   8.50  )
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
> This will allow a flowtable to be added to the nft bridge family.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nf_flow_table_inet.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


