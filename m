Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F061C54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKGkz+5yG2rxE8g4ISa2cT/1YcQdAFQoNiwBx3QyI0I=; b=yNqFFBE7D9y04R2ywDM+gY/mK0
	uCMcijHL0xEwnWUVMZcgxMVWouBX+DPV6JIA7B3/aHmgIWfiUmaLM1Nj+io0SELJoSkaaaY1Rvd50
	mzyvlNUeStkhgKQHKZ/e+TyxYy03zZ3BjqhhKSL3kAqyB2J1p3RShXDcPreu286y1K2g6TGwfw/i6
	ZQ1qlCOL1YqGeI+o1LIGKhJOLT9oeqa92gULcM1jlSOZpHQYmWiCrl8LL39eo5St3iXiJLFWaoSi8
	0Xx9qVMSYsh7rTRFnyr7X5IdT6n2g2cTV0u4wSqcAFCx/+XwSUemcVVqPpB6dWaJ1ITF2WRVjeyjM
	Xr87YQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQgv-0000000AdU4-42nd;
	Wed, 13 Mar 2024 15:38:53 +0000
Received: from outgoing6.flk.host-h.net ([188.40.0.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQgq-0000000AdSz-3lqb;
	Wed, 13 Mar 2024 15:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=oKGkz+5yG2rxE8g4ISa2cT/1YcQdAFQoNiwBx3QyI0I=; b=C8kd2jv3ZOQYnC
	Ei8vdK0ciGe8+LTwhqUnmaLxBr49zBTG6U+FzFo4U1tbD/3tcKSrFkC4WsOxHzWX15p7DOKWBWv1r
	lwW4wzdFK2Be3a38gruQF2YXZDEYlDO2q56Zdcryg/xhFaP1bpaj4OOoqeIUEVswmAQHwHCeUf97q
	X6Z/JYOBGmAYOOoWCq5kFiVJK+MlrhFix1urbLo/ckEmsZfU/CkahAgK5y0UIwVZdtxSg5GJXdeuc
	EmLWXs7URR1fdTsBcT5ouH1tpzDIxG1APEku/BNrLaVmKl6B/nkPxl5xfghn7jOIenh+ASqPKA2G7
	uILULVi1KX67NBi9peiQ==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam2-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rkQgg-0021r6-Of; Wed, 13 Mar 2024 17:38:42 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rkQge-0006Bo-8W; Wed, 13 Mar 2024 17:38:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 13 Mar 2024 17:38:35 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: dsa: mt7530: increase reset hold time
In-Reply-To: <997db446-030b-4e6a-beea-0ae7d990e7e2@arinc9.com>
References: <f594a72a91d12f1d027a06962caa9750@risingedge.co.za>
 <20240312192117.7789-1-justin.swartz@risingedge.co.za>
 <bf0ed70f-e106-4a7f-a98c-de34658feb4d@arinc9.com>
 <e6525cac666a033a5866465abb3e63f1@risingedge.co.za>
 <2640a495-97a0-4669-a53a-e367af956a78@arinc9.com>
 <c4590e9519d0cd788d157a1e1510cc45@risingedge.co.za>
 <997db446-030b-4e6a-beea-0ae7d990e7e2@arinc9.com>
Message-ID: <3146df060620f08a620417cfcf2b2179@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.21)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/2O3gPR4g/CqkfWst+Ku0pPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIv+fXqqb3FJ1Z7kkAIev0U9CKH/oA07tJunDPm536TODb5GPR
 oyaaXp1VNA9dXvxV+mFktoWo3CKg4C3LDJ75vu2U4GT70q7ZqN/P49BncZ5XB7lfx9K88uL/WnJE
 LAEP514Y/yfAEbrTclu3OeNcbACmFr3ts0d2E6vXySsvfMaT9Bjf4etJ827HW1/sdZ81dz6BqXHU
 oYg+nmOeSIjjxA24TPuOyBrko5yKpcR03QEJ9DjWmjcfK/FpTD0spWG+rMYoj8CdNq4vLYsMDbt4
 2oUP1Ae/eGZl2OLANHAHEjHENEhX9cq65nsXPA0MIFDIPOMDW/6+MC+5Mq5RH9OoW0W22an/ubzj
 InB/ImqScRfGyrhHVstPeAuxsRhUFJC4TtSvIahFt3uEpT0304dV2Yoz1SesQUA6bnjJZT6m9lal
 9vikoy50DqR3hu/rL5PGAoTDzn0QdoxFeruM0Uhu+b+DV6LvumMBiTpVm+SuIysihnVW8zB2Qi26
 vkVALycwzSdeC1kd8cXa71WqOc72jXbRpMw6Agze1f399OurHEyYS7nq+EBNvgiWKNNSkdVDZOrL
 5kxgO94lq2025NSImfKeGaSpuwkt9kMFaoxOFH3nT6Zph4wUZj+IQLUKRJzeMs4VIrisX+dtrxYn
 /0jYEvj5QBAPtzfeVlNHdCJmwgf0M7fnqgzRvCMiN68tcHQey84mBB4XoB473XOJmIRPynE3O7YZ
 oFBs6I7QuC1BjGNT52hVLEr/9PrrMm81h6IAYzikeIJfw26MB/V1E5BP9Gv0xI1YXOxC1lZqyFpL
 AwQr6muMti2YanICQnMITeB2fd0UyjU/MIq3Vtx6CgQGHtezYqxGMqsKjARq8PBC4qgGsfAERwCB
 JFs7XjZYbJPBsmpIto2O4JO2fx1gIuNHgi11AwJSTGCrOFs22K1ZnDqAw3gLmOBPHazhChxq9nGW
 aSi6bFHidB1VgzDzDZn/+QEiRQv+PVjjwa+Z5RFCOMRmYvGVP5J/K7tDFQHNyAqzdfFYVDBYJee7
 gx/u82RtU4hygYFW3IzBm5Ionz3C0cE0mVfWLKEgol9rYV4JEcNP1rJoln/cD8h/RIvkzXRTCYvX
 WLQhlD92+1l+zHfJg1FMwntsduNBxKPaTpE5L8d4VqFy6yKUFQtzhTlGiGL9B13u48a8ZFhRnJqB
 D+KeQursqcSfLN3+f9txz8J8C1oTIIDSVMZhrIoAWTF5tIdhy/UIEBYDcZg+Q8UhuRLyBn1+pvlH
 hV6a5QjptwQBGybQyDQ2/GYwPjlMcE57ESN6G+kn87CtwPdB/10jfVNpDbYnXJdSRQj8460WHJib
 IxmU2pb4i4DTkMZeMiNI9JSIyUbtnrlbG4BI8o81FOo91axhCaqPShJzgHH7y4ZfQxML
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_083849_799485_2C803965 
X-CRM114-Status: GOOD (  26.98  )
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

On 2024-03-13 17:04, Arınç ÜNAL wrote:
> On 13.03.2024 16:13, Justin Swartz wrote:
>> On 2024-03-13 14:06, Arınç ÜNAL wrote:
>>> On 13.03.2024 14:52, Justin Swartz wrote:
>>>> 
>>>> On 2024-03-13 10:59, Arınç ÜNAL wrote:
>>>>> This ship has sailed anyway. Now the changes the first patch did 
>>>>> must be
>>>>> reverted too. I will deal with this from now on, you can stop 
>>>>> sending
>>>>> patches regarding this.
>>>> 
>>>> At least if the first patch isn't reverted, the approach used is
>>>> less likely to result in the problem occuring, IMHO.
>>> 
>>> I disagree that the previous approach is less likely to result in the
>>> problem occurring. If you don't like the delay amount we agreed on, 
>>> feel
>>> free to express a higher amount.
>> 
>> I created and tested a patch to entertain your input about what you
>> thought could be a suitable hold period to address the problem, and it
>> appeared to work. The criteria being that the crystal frequency 
>> selection
>> was correct over 20 tests.
>> 
>> So if only the reset hold period is going to change, I'm good with 
>> what
>> you had suggested: 5000 - 5100 usec.
>> 
>> Ultimately the selection of this period should be guided by the timing
>> information provided in a datasheet or design guide from the 
>> manufacturer.
> 
> That's a good point, I agree.
> 
>> 
>> If you, or anyone else, has such a document that provides this 
>> information
>> and is able to confirm or deny speculation about any/all timing 
>> periods
>> related to reset, please do so.
> 
> These are the documents I use to program this switch family. I did not
> stumble upon a page going over this.
> 
> MT7621 Giga Switch Programming Guide v0.3:
> 
> https://github.com/vschagen/documents/blob/main/MT7621_ProgrammingGuide_GSW_v0_3.pdf
> 
> MT7531 switch chip datasheet:
> 
> https://wiki.banana-pi.org/Banana_Pi_BPI-R64#Documents

Thanks for the links.

Have you encountered this one?

MT7530 Giga Switch Programming Guide v0.1:
https://github.com/libc0607/arduino_mt7530/blob/master/MT7530_programming_guide_V00.pdf

It has some timing diagrams, but nothing I found for reset.

The HWTRAP description has some bits swapped, so I guess those were 
typos,
in the case of XTAL_SELECT.


>>> I also disagree on introducing a solution that is in addition to 
>>> another
>>> solution, both of which fix the same problem.
>> 
>> I'm not sure I understand why you say that. These patches were 
>> intended
>> to be applied exclusively, or in other words: in isolation - not 
>> together.
>> 
>> Although if they were applied together, it wouldn't really matter.
>> 
>> For the record, I've only continued to keep this thread alive in the
>> hope that some solution to this problem will make it into mainline
>> eventually.
>> 
>> I don't care if it was my original patch, the subsequent patch, or a
>> later patch provided by you or someone else. :)
> 
> I think you've missed that your patch is already applied. And it won't 
> be
> reverted for reasons explained by Paolo in this mail thread.
> 
> https://git.kernel.org/netdev/net-next/c/2920dd92b980
> 
> So if your patch here were to be applied too, the final mt7530.c would 
> have
> the LEDs disabled AND before reset deassertion delay increased.

Yes, I seem to have missed that. I thought your request for the
patch to be reverted definitely would have been performed, or at
least queued, seeing as you're the maintainer.

