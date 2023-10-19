Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB1ECDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zddgK8q1iNIBf8BnDpe1GXtODd/QfnBL3pWylceOZ9A=; b=hmWmLdrDO0Cw1K
	GTICt29tuoWTSEY49mOr71u0EXIbPvomA2/7/ButepdzRY0v01H5tF2FGfEcEgb+/zB9MMl8dTF9Y
	l8trn7bNZqSFVTqCpsjjF9A8EZm2157U3+DTT+FsM0p49JsMQssxGWOasU1M96otAvJrVso6iipYC
	J/+08iYQGEVHA4ZaqtVIFA5LDSPNtHQi9fG2nvFqZgFSiLOQ+ya6WdDp+oXDI2UFIRdWYAXkFlzIY
	DiD7/KtXKHDm3yQxeBumn/obQjo8WTNGeisMtSI8M61BUNBnmRCrvRRWor8WaneyNoYUkWKNx5BYL
	o4oLZmtlViJh1uWpjrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQ5g-00GvSX-2G;
	Thu, 19 Oct 2023 10:17:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQ5d-00GvRk-0n;
	Thu, 19 Oct 2023 10:17:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B35136607322;
	Thu, 19 Oct 2023 11:17:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697710635;
	bh=0P71wcdmZeNDRgq2k3g+efA5oDtGoggSn0l1TpQZ17k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ttpn6UU4pcVlAK9qmpH2/G52og116jTuzlfzkXrQlp+kr/iFMn+jZ7pj3wdRYK4Uk
	 DGRUSWSidFaLwUL7IObs7lYi43ktQUdnUwE8/L63vPmpT6TYRg7Z9dlf5AbyGus2fs
	 abwR9bFieb8jZpsER4FUP1W3sck4RS53F0T2jrobMfN5BY+JAyS/s2kFWN9d5J5t3u
	 z6KAbfY6K8NNxU11N7LqnGC0T03FhbnfaE0lYNeN2dWW672oOPcpFtgzCqFDdFGmQK
	 5FDEeeXbRAsIuHfLUOAjhLUbLscwsaa24tySuE1e2ajXuZcBSI5tYd/9QE9TCpqskn
	 Zqtu4MHWRPdFw==
Message-ID: <0fd83158-5f7c-4f0b-95ff-5857668ab9e8@collabora.com>
Date: Thu, 19 Oct 2023 12:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/24] drm/mediatek: Remove ineffectual power
 management codes
Content-Language: en-US
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-16-shawn.sung@mediatek.com>
 <5a059ca0-fcb7-4730-a0d8-29103fb71d54@collabora.com>
 <2313a4b08f57ab24b48a13a31845eed7e0ab042d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2313a4b08f57ab24b48a13a31845eed7e0ab042d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_031717_543900_9122A05B 
X-CRM114-Status: GOOD (  24.93  )
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
Cc: =?UTF-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "sean@poorly.run" <sean@poorly.run>, "johnson.wang@mediatek.corp-partner.google.com" <johnson.wang@mediatek.corp-partner.google.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/10/23 11:52, Shawn Sung (宋孝謙) ha scritto:
> Hi Angelo,
> 
> On Thu, 2023-10-19 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
>> Il 19/10/23 07:56, Hsiao Chien Sung ha scritto:
>>> Display modules will be powered on when .atomic_enable(),
>>> there is no need to do it again in mtk_crtc_ddp_hw_init().
>>> Besides, the DRM devices are created manually when mtk-mmsys
>>> is probed and there is no power domain linked to it.
>>>
>>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
>>> MT8173.")
>>>
>>> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 +++---------------
>>>    1 file changed, 3 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> index bc4cc75cca18..c7edd80be428 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> @@ -6,7 +6,6 @@
>>>    #include <linux/clk.h>
>>>    #include <linux/dma-mapping.h>
>>>    #include <linux/mailbox_controller.h>
>>> -#include <linux/pm_runtime.h>
>>>    #include <linux/soc/mediatek/mtk-cmdq.h>
>>>    #include <linux/soc/mediatek/mtk-mmsys.h>
>>>    #include <linux/soc/mediatek/mtk-mutex.h>
>>> @@ -362,22 +361,16 @@ static int mtk_crtc_ddp_hw_init(struct
>>> mtk_drm_crtc *mtk_crtc, struct drm_atomic
>>>    		drm_connector_list_iter_end(&conn_iter);
>>>    	}
>>>    
>>> -	ret = pm_runtime_resume_and_get(crtc->dev->dev);
>>> -	if (ret < 0) {
>>> -		DRM_ERROR("Failed to enable power domain: %d\n", ret);
>>> -		return ret;
>>> -	}
>>> -
>>
>> Are you really sure that writes to DISP_REG_OVL_xxx and others in
>> other modules,
>> called by the .layer_config() callback, can be successfully done on
>> an unpowered
>> and/or unclocked module, on all MediaTek SoCs?
>> This looks a bit odd.
> 
> Not sure if I get your point correctly. We removed this PM API because:
> 
> 1. mtk_crtc_ddp_hw_init() is called by mtk_drm_crtc_atomic_enable(),
> and the new inline function mtk_ddp_comp_power_on() is called before hw
> init, we can make sure the power is on before configuring the hardware.
> 
> 2. The device "crtc->dev->dev" here is assigned by the probe function
> of mtk-mmsys, which will be look like "mediatek-drm.auto.13", and this
> device is not linked to any power domain.
> 

Thanks for the clarification. In this case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>>
>>>    	ret = mtk_mutex_prepare(mtk_crtc->mutex);
>>>    	if (ret < 0) {
>>>    		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
>>> -		goto err_pm_runtime_put;
>>> +		goto error;
>>>    	}
>>>    
>>>    	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
>>>    	if (ret < 0) {
>>>    		DRM_ERROR("Failed to enable component clocks: %d\n",
>>> ret);
>>> -		goto err_mutex_unprepare;
>>> +		goto error;
>>>    	}
>>>    
>>>    	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>>> @@ -426,16 +419,13 @@ static int mtk_crtc_ddp_hw_init(struct
>>> mtk_drm_crtc *mtk_crtc, struct drm_atomic
>>>    
>>
>> ...because you could otherwise just call pm_runtime_put() here,
>> instead of removing
>> the pm_runtime_resume_and_get() call, which is something I would
>> advise to do.
>>
>> Regards,
>> Angelo
>>
> 
> Thanks,
> Shawn



