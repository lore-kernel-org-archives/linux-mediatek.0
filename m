Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECF4C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 06:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+zgrtDe2vx2LT7iA9VVOVQz2rx8LBh9zMLhK+oLZuk=; b=IYCFaBMrThisUz
	x9gfE5FvKSlMOElK+gUQ8U4K14gzQ2wm7Q+7M9DOwhC/ODLan2ig0twJFU9QkD0eFf1BISbEzCds2
	bSySTMzS9mzSCISfOCHKo+FD/TYu60UXf8ZjbEtWN/2RAOauk3vEAvyGsWRVFEx2lOEkVsKJGdPGC
	fct49DfVufDROxWu/f5zBvuVsySszYohzK2GVJasEYqstRhBoCL+arYqoo+LkcFyrSFsKla99sBno
	Itqq9tqBqkAogh+OyOKdATMs2S/Sa6PI7jeb5qPR4EnpmTThbTMmpoIHYJkPWNNGLLMNM7GQtc3p0
	EG3SlsSBFQmZXjSeF8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q24LK-00FfaC-2f;
	Thu, 25 May 2023 06:20:58 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q24LG-00FfZH-0C;
	Thu, 25 May 2023 06:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684995622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PMYlw8HNIORs6O71agJRG6kN/o5Gdaqc/Q6WI0OGFxBB084gH7qPo8ZYJsksMRIbOdhqNIBZmci9WTTEjB8yd/oNBxzkAGA2ihoR5jKXn7FDW71ffEzlNS+bGsqtdFKbyJGUcuUuz2aAdW66/+G+V2tnkfmeRBXAEqoIiGuimrU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684995622; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=T+zgrtDe2vx2LT7iA9VVOVQz2rx8LBh9zMLhK+oLZuk=; 
	b=SpbduvPkD1iSXDEfwNu4KjEG9HT4f3PLSf4TW7+iEysPbiEykWDFmPuShumcaIeerwIDPlPCOu3MKZ/V5HJcLiRd55JnuvNxZSx2r5VhPsVMNfuhr2JDPYKY0PDKzHAWy7B+8iiNkF4ZZl6Ct3YqqJoe5gHkf0ZD/CxwzRzT8nk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684995622;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T+zgrtDe2vx2LT7iA9VVOVQz2rx8LBh9zMLhK+oLZuk=;
	b=B69arnkMEs140Qlr+wkfQzzcENArNjqdJD3UAmCxEVoVh/GqGbY95tp3A/hzfsVX
	Sjn/3b82zGorWrZYT1FAV5RYjz/wvOTS0q982mpQsRWCbdFag9P4uuPSp9fitGp43w/
	tg587m02KXk+DqzGLykcXha07Tu2XxgchBLE0NIU=
Received: from [10.10.10.217] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1684995620524912.9368149177582; Wed, 24 May 2023 23:20:20 -0700 (PDT)
Message-ID: <7c915d5b-56c9-430d-05ac-544f76966eb1@arinc9.com>
Date: Thu, 25 May 2023 09:20:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 05/30] net: dsa: mt7530: read XTAL value from
 correct register
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-6-arinc.unal@arinc9.com>
 <20230524165701.pbrcs4e74juzb4r3@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230524165701.pbrcs4e74juzb4r3@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_232054_129457_D5A15CF4 
X-CRM114-Status: GOOD (  43.13  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24.05.2023 19:57, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:07PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> On commit 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
>> macros for reading the crystal frequency were added under the MT7530_HWTRAP
>> register. However, the value given to the xtal variable on
>> mt7530_pad_clk_setup() is read from the MT7530_MHWTRAP register instead.
>>
>> Although the document MT7621 Giga Switch Programming Guide v0.3 states that
>> the value can be read from both registers, use the register where the
>> macros were defined under.
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> I'm sorry, but I refuse this patch, mainly as a matter of principle -
> because that's just not how we do things, and you need to understand why.
> 
> The commit title ("read XTAL value from correct register") claims that
> the process of reading a field which cannot be changed by software is
> any more correct when it is read from HWTRAP rather than MHWTRAP
> (modified HWTRAP).
> 
> Your justification is that it's confusing to you if two registers have
> the same layout, and the driver has a single set of macros to decode the
> fields from both. You seem to think it's somehow not correct to decode
> fields from the MHWTRAP register using macros which have just HWTRAP in
> the name.

No, it doesn't confuse me that two registers share the same layout. My 
understanding was that the MHWTRAP register should be used for modifying 
the hardware trap, and the HWTRAP register should be used for reading 
from the hardware trap. I see that the XTAL constants were defined under 
the HWTRAP register so I thought it would make sense to change the code 
to read the XTAL values from the HWTRAP register instead. Let me know if 
you disagree with this.

> 
> While in this very particular case there should be no negative effect
> caused by the change (*because* XTAL_FSEL is read-only), your approach
> absolutely does not scale to the other situations that you will be faced
> with.
> 
> If it was any other r/w field from HWTRAP vs MHWTRAP, you would have
> needed to get used to that coding pattern (or do something about the
> coding pattern itself), and not just decide to change the register to
> what you think is correct - which is a *behavior* change and not just
> a *coding style* change. You don't change the *behavior* when you don't
> like the *coding style* !!! because that's not a punctual fix to your
> problem.
> 
> I'm sorry that it is like this, but you can't expect the Linux kernel to
> be written for the level of understanding of a beginner C programmer.
> It's simply too hard for everyone to change, and much easier, and more
> beneficial overall, for you to change.
> 
> I understand that you're poking sticks at everything in order to become
> more familiar with the driver. That's perfectly normal and fine. But not
> everything that comes as a result of that is of value for sharing back
> to the mainline kernel's mailing lists.

Makes sense.

> 
> Seriously, please first share these small rewrites with someone more
> senior than you, and ask for a preliminary second opinion.

Would submitting this as an RFC had been a similar action to your 
describing here? Because I already did that:

https://lore.kernel.org/netdev/20230421143648.87889-6-arinc.unal@arinc9.com/

> 
> As they say, "on the Internet, nobody knows you're a dog". If reviewers
> don't take into account that you're a newbie with C (which is a badge
> that you don't carry everywhere - because you don't have to), it's easy
> for patches like this (and most of this series) to come across as:
> "I have no consideration for the fact that the existing code works, and
> the way in which it works, I'm just gonna rewrite all of it according to
> my own sensibilities and subjective justifications, and throw baseless
> words at it such as: fix this, correct that, when in fact all I'm doing
> is make silly changes with no effect to the observable behavior".
> 
> Because I know that the above isn't the case, I try to be as polite as
> possible expressing my frustration that I am looking at a large volume
> of worthless and misguided refactoring.

I should've given more effort to explain my reasons for this patch. I 
disagree that the series is a large volume of worthless and misguided 
refactoring and am happy to discuss it patch by patch.

Arınç

