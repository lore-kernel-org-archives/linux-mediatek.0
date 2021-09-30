Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED42EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 10:58:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CB2619A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9CB2619A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP3XB+QoaZ4e08udHCEk0k+4IMo48aYHMQ6EKs4rerI=; b=t7CzJdmAjSJ7Mc87WVTneeqfoM
	bMBR926Ib2EWitcJ5mYVda95leLF29BS63SIwjsCzcQnPJ7NdwFDsf1tOAa+BMU+vJBSyVsu6Ns+L
	nNTTs4lzHsknbufGMd357N4vaUf2Hyv0HS6UAiF/bylTovs32erk5/AcXQtgvecvz8k4/zbB7jX+k
	okGbKce2wNLi1jbwS4vVXoGM9TR5IZQ9goi33i6IgBpU73Zn8SuErEKtjVBOkzqd0/03dqmK+QpEP
	pqppr8b0F2r/c9amowEO3Q3iKgXEBa/3sVkmVFgbfiz6O0gUnPtNa4OySWCViB3/+5fvtqOECtuyT
	RE3B0y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVtlk-00DxQa-Ic; Thu, 30 Sep 2021 10:58:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVtlL-00DxJG-Mf; Thu, 30 Sep 2021 10:58:05 +0000
Received: from [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1] (unknown
 [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED32C1F44A9D;
 Thu, 30 Sep 2021 11:58:00 +0100 (BST)
Subject: Re: [PATCH v8 09/12] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Matthias Kaehlcke <mka@chromium.org>,
 anan.sun@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>,
 Irui Wang <irui.wang@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-10-yong.wu@mediatek.com>
 <02f444d5-9633-3f9c-2d1f-97ce073d1180@collabora.com>
 <79cbf64491273797f218f417234b8c95936bd3b1.camel@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f9829a5a-984c-bced-0286-53f9edc8ae3d@collabora.com>
Date: Thu, 30 Sep 2021 12:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <79cbf64491273797f218f417234b8c95936bd3b1.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_035804_043093_0C5DD390 
X-CRM114-Status: GOOD (  32.88  )
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



On 30.09.21 05:28, Yong Wu wrote:
> Hi Dafna,
> 
> Thanks very much for the review.
> 
> On Wed, 2021-09-29 at 14:13 +0200, Dafna Hirschfeld wrote:
>>
>> On 29.09.21 03:37, Yong Wu wrote:
>>> MediaTek IOMMU has already added the device_link between the
>>> consumer
>>> and smi-larb device. If the vcodec device call the
>>> pm_runtime_get_sync,
>>> the smi-larb's pm_runtime_get_sync also be called automatically.
>>>
>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>> CC: Irui Wang <irui.wang@mediatek.com>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> Reviewed-by: Evan Green <evgreen@chromium.org>
>>> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
>>> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>    .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 +++-----------
>>> --
>>>    .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>>>    .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>>>    .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 +++-----------
>>> -----
>>>    4 files changed, 10 insertions(+), 75 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
>>> b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
>>> index 6038db96f71c..d0bf9aa3b29d 100644
>>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
>>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
>>> @@ -8,14 +8,12 @@
>>>    #include <linux/of_address.h>
>>>    #include <linux/of_platform.h>
>>>    #include <linux/pm_runtime.h>
>>> -#include <soc/mediatek/smi.h>
>>>    
>>>    #include "mtk_vcodec_dec_pm.h"
>>>    #include "mtk_vcodec_util.h"
>>>    
>>>    int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>>>    {
>>> -	struct device_node *node;
>>>    	struct platform_device *pdev;
>>>    	struct mtk_vcodec_pm *pm;
>>>    	struct mtk_vcodec_clk *dec_clk;
>>> @@ -26,18 +24,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev
>>> *mtkdev)
>>>    	pm = &mtkdev->pm;
>>>    	pm->mtkdev = mtkdev;
>>>    	dec_clk = &pm->vdec_clk;
>>> -	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
>>> -	if (!node) {
>>> -		mtk_v4l2_err("of_parse_phandle mediatek,larb fail!");
>>> -		return -1;
>>> -	}
>>>    
>>> -	pdev = of_find_device_by_node(node);
>>> -	of_node_put(node);
>>> -	if (WARN_ON(!pdev)) {
>>> -		return -1;
>>> -	}
>>> -	pm->larbvdec = &pdev->dev;
>>>    	pdev = mtkdev->plat_dev;
>>>    	pm->dev = &pdev->dev;
>>>    
>>> @@ -47,14 +34,11 @@ int mtk_vcodec_init_dec_pm(struct
>>> mtk_vcodec_dev *mtkdev)
>>>    		dec_clk->clk_info = devm_kcalloc(&pdev->dev,
>>>    			dec_clk->clk_num, sizeof(*clk_info),
>>>    			GFP_KERNEL);
>>> -		if (!dec_clk->clk_info) {
>>> -			ret = -ENOMEM;
>>> -			goto put_device;
>>> -		}
>>> +		if (!dec_clk->clk_info)
>>> +			return -ENOMEM;
>>>    	} else {
>>>    		mtk_v4l2_err("Failed to get vdec clock count");
>>> -		ret = -EINVAL;
>>> -		goto put_device;
>>> +		return -EINVAL;
>>>    	}
>>>    
>>>    	for (i = 0; i < dec_clk->clk_num; i++) {
>>> @@ -63,29 +47,24 @@ int mtk_vcodec_init_dec_pm(struct
>>> mtk_vcodec_dev *mtkdev)
>>>    			"clock-names", i, &clk_info->clk_name);
>>>    		if (ret) {
>>>    			mtk_v4l2_err("Failed to get clock name id =
>>> %d", i);
>>> -			goto put_device;
>>> +			return ret;
>>>    		}
>>>    		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>>>    			clk_info->clk_name);
>>>    		if (IS_ERR(clk_info->vcodec_clk)) {
>>>    			mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
>>>    				clk_info->clk_name);
>>> -			ret = PTR_ERR(clk_info->vcodec_clk);
>>> -			goto put_device;
>>> +			return PTR_ERR(clk_info->vcodec_clk);
>>>    		}
>>>    	}
>>>    
>>>    	pm_runtime_enable(&pdev->dev);
>>>    	return 0;
>>> -put_device:
>>> -	put_device(pm->larbvdec);
>>> -	return ret;
>>>    }
>>>    
>>>    void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
>>>    {
>>>    	pm_runtime_disable(dev->pm.dev);
>>> -	put_device(dev->pm.larbvdec);
>>>    }
>>
>> Now that functions only do  'pm_runtime_disable(dev->pm.dev);' so it
>> will be more
>> readable to remove the function mtk_vcodec_release_dec_pm
>> and replace with pm_runtime_disable(dev->pm.dev);
>> Same for the 'enc' equivalent.
> 
> Make sense. But It may be not proper if using pm_runtime_disable
> as the symmetry with mtk_vcodec_init_dec_pm in the mtk_vcodec_probe.
> 
> Maybe we should move pm_runtime_enable out from mtk_vcodec_init_dec_pm
> into mtk_vcodec_probe. I could do a new patch for this. Is this ok for
> you?

yes, there is also asymettry when calling pm_runtime* in general,
I see in the decoder it is called from mtk_vcodec_dec_pm.c
but in the encoder it is called from mtk_vcodec_enc.c,

I think all calls to pm_runtime* should be out of the *_pm.c files
since for example 'mtk_vcodec_dec_pw_on' also do just one call to
pm_runtime_resume_and_get so this function can also be removed.

thanks,
Dafna

> 
>>
>> Thanks,
>> Dafna
> 
> [snip]
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
