Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFCCF259D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 06:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzkqcrvTVaKqpqDByKdgad826mxzpVo//v8QIefMOL8=; b=NmcaC/71H3cfvhqELqcti+Ykws
	UQGwouva8VkB6ANogZfY2JVFMPgZeYxxMf09mBduFESTyYrSO76U2XiahXoEBejYjtvk6tAPQJoyH
	as+ZJiMUcmttcn1ii9BQ924WBqI1Hq8I90vizN07/a88QBWLrndeEQ+8w/V0x7n3OH9lPYvZ3B4t2
	/XbVaDdLV3Z4BP9nZJLm9ICUe1W1h8CxOPbPMPv3TS/jewahL4BPs7nqJfj6vuRc+bRPquHrmhuKp
	7F387+1ufmzVS96PnT2BJvcCfl1fuJdZYYahKvECwnbL3uNLIbvrJ5vhN7lxcyjQvXxfvMTlPw3Ru
	nyYxFKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Eg1-00000003ugp-1UkA;
	Mon, 14 Oct 2024 06:35:33 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Efy-00000003ug3-1etU
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 06:35:31 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso1448278a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 23:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1728887729; x=1729492529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzkqcrvTVaKqpqDByKdgad826mxzpVo//v8QIefMOL8=;
        b=JGFTcuzsx46wnCRlQYBvjUX7VP0W1S7EmrUyWfj0uaLk69H0G+SqKsKj+TSoFtKgh9
         NIcqafDzk8LHi3DYKxJuoZaD++n8V1VfqBHcN6i1JxmrJLWhpeaKv3uo12ufwYYmt/0f
         X1aOHtvEpquzTKk/j0Hj21J13PX8Du2PzjrRQ3PlwHZrpBJRCxcgQTWvRPxyfyzeJfWl
         BLB7OR8FxY6fNy9ptszB9iwB2R49BIl/Ggoh7a+m7OnVPAsLqo4HBMz1vU5Jy5XPvlfQ
         IU1cwfpFt+4WAHiqiRinMdOtO2y5GLYgc/KsLFCVEtHun+G/eVvdPdRCZZvQ1yUVKSq6
         Iuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728887729; x=1729492529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzkqcrvTVaKqpqDByKdgad826mxzpVo//v8QIefMOL8=;
        b=YY8HSlb58a0+T43VP1KNCo8WLux2YHHB2czwrbt2P4RipD/ghXmpovskM/KfdgBYlp
         He1lrzFeVvjd1B5hvAogGfgZ3z+EEHlISydtdBe3dzMnCnNbkgYVCR6m/AUc+g/DDq2c
         pr4u/pDUIliU9A5xiq8rv2HVuP9JaXUVsseI1sa193e0/8yLZEj3kCt0yu7avMwDa7Ji
         k2pzadEtJ5JFMhy7ZXSZ1uvXv79WUcDpkWiB3e/ZA+b9gFwXuwZsKK5TjnKNMDrHhGve
         a31beHsY98S5Pq5IL0pElBCg34Vgoa5A9lfi8YEnwRo+XWSX9WH+WF1ul+kN/M0BV7c5
         ZoLg==
X-Forwarded-Encrypted: i=1; AJvYcCVcxCBAepkv9CLPxHN/xYSsbXff/0fYz3ejo+IJYBm7jPI2BZx1fkCjKmd+czAAz39R3+TceogsRymLxmB07g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5PWZb1VxfhXeT4wIMJx4rGIoRkIEGLSOTNVP5y2i2c9n0PcYh
	xpR8+YpVcZcHMYIPpF/mprM0nyMW2VpfnbQM/n3T3/Zf+zd39Ursg+jZNeJnGUI=
X-Google-Smtp-Source: AGHT+IHtsfhY77d2hmhJ/UeBZXQQAahrdwUCAyfXzQzRvrPqdSAngDAVOM6fkmoaHNagJzIo6u/AkQ==
X-Received: by 2002:a17:907:d01:b0:a99:403e:2578 with SMTP id a640c23a62f3a-a99b9313475mr1017156666b.5.1728887728814;
        Sun, 13 Oct 2024 23:35:28 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99ee8da1besm278784766b.216.2024.10.13.23.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:35:28 -0700 (PDT)
Message-ID: <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
Date: Mon, 14 Oct 2024 09:35:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related
 improvements
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
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_233530_476732_3BB54503 
X-CRM114-Status: GOOD (  22.21  )
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

On 13/10/2024 21:54, Eric Woudstra wrote:
> This patchset makes it possible to set up a (hardware offloaded) fastpath
> for bridged interfaces.
> 

The subject and this sentence are misleading, you're talking about netfilter bridge
fastpath offload, please mention it in both places. When you just say bridge fast
path, I think of the software fast path.

> To set up the fastpath with offloading, add this extra flowtable:
> 
> table bridge filter {
>         flowtable fb {
>                 hook ingress priority filter
>                 devices = { lan0, lan1, lan2, lan3, lan4, wlan0, wlan1 }
>                 flags offload
>         }
>         chain forward {
>                 type filter hook forward priority filter; policy accept;
> 		ct state established flow add @fb
>         }
> }
> 
> Creating a separate fastpath for bridges.
> 
>          forward fastpath bypass
>  .----------------------------------------.
> /                                          \
> |                        IP - forwarding    |
> |                       /                \  v
> |                      /                  wan ...
> |                     /
> |                     |
> |                     |
> |                   brlan.1
> |                     |
> |    +-------------------------------+
> |    |           vlan 1              |
> |    |                               |
> |    |     brlan (vlan-filtering)    |
> |    +---------------+               |
> |    |  DSA-SWITCH   |               |
> |    |               |    vlan 1     |
> |    |               |      to       |
> |    |   vlan 1      |   untagged    |
> |    +---------------+---------------+
> .         /                   \
>  ------>lan0                 wlan1
>         .  ^                 ^
>         .  |                 |
>         .  \_________________/
>         .  bridge fastpath bypass
>         .
>         ^
>      vlan 1 tagged packets
> 
> To have the ability to handle xmit direct with outgoing encaps in the
> bridge fastpass bypass, we need to be able to handle them without going
> through vlan/pppoe devices. So I've applied, amended and squashed wenxu's
> patchset. This patch also makes it possible to egress from vlan-filtering
> brlan to lan0 with vlan tagged packets, if the bridge master port is doing
> the vlan tagging, instead of the vlan-device. Without this patch, this is
> not possible in the bridge-fastpath and also not in the forward-fastpath,
> as seen in the figure above.
> 
> There are also some more fixes for filling in the forward path. These
> fixes also apply to for the forward-fastpath. They include handling
> DEV_PATH_MTK_WDMA in nft_dev_path_info() and avoiding
> DEV_PATH_BR_VLAN_UNTAG_HW for bridges with ports that use dsa.
> 
> Conntrack bridge only tracks untagged and 802.1q. To make the bridge
> fastpath experience more similar to the forward fastpath experience,
> I've added double vlan, pppoe and pppoe-in-q tagged packets to bridge
> conntrack and to bridge filter chain.
> 
> Eric Woudstra (12):
>   netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit
>     direct
>   netfilter: bridge: Add conntrack double vlan and pppoe
>   netfilter: nft_chain_filter: Add bridge double vlan and pppoe
>   bridge: br_vlan_fill_forward_path_pvid: Add port to port
>   bridge: br_fill_forward_path add port to port
>   net: core: dev: Add dev_fill_bridge_path()
>   netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
>   netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
>   netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
>   netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to
>     nft_dev_path_info()
>   bridge: br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
>   netfilter: nft_flow_offload: Add bridgeflow to nft_flow_offload_eval()
> 
>  include/linux/netdevice.h                  |   2 +
>  include/net/netfilter/nf_flow_table.h      |   3 +
>  net/bridge/br_device.c                     |  20 ++-
>  net/bridge/br_private.h                    |   2 +
>  net/bridge/br_vlan.c                       |  24 +++-
>  net/bridge/netfilter/nf_conntrack_bridge.c |  86 ++++++++++--
>  net/core/dev.c                             |  77 +++++++++--
>  net/netfilter/nf_flow_table_inet.c         |  13 ++
>  net/netfilter/nf_flow_table_ip.c           |  96 ++++++++++++-
>  net/netfilter/nf_flow_table_offload.c      |  13 ++
>  net/netfilter/nft_chain_filter.c           |  20 ++-
>  net/netfilter/nft_flow_offload.c           | 154 +++++++++++++++++++--
>  12 files changed, 463 insertions(+), 47 deletions(-)
> 


