Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EFDC27C76
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Jan 2023 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cs8CQMUnzAkcAdMGkMzha0PghtPkyZLUG0nIyh3RyE=; b=jniKo8VpXUFrOLXy0Dn2Wc97fy
	5XX51bKNgXNVGgAf5ccWdZqsgvC6OTYVySKY7fgvMa7BCrkldEk+KE+d0/W1PDD/5L51mM4+t6uFl
	B9/hrXfyhwW1WNKzEYnj7hnItexF83xsY0TqnK2ec3cAi0scTgh/kzbqC4ffooAEf1O1RDPuVXv+H
	xyuuRzGpYAkMX/NJwOFAnQIhSbhb05Fql7T6INefTV5nazAlxo7O/XtD7t7UvDwNMxSKaynechziA
	X//LwWQlWINYP63oSkjdXINJDtEv/1LbLOB9qhT3YECJPu8BE3QyWQPDsjXMvgIAaCI4mqZ+9RG4U
	V9zyv4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYDf-00FDTl-F7; Sun, 22 Jan 2023 11:09:03 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYDU-00FDR2-Ja; Sun, 22 Jan 2023 11:08:54 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 5FB2618839B5;
	Sun, 22 Jan 2023 11:08:43 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 44DED2500261;
	Sun, 22 Jan 2023 11:08:43 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 3727B9EC000B; Sun, 22 Jan 2023 11:08:43 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Sun, 22 Jan 2023 12:08:42 +0100
From: netdev@kapio-technology.com
To: Vladimir Oltean <olteanv@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung Huh
 <woojung.huh@microchip.com>, "maintainer:MICROCHIP KSZ SERIES ETHERNET
 SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Russell King <linux@armlinux.org.uk>, Christian
 Marangi <ansuelsmth@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [RFC PATCH net-next 2/5] net: dsa: propagate flags down towards
 drivers
In-Reply-To: <20230118230135.szu6a7kvt2mjb3i5@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-3-netdev@kapio-technology.com>
 <20230117231750.r5jr4hwvpadgopmf@skbuf>
 <e4acb7edb300d41a9459890133b928b4@kapio-technology.com>
 <20230118230135.szu6a7kvt2mjb3i5@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <746b27d5f83b95f17eca18e22843951a@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_030852_820427_3560F457 
X-CRM114-Status: GOOD (  12.54  )
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

On 2023-01-19 00:01, Vladimir Oltean wrote:
> On Wed, Jan 18, 2023 at 11:35:08PM +0100, netdev@kapio-technology.com 
> wrote:

>> When the new dynamic flag is true, all drivers will ignore it in patch 
>> #3,
>> so basically nothing will change by that.
> 
> This is not true, because it assumes that DSA never called 
> port_fdb_add()
> up until now for bridge FDB entries with the BR_FDB_STATIC flag unset,
> which is incorrect (it did).
> 
> So what will change is that drivers which used to react to those bridge
> FDB entries will stop doing so.
> 

So the solution to this problem could be to only set the is_dyn flag in 
combination with the added_by_user flag. So an 'and' operation with the 
two in br_switchdev_fdb_populate()?

