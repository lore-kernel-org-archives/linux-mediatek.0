Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1135C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoaKPGbtL0W6yKop2Q5GqUbFMulbchm58vJX4E+Hvss=; b=UCD2dEFYGkX1QysikqqCpfhCq2
	Kq1jiX27FfBy/oqy22lq6zILY+xhSfUlwfHkUQh/pGg4FNlUqd2D/9AzQnXzkx7aAXU/+R/HH30zQ
	J9oaaors8Cayy7fxPPe2VPZrpPMvcKzrmvb3tWcZIID7xxcxaK+BTrphYWWPk2uPmplH2FkKg9oyB
	exEUuK67gg/TKwldZ0gAKChm6UaNhGphoRgN4lNFJP2rT8ArQnMdh3pgW7iILPxjT5dFRoTXrvPon
	jMlt3r64R93eztarkR5Ut52wI9Qtnj//DH+NiojXXE9DFvCicgS2RajwunSa9deOCaTZeK2ACBrIO
	kWBMjltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAKR-00AhJA-QO; Tue, 27 Sep 2022 13:08:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAKK-00AhHG-Ju
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 13:08:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id v1so9014118plo.9
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=YoaKPGbtL0W6yKop2Q5GqUbFMulbchm58vJX4E+Hvss=;
        b=Y3O5T8rz166uc6HJ4FhMI44NIUgz7yP8NiLJa38oQ3iQqcCvEf1JKUSMRRQjUmvMTd
         4ctpIh9zL2BGVRzkWihc/0+zJA0vvqQaNIcdLVBGBjlJgpCdtH9UA6CaIZ8fAsMB7Qa5
         MAmXOYJLBFGb76dyw/0GYl4Ud9bQLwonphTsObGEXWQEk9eA57oxtDSmPKQJHfic3A3j
         HkZqwW/hayyIYLR1Y0kHnLheguF50xHZLRtrPOgrjZtl0trmUGTA+HLEUWgduM2GBkWu
         ThZ/NjoYcg+Qh9SrbLP+UhAR4BHGL1ZL/OyBADAi8nYVZqFUBSIRwmAXmM7f9rMGutH+
         2GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YoaKPGbtL0W6yKop2Q5GqUbFMulbchm58vJX4E+Hvss=;
        b=GdoVtbpeQHIe7nP8OoTvX3acUTEtM9XdFJXBToT9eV9p2QGB8ELqK2VoeqOlYmdxJq
         NS1KqFZh/Fimww+noUd5n/ZEvyFNPVR5v+0cuJrjsCV/Gk3pE3SNzHzYfH4vpbsKu1T7
         6QDR+y810YIzjBiWlHZr4OWa7elKW71PqDSjKneHwBd4HE7XKwtPxGf35KtLJGRA1BQG
         VnYRTykuZtaangrAxW79kLfCwAfPa4NRiNh8UuWpU9CdLfDq0kQioh75pW9y1InVNoK6
         skhdvVEgIU1I6e5N0gHSVjkPeiuZEWE/1DI2qVpd0hi5yUiSpQWaif7/gSua+tG9If4o
         KNbQ==
X-Gm-Message-State: ACrzQf1vdIuY2pz1bVcp1a41ZNiVxz5EI0iaqDW/cRjuO8yfFobGYz7Y
	4mefyS07gERgN206kRkGvKhiOIn+/FY3+1w7g+LVLg==
X-Google-Smtp-Source: AMsMyM6X8Fa6ezRZqL7m/lEJjF3Bh5CG2glAPpLeLqQI0M9YdLpt4yB4B9sD/oFbG2+k4WA70xAHEax+sQbaSKsrxhc=
X-Received: by 2002:a17:90b:3807:b0:205:d746:93a0 with SMTP id
 mq7-20020a17090b380700b00205d74693a0mr3635933pjb.188.1664284124030; Tue, 27
 Sep 2022 06:08:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:08:43 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-7-4844816c9808@baylibre.com>
 <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
In-Reply-To: <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:08:43 -0700
Message-ID: <CABnWg9uDo_P7FKzL7zjsZbfrhjT7MtWinhy5pKvDbNp_R5oJPg@mail.gmail.com>
Subject: Re: [PATCH v1 07/17] drm/mediatek: extract common functions from the
 mtk hdmi driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_060844_679892_5D6667E6 
X-CRM114-Status: GOOD (  10.26  )
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

On Tue, 20 Sep 2022 12:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Create a common "framework" that can be used to add support for
>> different hdmi IPs within the mediatek range of products.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>> index d4d193f60271..008ec69da67b 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -22,7 +22,8 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>>
>>   mediatek-drm-hdmi-objs := mtk_cec.o \
>>   			  mtk_hdmi.o \
>
>abcd ... mtk_hdmi_common.o goes here :-)
>
>> -			  mtk_hdmi_ddc.o
>> +			  mtk_hdmi_ddc.o \
>> +			  mtk_hdmi_common.o \
>>
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 5cd05d4fe1a9..837d36ec4d64 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -32,187 +32,18 @@
>>   #include <drm/drm_probe_helper.h>
>>
>>   #include "mtk_cec.h"
>> -#include "mtk_hdmi.h"
>>   #include "mtk_hdmi_regs.h"
>> +#include "mtk_hdmi_common.h"
>>
>>   #define NCTS_BYTES	7
>>
>> -enum mtk_hdmi_clk_id {
>> -	MTK_HDMI_CLK_HDMI_PIXEL,
>> -	MTK_HDMI_CLK_HDMI_PLL,
>> -	MTK_HDMI_CLK_AUD_BCLK,
>> -	MTK_HDMI_CLK_AUD_SPDIF,
>> -	MTK_HDMI_CLK_COUNT
>> +const char * const mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT] = {
>
>Why MT8183? This can be either MT8167 or MT2701... or, IMO more appropriately, you
>should name the IP version.
>Example: MTK_HDMIV123_CLK_COUNT (I don't know what IP version would that be!).

You're right, the naming isn't great.
I'll ask mediatek if they have a good name that would regroup the "legacy"
HDMI IP and the new IP in mt8195.

Thx,
Guillaume.

>
>> +	[MTK_MT8183_HDMI_CLK_HDMI_PIXEL] = "pixel",
>> +	[MTK_MT8183_HDMI_CLK_HDMI_PLL] = "pll",
>> +	[MTK_MT8183_HDMI_CLK_AUD_BCLK] = "bclk",
>> +	[MTK_MT8183_HDMI_CLK_AUD_SPDIF] = "spdif",
>>   };
>>
>
>Regards,
>Angelo
>
>

