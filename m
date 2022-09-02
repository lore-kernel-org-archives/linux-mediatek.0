Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C16BECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b8+o5eZL7eCPiTTC0dL6jPHiAlxhrpP1pHOaHHKoOM=; b=z5Tl/t45SS4SdHpEqScfSjLYc5
	D03PNzqs/ck6w47Oyh+AqdJCayLnnumg+JUVE8BxdSkxrsmadiGN7Ouy0+E2g8YlDymhp3eHzFuFm
	YVupInE909jgQQtKzMMU+SsETCEYSxKNl+Vnzoq6V9+2HAFWX/J27F9TonkTL3f3nhlkGzyI0PlDK
	OJjC0+OzLYh80yfUfhaDzLWsvbgXeJ/CfVQbLC53SCYFSQpsAI4tS4V60cBflECZZGGtGqWIW9YAz
	cyu86d4GNzpzPP9EtoNXvEa6VEjs+paaF0qrTxeF5yQXn78+V8Lkp+o76AJmuCZ+o3y8R6vrEI/Gw
	QR2gMD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3iN-003EEF-5J; Fri, 02 Sep 2022 10:15:55 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3iB-003E2G-CE; Fri, 02 Sep 2022 10:15:45 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MJtzY44CrzHnYm;
	Fri,  2 Sep 2022 18:13:45 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 18:15:34 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 18:15:33 +0800
Subject: Re: [PATCH 3/3] media: platform: mtk-mdp3: fix error return code in
 mdp_vpu_dev_init()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
	<ping-hsun.wu@mediatek.com>, <daoyuan.huang@mediatek.com>,
	<moudy.ho@mediatek.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-4-sunke32@huawei.com>
 <ee6221e1-8ce6-9fe0-6094-1cd156fdaae3@collabora.com>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <957c9e9a-d729-0109-92e9-4fafe9ef7622@huawei.com>
Date: Fri, 2 Sep 2022 18:15:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ee6221e1-8ce6-9fe0-6094-1cd156fdaae3@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_031543_590296_CA56FA40 
X-CRM114-Status: GOOD (  11.60  )
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



在 2022/9/2 17:10, AngeloGioacchino Del Regno 写道:
> Il 02/09/22 10:58, Sun Ke ha scritto:
>> If mdp_vpu_shared_mem_alloc failed, mdp_vpu_dev_init should return 
>> -ENOMEM.
>>
>> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 
>> driver")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
> 
> Hello Sun,
> thanks for the patch! However, someone else already sent the same fix 
> and it's
> in a better shape. Please look at [1].
> 
> Thanks,
> Angelo
> 
> [1]: 
> https://patchwork.kernel.org/project/linux-mediatek/patch/YxDGFMwyeNXFPaig@kili/ 

Oh. I am late.

Thanks,
Sun Ke

> 
> 
>> ---
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c 
>> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
>> index 9f5844385c8f..078040b7f65e 100644
>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
>> @@ -175,6 +175,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, 
>> struct mtk_scp *scp,
>>       mem_size = vpu_alloc_size;
>>       if (mdp_vpu_shared_mem_alloc(vpu)) {
>>           dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
>> +        err = -ENOMEM;
>>           goto err_mem_alloc;
>>       }
>>
> 
> 
> .

