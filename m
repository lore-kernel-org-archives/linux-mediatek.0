Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F00C63797
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKUSoejtff77qU9EMHeAwp50PPUBaR6VmVDITAMw72M=; b=sks1QXkNEKm1oR6sj491BM5wvK
	Q474x6ieYLL9ZhsC878eMb++Ur61gbJ9NsBqovU2cdlIfF8jnhasEbaxIsPoAi0rb0QZ5YlSNDhtT
	hg5VXt7aQk7NdovlPWS2zjFEiaGr6PXt4QLkpW1cHPXAe5tUCXMxvSgFxexwOcioqHxUVjlZd90K1
	c5mGABITdGOJBG4KnCBmEPdCHedK8S3oex+imDLeroCopC1gyoi9M3afDT0YoyOepcF+ya5aJ+w7K
	3oqqIDfNJKZmtrbGk89Ys65deOlGZJ3G3oU619eMwz15q3a5npFLjalGsgOikEz/dGhkmMj/Tqn93
	GKLbb6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNU5h-00EeVL-AZ; Thu, 02 Feb 2023 07:33:05 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNU5R-00EeNx-73; Thu, 02 Feb 2023 07:32:50 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 9AAA118841CA;
	Thu,  2 Feb 2023 07:32:47 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 8B72C250007B;
	Thu,  2 Feb 2023 07:32:47 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 7A5E19B403E4; Thu,  2 Feb 2023 07:32:47 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 02 Feb 2023 08:32:47 +0100
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@idosch.org>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Cl=C3=A9m?=
 =?UTF-8?Q?ent_L=C3=A9ger?= <clement.leger@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 4/5] net: bridge: ensure FDB offloaded flag is
 handled as needed
In-Reply-To: <Y9qucziByvXsx5Q0@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-5-netdev@kapio-technology.com>
 <Y9qucziByvXsx5Q0@shredder>
User-Agent: Gigahost Webmail
Message-ID: <d972e76bed896b229d9df4da81ad8eb4@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_233249_423546_317EC794 
X-CRM114-Status: GOOD (  10.31  )
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

On 2023-02-01 19:24, Ido Schimmel wrote:
> 
> This also looks correct, but the function name is not really accurate
> anymore. I guess you can keep it as-is unless someone has a better name
> 
>>  		fdb_delete(br, fdb, swdev_notify);
>>  	else
>>  		err = -ENOENT;
>> --
>> 2.34.1
>> 

I have been wondering if it makes sense to have both external_learn and 
offloaded flags as they now work pretty much the same seen from the 
bridge. But as I don't know other switches, I guess there is some good 
reason to have the two?

