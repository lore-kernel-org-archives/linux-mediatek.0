Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18BEC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E57560233
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E57560233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EPmKq7fsXfX2GEQ2qgub0snju9opGyemoaBF9GPTvOw=; b=DWZP4Cz881ptAmz8X+IxNIuHA
	tVfyIPprsKfNQNA9dSRvWkh16ExrD4wffQcVzKBQNareCfyGCpeAr35Yz4WjoCNOETAK28typT+14
	l3ezH0LaG2WyD4UadPuWZrkk4cmNRzxE94UaUYj0P96UNOxuCz/bfEiVPZZdIrzfA9g+umH4ewqVi
	CNAi058TZ8MJ5N7RDOxh1n+l5akfNKrQjOm87/UZpa6z20EoS3s2g0XxiB6g4aiC1iakPFU4VpevV
	/Gcy4yippvQejfF/clK2c0mk82a42EpkejW3jdY7wZeX23yFX6s4JJHMunBt9v+wdIMmccDsx5tmK
	DrDoEf0Ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZW1-003wEa-RK; Sat, 17 Apr 2021 01:12:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUs-003vyn-Vl; Sat, 17 Apr 2021 01:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=uHp1lsmMo/OaLOPn5rxQXQZv8nGVAHmRajSz6fPFfzg=; b=pSHE+OgdFQo260CJae7L9qIQrY
 iBxwmoJ+GuyBGoY0O+mfUkYyDEMYEcJ+m1HJ8ZwHSMcNkHye9GMikLd8AnYaNFSG/be+HWYuwINgz
 6BNm8/Ahh+XZvg4SAjlBZQ34WObwBAZygm3FQcvTechX0yQUWaHSLoRqLB+koasEno9hW74ni7sTh
 w/5aUHVQViOLtWzStfx7hS9yRkYw1hS+9Npct+tLa5efjSAC/PJ1pZkdDZ8Fe2d05jEagvDPOW5NL
 q32MnDjVJctT1o1lzl56YnGwEcsNADjDHAnQwfdYNtSlUr4BHtx2vCpCTnF7Jjg4VOKhHq1vo+lXH
 nv6Rggug==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUq-009p33-CB; Sat, 17 Apr 2021 01:11:41 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FMZjQ2G6gz7vDT;
 Sat, 17 Apr 2021 09:09:14 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0;
 Sat, 17 Apr 2021 09:11:30 +0800
Subject: Re: [PATCH 0/8] iommu: fix a couple of spelling mistakes detected by
 codespell tool
To: Joerg Roedel <joro@8bytes.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 "David Woodhouse" <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
 <YHmsQtm4o5f7fAru@8bytes.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <2025c88d-0711-22c8-3e1c-2d8c9f053fbf@huawei.com>
Date: Sat, 17 Apr 2021 09:11:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <YHmsQtm4o5f7fAru@8bytes.org>
Content-Language: en-US
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181140_582187_4A7DA20E 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2021/4/16 23:24, Joerg Roedel wrote:
> On Fri, Mar 26, 2021 at 02:24:04PM +0800, Zhen Lei wrote:
>> This detection and correction covers the entire driver/iommu directory.
>>
>> Zhen Lei (8):
>>   iommu/pamu: fix a couple of spelling mistakes
>>   iommu/omap: Fix spelling mistake "alignement" -> "alignment"
>>   iommu/mediatek: Fix spelling mistake "phyiscal" -> "physical"
>>   iommu/sun50i: Fix spelling mistake "consits" -> "consists"
>>   iommu: fix a couple of spelling mistakes
>>   iommu/amd: fix a couple of spelling mistakes
>>   iommu/arm-smmu: Fix spelling mistake "initally" -> "initially"
>>   iommu/vt-d: fix a couple of spelling mistakes
> 
> This patch-set doesn't apply. Please re-send it as a single patch when
> v5.13-rc1 is released.

OK

> 
> Thanks,
> 
> 	Joerg
> 
> .
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
