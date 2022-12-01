Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2329C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyGS9D5ujbMRy1lgrW0gsYT3DCSNYr1uMHriNofwZbM=; b=xqzwxOV49e8HiIRw7ddcDHW8dA
	m3X0a66hlZ7oHLg4MFW28YZs/9JNcagHgCasOMB2hhxvzbVE2/1W9jg51YRwi67dB5wi2rXaN2+sx
	gv3434aC5DQxK6YkG4NKnW0I51rWXKVboYbeHv84tA3wq1etXyQaRlkxOOpxxU8yGVSI5ICHJz2jo
	WFFd5BvpveTZsFA4C9r5y1MdbYfl6h0r/q/oQFokzkW19zRd+dZKNI99ShSqhV0AxOLLolwvM0f2+
	sRC1EU3yQIuSJOkbygFTPQm3wJCMJdczVsCZbjsSv4VAALWji+LqAfySKDVOuSqLvTbR6c+abgdKc
	i+cGa3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Z1C-003sgG-8L; Thu, 01 Dec 2022 02:09:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Z0z-003scj-J6; Thu, 01 Dec 2022 02:09:31 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NMzyL0gfFzmWBp;
	Thu,  1 Dec 2022 10:08:42 +0800 (CST)
Received: from [10.174.176.189] (10.174.176.189) by
 kwepemi500014.china.huawei.com (7.221.188.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Dec 2022 10:09:23 +0800
Message-ID: <683df422-68f2-12e3-ff5e-66c45e567db2@huawei.com>
Date: Thu, 1 Dec 2022 10:09:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] media: platform: mtk-mdp3: Fix return value check in
 mdp_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221130081312.35523-1-linqiheng@huawei.com>
 <fc7ac761-eb81-347b-1c51-cdc9c786ee5b@collabora.com>
From: Qiheng Lin <linqiheng@huawei.com>
In-Reply-To: <fc7ac761-eb81-347b-1c51-cdc9c786ee5b@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.189]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_180929_826433_0934A56F 
X-CRM114-Status: GOOD (  14.54  )
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

在 2022/11/30 17:44, AngeloGioacchino Del Regno 写道:
> Il 30/11/22 09:13, Qiheng Lin ha scritto:
>> In case of error, the function mtk_mutex_get()
>> returns ERR_PTR() and never returns NULL. The NULL test in the
>> return value check should be replaced with IS_ERR().
>>
>> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 
>> driver")
>> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
>> ---
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c 
>> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>> index c413e59d4286..7a2d992dd842 100644
>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>> @@ -207,8 +207,8 @@ static int mdp_probe(struct platform_device *pdev)
>>       }
>>       for (i = 0; i < MDP_PIPE_MAX; i++) {
>>           mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
>> -        if (!mdp->mdp_mutex[i]) {
>> -            ret = -ENODEV;
>> +        if (IS_ERR(mdp->mdp_mutex[i])) {
>> +            ret = PTR_ERR(mdp->mdp_mutex[i]);
>>               goto err_return;
>>           }
>>       }
>>
> 
> That's true, and I fully agree.
> While you're at it, can you also fix the err_return case?
> 
> if (mdp)
>      for ...
>          if (!IS_ERR_OR_NULL(mdp->mdp_mutex[i]))
>              mtk_mutex_put(...)
> 

Thanks for your suggestion, will send the v2.

> Thanks,
> Angelo


