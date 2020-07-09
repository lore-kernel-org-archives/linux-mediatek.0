Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81F9C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 10:47:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B599A206DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 10:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnf3x+Qp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B599A206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9vL4QKjro7+ppGLqrbZ0cq1Wg9dylxymkk9I0l3nJfE=; b=hnf3x+Qp/Qx1k1FJafcMSInlU
	XoYvn7FwFJjT6Flf/kuekbAy0tu6NyFYinjXmaOb3aoWuVDgBv31CT2xXAdMw7Xpp6U/arZFGF2XH
	WYn1yA8y7RbvITFwkC9gwDYzwMkf/wEflKdtVUxAwcvPXYNYRzYGd40riWtd0/NGMDPmQWJVg4Fnp
	vQSvhy0ZVN+TA3fnzmIc+ZRpHKNMRvZLDLuNtMWjV2+gvHZCtBlVu7wFp3fgGhXmC063uavBc/q6d
	QzujpilMgPastQagalR4sjD4BNRGb66RFOQFQZGXBVhi8Ej4xU5Et1UN0zX1JyLTz5BvwlWlI9ssF
	syjIu6A4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtU5K-0001MI-UG; Thu, 09 Jul 2020 10:47:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtU5H-0001Kf-DV; Thu, 09 Jul 2020 10:47:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 72D912A3CAC
Subject: Re: [RESEND PATCH 3/3] drm/mediatek: mtk_dpi: Use simple encoder
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
 <20200518173909.2259259-4-enric.balletbo@collabora.com>
 <20200701134128.6a967a89@collabora.com>
 <3f7338ad-b83d-da1d-2b07-f5225c56d7f9@collabora.com>
Message-ID: <dba9e359-6f58-e283-d39a-82bfbec15d5a@collabora.com>
Date: Thu, 9 Jul 2020 12:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3f7338ad-b83d-da1d-2b07-f5225c56d7f9@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_064719_551647_16CD6E93 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi again,

On 8/7/20 17:12, Enric Balletbo i Serra wrote:
> Hi Boris,
> 
> Thank you to spend some time to review the patches.
> 
> On 1/7/20 13:41, Boris Brezillon wrote:
>> On Mon, 18 May 2020 19:39:09 +0200
>> Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:
>>
>>> The mtk_dpi driver uses an empty implementation for its encoder. Replace
>>> the code with the generic simple encoder.
>>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> ---
>>>
>>>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++-----------
>>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> index baad198c69eb..80778b2aac2a 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> @@ -20,6 +20,7 @@
>>>  #include <drm/drm_bridge.h>
>>>  #include <drm/drm_crtc.h>
>>>  #include <drm/drm_of.h>
>>> +#include <drm/drm_simple_kms_helper.h>
>>>  
>>>  #include "mtk_dpi_regs.h"
>>>  #include "mtk_drm_ddp_comp.h"
>>> @@ -510,15 +511,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>>  	return 0;
>>>  }
>>>  
>>> -static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
>>> -{
>>> -	drm_encoder_cleanup(encoder);
>>> -}
>>> -
>>> -static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
>>> -	.destroy = mtk_dpi_encoder_destroy,
>>> -};
>>> -
>>>  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>>>  				 enum drm_bridge_attach_flags flags)
>>>  {
>>> @@ -591,8 +583,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>>>  		return ret;
>>>  	}
>>>  
>>> -	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
>>> -			       DRM_MODE_ENCODER_TMDS, NULL);
>>> +	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
>>> +				      DRM_MODE_ENCODER_TMDS);
>>
>> Not related to this change, but shouldn't we have DRM_MODE_ENCODER_DPI
>> here?
>>
> 

Thinking a bit more about this and this patchset in general, I think I'll drop
this patch from the series, at the end, all the encoder creation stuff should be
moved to mtk_drm_drv.


> Right, I'll add a patch to fix this.
> 
>>>  	if (ret) {
>>>  		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>>>  		goto err_unregister;
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
