Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D43C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNKS+9KI7LnMuxMXJiDPOHA/qVljZrmYNszEIxCu2QY=; b=dnfBQggELB5m6fTU1kitzkOCoX
	ieXOWKsMjRTg/rjqidfjg5D2kXXFzlyhRxTMmWfg5kwpDpvGSkhq7SN4+Mxk7GzWFcVY3mjGJM/Yg
	tLNfw3+1j0L0t8fq/itFQv1X1+z7sWxqg5Zd8msc5fhnrGT3egFBxFvinP8FsOox7TjLCtO6CWdF4
	Q25fTyxLsnu+4krKQfKTVkAPos0bKo0DMY9ZxCfRnXOzZJ5Jhfnhxrv+5ZHlWZv9owJDHfFEObqoG
	i7ubrKNk61nOKUYxhFbHDzjgymLiVMwg9iqeeDOxCK5Jhi2cHgoj+Ow8pi2uYl4e+VS7LxWmVxBBo
	+yO7B+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiLx-004NlD-N8; Fri, 23 Sep 2022 13:04:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiLl-004Njc-M4; Fri, 23 Sep 2022 13:04:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E515CB82ED3;
	Fri, 23 Sep 2022 13:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF145C433C1;
	Fri, 23 Sep 2022 13:04:08 +0000 (UTC)
Message-ID: <cca427ac-436d-9cee-d3e7-8a957a0add25@xs4all.nl>
Date: Fri, 23 Sep 2022 15:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] media: platform: mtk-mdp3: fix PM reference leak in
 mdp_comp_clock_on()
Content-Language: en-US
To: Sun Ke <sunke32@huawei.com>, mchehab@kernel.org, matthias.bgg@gmail.com,
 ping-hsun.wu@mediatek.com, daoyuan.huang@mediatek.com, moudy.ho@mediatek.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-3-sunke32@huawei.com>
 <38c78ee6-8b7e-34fb-1dc0-8b2d28acdd3d@huawei.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <38c78ee6-8b7e-34fb-1dc0-8b2d28acdd3d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_060413_884990_FE3B8F1E 
X-CRM114-Status: GOOD (  14.97  )
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

It's in a pull request, waiting to be merged.

Regards,

	Hans

On 23/09/2022 08:25, Sun Ke wrote:
> ping...
> 
> 在 2022/9/2 16:58, Sun Ke 写道:
>> mdp_comp_clock_on will increase runtime PM usage counter,
>> and mdp_comp_clock_off will decrease the runtime PM usage counter.
>> so, if mdp_comp_clock_on failed after increment runtime PM usage
>> counter, it should decrease it before return a error code.
>>
>> pm_runtime_get_sync will increment pm usage counter even it failed.
>> Forgetting to putting operation will result in reference leak here.
>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>> counter balanced.
>>
>> And if failed to enable clk, add pm_runtime_put() to decrease the
>> runtime PM usage counter.
>>
>> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>> index 9a6ba5851ccb..d3eaf8884412 100644
>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>> @@ -682,7 +682,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
>>       int i, ret;
>>         if (comp->comp_dev) {
>> -        ret = pm_runtime_get_sync(comp->comp_dev);
>> +        ret = pm_runtime_resume_and_get(comp->comp_dev);
>>           if (ret < 0) {
>>               dev_err(dev,
>>                   "Failed to get power, err %d. type:%d id:%d\n",
>> @@ -699,6 +699,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
>>               dev_err(dev,
>>                   "Failed to enable clk %d. type:%d id:%d\n",
>>                   i, comp->type, comp->id);
>> +            pm_runtime_put(comp->comp_dev);
>>               return ret;
>>           }
>>       }
>>


