Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F47CD5BDE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfxTI6yT98vdYMPFLMQrKaY5NDiQ8OkonbcRN4stPA4=; b=oBOr86fIqSCKwaPgG6K+Dtbaow
	dFRhoYSKfNSg1WjUxvIs4oOPZhu0aarZb9mUHTB9S/duzmwi6IDH7RQlL7QXlZ68mXosWRgwe07QX
	9zuKLNlMDqPSK3Phi657YXjsQJMKgY8b9E92wZfx+72ASno8Ifkw5jLRmxIQXmjKpm8qtsTYnHwWn
	vjC0nIeKt7249c5lDxAdx+ngA2u3leg501SD4nQEXxOzAw9CbmDy6PDc+80Qb+WFr291SijldlQBR
	2ukOIrL7cPIvM61T5uqPMwqp0ntP6CVwz3q69Ey6LLNS1+r5dXq09PTTkHn5dqe74MIL5CoXWR9yV
	lNUv5xMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIT6-005yPF-05;
	Thu, 21 Sep 2023 12:07:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIT2-005yOE-2b;
	Thu, 21 Sep 2023 12:07:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4D7D165C;
	Thu, 21 Sep 2023 05:08:12 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C1D73F5A1;
	Thu, 21 Sep 2023 05:07:34 -0700 (PDT)
Message-ID: <ba2432e4-cfa9-62a8-626e-97aab44c9ffe@arm.com>
Date: Thu, 21 Sep 2023 13:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] ARM: vfp: Add vudot opcode to VFP undef hook
Content-Language: en-GB
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: amit.kachhap@arm.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux@armlinux.org.uk,
 matthias.bgg@gmail.com, yj.chiang@mediatek.com
References: <170e8577-42c9-b72f-60c7-80141f379ec4@arm.com>
 <20230921021350.28283-1-mark-pk.tsai@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230921021350.28283-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_050736_958508_8AA28C07 
X-CRM114-Status: GOOD (  24.66  )
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

On 21/09/2023 3:13 am, Mark-PK Tsai wrote:
>> On 2023-09-20 09:39, Mark-PK Tsai wrote:
>>> Add vudot opcode to the VFP undef hook to fix the
>>> potentially undefined instruction error when the
>>> user space executes vudot instruction.
>>
>> Did the kernel expose a hwcap to say that the dot product extension is
>> supported? I'm pretty sure it didn't, so why would userspace expect this
>> to work? ;)
> 
> The hwcap for dotprod has been exported since commit:
> 
> 62ea0d873af3 ARM: 9269/1: vfp: Add hwcap for FEAT_DotProd
> 
>>
>> IIRC Amit was looking at defining the hwcaps to align with arm64 compat,
>> but I believe that series faltered since most of them weren't actually
>> needed (and I think at that point it was still missing the VFP support
>> code parts). It would be nice if someone could pick up and combine both
> 
> Were the mentioned series related to this commit?
> 
> 62ea0d873af3 ARM: 9269/1: vfp: Add hwcap for FEAT_DotProd

Oh, that did get merged? My apologies, I grepped for the hwcaps in 
arch/arm but somehow failed to spot that some definitions did exist, so 
assumed it hadn't been; not sure what went wrong there :(

In that case, we definitely want this tagged as a fix, and to make sure 
we double-check for any equivalent fixes still needed for the other 
features too. Sorry again for the confusion.

>> efforts and get this done properly; fill in *all* the hwcaps and
>> relevant handling for extensions which Cortex-A55 supports (since
>> there's definitely more than just VUDOT), and then hopefully we're done
>> for good.
> 
> Agree.
> 
>>
>>> Before this commit, kernel didn't handle the undef exception
>>> caused by vudot and didn't enable VFP in lazy VFP context
>>> switch code like other NEON instructions.
>>> This led to the occurrence of the undefined instruction
>>> error as following:
>>>
>>> [  250.741238 ] 0904 (26902): undefined instruction: pc=004014ec
>>> ...
>>> [  250.741287 ] PC is at 0x4014ec
>>> [  250.741298 ] LR is at 0xb677874f
>>> [  250.741303 ] pc : [<004014ec>]    lr : [<b677874f>]    psr: 80070010
>>> [  250.741309 ] sp : beffedb0  ip : b67d7864  fp : beffee58
>>> [  250.741314 ] r10: 00000000  r9 : 00000000  r8 : 00000000
>>> [  250.741319 ] r7 : 00000001  r6 : 00000001  r5 : beffee90  r4 : 00401470
>>> [  250.741324 ] r3 : beffee20  r2 : beffee30  r1 : beffee40  r0 : 004003a8
>>> [  250.741331 ] Flags: Nzcv  IRQs on  FIQs on  Mode USER_32  ISA ARM Segment user
>>> [  250.741339 ] Control: 10c5383d  Table: 32d0406a  DAC: 00000055
>>> [  250.741348 ] Code: f4434aef f4610aef f4622aef f4634aef (fc620df4)
>>>
>>> Below is the assembly of the user program:
>>>
>>> 0x4014dc <+108>: vst1.64 {d20, d21}, [r3:128]
>>> 0x4014e0 <+112>: vld1.64 {d16, d17}, [r1:128]
>>> 0x4014e4 <+116>: vld1.64 {d18, d19}, [r2:128]
>>> 0x4014e8 <+120>: vld1.64 {d20, d21}, [r3:128] --> switch out
>>> 0x4014ec <+124>: vudot.u8 q8, q9, q10         <-- switch in, and FPEXC.EN = 0
>>>                                                     SIGILL(illegal instruction)
>>>
>>> Link: https://services.arm.com/support/s/case/5004L00000XsOjP
>>
>> Linking to your private support case is not useful to upstream. Even I
>> can't open that link.
> 
> I thought that maybe someone in arm need this.
> But it seems a bit noisy so I will remove the link from v2.

Yeah, even within Arm most of us don't have permission to access the 
support system.

Cheers,
Robin.

>>
>>> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
>>> ---
>>>    arch/arm/vfp/vfpmodule.c | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
>>> index 7e8773a2d99d..7eab8d1019d2 100644
>>> --- a/arch/arm/vfp/vfpmodule.c
>>> +++ b/arch/arm/vfp/vfpmodule.c
>>> @@ -788,6 +788,12 @@ static struct undef_hook neon_support_hook[] = {{
>>>    	.cpsr_mask	= PSR_T_BIT,
>>>    	.cpsr_val	= 0,
>>>    	.fn		= vfp_support_entry,
>>> +}, {
>>> +	.instr_mask	= 0xffb00000,
>>> +	.instr_val	= 0xfc200000,
>>> +	.cpsr_mask	= PSR_T_BIT,
>>> +	.cpsr_val	= 0,
>>> +	.fn		= vfp_support_entry,
>>>    }, {
>>>    	.instr_mask	= 0xef000000,
>>>    	.instr_val	= 0xef000000,
>>> @@ -800,6 +806,12 @@ static struct undef_hook neon_support_hook[] = {{
>>>    	.cpsr_mask	= PSR_T_BIT,
>>>    	.cpsr_val	= PSR_T_BIT,
>>>    	.fn		= vfp_support_entry,
>>> +}, {
>>> +	.instr_mask	= 0xffb00000,
>>> +	.instr_val	= 0xfc200000,
>>> +	.cpsr_mask	= PSR_T_BIT,
>>> +	.cpsr_val	= PSR_T_BIT,
>>> +	.fn		= vfp_support_entry,
>>
>> Why have two entries conditional on each possible value of one bit for
>> otherwise identical encodings? Surely it suffices to set both cpsr_mask
>> and cpsr_val to 0?
> 
> You're right.
> I will set both cpsr_mask and cpsr_val to 0 and use single entry,
> as you suggested, in the v2 patch.
> 
> Thanks.
> 
>>
>> Thanks,
>> Robin.
>>
>>>    }};
>>>    
>>>    static struct undef_hook vfp_support_hook = {

