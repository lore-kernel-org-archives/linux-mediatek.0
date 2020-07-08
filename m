Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AA1C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 15:13:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01FFE2078D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 15:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUGAEWxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01FFE2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B9ddk3a+lYVEY6ziCeHYRSHkimZmemJYN0O0ISyK/wI=; b=RUGAEWxePCQ/mNO4Qs6yLzkX+
	4oMWqfyjOzBZyu/OO0gI18uAYj4dDOP+exUkh4zTjWOftvNtpUDx233RUvHr+9LmmcPGCd9lmFHJ3
	W7WxhHmX2yhlcmosU5cAqzqEB/Hrgn19GaA22A7qbiL0p5ECD/gn/8/c+RVdqxTqyrO78mytXJHBK
	NmzRKKbukD6fG7vwpDtoZb25ny46NYc85TUy2W/dr9ytLMpTwCSRX75B5MgbfLZ+w/UJYKzEfGGha
	HARN+tZaZPPKW4PfjA1VKBoqopseIOKkK/jYmOasR4BZfxAu0iWm/UfEsrt3PTzEemvd3plGSrCE3
	3s14NXpmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtBkj-0003Mi-6a; Wed, 08 Jul 2020 15:12:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtBkd-0003Ku-Kw; Wed, 08 Jul 2020 15:12:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 609322A02F4
Subject: Re: [RESEND PATCH 3/3] drm/mediatek: mtk_dpi: Use simple encoder
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
 <20200518173909.2259259-4-enric.balletbo@collabora.com>
 <20200701134128.6a967a89@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <3f7338ad-b83d-da1d-2b07-f5225c56d7f9@collabora.com>
Date: Wed, 8 Jul 2020 17:12:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701134128.6a967a89@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_111247_790645_3102EF65 
X-CRM114-Status: GOOD (  17.94  )
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

Hi Boris,

Thank you to spend some time to review the patches.

On 1/7/20 13:41, Boris Brezillon wrote:
> On Mon, 18 May 2020 19:39:09 +0200
> Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:
> 
>> The mtk_dpi driver uses an empty implementation for its encoder. Replace
>> the code with the generic simple encoder.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> ---
>>
>>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++-----------
>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index baad198c69eb..80778b2aac2a 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -20,6 +20,7 @@
>>  #include <drm/drm_bridge.h>
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_of.h>
>> +#include <drm/drm_simple_kms_helper.h>
>>  
>>  #include "mtk_dpi_regs.h"
>>  #include "mtk_drm_ddp_comp.h"
>> @@ -510,15 +511,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>  	return 0;
>>  }
>>  
>> -static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
>> -{
>> -	drm_encoder_cleanup(encoder);
>> -}
>> -
>> -static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
>> -	.destroy = mtk_dpi_encoder_destroy,
>> -};
>> -
>>  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>>  				 enum drm_bridge_attach_flags flags)
>>  {
>> @@ -591,8 +583,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>>  		return ret;
>>  	}
>>  
>> -	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
>> -			       DRM_MODE_ENCODER_TMDS, NULL);
>> +	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
>> +				      DRM_MODE_ENCODER_TMDS);
> 
> Not related to this change, but shouldn't we have DRM_MODE_ENCODER_DPI
> here?
> 

Right, I'll add a patch to fix this.

>>  	if (ret) {
>>  		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>>  		goto err_unregister;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
