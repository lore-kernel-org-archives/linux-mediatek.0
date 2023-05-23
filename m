Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2C0C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaMCyBHE2i/5Okk7BbF6VsFNl1PIr2h5Mddxlu//RX8=; b=EA7/xWwrOMDjDjc606Ck8M/coU
	HVUIqCvERvTRG34cnFAZvjM/qWeuRlVfIevO1n2EKFhJz63jq4UtJou4OwLwXBqVQPO/lVxj3FhVw
	a4lGNYyiQIqa0/o5Jx+55YWaJs96LODuWSh4oXHKX67R6P3HyWvcCQURxWe7WY2y6CHK++uIOg1b0
	TWja5p0qspPs1hkZKtDUr1Lc9K8WIhidXjZ0DLAU4VFFgX1Dj7a/Dbrd/zqGr1ZvHwJDIPKULN2/o
	MdeGwsY2+dg30enI0y45Lz2CV5piq/eZ04g31c6AG5YSps3WfTUnfbtKeKbcgU1jEV90AAvViGPT1
	O0sXPXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1R80-00AF8J-27;
	Tue, 23 May 2023 12:28:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1R7x-00AF7C-11;
	Tue, 23 May 2023 12:28:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 79E3663129;
	Tue, 23 May 2023 12:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFABCC433EF;
	Tue, 23 May 2023 12:28:29 +0000 (UTC)
Message-ID: <2f1bf798-49c3-13d7-96e5-b29e7df73bd1@xs4all.nl>
Date: Tue, 23 May 2023 14:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] media: mediatek: vcodec: mtk_vcodec_dec_hw: Use
 devm_pm_runtime_enable()
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Fei Shao <fshao@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
 <b5799dfe-f17b-a838-0916-645ba83307d2@xs4all.nl>
In-Reply-To: <b5799dfe-f17b-a838-0916-645ba83307d2@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_052833_433688_FE6EF1B2 
X-CRM114-Status: GOOD (  20.71  )
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

On 23/05/2023 13:42, Hans Verkuil wrote:
> On 15/05/2023 08:16, Fei Shao wrote:
>> Convert pm_runtime_enable() to the managed version, and clean up error
>> handling and unnecessary .remove() callback accordingly.
> 
> This patch no longer applies. Can you make a v3?

Sorry, you can ignore this. I now realize that this was a v2 of

https://patchwork.linuxtv.org/project/linux-media/patch/20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid/

I had that v1 applied, so obviously this v2 would fail to apply. After dropping
that v1 patch it now applies cleanly.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: Fei Shao <fshao@chromium.org>
>>
>> ---
>>
>> Changes in v2:
>> Use devm_pm_runtime_enable() per suggestion from the previous thread:
>> https://lore.kernel.org/lkml/20230510164330.z2ygkl7vws6fci75@pengutronix.de/T/#m25be91afe3e9554600e859a8a59128ca234fc63d
>>
>>  .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 26 ++++++-------------
>>  1 file changed, 8 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
>> index b753bf54ebd9..e1cb2f8dca33 100644
>> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
>> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
>> @@ -148,20 +148,21 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
>>  	ret = mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
>>  	if (ret)
>>  		return ret;
>> -	pm_runtime_enable(&pdev->dev);
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>>  
>>  	of_id = of_match_device(mtk_vdec_hw_match, dev);
>>  	if (!of_id) {
>>  		dev_err(dev, "Can't get vdec subdev id.\n");
>> -		ret = -EINVAL;
>> -		goto err;
>> +		return -EINVAL;
>>  	}
>>  
>>  	hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
>>  	if (hw_idx >= MTK_VDEC_HW_MAX) {
>>  		dev_err(dev, "Hardware index %d not correct.\n", hw_idx);
>> -		ret = -EINVAL;
>> -		goto err;
>> +		return -EINVAL;
>>  	}
>>  
>>  	main_dev->subdev_dev[hw_idx] = subdev_dev;
>> @@ -173,36 +174,25 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
>>  	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
>>  		ret = mtk_vdec_hw_init_irq(subdev_dev);
>>  		if (ret)
>> -			goto err;
>> +			return ret;
>>  	}
>>  
>>  	subdev_dev->reg_base[VDEC_HW_MISC] =
>>  		devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
>>  		ret = PTR_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC]);
>> -		goto err;
>> +		return ret;
>>  	}
>>  
>>  	if (!main_dev->subdev_prob_done)
>>  		main_dev->subdev_prob_done = mtk_vdec_hw_prob_done;
>>  
>>  	platform_set_drvdata(pdev, subdev_dev);
>> -	return 0;
>> -err:
>> -	pm_runtime_disable(subdev_dev->pm.dev);
>> -	return ret;
>> -}
>> -
>> -static int mtk_vdec_hw_remove(struct platform_device *pdev)
>> -{
>> -	pm_runtime_disable(&pdev->dev);
>> -
>>  	return 0;
>>  }
>>  
>>  static struct platform_driver mtk_vdec_driver = {
>>  	.probe	= mtk_vdec_hw_probe,
>> -	.remove = mtk_vdec_hw_remove,
>>  	.driver	= {
>>  		.name	= "mtk-vdec-comp",
>>  		.of_match_table = mtk_vdec_hw_match,
> 


