Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C074FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbqubTzpuS2fP+77yzNYNU06KQd5UI1+KENLBYyvkA0=; b=pPe3cx6z0uvru5hep46ghnCuJd
	smbjewRrtRzZEUlqXtzYpltdjbhGHnbUhyXOMy8IaJ3+dxDzv/KxfxdzPpNSq/frUvfoENsYzVGtK
	GiLBWfP+CaeMxnAENx68xrGKFPKxn5bj4X/gh1Kk7OBK/UlI1nHWzWFP4mgBLQZm0DWXrJDuCIc6q
	w9T+e7H8LPHxBKEuAXCn7urA+L7rGV1JRp86y0g/2TlIKjO3ESqAvSOF1HMA4ZwkAknLxG9ZxxUnb
	4Ute/ueiBau/5PV0MPxk2m0uXp+2GgonlF1sWihitZnxOM8evZWfAzYDmIknZIEh3/A75wMXjftDU
	guyIMNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwEX-0046Qz-T4; Thu, 29 Sep 2022 16:17:57 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwEI-0046Lb-AM; Thu, 29 Sep 2022 16:17:43 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id C3F251884D0E;
	Thu, 29 Sep 2022 16:17:40 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id B9E4D2500370;
	Thu, 29 Sep 2022 16:17:40 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id AFFD09EC0002; Thu, 29 Sep 2022 16:17:40 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 29 Sep 2022 18:17:40 +0200
From: netdev@kapio-technology.com
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
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
 Machata <petrm@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, Florent
 Fourcot <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 9/9] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
In-Reply-To: <20220929091143.468546f2@kernel.org>
References: <20220928174904.117131-1-netdev@kapio-technology.com>
 <20220929091143.468546f2@kernel.org>
User-Agent: Gigahost Webmail
Message-ID: <6811b44516cf8bf37678bab23bca80ba@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_091742_533593_18C52748 
X-CRM114-Status: GOOD (  13.49  )
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

On 2022-09-29 18:11, Jakub Kicinski wrote:
> On Wed, 28 Sep 2022 19:49:04 +0200 Hans Schultz wrote:
>> From: "Hans J. Schultz" <netdev@kapio-technology.com>
>> 
>> Verify that the MAC-Auth mechanism works by adding a FDB entry with 
>> the
>> locked flag set, denying access until the FDB entry is replaced with a
>> FDB entry without the locked flag set.
>> 
>> Add test of blackhole fdb entries, verifying that there is no 
>> forwarding
>> to a blackhole entry from any port, and that the blackhole entry can 
>> be
>> replaced.
>> 
>> Also add a test that verifies that sticky FDB entries cannot roam 
>> (this
>> is not needed for now, but should in general be present anyhow for 
>> future
>> applications).
> 
> If you were trying to repost just the broken patches - that's not gonna
> work :(

Sorry, I do not understand what 'broken' patches you are referring to?

I think that the locked port tests should be working?

