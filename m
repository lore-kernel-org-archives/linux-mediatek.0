Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C3EC282DC
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=; b=aOvhUajRNKyJvjM/YoZV6qYz6N
	vikx6aQvNPa5wi/gnFqOXmZ2ygCMknZls3UWEWGmg6LK5mO6cjMeJoAGk1I5a1tshkNaniYHd7tEM
	tX97oGAvrrJqGpWNe6D18A4IEQCA+VOeClarWmi81e1k7dLzXEUEzXpdKZh9ZUstuH8E6FWGKcvhw
	fOkrxNDjr4/Cn2jdgeCl0sRyQR6TJus+NKqdHKqd9Oci9Zxo3fKTVkKlOfEsm2JbN2TA5L+086GfC
	y3MAno2b07+zRQhVFyLO4PQFckuyiEypb4n9A3LJC80Di8qIZ0Uvi/Isa1xDGjSCrovB5ptPqd46/
	HTKE5r1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpl4f-00000007VpZ-3LNq;
	Wed, 05 Mar 2025 09:29:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk0a-00000007M5P-3PDy
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=; b=TbTdWuaLEUhQibdD4CJuRQV5BH
	TDd+Vb4f10NUxZAj72hafgqZNL01+xI8X0qEOmJkPcZrs/q0ROl68eupM6syPmQCD70QZ/IF6qSDL
	bp9lvp7W7NeJztX4p2NbCK/9qEvedGTrsZEbEUVhVLTzi8GIB42WZCOFVKtPniEIBl2FytO6dBdtk
	igzxDcX21R5+0hotC31BEQIj3+NmZaQ4M89X1iVk/i7hjjd4WpnQ3FGM8vv7nTnu7++2xmMsBs+oG
	nq3uR29Uz+ydVwdv2GGVXWOBXmuyCL0jbMkMhO6oB4XYTG8sxUyJ2v1FfM87nFhk7fCLC+tb0kaWq
	G0jsctQQ==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk0X-00000000PwY-3T7B
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Mar 2025 08:21:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1184926666b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Mar 2025 00:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1741162896; x=1741767696; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=;
        b=ZhtijU+kdq8FgNi+x6h6D0tGFZRoqWK3/l3Wkw8NYm4LN9XBNYyx2uQK925sEYbT4K
         thj0cG8knKAUI4vLf+NTkSD+QWlhA6BAk1vKxZ8z6g5eAso/Mo+QJLeQQ6V9AsZUM711
         vWtv2wdZ6qOpBZNTKl5MclPgmA/5Ky2HOjmkfgpGzFBPPMzRr2U2K8WIdNjTcQnrTYmP
         kcCeMvVRpTafOOVXapSbPwWTNwO5FkYbnm0QVLgGYghoZfHyYlJagqD+PvIc6CkkBpYS
         ETIW7NR/kOr1tAczKb4pxCtSSgstuqhVc1GpFpkoz1NBSQcT5P4mRFj0sDESIl6u4Ki8
         HJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162896; x=1741767696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=;
        b=CbK5vuDSSurC9Osi+QsN8Tea7C5jdNaLNBTR6kblACV7XeTYeu7ezhTBbB29jpwwMI
         GF210XcRV/fn5oR2JdV/kkc7Q3TnJi/ozSzuIlLs2WB4RCrvP1DhXQ5YT7I8uSxx4I4J
         ZME9pVQS6KcU++/IF7JaQCRQVY+iO8W2WKVy5luI45AU6WjAcPns1AdgKShXaIUtEx9O
         T3cSCLDsL5LLKyYrwQqQ1gnxKDZaBKcmT9cu9BJ79w3JfvbPg4ZaKYHd2tu8B29ZpCSV
         fo7Yz5c74pElmihvQq6rZJMOLypOWmITdGSlR/LKoy5uRjwx3UMwmdzxkzxGrAyEpAXJ
         57mw==
X-Forwarded-Encrypted: i=1; AJvYcCW6tULIoE9j+Zb1Z8ZBvdJ1jYEH3eE2xROrAdGAeVS/1o91Zsd6rrgkQIq8OF4HqFTX0QjkOQst9zuDMo6boQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBt7zwapehVjXmgcd0h8hKpoaIPZ7rf5GjZS5XwWTE6s7hv2MQ
	rVr7v0R68TbNU9kEmMAo/TQN5U+ZGIwRe+sbo0neumHUEj8mO+vqX3jujUCkNmA=
X-Gm-Gg: ASbGnctZ/3DjY9ZJiVJx6sdfie6/LiBoQDYjzR8IlSmDxa2zt/65mCByZnAq/cBLCk/
	eCRbN8bvCGKbysetQYtYV7SRxO8tLgOax/MzFE4jlSETEcMv5iagDVEZroZ187BoEHUvfk09w8R
	FknSFscmdiwbz9DnzAFf3j2RcpCxfKlNBvyoqZ7FGxljRDc6MnFLXdPrgBzz1jfoLLY3NpBTFG8
	EZv4w3dqRKMzAD7DTSPmtt3yCzJBWcuSjJHAIqaCP0WrSo31S1uGAz6p60EePa61Id4Y+jombFe
	Vo4QjB79oxnDFCcT1AKqbFhB4l5aXra0crutY2R3alM6Go0kzyyBw61qi9YtsmDxjyiQADk3gCO
	B
X-Google-Smtp-Source: AGHT+IGaoXnq3lSxzaaUwAuVfK+jenlYaXFrv+TPSgSHSnmbmoUQLeCI462sahYSphebEzq/qYnUHQ==
X-Received: by 2002:a17:907:7f0b:b0:ac1:fb60:2269 with SMTP id a640c23a62f3a-ac20d925048mr217259766b.27.1741162895402;
        Wed, 05 Mar 2025 00:21:35 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf58804b49sm693744066b.26.2025.03.05.00.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:21:34 -0800 (PST)
Message-ID: <b3b5418c-65d5-48bf-8868-2d9abcb4f758@blackwall.org>
Date: Wed, 5 Mar 2025 10:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 01/15] net: pppoe: avoid zero-length arrays in
 struct pppoe_hdr
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
 <20250228201533.23836-2-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250228201533.23836-2-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_082138_158920_C40141CB 
X-CRM114-Status: GOOD (  11.95  )
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
> Jakub Kicinski suggested following patch:
> 
> W=1 C=1 GCC build gives us:
> 
> net/bridge/netfilter/nf_conntrack_bridge.c: note: in included file (through
> ../include/linux/if_pppox.h, ../include/uapi/linux/netfilter_bridge.h,
> ../include/linux/netfilter_bridge.h): include/uapi/linux/if_pppox.h:
> 153:29: warning: array of flexible structures
> 
> It doesn't like that hdr has a zero-length array which overlaps proto.
> The kernel code doesn't currently need those arrays.
> 
> PPPoE connection is functional after applying this patch.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  drivers/net/ppp/pppoe.c       | 2 +-
>  include/uapi/linux/if_pppox.h | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


