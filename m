Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED97CFC283
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OEZSManMbDy+6XUNveh1qOkExWxjzK6ls7MTgzx6HM=; b=OvY2wn9g9qkCY/
	s4yYRunHFvijkEkYgDKNArgt0555Z2ETzqogm8E/2kRWRxWJnW4NB5NZZ/Hs1SMS/dYmO+aXPp28C
	WUfOW4dYBxZnT9nJNxZaaiP9ROcsOd1xKzRSx6oNcKGP8RAuYHz7HZOfItzJ87x9fa2MqqmL4X364
	knrPNy8mp3g0dI3j/3HVuvNRVWr3mQNxU0SNCPif+tGR/ZMFf2LdiVqRdXG4UQwWi1SgqVzllFY5q
	cQxuYmQR5p6vlD9qPOvz2eEgUCBPBEv/u0JHLozGASgzGghTefl/JGYGFUTwAOKsWe8m5HOupusgd
	VPrpTV9sxqkan7H94r9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0emY-00000007q2G-0X9F;
	Tue, 15 Oct 2024 10:28:02 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0el5-00000007pme-1mbw;
	Tue, 15 Oct 2024 10:26:32 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb51f39394so18325681fa.2;
        Tue, 15 Oct 2024 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728987989; x=1729592789; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OEZSManMbDy+6XUNveh1qOkExWxjzK6ls7MTgzx6HM=;
        b=czrI/r6YCEGDoWSJKQ8x9q9FLQ3rJLqB697Bvt4NwtzrPiS+oqV8sZb8znR9NaiuQV
         /zI0UOIl6HQuMt8J9ZCEoWLSzKb3eLoRLsxC1PiXTrcJN4ZQrYQmHWuPD3Z0zm3fZQDJ
         HaMsbae42ghK89Z3JBxCm/IhOKwOeKLJfCg57a0P3ayZ3ps1DCMpU1pWdBg4j4/PM2em
         9+qv2h3TSm2nR6G9AId7BMrmpF57PTVBINUWJ/ZJM4EHTtuzElGtvcOnpRxDq0CwrE8j
         ZDjIPdrvyitoymMYVrnla+uXSmp5CDfkgvCS5+gZJb3q25fVASYkMpW/PPca5rxDax7R
         IfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728987989; x=1729592789;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OEZSManMbDy+6XUNveh1qOkExWxjzK6ls7MTgzx6HM=;
        b=JrVO3OFafQsXVQsSNkNVw+WOIHxzAG5O8W2lknYfKVoqaTHjyYbmh3YPh7EjJkqiMf
         2rwDBhNFdR/+/Id/JxczPih1vAUgSm8zH8TtBMHRl1JV8rtkOV4A93dtiIdVgfJYfqCj
         hBx9DtP5fJ1kxv58hhFY0JBC68jqL4HXog+L/wkdHOPG8D0EPbNCRXeZiWhZpXiobG3q
         A0uddBc+/SYWVO8hgn/18NQIPXfwlm7TcLkWOU3Xgrzeekrdk7OF9QfaPrKiUNscCkDc
         eHxh9rz1LxePtE8vJFStHXpuGA55uLmY3LeUu+rgRMnwwu9wlDj/Sv/XwarTQ1dPF5DW
         ZXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV29elm6gjnyUXqgEZtLoWleknpbSpzBWxN+YErXkxhkrrD/WWyDWXFVhsIK7YYrIzD4XM1h9SgMXhF0tNxYMw=@lists.infradead.org, AJvYcCVphsF3NLonviwtZ7o1B5b40jRL6lYwla5pY5WqtzZcjwsn+AE/tjEONAVxJ3CmkCgbEm5UuohSKNm64FzNW9RY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhf854dpZuOTFH7J6Gav0JUY6dpQVKzPUtbSqLr2LhfjNppyjD
	ECFA22V/5dpKCwW2mgNPAqe4PTVVZOPO0AkiKZN8DCamj5+KvPnd
X-Google-Smtp-Source: AGHT+IG0LiZB9HnhbCpZVWzqC6TRdvuR7h3XUUllI7Bu0NEUbFWH+GXR3fi/dRhYBz6E26VF5ntuQA==
X-Received: by 2002:a2e:4e11:0:b0:2fb:5060:7037 with SMTP id 38308e7fff4ca-2fb506070e0mr27373511fa.41.1728987988831;
        Tue, 15 Oct 2024 03:26:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d77996asm529535a12.74.2024.10.15.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:26:28 -0700 (PDT)
Message-ID: <b919a6b1-1c07-4fc9-b3dc-a7ac2f3645bf@gmail.com>
Date: Tue, 15 Oct 2024 12:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 11/12] bridge:
 br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
To: Vladimir Oltean <olteanv@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-12-ericwouds@gmail.com>
 <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
 <6209405e-7100-43f9-b415-3be8fbcc6352@blackwall.org>
 <20241014144613.mkc62dvfzp3vr7rj@skbuf>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <20241014144613.mkc62dvfzp3vr7rj@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_032631_503464_5F604BB0 
X-CRM114-Status: GOOD (  36.44  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/14/24 4:46 PM, Vladimir Oltean wrote:
> Keeping the full email body untrimmed for extra context for the newly
> added people.
> 
> On Mon, Oct 14, 2024 at 09:22:07AM +0300, Nikolay Aleksandrov wrote:
>> On 14/10/2024 09:18, Nikolay Aleksandrov wrote:
>>> On 13/10/2024 21:55, Eric Woudstra wrote:
>>>> In network setup as below:
>>>>
>>>>              fastpath bypass
>>>>  .----------------------------------------.
>>>> /                                          \
>>>> |                        IP - forwarding    |
>>>> |                       /                \  v
>>>> |                      /                  wan ...
>>>> |                     /
>>>> |                     |
>>>> |                     |
>>>> |                   brlan.1
>>>> |                     |
>>>> |    +-------------------------------+
>>>> |    |           vlan 1              |
>>>> |    |                               |
>>>> |    |     brlan (vlan-filtering)    |
>>>> |    |               +---------------+
>>>> |    |               |  DSA-SWITCH   |
>>>> |    |    vlan 1     |               |
>>>> |    |      to       |               |
>>>> |    |   untagged    1     vlan 1    |
>>>> |    +---------------+---------------+
>>>> .         /                   \
>>>>  ----->wlan1                 lan0
>>>>        .                       .
>>>>        .                       ^
>>>>        ^                     vlan 1 tagged packets
>>>>      untagged packets
>>>>
>>>> Now that DEV_PATH_MTK_WDMA is added to nft_dev_path_info() the forward
>>>> path is filled also when ending with the mediatek wlan1, info.indev not
>>>> NULL now in nft_dev_forward_path(). This results in a direct transmit
>>>> instead of a neighbor transmit. This is how it should be, But this fails.
>>>>
>>>> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
>>>> filling in from brlan.1 towards wlan1. But it should be set to
>>>> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
>>>> is not correct. The dsa switchdev adds it as a foreign port.
>>>>
>>>> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG is
>>>> set when there is a dsa-switch inside the bridge.
>>>>
>>>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>>>> ---
>>>>  net/bridge/br_private.h |  1 +
>>>>  net/bridge/br_vlan.c    | 18 +++++++++++++++++-
>>>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
>>>> index 8da7798f9368..7d427214cc7c 100644
>>>> --- a/net/bridge/br_private.h
>>>> +++ b/net/bridge/br_private.h
>>>> @@ -180,6 +180,7 @@ enum {
>>>>  	BR_VLFLAG_MCAST_ENABLED = BIT(2),
>>>>  	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
>>>>  	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
>>>> +	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
>>>>  };
>>>>  
>>>>  /**
>>>> diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
>>>> index 1830d7d617cd..b7877724b969 100644
>>>> --- a/net/bridge/br_vlan.c
>>>> +++ b/net/bridge/br_vlan.c
>>>> @@ -3,6 +3,7 @@
>>>>  #include <linux/netdevice.h>
>>>>  #include <linux/rtnetlink.h>
>>>>  #include <linux/slab.h>
>>>> +#include <net/dsa.h>
>>>>  #include <net/switchdev.h>
>>>>  
>>>>  #include "br_private.h"
>>>> @@ -100,6 +101,19 @@ static void __vlan_flags_commit(struct net_bridge_vlan *v, u16 flags)
>>>>  	__vlan_flags_update(v, flags, true);
>>>>  }
>>>>  
>>>> +static inline bool br_vlan_tagging_by_switchdev(struct net_bridge *br)
>>>
>>> no inline in .c files and also constify br
>>>
>>>> +{
>>>> +#if IS_ENABLED(CONFIG_NET_DSA)
>>>> +	struct net_bridge_port *p;
>>>> +
>>>> +	list_for_each_entry(p, &br->port_list, list) {
>>>> +		if (dsa_user_dev_check(p->dev))
>>>
>>> I don't think this can change at runtime, so please keep a counter in
>>> the bridge and don't walk the port list on every vlan add.
>>>
>>
>> you can use an internal bridge opt (check br_private.h) with a private opt
>> that's set when such device is added as a port, no need for a full counter
>> obviously
> 
> To continue on Nikolay's line of thought...
> 
> Can you abstractly describe which functional behavior do you need the
> bridge port to perform, rather than "it needs to be a DSA user port"?

Hello Vladimir,

This has to do with the sequence of events, when dealing with vlan
tagging in a bridge. When looking at the ingress of untaggged packets,
that will be tagged by a certain port of that bridge, it depends when
this tagging happens, in respect to the netfilter hook. This describes
the existing code:

Because we are using dev_fill_forward_path(), we know in all cases that
untagged packets arive and are tagged by the bridge.

In the case (#1) off a switchdev, the tagging is done before the packet
reaches the netfilter hook. Then the software fastpath code needs to
handle the packet, as if it is incoming tagged, remembering that this
tag was tagged at ingress (tuple->in_vlan_ingress). We need to remember
this, because dealing with hardware offloaded fastpath we then need to
skip this vlan tag in the hardware offloaded fastpath in
nf_flow_rule_match() and nf_flow_rule_route_common().

In all other cases (#2), 'normal' ports (ports without switchdev and
dsa-user-ports) the tagging is done after packet reaches the
netfilter-hook. Then the software fastpath code needs to handle the
packet, as incoming untagged.

(Of course the dsa-user-port is more complicated, but it all handled by
the dsa architecture so that it can be used as a 'normal' port.)

In both cases #1 and #2 also the other direction is taken into account.

To decide which case to apply, the code looks at
BR_VLFLAG_ADDED_BY_SWITCHDEV, which was actually used for something
else, but it is easily available in the code at that point and seemed to
work, so far...

But as it turns out, this flag is also set for foreign ports added to
the dsa-switchdev. This means that case #1 is applied to the foreign dsa
port. This breaks the software fastpath and, with packets not reaching
their destination, also the hardware offloaded fastpath does not start.
We need to apply case #2.

So actually we need to know, inside br_vlan_fill_forward_path_mode(),
whether or not net_bridge_port *dst is a foreign port added to the dsa
switchdev. Or perhaps there is another way to find out we have to apply
case #2.

> switchdev_bridge_port_offload() has a mechanism to inform the bridge
> core of extra abilities (like tx_fwd_offload). Perhaps you could modify
> the DSA drivers you need to set a similar bit to inform the bridge of
> their presence and ability. That would also work when the bridge port is
> a LAG over a DSA user port.
> 
> Also, please also CC DSA maintainers when you use DSA API outside
> net/dsa/ and drivers/net/dsa/. I am in the process of revamping the
> public DSA API and would like to be in touch with changes as they are
> made.
> 
>>>> +			return false;
>>>> +	}
>>>> +#endif
>>>> +	return true;
>>>> +}
>>>> +
>>>>  static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>>>>  			  struct net_bridge_vlan *v, u16 flags,
>>>>  			  struct netlink_ext_ack *extack)
>>>> @@ -113,6 +127,8 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>>>>  	if (err == -EOPNOTSUPP)
>>>>  		return vlan_vid_add(dev, br->vlan_proto, v->vid);
>>>>  	v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV;
>>>> +	if (br_vlan_tagging_by_switchdev(br))
>>>> +		v->priv_flags |= BR_VLFLAG_TAGGING_BY_SWITCHDEV;
>>>>  	return err;
>>>>  }
>>>>  
>>>> @@ -1491,7 +1507,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
>>>>  
>>>>  	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
>>>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
>>>> -	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
>>>> +	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
>>>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
>>>>  	else
>>>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
>>>

