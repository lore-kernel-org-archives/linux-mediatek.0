Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EF3D1A429
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGGL1J/PYpfVQt9U8v/NWEtE6h5sWLzedGtSBPsspeY=; b=jjwkTEGI0ZAjCFPfbKLdpz9o05
	EojTgtR5UZ+9u7as6OpS/2PR7Jagr4ohOiocSX6jESQ7C5MAPVMDcfT7DMFEK7Yd05WnWJy5oC/0h
	EPYRM7BC+lGufcAMRC5S6Y/dW4UedLTeyv3xevG1bgCe6p/zmyWLSSTTxRqIz4Igi2pP8Z2f2mRWR
	zFOc+ES3PhMYGyB5wzLRiQcHhTVEUta3uzgR6FgVSoVbipfNy5znt4OiBlQPfUHWrM8/ItBk5ywZE
	Y1wmL++Hbeal2ObDQgQlJaFKm4R6r9H5xBGUTqjYpTqjAksV6sShsAdcfeGrurm0cOpRjQnza+Ovq
	QpYJ69dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EXc-00000003tBv-2CrY;
	Mon, 14 Oct 2024 06:26:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ET5-00000003sKB-14zn
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 06:22:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a99650da839so685728566b.2
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1728886929; x=1729491729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGGL1J/PYpfVQt9U8v/NWEtE6h5sWLzedGtSBPsspeY=;
        b=hoHB7RVcwVf0BeKy4N6FIaVXC7yr2umQkdUmG/fy25u8unlwguJKbSlzZmUeEniUQv
         ryM6fR36Ehr5Q/UvpE0lxUKUwBqny9XuBEDHtpTluyJ/+jjNaNaxUFIuN/ckZa2TNEaB
         ngGyUyzyai4RajAHDLnMsW7JuYXKHiX2mh+OIvWUxEilvWXJP5wh/iteZcrUGOyMFGmb
         kzXV1ke2vsIRXgwT0ln2T0NtfnDmOFN1Xxk0Aa57VTOEm8eQ4nUoXT5lTCOOtoNf2JM/
         MnYXQ+GycjkZUIBEnBJogME7y3+ImwPhPy6WRR7wzhW6iRvyA91OF/yHsRrHLhuIGxfx
         Edpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728886929; x=1729491729;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGGL1J/PYpfVQt9U8v/NWEtE6h5sWLzedGtSBPsspeY=;
        b=N7JmlctQeCu0/vUFUM76vMy3yMKDgMSmACshn8TA5nkKEMoawTrEP6JBnkfETvuLg6
         Pqy1CtP/yZZbGP3tuzZzVRIcszcq0ugIa6Y1Y9MOwhVYfR11kEoCNs6ZUxDBjXha4vaR
         87J0KJjwHfy6vBchs0TsaoBwE+wbwWmsc/cOpLDc727o2tK2x3ADOTkED+sgF9Nq5PDJ
         Q318rsNHiKvus8cJZMfUSFPinUw8U8THpqAuWgZzzOPMo4tInPFFwBh0d5nZ9BkaxLl8
         RL3ZSesTONLf0NmBlrV+GXyPymDDRVlxBUdBVjY9fx17DKFxtCu2k7NlHRbDz6/DQtM7
         NAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV774lVp7pG+sPiFhh7zO8dM8FAo9y45iXIiiGNSwXOo925NL4ejjs1pGk0xyrf/nu+bP2dm7USjPxJgM929Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNLXQsdLL6BLpol7mwWN7mRj37IH+ah/3P4yox0Y2i4APn9yhW
	nYYtcUB7O9xkj+50l8fZGbpNCUNWAsbMgG/mFaECZYwVhKM8yTD/NPuR7ieBYMY=
X-Google-Smtp-Source: AGHT+IHVur/aV2xDIG/Y4Ciomygy3p/dpFh9piHKROvSG20M9nxSRBAcVlry/ihfS/LPn7d/B70JrQ==
X-Received: by 2002:a17:907:7296:b0:a91:158f:6693 with SMTP id a640c23a62f3a-a99e39cfc56mr689668266b.9.1728886929350;
        Sun, 13 Oct 2024 23:22:09 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f085fb70sm264862666b.7.2024.10.13.23.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:22:08 -0700 (PDT)
Message-ID: <6209405e-7100-43f9-b415-3be8fbcc6352@blackwall.org>
Date: Mon, 14 Oct 2024 09:22:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 11/12] bridge:
 br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
From: Nikolay Aleksandrov <razor@blackwall.org>
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
 <20241013185509.4430-12-ericwouds@gmail.com>
 <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
Content-Language: en-US
In-Reply-To: <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_232211_350967_A73C6DB0 
X-CRM114-Status: GOOD (  21.29  )
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

On 14/10/2024 09:18, Nikolay Aleksandrov wrote:
> On 13/10/2024 21:55, Eric Woudstra wrote:
>> In network setup as below:
>>
>>              fastpath bypass
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
>> |    |               +---------------+
>> |    |               |  DSA-SWITCH   |
>> |    |    vlan 1     |               |
>> |    |      to       |               |
>> |    |   untagged    1     vlan 1    |
>> |    +---------------+---------------+
>> .         /                   \
>>  ----->wlan1                 lan0
>>        .                       .
>>        .                       ^
>>        ^                     vlan 1 tagged packets
>>      untagged packets
>>
>> Now that DEV_PATH_MTK_WDMA is added to nft_dev_path_info() the forward
>> path is filled also when ending with the mediatek wlan1, info.indev not
>> NULL now in nft_dev_forward_path(). This results in a direct transmit
>> instead of a neighbor transmit. This is how it should be, But this fails.
>>
>> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
>> filling in from brlan.1 towards wlan1. But it should be set to
>> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
>> is not correct. The dsa switchdev adds it as a foreign port.
>>
>> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG is
>> set when there is a dsa-switch inside the bridge.
>>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>> ---
>>  net/bridge/br_private.h |  1 +
>>  net/bridge/br_vlan.c    | 18 +++++++++++++++++-
>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
>> index 8da7798f9368..7d427214cc7c 100644
>> --- a/net/bridge/br_private.h
>> +++ b/net/bridge/br_private.h
>> @@ -180,6 +180,7 @@ enum {
>>  	BR_VLFLAG_MCAST_ENABLED = BIT(2),
>>  	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
>>  	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
>> +	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
>>  };
>>  
>>  /**
>> diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
>> index 1830d7d617cd..b7877724b969 100644
>> --- a/net/bridge/br_vlan.c
>> +++ b/net/bridge/br_vlan.c
>> @@ -3,6 +3,7 @@
>>  #include <linux/netdevice.h>
>>  #include <linux/rtnetlink.h>
>>  #include <linux/slab.h>
>> +#include <net/dsa.h>
>>  #include <net/switchdev.h>
>>  
>>  #include "br_private.h"
>> @@ -100,6 +101,19 @@ static void __vlan_flags_commit(struct net_bridge_vlan *v, u16 flags)
>>  	__vlan_flags_update(v, flags, true);
>>  }
>>  
>> +static inline bool br_vlan_tagging_by_switchdev(struct net_bridge *br)
> 
> no inline in .c files and also constify br
> 
>> +{
>> +#if IS_ENABLED(CONFIG_NET_DSA)
>> +	struct net_bridge_port *p;
>> +
>> +	list_for_each_entry(p, &br->port_list, list) {
>> +		if (dsa_user_dev_check(p->dev))
> 
> I don't think this can change at runtime, so please keep a counter in
> the bridge and don't walk the port list on every vlan add.
> 

you can use an internal bridge opt (check br_private.h) with a private opt
that's set when such device is added as a port, no need for a full counter
obviously

>> +			return false;
>> +	}
>> +#endif
>> +	return true;
>> +}
>> +
>>  static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>>  			  struct net_bridge_vlan *v, u16 flags,
>>  			  struct netlink_ext_ack *extack)
>> @@ -113,6 +127,8 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>>  	if (err == -EOPNOTSUPP)
>>  		return vlan_vid_add(dev, br->vlan_proto, v->vid);
>>  	v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV;
>> +	if (br_vlan_tagging_by_switchdev(br))
>> +		v->priv_flags |= BR_VLFLAG_TAGGING_BY_SWITCHDEV;
>>  	return err;
>>  }
>>  
>> @@ -1491,7 +1507,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
>>  
>>  	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
>> -	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
>> +	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
>>  	else
>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
> 


