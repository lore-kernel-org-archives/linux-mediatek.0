Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546BFC02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=; b=gN2oH3vv9eUC3lHT/jkA6JHRdp
	6B1NdeLH9sqVBhJlWqac5Q/njA2XzIfhPe7WetNURXjSd+K5dCB6nhb0R78h52Fy/A5UHtSI0g6zL
	fPCP1iLb1oiCKB46+vz0RsfMif2gl3n68tieLiPOPMOdK6+jJKvqbthRDBGY3Nmra4DPZAXQC9jYK
	IiqV16u91TIJj4A6bCsU4GgnANd0Bb10ZebM8GuMd4d9keKHvkM1f4/XLzfhlqNAKvIdJZ9A06C9u
	ZFl8ZtqaHuJxPurkF68gGK2JL6TQUUxVYoal21Fr99cjon+shltNzwk+WM4RTpr5Dn+lOGvj9wJRS
	sZfIuwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3G6-00000006eRi-2K4A;
	Thu, 06 Feb 2025 14:53:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg34g-00000006cql-1vrF
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:41:51 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa68b513abcso190807466b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852909; x=1739457709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=;
        b=fUfF55mSMInKO7GVOPuStOHUPPk3x8KWeZZrSxpVroWDT6gLWgNzoGdjFzwS1uD+Fo
         5pPp9rAfuupjTxAcESe9yvj3fo4/oo2HPohzkXyk+md8d5sHcdN5xTN8GzxbbXBJYx8/
         1kku8lubvKDxzC4+AQBBiTek2cl1ziOiKVoqKD0VU0bB3Iu+lZOkM/SBfrQt5XGQrde2
         B/L0hodptfxfROznClJyNjgw3t8WGj4exUSCP1NLZswmAHiUZLy7cLDZR0wcD4gv6gCF
         g7MfXatMihqoxxGqXig51EP+J8bixWgxnq6eMYPhGyXj4PMvZNI6LSFY/arPYveDDCHO
         +16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852909; x=1739457709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=;
        b=txyWBhkeI/Gi1NCDep1HSLNwQ1VIGAHwohHj9aVw7D33oiHi3GI0fQs+HqWjE8HrTr
         24PvI/vuh64zILXf25DMzvE3YP4mNSw4jeFtJxxbsCStnvYO040nVmb4XR5HSl7oovzK
         mE2nMUhvGee1SBLgAPhqKNk2+dGFezCt170yTifRJRASaXj6zjcC/BNAHnGtGmOgEGle
         a2VLSK2IbYIMelSjG98J6th1VRF1UclsUbr1SBBi8s13/QQDOrY+4AXOEwagC90wv54C
         mp/zuSyzA/xzaXz7sA83x5z4T1eCUXcoBlKaCTr4sWRZBca9b1JAVh8Lp+TBcyLFHzng
         P4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7dtGok0YM4NFQJQytYTpppfY7o0sTsoTC0UmWZQZKIM/DJNDEU/nvp6WmuXTuHyaWoI0ILjUs4G7CnLGl+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5klcCPozSJUdOOpT1uvcYD1jU/RqmOkNPOUSxrBvYOc6cTKcY
	PzEvJDubSmBM5Z66jFHMslW1DcJIZIQHFhdJEoJOmKW8LxBv1WTtftQndNFUMKI=
X-Gm-Gg: ASbGncv7SDxalWg3xbQTmcZZZFHRpt7Auwn2QFjNDI3qnQHk9UcfeiWTJ3eszh6pqbL
	wEQqa/DFs+/YzICeyEvhX3w9sXcqvpj1clVH8oV3IzmCdHoxd91+FO38Qtg36nOMWjRXFTcungu
	gXJX0T8AQg0vDJFHN/Gyt10l0ZEeBJn44ipq1gF+DWP5TVQ4T59Xs/NuheIERYhxDdgNcnjnJuG
	7AEhs+R1N6sDu6Q8USk+ineP+itviCYYGTAAe9F4+Qd9f2tTlcilnL9cTl2D+6NNQUCm9gE3z94
	4gQ7KTBVJzzdQy9l6/CawrZbs34ZCi5cn7+stvCPg4gw5sw=
X-Google-Smtp-Source: AGHT+IGYS6d4HsD5MEqTfuQgUgTGOYMkujVYUnjTnyeKJRhPZPj1m191dnJjgGKyqlpsKlnGfxYIDA==
X-Received: by 2002:a17:907:c23:b0:aa6:a7ef:7f1f with SMTP id a640c23a62f3a-ab75e233e41mr751067866b.11.1738852909025;
        Thu, 06 Feb 2025 06:41:49 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f484acsm109660266b.11.2025.02.06.06.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:41:48 -0800 (PST)
Message-ID: <ffcafced-51a2-4a09-ba45-1aafc8f39081@blackwall.org>
Date: Thu, 6 Feb 2025 16:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 11/14] netfilter: nft_flow_offload: No
 ingress_vlan forward info for dsa user port
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
 <20250204194921.46692-12-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-12-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_064150_501980_2793EF77 
X-CRM114-Status: UNSURE (   8.78  )
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
> The bitfield info->ingress_vlans and correcponding vlan encap are used for
> a switchdev user port. However, they should not be set for a dsa user port.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>



