Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A5AECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X+A/CY6hCesiBm0B3HPbEZOmy/FGctIKVvXMEfqC44=; b=U7HbpOHQGPAmWl/di0n40MjKhB
	xOb1ZXqZdJzqCkEiZkQTIaJu4YxgCm/wpRdvHOuB2/cQn7NIaF+6WypZN4GqjnspIiIewWTt1cJcZ
	uMT6G/QlhAfDKe+vlAwph9GNBxWiAx4cpkwW4LPaKiSau/TkdXsX/tAn5FFasCFE3yQlTtlmV9odQ
	+uY0t7IlCufwO4ibwN7ElnZlFoz3SgB/oRBHuw2CDI2NKrtsvFWcy4tm3t5c5CXmxhiXroP2BB7PJ
	7FTI9jzyC6t7mx9v/7L/qFC1bTJ99bK5yaryVg4sTqRlNYZC3z9tdNV0ee5GqvHoTv54QsgVSkO0m
	4KOaxZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSdAy-008I68-PA; Mon, 29 Aug 2022 11:43:32 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSdAm-008Htg-3C; Mon, 29 Aug 2022 11:43:21 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 5AC4E1884942;
	Mon, 29 Aug 2022 11:43:18 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 4B03125032B7;
	Mon, 29 Aug 2022 11:43:18 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 42CC79EC0001; Mon, 29 Aug 2022 11:43:18 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 13:43:18 +0200
From: netdev@kapio-technology.com
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Shuah Khan
 <shuah@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>, Ido
 Schimmel <idosch@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 net-next 1/6] net: bridge: add locked entry fdb flag to
 extend locked port feature
In-Reply-To: <e9eb5b72-073a-f182-13b7-37fc53611d5f@blackwall.org>
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-2-netdev@kapio-technology.com>
 <e9eb5b72-073a-f182-13b7-37fc53611d5f@blackwall.org>
User-Agent: Gigahost Webmail
Message-ID: <e1e07c4ebdcc494d9a20d1a8ec398b48@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_044320_338330_D9F6D89C 
X-CRM114-Status: UNSURE (   9.32  )
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

> On 2022-08-27 13:30, Nikolay Aleksandrov wrote:
>> @@ -879,6 +888,10 @@ void br_fdb_update(struct net_bridge *br, struct 
>> net_bridge_port *source,
>>  						      &fdb->flags)))
>>  					clear_bit(BR_FDB_ADDED_BY_EXT_LEARN,
>>  						  &fdb->flags);
>> +				if (source->flags & BR_PORT_MAB)
>> +					set_bit(BR_FDB_ENTRY_LOCKED, &fdb->flags);
>> +				else
>> +					clear_bit(BR_FDB_ENTRY_LOCKED, &fdb->flags);
> Please add a test for that bit and only then change it.
> 

Okay, I have revised this part now. I hope that it is suitable?

@@ -749,6 +756,10 @@ void br_fdb_update(struct net_bridge *br, struct 
net_bridge_port *source,
                                                       &fdb->flags)))
                                         
clear_bit(BR_FDB_ADDED_BY_EXT_LEARN,
                                                   &fdb->flags);
+                               /* Allow roaming from an unauthorized 
port to an
+                                * authorized port */
+                               if 
(unlikely(test_bit(BR_FDB_ENTRY_LOCKED, &fdb->flags)))
+                                       clear_bit(BR_FDB_ENTRY_LOCKED, 
&fdb->flags);
                         }

                         if (unlikely(test_bit(BR_FDB_ADDED_BY_USER, 
&flags)))


