Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A826C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 11:36:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A542522250
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 11:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R1kcSQDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A542522250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NGQXJYdrb07SMIQZH7sz0T1WxYT1ILjo81w11jSCgjU=; b=R1kcSQDMB3bph2aoGQqe8NsYg
	iHTwaB4/tE5awckb4Akv6DHIOBO83AUAAgGT2TbZRW9SuXPQSUpJLK0h4GgVr2qJu0h0qEDot1Jwk
	UoE4Wtb+y08pAhSLMTpkJF11DSsqSyiI+Xxxqk52GEFxA1y5ZBHK6dY8BNVX86vUOr9QQwdCIsdtb
	GEzIktGbsmhjiSrkcqn+4sIpugafzdeNqwt9atCyR2Ukk3mT/G49D3oi3a0EcQrP7Mza+kBVypi7O
	GsiThlEBnLLsUeBy+jxFShODrv5fbqJ5SK3fzsbFWUxMgF4u3WSHNTPXWC9VejyHZW8vAL66C25uG
	MyXqaFY9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX0nO-0005X3-U2; Mon, 26 Oct 2020 11:36:14 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX0nH-0005V6-OC; Mon, 26 Oct 2020 11:36:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A68D3101E;
 Mon, 26 Oct 2020 04:36:05 -0700 (PDT)
Received: from [10.57.50.191] (unknown [10.57.50.191])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3DC63F719;
 Mon, 26 Oct 2020 04:36:02 -0700 (PDT)
Subject: Re: [PATCH v3 11/24] iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for
 MediaTek
To: Yong Wu <yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-12-yong.wu@mediatek.com>
 <a5713949-1d95-40f1-d35d-d99735b48294@arm.com>
 <1603698083.26323.87.camel@mhfsdcap03>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7a03faf4-b382-2923-b9fa-9a55861f49d6@arm.com>
Date: Mon, 26 Oct 2020 11:35:56 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1603698083.26323.87.camel@mhfsdcap03>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_073607_891309_7EB9DE5F 
X-CRM114-Status: GOOD (  25.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-10-26 07:41, Yong Wu wrote:
> On Fri, 2020-10-23 at 15:10 +0100, Robin Murphy wrote:
>> On 2020-09-30 08:06, Yong Wu wrote:
>>> The standard input iova bits is 32. MediaTek quad the lvl1 pagetable
>>> (4 * lvl1). No change for lvl2 pagetable. Then the iova bits can reach
>>> 34bit.
>>>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>    drivers/iommu/io-pgtable-arm-v7s.c | 13 ++++++++++---
>>>    drivers/iommu/mtk_iommu.c          |  2 +-
>>>    2 files changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
>>> index 8362fdf76657..306bae2755ed 100644
>>> --- a/drivers/iommu/io-pgtable-arm-v7s.c
>>> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
>>> @@ -50,10 +50,17 @@
>>>     */
>>>    #define ARM_V7S_ADDR_BITS		32
>>>    #define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
>>> +/* MediaTek: totally 34bits, 14bits at lvl1 and 8bits at lvl2. */
>>> +#define _ARM_V7S_LVL_BITS_MTK(lvl)	(20 - (lvl) * 6)
>>
>> This should defined in terms of both lvl and cfg->ias. The formula here
>> is nothing more than a disgusting trick I made up since a linear
>> interpolation happened to fit the required numbers. That said, all of
>> these bits pretending that short-descriptor is a well-defined recursive
>> format only served to allow the rest of the code to look more like the
>> LPAE code - IIRC they've already diverged a fair bit since then, so
>> frankly a lot of this could stand to be unpicked and made considerably
>> clearer by simply accepting that level 1 and level 2 are different from
>> each other.
> 
> If the formula is not good and make it clearer, How about this?
> 
> 
> /*
>   * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level
> 2,
> -* and 12 bits in a page. With some carefully-chosen coefficients we can
> -* hide the ugly inconsistencies behind these macros and at least let
> the
> -* rest of the code pretend to be somewhat sane.
> +* and 12 bits in a page.
> +*
> +* MediaTek extend 2 bits to reach 34 bits, 14 bits at lvl1 and 8 bits
> at lvl2.
>   */
> 
> -#define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
> +#define _ARM_V7S_LVL1_BITS_NR(cfg)     (((cfg)->ias == 32) ? 12 : 14)
> +#define _ARM_V7S_LVL2_BITS_NR		8
> +
> +#define _ARM_V7S_LVL_BITS(lvl, cfg)    \
> +      (((lvl) == 1) ? _ARM_V7S_LVL1_BITS_NR(cfg):_ARM_V7S_LVL2_BITS_NR)

Well, I'd have gone for something really simple and clear like:

#define ARM_V7S_LVL_BITS(lvl, cfg) ((lvl) == 1 ? (cfg)->ias - 20 : 8)
#define ARM_V7S_LVL_SHIFT(lvl)     ((lvl) == 1 ? 20 : 12)

Then maybe see if enough of the users could resolve lvl significantly 
earlier to make it worth splitting things up further.

Robin.

>>>    #define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
>>>    #define ARM_V7S_TABLE_SHIFT		10
>>>    
>>> -#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	(1 << _ARM_V7S_LVL_BITS(lvl))
>>> +#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	({				\
>>> +	int _lvl = lvl;							\
>>> +	!arm_v7s_is_mtk_enabled(cfg) ?					\
>>> +	 (1 << _ARM_V7S_LVL_BITS(_lvl)) : (1 << _ARM_V7S_LVL_BITS_MTK(_lvl));\
>>> +})
>>> +
>>>    #define ARM_V7S_TABLE_SIZE(lvl, cfg)					\
>>>    	(ARM_V7S_PTES_PER_LVL(lvl, cfg) * sizeof(arm_v7s_iopte))
>>>    
>>> @@ -63,7 +70,7 @@
>>>    #define _ARM_V7S_IDX_MASK(lvl, cfg)	(ARM_V7S_PTES_PER_LVL(lvl, cfg) - 1)
>>>    #define ARM_V7S_LVL_IDX(addr, lvl, cfg)	({			\
>>>    	int _l = lvl;							\
>>> -	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
>>> +	((addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
>>>    })
>>>    
>>>    /*
>>> @@ -755,7 +762,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>>>    {
>>>    	struct arm_v7s_io_pgtable *data;
>>>    
>>> -	if (cfg->ias > ARM_V7S_ADDR_BITS)
>>> +	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
>>>    		return NULL;
>>>    
>>>    	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index f6a2e3eb59d2..6e85c9976a33 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -316,7 +316,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
>>>    			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
>>>    			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
>>>    		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
>>> -		.ias = 32,
>>> +		.ias = 34,
>>>    		.oas = 35,
>>>    		.tlb = &mtk_iommu_flush_ops,
>>>    		.iommu_dev = data->dev,
>>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
