Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506ADC54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08xa12eFgF24Q/HExgdKesRSK158jc76k5/A1mMD/dI=; b=aq+TGwN8u/ByVBw+bhbXTPaEM0
	NsTEKo7FaIXZ7aJOiocThCfaHDU5B/ZEq+yFxgmlAhESCiC/BLg6DDteJmOt/jC2SSlhKMmbyOpbs
	ChsI4RrpgC1mrTXuaYMqBpgVHa6MgIoUq0pVGSFbAP44ETSJwP6H4UvdwCK5YtEArlngvKKOy8/Tl
	PUfnKwiyXHfaPsi2EyUipkWesEyQjotpeTX98x27AUHgFfxpebUUc1Dp1sXE+gSsNrIUNbaSDXXvz
	CRIYitVTqq+tyWdTb4sm1EXd+s4X3uEQZFGQYtoj3w2hRE9uzwPzDEb6BkLUd6d/IzzY6ZmhTNWTc
	CPR9VQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQAH-0000000AXSG-31CI;
	Wed, 13 Mar 2024 15:05:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQAC-0000000AXPn-4AAA;
	Wed, 13 Mar 2024 15:05:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42A22C0012;
	Wed, 13 Mar 2024 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710342301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08xa12eFgF24Q/HExgdKesRSK158jc76k5/A1mMD/dI=;
	b=bpQnl2O53b8VNslubfwlRrs7ImLhnBZRI9miQ9brL4i/HTzsv/LTAj56RocdLqLJLKoGny
	DldxBahLEeGZIYaq6nGvwweoK0RZxxCAGLpB3lUtGBxr0vzg+NePAaMp5QVbvGeTNOhXqY
	0Bd51c+TdsuD0Xjs5lcutZp/YDpwzN3sia8HmJD1NJugiryFPoXi2WHCYtKZMEdjrK+6fD
	VZPX8G0BRxGd4xbw+VUiAMm15m4hi8RtDQ469an0lQU4Vpbaar4bHRzELsSYqWlM8guE4I
	DzGIwsu9iTOhSFm8iVlcemcECjbo8FTzHz/PTrGBZW08zaCt2UjiroNmPTWaMQ==
Message-ID: <997db446-030b-4e6a-beea-0ae7d990e7e2@arinc9.com>
Date: Wed, 13 Mar 2024 18:04:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: mt7530: increase reset hold time
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <f594a72a91d12f1d027a06962caa9750@risingedge.co.za>
 <20240312192117.7789-1-justin.swartz@risingedge.co.za>
 <bf0ed70f-e106-4a7f-a98c-de34658feb4d@arinc9.com>
 <e6525cac666a033a5866465abb3e63f1@risingedge.co.za>
 <2640a495-97a0-4669-a53a-e367af956a78@arinc9.com>
 <c4590e9519d0cd788d157a1e1510cc45@risingedge.co.za>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <c4590e9519d0cd788d157a1e1510cc45@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_080505_372670_E87F506F 
X-CRM114-Status: GOOD (  26.44  )
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

On 13.03.2024 16:13, Justin Swartz wrote:
> On 2024-03-13 14:06, Arınç ÜNAL wrote:
>> On 13.03.2024 14:52, Justin Swartz wrote:
>>>
>>> On 2024-03-13 10:59, Arınç ÜNAL wrote:
>>>> This ship has sailed anyway. Now the changes the first patch did must be
>>>> reverted too. I will deal with this from now on, you can stop sending
>>>> patches regarding this.
>>>
>>> At least if the first patch isn't reverted, the approach used is
>>> less likely to result in the problem occuring, IMHO.
>>
>> I disagree that the previous approach is less likely to result in the
>> problem occurring. If you don't like the delay amount we agreed on, feel
>> free to express a higher amount.
> 
> I created and tested a patch to entertain your input about what you
> thought could be a suitable hold period to address the problem, and it
> appeared to work. The criteria being that the crystal frequency selection
> was correct over 20 tests.
> 
> So if only the reset hold period is going to change, I'm good with what
> you had suggested: 5000 - 5100 usec.
> 
> Ultimately the selection of this period should be guided by the timing
> information provided in a datasheet or design guide from the manufacturer.

That's a good point, I agree.

> 
> If you, or anyone else, has such a document that provides this information
> and is able to confirm or deny speculation about any/all timing periods
> related to reset, please do so.

These are the documents I use to program this switch family. I did not
stumble upon a page going over this.

MT7621 Giga Switch Programming Guide v0.3:

https://github.com/vschagen/documents/blob/main/MT7621_ProgrammingGuide_GSW_v0_3.pdf

MT7531 switch chip datasheet:

https://wiki.banana-pi.org/Banana_Pi_BPI-R64#Documents

> 
> 
>> I also disagree on introducing a solution that is in addition to another
>> solution, both of which fix the same problem.
> 
> I'm not sure I understand why you say that. These patches were intended
> to be applied exclusively, or in other words: in isolation - not together.
> 
> Although if they were applied together, it wouldn't really matter.
> 
> For the record, I've only continued to keep this thread alive in the
> hope that some solution to this problem will make it into mainline
> eventually.
> 
> I don't care if it was my original patch, the subsequent patch, or a
> later patch provided by you or someone else. :)

I think you've missed that your patch is already applied. And it won't be
reverted for reasons explained by Paolo in this mail thread.

https://git.kernel.org/netdev/net-next/c/2920dd92b980

So if your patch here were to be applied too, the final mt7530.c would have
the LEDs disabled AND before reset deassertion delay increased.

Arınç

