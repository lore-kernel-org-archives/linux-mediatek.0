Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AABC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49DE64DA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D49DE64DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hw2B0e9Fck5KtaYQt/Tz8CPM8+OuYlqBFB/jwby4c6Q=; b=GWaniFtNOUTZloMCEZxgoj278
	OrI9vnbQf1Qpm9onfVwr2pe7DXbk/LcAfb45IVLDWmpNyoTGFKmom3XtTLQAwy6KxHGsG2TwJ9xMH
	fjOPb3cpbv2icN16nygb8CMt+FglUi1SQRKwNgE5N9kQg81ONwfmKC0yjUB27WYH+fDBK5TKZ6KHv
	O2VF+qdwomg/6YzmiijYLEbMd0rp37RgOGwlnlv/xao4PcQQDJiiJLPAOs7Jd0/7XlN0/8Q3uTIzG
	3t4S3KuhscTCUVh8hz6YoQZwwPJS3TLSTClG7mSn+XQ2QAWWZQgxsaPTexVAidHuBalxFEqygumae
	dc73i9fLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qcK-0002mI-Qs; Wed, 27 Jan 2021 19:36:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qcG-0002lM-T9; Wed, 27 Jan 2021 19:36:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95AF5106F;
 Wed, 27 Jan 2021 11:36:34 -0800 (PST)
Received: from [10.57.47.135] (unknown [10.57.47.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C789B3F68F;
 Wed, 27 Jan 2021 11:36:31 -0800 (PST)
Subject: Re: [PATCH v2] of/device: Update dma_range_map only when dev has
 valid dma-ranges
To: Rob Herring <robh+dt@kernel.org>
References: <20210119105203.15530-1-yong.wu@mediatek.com>
 <YBFj9whLvqlV2erm@aptenodytes> <159d4486-bb7e-249d-2bad-f5bba839041d@arm.com>
 <CAL_JsqKgGOAe-ZSw9qJ7POVv5nJuX+UoJE-MS3drKrM119pw-w@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8f742f94-4087-7fb6-4b7c-9058593b67cf@arm.com>
Date: Wed, 27 Jan 2021 19:36:30 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKgGOAe-ZSw9qJ7POVv5nJuX+UoJE-MS3drKrM119pw-w@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_143637_006288_B07F2AF1 
X-CRM114-Status: GOOD (  17.58  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tomasz Figa <tfiga@google.com>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-27 19:09, Rob Herring wrote:
> On Wed, Jan 27, 2021 at 7:13 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> [ + Christoph, Marek ]
>>
>> On 2021-01-27 13:00, Paul Kocialkowski wrote:
>>> Hi,
>>>
>>> On Tue 19 Jan 21, 18:52, Yong Wu wrote:
>>>> The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
>>>> supplanting dma_pfn_offset") always update dma_range_map even though it was
>>>> already set, like in the sunxi_mbus driver. the issue is reported at [1].
>>>> This patch avoid this(Updating it only when dev has valid dma-ranges).
>>>>
>>>> Meanwhile, dma_range_map contains the devices' dma_ranges information,
>>>> This patch moves dma_range_map before of_iommu_configure. The iommu
>>>> driver may need to know the dma_address requirements of its iommu
>>>> consumer devices.
>>>
>>> Just a gentle ping on this issue, it would be nice to have this fix merged
>>> ASAP, in the next RC :)
>>
>> Ack to that - Rob, Frank, do you want to take this through the OF tree,
>> or shall we take it through the DMA-mapping tree like the original culprit?
> 
> I've already got some fixes queued up and can take it.

Brilliant, thanks!

> Suggested-by doesn't mean you are happy with the implementation. So
> Acked-by or Reviewed-by?

It still feels slightly awkward to give a tag to say "yes, this is 
exactly what I suggested", but for the avoidance of doubt,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Cheers,
Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
