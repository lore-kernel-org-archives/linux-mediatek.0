Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC17C282D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=; b=PtjDw5kNEnok9GrhqmyAYw/cTm
	FQ5UIypszIoWztq5YZghIvrfvWuMIj+cYx+ndmI4s7crCYqLgMJWZB4yakFJHSa/mPtYihQhFq0Za
	3iVsu7IupwYxPn1l1H5/p2KPPOzAsW5kCxxQucwTOutYn7CUEUs9kJcGvrUHl3zgq0XAawl9Ii1+J
	GavDsXk7MkEqwXLeQuFFDqYdob6dLpHbmWexOv3pG161YYazNfNs+0Zjjs0FXlg3QCpvHyvAMk/QP
	tQ8DMSiMQV6uDJfvfhny969fAx1n+pWghv6k6dF1Kf+2BBh9fdJElfe1tdwFW0SUVpvsNhU/IQNTx
	CsV8vI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpl4e-00000007Vny-1OzO;
	Wed, 05 Mar 2025 09:29:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjzP-00000007Lsz-3Ujz
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=; b=iBH3UA2yg1hyMDs06sgaLQ64Ni
	vbP+UP77yyYdb2vVQ2OsigscuUrpLp6daIhn0ymitWnEGMUewxIEHFd2Bb0htOjb+JGuS2n6nQiG4
	Pt7MBVLSDC6eFs5lanp6khJEl6dym77nxxcPzqBBG04EQt4sVfaAUWibQFVUD9DZqWZRKCgpLrl5e
	uUQjSu8rBcVqIse3jG+ilS8PqIC91HlYXj9snh6sunDTwFzDE+yrrzOacUB7cP1Jnj7+tp3m9gjmI
	F0uZhkqchkcFXzrMMV2QdZISR69Tb/Uurw9z/ArRr+p1wuk0uU0Q8BnWFx5Ef/y9IrCTaNfEhFIno
	pUe0svlg==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjzM-00000000PuE-1ubI
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Mar 2025 08:20:26 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e535d16180so4635721a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Mar 2025 00:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1741162822; x=1741767622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=;
        b=wTDDhUd/wLCImlH7cxoKsb1qj1eri2fu71KuUVnMJxek/yAoNS4K2mmr3OHg3CknH6
         25dNqTA4ez33+dZKqyNonY5fwkbiPpXpLq0f4DhmpWKlMhLExYEpSFtQ57O+yMgEWNJD
         BEPPRpviGMMzkfapCdDW89aT2mFHCqL0MsDseiSfC9FTvW3JR7eknqaCAgaHzFk49Bir
         p9D8WrUZvrfJlt5okwbu+kOodqJmAIBVSKd9XUERGhkjBk3YjmMPFFzwm+ty7dORkfxm
         NxjQ5QXF+ClCxseFLskEFlhc50opm3t70ry4tYgmzG8rm49uzlFnUAFqWoqQVTBUh4J5
         zWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162822; x=1741767622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=;
        b=CwuwnvtIFsV6+P3fM40R0N8vCkhlqY1PPOPjek3qqUsoB0KIvN5o0y3xB6gfKK9hKK
         9PoklmrpHGI1zADJQb4hNGjwbGwZ9Y3zfw9dlE4wQqdxhNnD3mkMH8Z/1nuQSn/QX//w
         6aFtCvd+5j8zSK5QAW1EgKEDpVv2/uLlWvFTE3kbyt8xa3wXvPn7Zm45jqWpVi3UCsb/
         gVWvz5u7hjVy9EejPqMiMUYOwxxhX/o/7NsapTF1r8VtlINhScAvgKho1L25Twy6CAbs
         mZ7sf21NdVf5ZIkdj8LUrSLMlYPAgv/cxEkjZmqSbCUbffXnKZmCz2fPEKntt0yno189
         Rq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW040sXcQNLcU8cDNytOqhm/p7F1TjbHB2ymEkOZitrSUrC6Rbo0A9wn55Kg9Kq1jzGYfKeM2HMs8q8tV8a7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YybR9aPmYB4n6HrcEZMuZxG7o9rGjv8CVHmKmqywquDrTKCUZrh
	5Agp/egCFLK8RsRSCRta2QbstDnD/v2LK66OaxnTyeniO/okBXSVn9oYx0TFdKk=
X-Gm-Gg: ASbGncsGiky5Sk8mxOseL55dTHz23sq4nD3+ZjI0V2ZPHPQWIWoxobyvuG1Zhokamac
	5W336/RCfDC0dYIVH65VV3bePKpbtoECFDTvvSadBMYwF6dnTFh5Thk2dZve77PhYbB/sQkQTcf
	LjwGnnoFb/t7zrQRVxn7DFTzNfSOlpcoiGjPPCkAqn99ipbVBRyaNAnAsPrf1j3DzyqLVoS6w+C
	UhgrrvNSfCccDeVAQNoT1iEyl8pNCN/kQPpNYP7oJneNij1r3mIwy87CcPzjCvXbt9mcIN3jyNK
	/S7vC4FxNCCxY45tz4EMA+g/brsVsitmV+NOFNmpfm4jQ+KKBe+NtDv5quWpGTxVKES8Gf7JJZL
	c
X-Google-Smtp-Source: AGHT+IG3uX4osOFdkeIE8BVoOkaHQ2eM06ismAlJEsM6OrJRVb5spjiMCAH7SqlSZ6VKBFc01zjVCQ==
X-Received: by 2002:a05:6402:2714:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5e59f47ced8mr4078134a12.24.1741162821234;
        Wed, 05 Mar 2025 00:20:21 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf3f3bbfb3sm845989066b.77.2025.03.05.00.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:20:20 -0800 (PST)
Message-ID: <2690fc33-0646-4aff-aacf-2760706139e1@blackwall.org>
Date: Wed, 5 Mar 2025 10:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 04/15] netfilter: bridge: Add conntrack double
 vlan and pppoe
To: Eric Woudstra <ericwouds@gmail.com>,
 Michal Ostrowski <mostrows@earthlink.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ahmed Zaki <ahmed.zaki@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20250228201533.23836-1-ericwouds@gmail.com>
 <20250228201533.23836-5-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250228201533.23836-5-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_082024_724912_714372FD 
X-CRM114-Status: UNSURE (   8.13  )
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

On 2/28/25 22:15, Eric Woudstra wrote:
> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets that are passing a bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/netfilter/nf_conntrack_bridge.c | 83 ++++++++++++++++++----
>  1 file changed, 71 insertions(+), 12 deletions(-)
>

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


