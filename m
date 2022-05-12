Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1/ud6ebsQJfF9x6G5pYbLwIpnkWeSmswMA2HajPK1g=; b=32lsalnT3YwNWK
	Jfd65d1gY8J9r/Sy2fvemtYaPuqR4qUyFQnq+CPbjHA79vkGhWs2kiYkPTVjWjnbaA1vXtRku6Xqs
	je8J6uugPHkE9BDhMTnjjJUU1Lyzq3d8weLMSnD2rRTVhHveRaTv+kLMxVEydVTsClWBbuD1CSTsY
	Ve1YMa4wMlpyGlgngb2tZ6IbrmCP9ez83zIrcbrOAqRT3Qt55UAC3FjSV5QPS1A3F3/CEZEBt8qda
	NfG2D4PTNX0O50O45Uobp/Wvx87mPMEJKHmyAPEXIbyJ8XmT5BRDg7SDuzXbBe7DtMfDdaxd82V3M
	u1oJWGyHkyEBwO136OIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np8Yg-00Bznj-1X; Thu, 12 May 2022 13:08:46 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np8YL-00Bzdj-Ol; Thu, 12 May 2022 13:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=DTcXjqwJcyjxDHHFvu33WWIok7d6H0qQBE5Az94H2hs=; b=F+dc79CQLfiu3sCXC1DvRCCc56
 gc13CemRbwM8NUWT2JkFc8aghwDjlOZBCMjq2Ke7cioqZ4wYe9Oz3nn/5ch8GaRsv4cum9PLmXZ7K
 ojCob5fiIRKPxbCg3TZ/Ou7LbuC3cePSKi64PXfsXQtk3ZcxGk5oXsiVYTGZGumILHHk=;
Received: from [217.114.218.27] (helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1np8Y2-0004Eq-7W; Thu, 12 May 2022 15:08:06 +0200
Message-ID: <987a1cd5-6f35-d3ac-1d42-5346be7ecb1a@nbd.name>
Date: Thu, 12 May 2022 15:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
 <20220511093245.3266lqdze2b4odh5@skbuf> <YnvJFmX+BRscJOtm@lunn.ch>
 <0ef1e0c2-1623-070d-fbf5-e7f09fc199ca@nbd.name> <Ynz/7Wh6vDjR7ljs@lunn.ch>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
In-Reply-To: <Ynz/7Wh6vDjR7ljs@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_060826_104295_CF060B30 
X-CRM114-Status: GOOD (  25.81  )
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


Hi Andrew,

On 12.05.22 14:39, Andrew Lunn wrote:
>> I just ran some more tests, here's what I found:
>> The switch automatically pads all forwarded packets to 64 bytes.
>> When packets are forwarded from one external port to another, the padding is
>> all zero.
>> Only when packets are sent from a CPU port to an external port, the last 4
>> bytes contain garbage. The garbage bytes are different for every packet, and
>> I can't tell if it's leaking contents of previous packets or what else is in
>> there.
>> Based on that, I'm pretty sure that the hardware simply has a quirk where it
>> does not account for the special tag when generating its own padding
>> internally.
> 
> This does not yet explain why your receiver is dropping the frame. As
> Vladimir pointed out, the contents of the pad should not matter.
> 
> Is it also getting the FCS wrong when it pads? That would cause the
> receiver to drop the frame.
> 
> Or do we have an issue in the receiver where it is looking at the
> contents of the pad?
On the devices that I used for testing before, FCS wasn't reported in my 
captures. Since I can't reproduce the issue of the receiver dropping 
frames anymore, I currently have no way of figuring out what went wrong.

When I was able to reproduce the issue, I'm sure that I switched between 
patched and unpatched builds a few times to make sure that my change 
actually made a difference, which it did.

I do agree that having the garbage bytes in there is technically 
compliant with the spec. On the other hand, based on my observations I 
believe that the hardware's behavior of filling the last 4 bytes with 
seemingly random values only in the case of small frames being sent with 
a CPU special tag is clearly not intentional nor by design.

The issue is also clearly limited to processing packets with the tag 
(which can only come from the CPU), so in my opinion the tag driver is 
the right place to deal with it.

So I guess it comes down to whether you guys think that this is worth 
fixing.

I still consider it worth fixing, because:
- It looks like a hardware bug to me with potentially unknown consequences.
- If it caused issues in my setup, it might do so in other people's 
setups as well.
- I can't rule out potential information leakage from those 4 bytes

I guess if you guys don't think the issue is worth the price of a very 
small performance hit from padding the packets, I will just have to keep 
this as an out-of-tree patch.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
