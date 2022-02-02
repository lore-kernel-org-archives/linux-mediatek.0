Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55335C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gikIKVqFeohxfURdMfljjBZvG88S3i+jLWXqQMfDLoQ=; b=DIQb+gk8DTrT+D
	6BtshnAEkpUdffH0r3rVM9byY0DqkLsuqvdfpeP5o1eAiMgVE5XIQY0cNILyOho11/GCI/YOxuWLM
	Ibz68aJKb16Q7kP5IFV23fx+0LxfySr19HWUapqKVZsf2LPrXQg36n6RfKanR03ZMvwk9Sjy8Y2e6
	LnUdSxGQx5PwGmaXOOjUF8whKL1zwh2S5W2v4HaI8VTD44C3pq3LN1XxUGF/vdetfgxl/Lo7CwsmS
	qVkwY4kPmFYjqXnFyghyz1XWMkNRiL7zVdOWuqxHgkCLEK+J8N6HalHZL+rNi9R0rYBCMa5Bv8A0f
	P3KFVfNyP88l/1F1a/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFBYg-00EgAu-VW; Wed, 02 Feb 2022 09:04:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFBYD-00EfvR-NL; Wed, 02 Feb 2022 09:03:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C0FAC1F44279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643792617;
 bh=ViQMSZyem2MB0mucYiFAcZf2AlB+Sx22LpjdHO5YXF0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b1RRKral5pgotlT6/jsPB+u1VgcTZt1FRG7f2Er6wgkECZsykAIVxS2Nun0z4mTeo
 q/7Kkirv9qIpyJBbD/SOYgFQifaE/65xIkE09at9DlJO/IoM6q+S59z6BrWr7JhhgF
 EiuW2pLioSCLXtKvwlYFbQbohL8u5aa58DrXHDoBacOP0c6ipDEKOTYd+L1KUi10OA
 xRkwKskoXoTGTe1YmhFRaarO1tH/wPe3DeLIT4KEwx7RP2FU0wNGyHHROw7Phf3erO
 buErqVINDQhsx9hyD8w9sJrRd7WnkDUZQKtHJrhWNwLr9NO+3VxKGzxm4qq1tvJr4n
 0w9chva8H2eLw==
Message-ID: <91fff43a-c85d-2934-b54b-67ffe6fc2f29@collabora.com>
Date: Wed, 2 Feb 2022 10:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 3/3] remoteproc: mtk_scp: Use dev_err_probe() where
 possible
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
 <20220124120915.41292-3-angelogioacchino.delregno@collabora.com>
 <20220201183612.GC2490199@p14s>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220201183612.GC2490199@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_010342_012148_8D2190ED 
X-CRM114-Status: GOOD (  25.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 01/02/22 19:36, Mathieu Poirier ha scritto:
> Hi Angelo,
> 
> On Mon, Jan 24, 2022 at 01:09:15PM +0100, AngeloGioacchino Del Regno wrote:
>> Simplify the probe function, where possible, by using dev_err_probe().
>> While at it, as to increase human readability, also remove some
>> unnecessary forced void pointer casts that were previously used in
>> error checking.
> 
> I am in favour of all 3 patches (please add a cover letter next time) but weary
> about testing - do you have access to a Mediatek platform to try this on or
> is it purely theoretical?
> 
> I would definitely feel better to see a "Tested-by" tag by someone out there
> with access to the HW.
> 
> Thanks,
> Mathieu
> 

Hello Mathieu,

I have multiple MediaTek platforms and I always test on all of them before
pushing such commits upstream, so, even though this kind of patch is trivial,
this is *not* purely theoretical and I confirm that this was successfully tested.

Regards,
Angelo

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/remoteproc/mtk_scp.c | 28 ++++++++++++----------------
>>   1 file changed, 12 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
>> index e40706b0e015..dcddb33e9997 100644
>> --- a/drivers/remoteproc/mtk_scp.c
>> +++ b/drivers/remoteproc/mtk_scp.c
>> @@ -757,10 +757,8 @@ static int scp_probe(struct platform_device *pdev)
>>   	int ret, i;
>>   
>>   	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
>> -	if (!rproc) {
>> -		dev_err(dev, "unable to allocate remoteproc\n");
>> -		return -ENOMEM;
>> -	}
>> +	if (!rproc)
>> +		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
>>   
>>   	scp = (struct mtk_scp *)rproc->priv;
>>   	scp->rproc = rproc;
>> @@ -770,21 +768,20 @@ static int scp_probe(struct platform_device *pdev)
>>   
>>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>>   	scp->sram_base = devm_ioremap_resource(dev, res);
>> -	if (IS_ERR((__force void *)scp->sram_base)) {
>> -		dev_err(dev, "Failed to parse and map sram memory\n");
>> -		return PTR_ERR((__force void *)scp->sram_base);
>> -	}
>> +	if (IS_ERR(scp->sram_base))
>> +		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
>> +				     "Failed to parse and map sram memory\n");
>> +
>>   	scp->sram_size = resource_size(res);
>>   	scp->sram_phys = res->start;
>>   
>>   	/* l1tcm is an optional memory region */
>>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
>>   	scp->l1tcm_base = devm_ioremap_resource(dev, res);
>> -	if (IS_ERR((__force void *)scp->l1tcm_base)) {
>> -		ret = PTR_ERR((__force void *)scp->l1tcm_base);
>> +	if (IS_ERR(scp->l1tcm_base)) {
>> +		ret = PTR_ERR(scp->l1tcm_base);
>>   		if (ret != -EINVAL) {
>> -			dev_err(dev, "Failed to map l1tcm memory\n");
>> -			return ret;
>> +			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
>>   		}
>>   	} else {
>>   		scp->l1tcm_size = resource_size(res);
>> @@ -792,10 +789,9 @@ static int scp_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
>> -	if (IS_ERR((__force void *)scp->reg_base)) {
>> -		dev_err(dev, "Failed to parse and map cfg memory\n");
>> -		return PTR_ERR((__force void *)scp->reg_base);
>> -	}
>> +	if (IS_ERR(scp->reg_base))
>> +		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
>> +				     "Failed to parse and map cfg memory\n");
>>   
>>   	ret = scp->data->scp_clk_get(scp);
>>   	if (ret)
>> -- 
>> 2.33.1
>>


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
