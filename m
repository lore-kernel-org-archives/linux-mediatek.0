Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0903C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gc0Kzp1pJbChRkYDVqtI57ISWsMVZK02tduByriKmvM=; b=I79lmA+nmCbhsD
	oJAKxD/8ap5V5j5JurGWOM6ZxOBU2zp6bHGB+onZeFA60NOkk7RuQ8wAf9+0K6ZYaxH5Ko1mOJ+5V
	+xb74MXzqx2458BWoHYHaj1JH50gJntals+YlNIyi78qqVWx2K0bcIVbx2xstzYhE9q08fVhHFlMs
	nQ4rmOMSyQUExQ46FN4f6x3x3q5rOr9Z24uF59+aHHQKWqfQ7VuPpMm5Xqmo5m1dsUf8lGg3Bx6tU
	B3DkcABjnHgXbJWnyRhfAvzQvTtwbzdkCnX/jrp4eC7MVyUNwh7RjwbJE/cZXmfhAkYL1/E6E0Oqx
	EFt2PP8Mx76zL7claXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncW1i-00DPS7-2V; Thu, 07 Apr 2022 17:34:34 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncW1V-00DPOi-J3; Thu, 07 Apr 2022 17:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BENyw9REzFw21Y9JYWQhGCjQdTS7poSOOzrBA1Jfnw8=; b=Ycfnwn8Fzr8gGTr7Hubc5fcU2L
 4ea8L+1tJMF9elbvlR8oi5Y1o83X5vAXMHeNu6wZjqswREt+J7YXxuGECdVW1q5TcDoXuoCizx29u
 Z7cYRki96aAmgz9tTFslS7F8fDSkfmHWzopvgOZBQjCasPRHiZWiMyV9htx4fFnvIwQc=;
Received: from p200300daa70ef200411eb61494300c34.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:411e:b614:9430:c34] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ncW1O-0007dq-Iz; Thu, 07 Apr 2022 19:34:14 +0200
Message-ID: <f038a8b1-bda5-e336-dd75-677798f602eb@nbd.name>
Date: Thu, 7 Apr 2022 19:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2 00/14] MediaTek SoC flow offload improvements +
 wireless support
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <164925181755.19554.1627872315624407424.git-patchwork-notify@kernel.org>
 <Yk8J1xjbClhuAdBG@lunn.ch> <d3414eb8-bcf5-094c-8f27-66743dbbd441@nbd.name>
 <Yk8fPe6wWFFfXESJ@lunn.ch>
Content-Language: en-US
In-Reply-To: <Yk8fPe6wWFFfXESJ@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_103421_844879_5B4A4A66 
X-CRM114-Status: GOOD (  28.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07.04.22 19:28, Andrew Lunn wrote:
> On Thu, Apr 07, 2022 at 07:00:36PM +0200, Felix Fietkau wrote:
>> On 07.04.22 17:57, Andrew Lunn wrote:
>> > On Wed, Apr 06, 2022 at 01:30:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
>> > > Hello:
>> > > 
>> > > This series was applied to netdev/net-next.git (master)
>> > > by David S. Miller <davem@davemloft.net>:
>> > > 
>> > > On Tue,  5 Apr 2022 21:57:41 +0200 you wrote:
>> > > > This series contains the following improvements to mediatek ethernet flow
>> > > > offload support:
>> > > > > - support dma-coherent on ethernet to improve performance
>> > > > - add ipv6 offload support
>> > > > - rework hardware flow table entry handling to improve dealing with hash
>> > > >   collisions and competing flows
>> > > > - support creating offload entries from user space
>> > > > - support creating offload entries with just source/destination mac address,
>> > > >   vlan and output device information
>> > > > - add driver changes for supporting the Wireless Ethernet Dispatch core,
>> > > >   which can be used to offload flows from ethernet to MT7915 PCIe WLAN
>> > > >   devices
>> > 
>> > Hi David
>> > 
>> > It seems very early to merge this. The discussion of if the files are
>> > even in the right places has not even finished. And Arnd seems to not
>> > want parts of this in his subsystem. And there are some major
>> > architecture issues which need discussing...
>> > 
>> > I think you should revert this.
>> How about I simply send follow-up patches that move the relevant pieces to
>> net?
> 
> There has just been comments from Rob about the binding. I've not yet
> looked at the code, but if i remember correctly, v1 had some
> interaction with the DSA tagger, so i do want to look at it.
> 
> I'm also wondering if there is anything common here with IPA. It is an
> accelerator which sits between the WiFi and the mobile phone baseband
> device.
I don't think it has much in common with IPA. WED doesn't completely sit 
between WiFi and the ethernet MAC, it just captures some (but not all) 
of the DMA rings and intercepts IRQs.

> I really would prefer that a proper review of this code was made, by
> netdev people, and the bigger architecture questions looked at. So
> far, all the reviewers have been from outside netdev.
Sure. I will definitely quickly fix any issues that show up. I did 
submit this series once already a while back, and there hasn't really 
been any feedback on it.

- Felix


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
