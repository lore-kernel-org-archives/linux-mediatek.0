Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFCFCCA47A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6iDMRIStudm8UtTmcXyNMTEb7Vm4K7CJBy/UPn/ayw=; b=sqkhNsOYzDGm4SdoJ8X/ebhNIJ
	M9edbr/Cb06kUj9stxgYQ/KYznsifS5BwBFdqKFXNCc39N8lPGb0BLRSiRczCG4My7rdh1Gb4oQ8y
	611m5W47wztZCkS+JVM+bee1Sovkzu+AxzfDSNgj0ZPowvFwkY/8Tl/XkKYJmmpIIZIcJVeT/LdH6
	L0EBPZSGwF7Xx+lV5XQyZgdWSd5+3vvT0cNIw+w3uhfwhYQQVre7Ej06lXOZknlxflALzTgpPN8NN
	LZynPNA5c38UH5LXiLrQPkH7q5Njp3u47ixWKovWPVlIeSdBmOgKEMbBnUaPRhh+WjGbO94wvixql
	qu7Txorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mnF-001sz7-B8; Thu, 16 Jun 2022 10:32:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mmt-001srK-99; Thu, 16 Jun 2022 10:31:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FAB912FC;
	Thu, 16 Jun 2022 03:31:41 -0700 (PDT)
Received: from [10.57.82.209] (unknown [10.57.82.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 053D13F792;
	Thu, 16 Jun 2022 03:31:37 -0700 (PDT)
Message-ID: <521ed82e-f213-f635-6f5e-3e35ff8cc020@arm.com>
Date: Thu, 16 Jun 2022 11:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Add error path for loop of
 mm_dts_parse
Content-Language: en-GB
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
 <20220616054203.11365-3-yong.wu@mediatek.com>
 <e2091397-b6e2-7296-1378-dc10b24c6ef4@arm.com>
 <b2ea919315d0084adb465378e6970dbfa4f0829e.camel@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <b2ea919315d0084adb465378e6970dbfa4f0829e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_033143_458338_D8870EC1 
X-CRM114-Status: GOOD (  17.77  )
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

On 2022-06-16 11:08, Yong Wu wrote:
> On Thu, 2022-06-16 at 09:59 +0100, Robin Murphy wrote:
>> On 2022-06-16 06:42, Yong Wu wrote:
>>> The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the
>>> i+1
>>> larb is parsed fail(return -EINVAL), we should of_node_put for the
>>> 0..i
>>> larbs. In the fail path, one of_node_put matches with
>>> of_parse_phandle in
>>> it.
>>>
>>> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with
>>> the MM TYPE")
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>    drivers/iommu/mtk_iommu.c | 21 ++++++++++++++++-----
>>>    1 file changed, 16 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index 3b2489e8a6dd..ab24078938bf 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -1071,12 +1071,12 @@ static int mtk_iommu_mm_dts_parse(struct
>>> device *dev, struct component_match **m
>>>    
>>>    		plarbdev = of_find_device_by_node(larbnode);
>>>    		if (!plarbdev) {
>>> -			of_node_put(larbnode);
>>> -			return -ENODEV;
>>> +			ret = -ENODEV;
>>> +			goto err_larbnode_put;
>>>    		}
>>>    		if (!plarbdev->dev.driver) {
>>> -			of_node_put(larbnode);
>>> -			return -EPROBE_DEFER;
>>> +			ret = -EPROBE_DEFER;
>>> +			goto err_larbnode_put;
>>>    		}
>>>    		data->larb_imu[id].dev = &plarbdev->dev;
>>>    
>>> @@ -1107,9 +1107,20 @@ static int mtk_iommu_mm_dts_parse(struct
>>> device *dev, struct component_match **m
>>>    			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>>>    	if (!link) {
>>>    		dev_err(dev, "Unable to link %s.\n", dev_name(data-
>>>> smicomm_dev));
>>> -		return -EINVAL;
>>> +		ret = -EINVAL;
>>> +		goto err_larbnode_put;
>>>    	}
>>>    	return 0;
>>> +
>>> +err_larbnode_put:
>>> +	while (i--) {
>>> +		larbnode = of_parse_phandle(dev->of_node,
>>> "mediatek,larbs", i);
>>> +		if (larbnode && of_device_is_available(larbnode)) {
>>> +			of_node_put(larbnode);
>>> +			of_node_put(larbnode);
>>> +		}
>>
>> This looks a bit awkward - could we not just iterate through
>> data->larb_imu and put dev->of_node for each valid dev?
> 
> It should work. Thanks very much.
> 
>>
>> Also, of_find_device_by_node() takes a reference on the struct
>> device
>> itself, so strictly we should be doing put_device() on those as well
>> if we're bailing out.
> 
> Thanks for this hint. A new reference for me. I will add it.

In fact, thinking about it some more we may as well do the of_node_put() 
unconditionally immediately after the of_find_device_by_node() call, so 
then it's *only* the device references we'd need to worry about cleaning 
up in the failure path.

Robin.

