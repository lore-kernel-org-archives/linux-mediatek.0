Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817DCC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 00:04:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DA164DFD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 00:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07DA164DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7jbNvzJxkdGGMbR9qBm1GzJ+yUT70Wq3DQAyjZqmBrE=; b=bIFwhDJxl33GCLNp9BpKL7Utu
	aCfjXYRrbF+JOLmP6KIBeKgAN8vte4+QXmADWlTe2orZ2ZQxJLLUfpelnGMSJ6mz4cPy1NueDcWkk
	NtrQVKyxGwJmxYHXeRlm3Qa43rSHEz714xBT7UECnMA+JZ6L2zaL5bRIAnfAMn/++o79TThpqmdo5
	m9GaElCQvkknmyl5J2aCaL4eM+9wI2HMZGF5TQcd1tKicwwuuXgYsWp4wwN8PEhQ6wEwrDq/VC8aT
	aM9A85v4iwSY5RkLq7tdq8hViUxXNI0JdprCzDZ/JIrkShse9a0tt5YVPlFl9LRAca9Tvd4XCSd+j
	ifX4Ux4QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5HGq-0002wH-9k; Fri, 29 Jan 2021 00:04:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5HGm-0002v8-Fc; Fri, 29 Jan 2021 00:04:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26F6413D5;
 Thu, 28 Jan 2021 16:04:02 -0800 (PST)
Received: from [10.57.35.163] (unknown [10.57.35.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 686373F66E;
 Thu, 28 Jan 2021 16:03:59 -0800 (PST)
Subject: Re: [PATCH v6 07/33] iommu: Avoid reallocate default domain for a
 group
To: Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-8-yong.wu@mediatek.com>
 <20210126222305.GB30460@willie-the-truck>
 <1611740356.5302.14.camel@mhfsdcap03>
 <20210128211020.GA3531@willie-the-truck>
 <20210128211442.GB3531@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <654abe35-bc60-741b-1238-d9c585a45c06@arm.com>
Date: Fri, 29 Jan 2021 00:03:57 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128211442.GB3531@willie-the-truck>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_190412_607088_990CF23D 
X-CRM114-Status: GOOD (  22.10  )
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
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-28 21:14, Will Deacon wrote:
> On Thu, Jan 28, 2021 at 09:10:20PM +0000, Will Deacon wrote:
>> On Wed, Jan 27, 2021 at 05:39:16PM +0800, Yong Wu wrote:
>>> On Tue, 2021-01-26 at 22:23 +0000, Will Deacon wrote:
>>>> On Mon, Jan 11, 2021 at 07:18:48PM +0800, Yong Wu wrote:
>>>>> If group->default_domain exists, avoid reallocate it.
>>>>>
>>>>> In some iommu drivers, there may be several devices share a group. Avoid
>>>>> realloc the default domain for this case.
>>>>>
>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>> ---
>>>>>   drivers/iommu/iommu.c | 3 ++-
>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>>>> index 3d099a31ddca..f4b87e6abe80 100644
>>>>> --- a/drivers/iommu/iommu.c
>>>>> +++ b/drivers/iommu/iommu.c
>>>>> @@ -266,7 +266,8 @@ int iommu_probe_device(struct device *dev)
>>>>>   	 * support default domains, so the return value is not yet
>>>>>   	 * checked.
>>>>>   	 */
>>>>> -	iommu_alloc_default_domain(group, dev);
>>>>> +	if (!group->default_domain)
>>>>> +		iommu_alloc_default_domain(group, dev);
>>>>
>>>> I don't really get what this achieves, since iommu_alloc_default_domain()
>>>> looks like this:
>>>>
>>>> static int iommu_alloc_default_domain(struct iommu_group *group,
>>>> 				      struct device *dev)
>>>> {
>>>> 	unsigned int type;
>>>>
>>>> 	if (group->default_domain)
>>>> 		return 0;
>>>>
>>>> 	...
>>>>
>>>> in which case, it should be fine?
>>>
>>> oh. sorry, I overlooked this. the current code is enough.
>>> I will remove this patch. and send the next version in this week.
>>> Thanks very much.
>>
>> Actually, looking at this again, if we're dropping this patch and patch 6
>> just needs the kfree() moving about, then there's no need to repost. The
>> issue that Robin and Paul are discussing can be handled separately.

FWIW patch #6 gets dropped as well now, since Rob has applied the 
standalone fix (89c7cb1608ac).

Robin.

> Argh, except that this version of the patches doesn't apply :)
> 
> So after all that, please go ahead and post a v7 ASAP based on this branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/mtk
> 
> Will
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
