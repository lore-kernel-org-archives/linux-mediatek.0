Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E2CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVHgfeK+0yXNwYMJqLB3RuEuq3zMmGUnN/V4RFLasQ8=; b=uiqQ5Iv3ns8VK4IRyG8Dkvj6kF
	qwU7Bu7NC0ZgyxVHrzP+QvaHjkVsZ18kkv0yD9zcMaYEBP53hyz8SaILfAXAGcCSM842h9JMiUYV7
	vNzcPMemKEz2/oraEagtennFpHNTvWBh4T1ZHOMwum780wuPrqb9Q1EY+f1EZmhJhufRK0yB9uLaw
	hgsmibubXqaEoW6Xf32H98zkRqwrFxH1ksuqC9X94M2VcogWkfOtbriIuLKUIPrYcuwBmTS6xt7hV
	re3z9eNMPB9Afdndv9Q4kpIlfiQfWm+ErRNdyMs86yfckfxNAOmHhTaHgg/s2e6ZeZNNxkbNKheqw
	DllXWXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofgW6-009YdE-KR; Tue, 04 Oct 2022 11:55:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofgW1-009Yc8-SR
	for linux-mediatek@lists.infradead.org; Tue, 04 Oct 2022 11:55:16 +0000
Received: by mail-lf1-x130.google.com with SMTP id f37so2436751lfv.8
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Oct 2022 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=AVHgfeK+0yXNwYMJqLB3RuEuq3zMmGUnN/V4RFLasQ8=;
        b=HCraqwA4dmNVerhXpmAuHLH4r2VSVcfXCEXH9CybnppQCmsY4LWHa0k0aB34ps+YJh
         D0FCBE7aw2MjUV0uur4XGgPoQ+QSzmM9HHhfdqDSG1s+xvs4O3W5qunm3BtDzZJSuY0u
         atHJpYrSENjx/q+LeBwFD/q3EUd4D6MtToFTnDGC56yykmwQKeCUxnfhgeJSRsusknmk
         5QTgbwRmJsAEpECIgtW2tn0jLsRksRyDmpr40kHA82vkMhu4WLJVFFVVO3Ek9nYL7w0v
         jv4ujvhJiLhHm6GueGGupHX7HtNZhEaqeHSwTAdwcPOlX/QIGWXNIJtMftYwAj5M+A49
         V8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=AVHgfeK+0yXNwYMJqLB3RuEuq3zMmGUnN/V4RFLasQ8=;
        b=UTrGyIK0GqputTmEBXgVhKcCOmtLnLm7Qn+eD1Bj5OOy7+cXiLB2MTRYEKozpjl9Gz
         1N2er6FzTm7D3GQ6QI+8erxvhA4epE8zkKjTihiRaXY1cdOdqRWpzJinRRtJYpAW0b9G
         +I68/D5llUUwc8r6x2pq46oC8O9OaEHT04USpH32Eu9ya09DSuaovbnQHnL51NJQEYxV
         DCP9CyTNM3M9iyrvq9K8klxlY1V1/kOokrS3t+bNTJqsKO7buXLttQXUtW3dYeujKteQ
         PjyGItkd0Lh+n/VsTcm0uuKGQtd6FtuH2twoaFhxamqX1hqL3P7+HkZuuQIOBQ3yn9lF
         JBuw==
X-Gm-Message-State: ACrzQf3H4Ei2Y7EUZ+urpz9V4T1EsdIjBd2CVotA5tIQ+EmpFIQ8tRpW
	zJSzRzU7G1uv4+R5wE0r12uvcjP5zveaVyffz68bNg==
X-Google-Smtp-Source: AMsMyM7T5HmFHtYzBToQIDw740pyxsyZD3CK3phoCdY5v6/uoVZEM5zyMYJH17SMmdaDtr3rE0uxWHutyCOz+oUYcFU=
X-Received: by 2002:ac2:44b6:0:b0:4a2:5084:6163 with SMTP id
 c22-20020ac244b6000000b004a250846163mr1242968lfm.446.1664884510269; Tue, 04
 Oct 2022 04:55:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Oct 2022 04:55:07 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org> <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
 <bc64b69d-3d65-f5ca-a688-2ad1a055ba4b@linaro.org> <CABnWg9sJFBAXi1bu_yHDppFOmg=H=G7QTn9Bzqkr-t7qm5vUFw@mail.gmail.com>
 <db1abf9d-ba40-f71c-0d37-c3912ac1bd8e@linaro.org>
In-Reply-To: <db1abf9d-ba40-f71c-0d37-c3912ac1bd8e@linaro.org>
MIME-Version: 1.0
Date: Tue, 4 Oct 2022 04:55:07 -0700
Message-ID: <CABnWg9vOHWpdLPAFdXAG3GNgsxpbzgh2gTq_tm72Tk2uR54LaQ@mail.gmail.com>
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_045513_938231_D47712E7 
X-CRM114-Status: GOOD (  19.93  )
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

On Tue, 04 Oct 2022 12:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 03/10/2022 17:29, Guillaume Ranquet wrote:
>> On Tue, 27 Sep 2022 16:28, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> On 27/09/2022 15:04, Guillaume Ranquet wrote:
>>>> On Thu, 22 Sep 2022 09:20, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>> On 19/09/2022 18:56, Guillaume Ranquet wrote:
>>>>>> Add dpi support to enable the HDMI path.
>>>>>>
>>>>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>>>> index 72049a530ae1..27f029ca760b 100644
>>>>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>>>> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>>>>>  	  .data = (void *)MTK_DPI },
>>>>>>  	{ .compatible = "mediatek,mt8192-dpi",
>>>>>>  	  .data = (void *)MTK_DPI },
>>>>>> +	{ .compatible = "mediatek,mt8195-dpi",
>>>>>> +	  .data = (void *)MTK_DPI },
>>>>>
>>>>> It's compatible with the others. You don't need more compatibles.
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> It's a bit confusing, because this compatible is used in both
>>>> mtk_drm_drv.c and in mtk_dpi.c
>>>>
>>>> Albeit it's entirely the same thing regarding the mtk_drm_drv module,
>>>> it's pretty different
>>>> regarding the mtk_dpi module.
>>>
>>> Sure, but this does not explain why do you need these entries here in
>>> mtk_drm_drv.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Hi Krzysztof,
>>
>> Sorry for the late answer.
>> The mtk_drm_drv is the component master of the full mediatek drm stack.
>>
>> it "binds" all of the crtc/dpi/ovl/mutex/merge... components of the stack.
>>
>> That mtk_ddp_comp_dt_ids array is iterated over to find all of the components
>> from the device tree.
>
>No. You said what the code is doing. I think I understand this. You
>still do not need more compatibles. Your sentence did not clarify it
>because it did not answer at all to question "why". Why do you need it?
>
>Sorry, the change looks not correct.
>
>Best regards,
>Krzysztof
>

I need a new compatible to adress the specifics of mt8195 in the mtk_dpi driver,
the change is in this series with:
[PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver [1]

I then need to add that compatible to the "list" here in mtk_drm_drv.
I don't see a way around this unless I rewrite the way mtk_drm_drv works?

Maybe if I declare a new compatible that is generic to all mediatek
dpi variants?
and have all the dts specify the node with both the generic dpi and
the specific compatible?

dpi@xxx {
	compatible = "mediatek,dpi", "mediatek,mt8195-dpi";
	...
}

Then I can "collapse" all the dpi related nodes in mtk_drm_drv under
"mediatek,dpi" ?

I guess would have to do the change for all other components that are needed in
mtk_drm_drv (mmsys, aal, ccor, color, dither, dsc, gamma, mutex...).

That's the only trivial way I can think of implementing this with the
current status
of the mtk_drm stack.

Do you have any other ideas in mind?

Thx,
Guillaume.

[1] : https://lore.kernel.org/all/20220919-v1-16-4844816c9808@baylibre.com/

