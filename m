Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48B1C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 15:49:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCF022AAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 15:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCF022AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h8+EcPgl1YWbhvFhvI5Qtw9wMkOOmZt5FkQEmNssPA0=; b=YDod8mH671d3rhJ7OCp5m1W5f
	boaiJhOJHhj7zlfIvwaUneKwzGULAbjogl9AsrrMx84EqWClKG7LUzwj14OmV5kXuNKjWC1P6TRBd
	nmJflcNDVDWCAm16IkttJNEzvUTeAkBaNzYzszUwxExvtRld9zEkv59vhLsw2tHfIepQidwFd0vnN
	5XPVD/6c+NAFuh5CVLr8tAT+W3BIp0oTd958sUF4PsQ8440A00jAcjhaObiEYJNPQiQsaxXTtNrsE
	PYh9LIs4GHHZx+V/ZS3FySRqpcJfKJp0QAgcsGwrx624hd45dNI/RXKrvIrDdwaKnEBw7iLg6SfNk
	6nwH1GPlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1WmK-0007ot-8Z; Mon, 18 Jan 2021 15:49:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1WmH-0007o0-4i; Mon, 18 Jan 2021 15:49:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7641FB;
 Mon, 18 Jan 2021 07:49:09 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 559E53F68F;
 Mon, 18 Jan 2021 07:49:06 -0800 (PST)
Subject: Re: [PATCH v6 06/33] of/device: Move dma_range_map before
 of_iommu_configure
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-7-yong.wu@mediatek.com>
 <20210114192732.GA3401278@robh.at.kernel.org>
 <1610688626.4578.1.camel@mhfsdcap03>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1853732d-0efd-171e-9e1f-7ee7ed72a98f@arm.com>
Date: Mon, 18 Jan 2021 15:49:06 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610688626.4578.1.camel@mhfsdcap03>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_104913_302751_EEC1D63D 
X-CRM114-Status: GOOD (  21.00  )
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
 Tomasz Figa <tfiga@google.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-15 05:30, Yong Wu wrote:
> On Thu, 2021-01-14 at 13:27 -0600, Rob Herring wrote:
>> On Mon, Jan 11, 2021 at 07:18:47PM +0800, Yong Wu wrote:
>>> "dev->dma_range_map" contains the devices' dma_ranges information,
>>> This patch moves dma_range_map before of_iommu_configure. The iommu
>>> driver may need to know the dma_address requirements of its iommu
>>> consumer devices.
>>>
>>> CC: Rob Herring <robh+dt@kernel.org>
>>> CC: Frank Rowand <frowand.list@gmail.com>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>   drivers/of/device.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/of/device.c b/drivers/of/device.c
>>> index aedfaaafd3e7..1d84636149df 100644
>>> --- a/drivers/of/device.c
>>> +++ b/drivers/of/device.c
>>> @@ -170,9 +170,11 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>>>   	dev_dbg(dev, "device is%sdma coherent\n",
>>>   		coherent ? " " : " not ");
>>>   
>>> +	dev->dma_range_map = map;
>>>   	iommu = of_iommu_configure(dev, np, id);
>>>   	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
>>>   		kfree(map);
>>> +		dev->dma_range_map = NULL;
>>
>> Not really going to matter, but you should probably clear dma_range_map
>> before what it points to is freed.
>>
>> With that,
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Thanks for the review. I will move it before "kfree(map)" in next
> version.

Paul noticed that we already have a bug in assigning to this 
unconditionally[1] - I'd totally forgotten about this series when I 
theorised about IOMMU drivers wanting the information earlier, but 
sweeping my inbox now only goes to show I was right to think of it :)

We should really get something in as a fix independent of this series, 
taking both angles into account.

Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be097c7ceb32@arm.com/

>>
>>>   		return -EPROBE_DEFER;
>>>   	}
>>>   
>>> @@ -181,7 +183,6 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>>>   
>>>   	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>>>   
>>> -	dev->dma_range_map = map;
>>>   	return 0;
>>>   }
>>>   EXPORT_SYMBOL_GPL(of_dma_configure_id);
>>> -- 
>>> 2.18.0
>>>
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
