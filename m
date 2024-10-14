Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD56D1813B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D81y7fKwRxdQsGqZVOlIH9RZC5XB7EL1pIKoTfjy1Kg=; b=gCtr9B/NGjo31/rL0iMnrj63uq
	bk3oyLsYxwnoPkz9axEg092kwsgamQyAIOzTitKP7STv9vb8RDF0qgZe1ktGSAvRtlY0qvUQ9m1+g
	APdgQMTcXWVY4meA4WrvYfW9VBZ+1gQk5K3pfDQbAPRhbS+YF9GANZKigtdTkhc5N0qyKo7jDehRs
	fqP/9+C/zDh9vjpFK5jr3nmTeGwvcQoGBlVZjenqQO+HLrdBolqrUtk6DjhUvWmc0eUnjJWpGiBM9
	aeq8pIxWdQbNOaLZs9ShoqLjYm9RVL6U0va9q/c5UmarxeKev3Tg2ohKUczzaJtREiD4mccJ2YOWX
	U3V0BeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Pot-00000006AsQ-0u0L;
	Mon, 14 Oct 2024 18:29:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Pof-00000006AoJ-2PE5;
	Mon, 14 Oct 2024 18:29:14 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a99650da839so799789166b.2;
        Mon, 14 Oct 2024 11:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728930552; x=1729535352; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D81y7fKwRxdQsGqZVOlIH9RZC5XB7EL1pIKoTfjy1Kg=;
        b=ksoiibZWiAiTXi3nU8gvK+x+YuZc7z4ITN2I/7vE9pgOabXRxVWjWUyTWqaRzsep6Q
         NLLXMT+PGnZgq5OWgfEHq6ES4jLjlehGBNA5MF4PRdjpq8ydZXaOj0eVPq2623S+2xd1
         dVkTuGGkqQDxxRgcjNIUqd+LdOwW4jAnnspa+NEVpdZ9yeFEOvs1/2uCx5Tfc3N/qPd1
         U0K/X+MwxHOdqZhXHdigPluAmURuYOoyry/PFbOt2jhdHYA2t/vMek8K0T5Q5cb88Wny
         ysLjRFP1dQMpBWx7jzYGZQn2uRTqs9Wg4iECmPXibPTmtSsHnm4Va2YlOsbSaj7xgQ/3
         L9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728930552; x=1729535352;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D81y7fKwRxdQsGqZVOlIH9RZC5XB7EL1pIKoTfjy1Kg=;
        b=Y99T8zm36pqNB87iebWQbPazgCSIU2VvyGMm0v3eRzlsdHR1bHqSGVPU78Ml7Cy+gp
         gPlWLJ1D03rxHWFY29UCvrgExJ7BLoeKqkx2bo2w9xVvy832YFdotnpZ3vic0LLlrmqQ
         MBCkhXlBvDgVCOUrIxVTwrYrM4RlLv/jCmIrGl6p+AZpL4LBYWWVjkl/NHEdoBc/0Wxz
         BhLiu468TSAe6oh8cv77lt4mW9MWvhtI8dSm5eJHGW5bt3C0tdydhLqH5jF+lJFV6uoD
         mxMuGdEiOvVE0JF6tKNJ9UkWrAB5bNGZ0mZGK/q7x8MZTgKNtQlrCAXRbiAbgidHlwXG
         PjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmLJyn3GI98C31easGZl1JX7fULJ04NrIUENWbIQLuU4GRPAKaLrs77wqixNtIP1EG0LifHntv03qqfOWQm/Y=@lists.infradead.org, AJvYcCVExJUyNc52LklKI2+ZTGU4vZInSxZJVzNvqJSBkgzkdaVkmsvKfNvLODz8f5VDNaJxZoHwX1nWrq0H2A2XyAlh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0HpnYUbdTRB3vujEN/4Lit9m1VlhrCE6oho3AuHgVGvY8WRQV
	sbwdWXIYvYdGJe5dSSgY3V6CasQ0ekzDMb+bhD6ovgCNAkA60w14
X-Google-Smtp-Source: AGHT+IG2fUbfuh5wkGWZbcGbeW+oiKoSliAYbpoN9TVWJ2yiOiQqFWSM3p/oEnVvn3XUKpbClxQrlw==
X-Received: by 2002:a17:907:f70a:b0:a99:40e6:157c with SMTP id a640c23a62f3a-a99e39e5061mr856384766b.4.1728930551244;
        Mon, 14 Oct 2024 11:29:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a06169946sm247327066b.204.2024.10.14.11.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 11:29:10 -0700 (PDT)
Message-ID: <a07cadd3-a8ff-4d1c-9dca-27a5dba907c3@gmail.com>
Date: Mon, 14 Oct 2024 20:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related
 improvements
To: Nikolay Aleksandrov <razor@blackwall.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
 <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_112913_746360_322B6CBB 
X-CRM114-Status: GOOD (  21.72  )
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



On 10/14/24 8:35 AM, Nikolay Aleksandrov wrote:
> On 13/10/2024 21:54, Eric Woudstra wrote:
>> This patchset makes it possible to set up a (hardware offloaded) fastpath
>> for bridged interfaces.
>>
> 
> The subject and this sentence are misleading, you're talking about netfilter bridge
> fastpath offload, please mention it in both places. When you just say bridge fast
> path, I think of the software fast path.
> 

Hello Nikolay,

It would be no problem for me to change the subject and body, if you
think that is better.

The thing is, these patches actually make it possible to set up a fully
functional software fastpath between bridged interfaces. Only after the
software fastpath is set up and functional, it can be offloaded, which
happens to by my personal motivation to write this patch-set.

If the offload flag is set in the flowtable, the software fastpath will
be offloaded. But in this patch-set, there is nothing that changes
anything there, the existing code is used unchanged.

>> To set up the fastpath with offloading, add this extra flowtable:
>>
>> table bridge filter {
>>         flowtable fb {
>>                 hook ingress priority filter
>>                 devices = { lan0, lan1, lan2, lan3, lan4, wlan0, wlan1 }
>>                 flags offload
>>         }
>>         chain forward {
>>                 type filter hook forward priority filter; policy accept;
>> 		ct state established flow add @fb
>>         }
>> }
>>
>> Creating a separate fastpath for bridges.
>>
>>          forward fastpath bypass
>>  .----------------------------------------.
>> /                                          \
>> |                        IP - forwarding    |
>> |                       /                \  v
>> |                      /                  wan ...
>> |                     /
>> |                     |
>> |                     |
>> |                   brlan.1
>> |                     |
>> |    +-------------------------------+
>> |    |           vlan 1              |
>> |    |                               |
>> |    |     brlan (vlan-filtering)    |
>> |    +---------------+               |
>> |    |  DSA-SWITCH   |               |
>> |    |               |    vlan 1     |
>> |    |               |      to       |
>> |    |   vlan 1      |   untagged    |
>> |    +---------------+---------------+
>> .         /                   \
>>  ------>lan0                 wlan1
>>         .  ^                 ^
>>         .  |                 |
>>         .  \_________________/
>>         .  bridge fastpath bypass
>>         .
>>         ^
>>      vlan 1 tagged packets
>>
>> To have the ability to handle xmit direct with outgoing encaps in the
>> bridge fastpass bypass, we need to be able to handle them without going
>> through vlan/pppoe devices. So I've applied, amended and squashed wenxu's
>> patchset. This patch also makes it possible to egress from vlan-filtering
>> brlan to lan0 with vlan tagged packets, if the bridge master port is doing
>> the vlan tagging, instead of the vlan-device. Without this patch, this is
>> not possible in the bridge-fastpath and also not in the forward-fastpath,
>> as seen in the figure above.
>>
>> There are also some more fixes for filling in the forward path. These
>> fixes also apply to for the forward-fastpath. They include handling
>> DEV_PATH_MTK_WDMA in nft_dev_path_info() and avoiding
>> DEV_PATH_BR_VLAN_UNTAG_HW for bridges with ports that use dsa.
>>
>> Conntrack bridge only tracks untagged and 802.1q. To make the bridge
>> fastpath experience more similar to the forward fastpath experience,
>> I've added double vlan, pppoe and pppoe-in-q tagged packets to bridge
>> conntrack and to bridge filter chain.
>>
>> Eric Woudstra (12):
>>   netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit
>>     direct
>>   netfilter: bridge: Add conntrack double vlan and pppoe
>>   netfilter: nft_chain_filter: Add bridge double vlan and pppoe
>>   bridge: br_vlan_fill_forward_path_pvid: Add port to port
>>   bridge: br_fill_forward_path add port to port
>>   net: core: dev: Add dev_fill_bridge_path()
>>   netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
>>   netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
>>   netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
>>   netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to
>>     nft_dev_path_info()
>>   bridge: br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
>>   netfilter: nft_flow_offload: Add bridgeflow to nft_flow_offload_eval()
>>
>>  include/linux/netdevice.h                  |   2 +
>>  include/net/netfilter/nf_flow_table.h      |   3 +
>>  net/bridge/br_device.c                     |  20 ++-
>>  net/bridge/br_private.h                    |   2 +
>>  net/bridge/br_vlan.c                       |  24 +++-
>>  net/bridge/netfilter/nf_conntrack_bridge.c |  86 ++++++++++--
>>  net/core/dev.c                             |  77 +++++++++--
>>  net/netfilter/nf_flow_table_inet.c         |  13 ++
>>  net/netfilter/nf_flow_table_ip.c           |  96 ++++++++++++-
>>  net/netfilter/nf_flow_table_offload.c      |  13 ++
>>  net/netfilter/nft_chain_filter.c           |  20 ++-
>>  net/netfilter/nft_flow_offload.c           | 154 +++++++++++++++++++--
>>  12 files changed, 463 insertions(+), 47 deletions(-)
>>
> 

