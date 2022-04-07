Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhhzgLkPjiKjgSKOtg+Ftq67dCOlRbTBgLjGpdIP2oU=; b=Nna10dTh3SYbTe
	IBhVezN7p7NlNa1f65rosbHJO4p1DDHaJYb3vtbqj4g4D8DASjBvLgUdFulDGn59D2SkJ5qXcE+Xk
	qiPhivZMlyGjXlA3axYBUYAqw/1kt4izz0+KkhtSNIjkIeU8N/1HI7gde++qRP/sclQlk5iG2EWrc
	+oRgstjUfJ41fcP276NEiYvEMCoLCCH8m6tKYsfoCUsTNsidiq3Q7q0e/t1NvMEvK1h+pKDbbShny
	nAMtKpnaCkS1cGDmDsAVfK6k8Usp7TzBKJAaWOfNxeEHpt9VaSPtL2mVNBGwplQqaCesObfa2c7q/
	4l8PeKBmHNIdUnztcY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncVVX-00DGcc-TH; Thu, 07 Apr 2022 17:01:19 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncVV6-00DGLg-2Z; Thu, 07 Apr 2022 17:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vENSv8lP8Ut37DNoBAoTPYOdif4ADrHDkp52LZIvgnw=; b=UBR+Un0Bt3zC4CZe47z012DyZp
 m3wAU7sKVROLk/oCT88VLlUh/kikSANxEjUIk0bvGYIFpoLSsLUt/A7ZvW46D+dvnTbD0sdngxq2+
 06W6NBg6OBAeWv+1GrUfxHYT3KfHnl3d71TLRDsQPN15hWrcIqNLYZKXMf9Um33/AjZo=;
Received: from p200300daa70ef2000000000000000451.dip0.t-ipconnect.de
 ([2003:da:a70e:f200::451] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ncVUq-0005sP-UU; Thu, 07 Apr 2022 19:00:37 +0200
Message-ID: <d3414eb8-bcf5-094c-8f27-66743dbbd441@nbd.name>
Date: Thu, 7 Apr 2022 19:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 00/14] MediaTek SoC flow offload improvements +
 wireless support
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <164925181755.19554.1627872315624407424.git-patchwork-notify@kernel.org>
 <Yk8J1xjbClhuAdBG@lunn.ch>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <Yk8J1xjbClhuAdBG@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_100052_303436_C14288EB 
X-CRM114-Status: GOOD (  18.08  )
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

On 07.04.22 17:57, Andrew Lunn wrote:
> On Wed, Apr 06, 2022 at 01:30:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
>> Hello:
>> 
>> This series was applied to netdev/net-next.git (master)
>> by David S. Miller <davem@davemloft.net>:
>> 
>> On Tue,  5 Apr 2022 21:57:41 +0200 you wrote:
>> > This series contains the following improvements to mediatek ethernet flow
>> > offload support:
>> > 
>> > - support dma-coherent on ethernet to improve performance
>> > - add ipv6 offload support
>> > - rework hardware flow table entry handling to improve dealing with hash
>> >   collisions and competing flows
>> > - support creating offload entries from user space
>> > - support creating offload entries with just source/destination mac address,
>> >   vlan and output device information
>> > - add driver changes for supporting the Wireless Ethernet Dispatch core,
>> >   which can be used to offload flows from ethernet to MT7915 PCIe WLAN
>> >   devices
> 
> Hi David
> 
> It seems very early to merge this. The discussion of if the files are
> even in the right places has not even finished. And Arnd seems to not
> want parts of this in his subsystem. And there are some major
> architecture issues which need discussing...
> 
> I think you should revert this.
How about I simply send follow-up patches that move the relevant pieces 
to net?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
