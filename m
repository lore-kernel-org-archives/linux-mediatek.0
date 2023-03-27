Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0525C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 21:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gN1X2K/tBvjGjLYNzWH7jfewqFqoB9kkVZmSTyexhk=; b=1eOqxWG9GKn1H+NsnS1X3c3G5M
	n+ytQfmKyONda0oYSyukOwpVzg1N52PwGcKFrYqIK+qt71S9ICrzBI4kxOQjtjmrcGahUOTei+OYA
	+SLTO476FC4geRE2d80ez7JAEDHL/MFCdVHSHFAa2biHDdzks0mFOkClxJtkNc+pPf21VS8dyV8AE
	6RTL3ZpH6PXQg0Bf5NSAzDRhbsnbklq/ZnKnvU8KhM1dUmdXKOjGXZDRlhh/e7ivFLBkTFsGQ5fD7
	LjHu3ri4uUZrnJfIoT3SIi4JdgH4S0zDV7teZ1fTPts1Xf9AtcfA+c3kOdiZWsSzH6ArKqrRgfP9+
	TxoWY7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgull-00CSzX-10;
	Mon, 27 Mar 2023 21:52:49 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgulh-00CSxX-0w;
	Mon, 27 Mar 2023 21:52:46 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 0E9AE1884564;
	Mon, 27 Mar 2023 21:52:35 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 02FC225042EC;
	Mon, 27 Mar 2023 21:52:35 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id ED01F9B403E2; Mon, 27 Mar 2023 21:52:34 +0000 (UTC)
X-Screener-Id: e32ae469fa6e394734d05373d3a705875723cf1e
Received: from fujitsu (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id 38ACD91201E3;
	Mon, 27 Mar 2023 21:52:34 +0000 (UTC)
From: Hans Schultz <netdev@kapio-technology.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Woojung Huh <woojung.huh@microchip.com>, "maintainer:MICROCHIP KSZ SERIES
 ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, Ido Schimmel <idosch@nvidia.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>, "open
 list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 2/6] net: dsa: propagate flags down towards
 drivers
In-Reply-To: <20230327160009.bdswnalizdv2u77z@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-3-netdev@kapio-technology.com>
 <20230327115206.jk5q5l753aoelwus@skbuf>
 <87355qb48h.fsf@kapio-technology.com>
 <20230327160009.bdswnalizdv2u77z@skbuf>
Date: Mon, 27 Mar 2023 23:49:58 +0200
Message-ID: <87pm8tooe1.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_145245_472315_384E9D95 
X-CRM114-Status: GOOD (  20.58  )
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

On Mon, Mar 27, 2023 at 19:00, Vladimir Oltean <olteanv@gmail.com> wrote:
> A reasonable question you could ask yourself is: why do my BR_FDB_OFFLOADED
> entries have this flag in the software bridge in the first place?
> Did I add code for it? Is it because there is some difference between
> mv88e6xxx and ocelot/felix, or is it because dsa_fdb_offload_notify()
> gets called in both cases from generic code just the same?
>
> And if dsa_fdb_offload_notify() gets called in both cases just the same,
> but no other driver except for mv88e6xxx emits the SWITCHDEV_FDB_DEL_TO_BRIDGE
> which you've patched the bridge to expect in this series, then what exactly
> is surprising in the fact that offloaded and dynamic FDB entries now become
> stale, but are not removed from the software bridge as they were before?

Yes, I see I have missed that the dsa layer already adds the offloaded
flag in dsa_slave_switchdev_event_work() in slave.c.

My first approach was to use the SWITCHDEV_FDB_ADD_TO_BRIDGE event
and not the SWITCHDEV_FDB_OFFLOADED event as the first would set the
external learned flag which is not aged out by the bridge.
I have at some point earlier asked why there would be two quite
equivalent flags and what the difference between them are, but I didn't
get a response.

Now I see the difference and that I cannot use the offloaded flag
without changing the behaviour of the system as I actually change the
behaviour of the offloaded flag in this version of the patch-set.

So if the idea of a 'synthetically' learned fdb entry from the driver
using the SWITCHDEV_FDB_ADD_TO_BRIDGE event from the driver towards the
bridge instead is accepted, I can go with that?
(thus removing all the changes in the patch-set regarding the offloaded
flag ofcourse)

