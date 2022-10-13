Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FD9C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 18:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut4EbarKkpZ9mDezk2g3foovPdourKB9PA9pQp4xLyM=; b=TwqKU6AzJG0jg98uP5mn3KDOrw
	rLc2h2HMCGzuY53T4TfOygv6IKMb1QfIOB2hmLHgNTe+0gco9SmmJ1E0ESw0zMLEzk6Ke3zuhHA/W
	hoflhDl1JsHPPTSfR61o7i7aPMj2VXrWKg42VHbOPwNCx6Cf3x/awlMYezshMKO2yA02/vGdqF16A
	KHfBnsqq6FTXWfuRaRFq+DH17nUuE9+Tadqv9eo4dXa/IexHQvtJtwsPsJIHmr4g5Lr2Czhwf/nOz
	jNMEx0idLGegzh4zHRlyc74YkVGXlHgu3tUbqPR35/gzlklF5Kgh8dhpAfgn0xrOx8AHXI2zWFK2a
	6uACT+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3QJ-00CmPe-22; Thu, 13 Oct 2022 18:59:15 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3Q6-00CmOC-LW; Thu, 13 Oct 2022 18:59:04 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id AED361884BD4;
	Thu, 13 Oct 2022 18:58:57 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 8569E2500015;
	Thu, 13 Oct 2022 18:58:57 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 7DDF49EC0005; Thu, 13 Oct 2022 18:58:57 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 13 Oct 2022 20:58:57 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
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
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>, Petr
 Machata <petrm@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>,
 Hans Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>,
 Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 net-next 3/9] net: switchdev: add support for
 offloading of the FDB locked flag
In-Reply-To: <Y0gbVoeV/e6wzlbM@shredder>
References: <20221009174052.1927483-1-netdev@kapio-technology.com>
 <20221009174052.1927483-4-netdev@kapio-technology.com>
 <Y0gbVoeV/e6wzlbM@shredder>
User-Agent: Gigahost Webmail
Message-ID: <d314ba738b12e28694a955de1301e906@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_115902_880785_71FB9717 
X-CRM114-Status: GOOD (  10.70  )
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

On 2022-10-13 16:06, Ido Schimmel wrote:
>> diff --git a/net/dsa/port.c b/net/dsa/port.c
>> index e4a0513816bb..eab32b7a945a 100644
>> --- a/net/dsa/port.c
>> +++ b/net/dsa/port.c
>> @@ -304,7 +304,7 @@ static int dsa_port_inherit_brport_flags(struct 
>> dsa_port *dp,
>>  					 struct netlink_ext_ack *extack)
>>  {
>>  	const unsigned long mask = BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD |
>> -				   BR_BCAST_FLOOD | BR_PORT_LOCKED;
>> +				   BR_BCAST_FLOOD;
> 
> Not sure how this is related to the patchset.
> 

In general it is needed as a fix because of the way learning with locked 
port is handled in the driver,
so as with MAB and also locked port in the future needing a non-zero 
Port Association Vector (PAV)
for refresh etc to work, inheritance of the locked port flag is a bad 
idea (say bug) and shouldn't have
been in the first place.

