Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AE2C6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 13:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVImipPJ55LLlj3hxov+6J9Uas9BlzTbH/QBaoiYcnE=; b=CLfEB3Suk3DpPS43Z9Qru/6m4I
	hKnRA7s4s4JsKRBsH8TehCY28h0iHtr6E7m802+HTNrmGclYWRGx7Ezre+6Vvgp2ufGCSCVvNPnxa
	kLLw8sM8j9Y2iPEK/dSUIq2Nw5199toN/Ei3RgF5E28KxkQUNsoW/e6ypMXUEjAGIVvJNl4+/CWPi
	1nrfvDoURLlXU+7gTlQoWz7aLB6JUPCpqDGBHIzrZmYQEFO3D2DCh1LO09L1g5CZJ5q0+wTWKKjkP
	Hzmy8TH7vvfP1Mx63DFuNwcqX0ry4y2piM2aJ/1U+7t7cuWXwwRIPMShVAupO8ugaQrqy+CEZvjA2
	5EHMSUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAHp-00AgMf-CG; Tue, 27 Sep 2022 13:06:09 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAHn-00AgM2-EL
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 13:06:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id u59-20020a17090a51c100b00205d3c44162so2333477pjh.2
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=tVImipPJ55LLlj3hxov+6J9Uas9BlzTbH/QBaoiYcnE=;
        b=AeFiLZSELiOLu0C/WY7j3qNn2XbPtZX/1DfSK5wxjFb2rqwPO7CvvZtAFF5v6/7J26
         ahCqqp2F9wNI5OYX7qy/ObhCyFoh9fcBwqqwDTOmQ3Szz628RGrS+W9AFjoVJocXlWki
         VC0GYuee8hoFp6tnnZjb+BQvkFkX4acVrRZQaXEcy3Crna/0t54Jbazxa/CYEy/0/zFu
         2lndzQwEpvpkb26lSSoBm5VVsMti9KIfqB8rnh9R4Sn70IUDgJCGjP5FzkG0xZM/8Ujz
         ktOS6zIlcVHVVfda96Denge0ZrYEMhecJgtt3RQnWSFrUZInrw19D5HLdT/lXGWs6zAx
         AlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=tVImipPJ55LLlj3hxov+6J9Uas9BlzTbH/QBaoiYcnE=;
        b=a/42JmNwGqXbSp9gUX5AjVu2hxY9uBnFLCSVPGno31oYTBjWo+L5SaB7ilVxB9mwG7
         2sL3emvZZ6Hw4kW/qIbKo+dB4Gea+9PUvuNNU8W4ZlBF0/4i2aNZOaIfVom4KOPL3x7R
         k/f2Z7FH+wSFayhsQvlCX3DbZB68Dm+Kn1SyU6RikPpYBUtYWhVkD5gbpsADfn6D3nKC
         DGg4upAmy+EEnk3jX6KEaujgqBWA+aGoFInfANoi/u95JGWz/mfA/cvzAqPtJu9bWtr/
         nRGR+Xpt35wDC6BrSu/40GK4bu7WZIxB/5QULBb6v71Kgxa/pgqOhfjNH1wGmJFIPXFQ
         tWWA==
X-Gm-Message-State: ACrzQf1PjYeVzO8z8iEff/EdYCXp72ANJolcsd50j09g7DJAaEU7Yvt+
	eOCKlF1H51yvflZdjPlFq/45oYx4ul2rcrY/JHer0Q==
X-Google-Smtp-Source: AMsMyM6iYfFfRkY7ZCfN7iH6SfIok108DtV5xTUiUrfRhR4EUYS3wDXnryle8l6ZhFGMR+ScZmNr7PCxr1+tKvPRj2I=
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr4399905pjb.99.1664283966835; Tue, 27
 Sep 2022 06:06:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:06:06 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-5-4844816c9808@baylibre.com>
 <32c4822a-a094-5fa3-c2af-e515bf897937@collabora.com>
In-Reply-To: <32c4822a-a094-5fa3-c2af-e515bf897937@collabora.com>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:06:06 -0700
Message-ID: <CABnWg9vsd7Lk4kR4j-XrgJXAX+sEd3J+oz3hFc4sEuCGRRy8qw@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] drm/mediatek: hdmi: use a syscon/regmap instead
 of iomem
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
X-CRM114-CacheID: sfid-20220927_060607_498576_6A7671B5 
X-CRM114-Status: GOOD (  10.38  )
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

On Tue, 20 Sep 2022 12:18, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> To prepare support for newer chips that need to share their address
>> range with a dedicated ddc driver, move to a syscon.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 3196189429bc..5cd05d4fe1a9 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>
>..snip..
>
>> @@ -1428,7 +1413,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>   	struct device_node *cec_np, *remote, *i2c_np;
>>   	struct platform_device *cec_pdev;
>>   	struct regmap *regmap;
>> -	struct resource *mem;
>>   	int ret;
>>
>>   	ret = mtk_hdmi_get_all_clk(hdmi, np);
>> @@ -1474,8 +1458,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>   	}
>>   	hdmi->sys_regmap = regmap;
>>
>> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	hdmi->regs = devm_ioremap_resource(dev, mem);
>> +	hdmi->regs = syscon_node_to_regmap(dev->of_node);
>
>Nack. You're breaking ABI, this will force everyone to add syscon to devicetree,
>hence this breaks retrocompatibility with old devicetrees.
>
>Hint: not here, device_node_to_regmap()

Hi Angelo,

I'm sorry, I didn't think device tree retro compatibility was a thing.

I'll drop the requirement for the module to be a syscon.
Thx for the hint.

Thx,
Guillaume.

>
>Regards,
>Angelo
>
>>   	if (IS_ERR(hdmi->regs)) {
>>   		ret = PTR_ERR(hdmi->regs);
>>   		goto put_device;
>
>

