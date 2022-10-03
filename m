Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58531C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuEmPyN4Ez4NmzzutnovdwGSEF1vNe6R6TiRpHW5ogY=; b=x/DqKeO8T/8Y/86GiKjrzatunW
	+VcQSmaSjptcPcmGW83+bh3okpHCrCHpzzM0kqFvVLFjoWbSkXX+0KYI0neRa0LEBmOJNt++nsSzR
	kgqClFFAj1jWUcDgPB5Jjea3zP7xvkOETOwbE2CrzVocWxXK1IpOUAy+C2J0iMeElezkrFfJ3Aq+O
	PiKDOTmSMwjibBdrGJGeD1GwJ2KG4CQF+8cDvLioV5GUArj+yaDfmZK62RY6jW7auLvoLpcmVKlRG
	8h4BsGnBr29/K5VsjXVCWFzyz0YjnFHvUGPndgvErWbNyZgczWICbu8AamzOFn+NvNvIFLhsSdukm
	auj+tOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofNOF-006Siu-H2; Mon, 03 Oct 2022 15:29:55 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofNO1-006Se1-FB
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 15:29:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id q99-20020a17090a1b6c00b0020ac0368d64so940505pjq.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Oct 2022 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=BuEmPyN4Ez4NmzzutnovdwGSEF1vNe6R6TiRpHW5ogY=;
        b=faryKYuRlup1uNl841W9tCsnXKY4x5ZzddcOLsdf9HkC6Bzo24TLmqkXIRjeolgwQ0
         uVnITeO5OeSznTxdOXLjya60IB11c2j9MAUPdCKbidhkfkEvpXdE+JKkOxObngvaMZ34
         YQ52qsWDGO9ZLcU4KgbMShdKMGgc4RGVjpSgkdbTzHE2GjrWygu3wygkpENNPhlESvp0
         y9fw6suGV2xOkH7lz62ZnfHklPnDTChe4P3JzhwayXA4BdsYg/7iJclyFl/JhkLgIhLj
         lJxHANwUI/go2VxU7IzU6jQR9FR3g59ID9r9gsFpVg4q0OChrT7Dtkg4IV3dgGbRSAD3
         mRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BuEmPyN4Ez4NmzzutnovdwGSEF1vNe6R6TiRpHW5ogY=;
        b=ic9GEfn3SsY8FGHxTp20wrO4wE1/8cEr6wY7p368XQwWygdjXOpHDhC8tBOkFkTMOL
         lujZdOgLlub8hvxfxBUsEr1j28zoorw969cJ95cXlQ+CtSHgdYueJoqfDRl3IEoodVO6
         1zv9jxZluxbBdf91/E75Q+9FMcGA4DAwdfVyojhTtqGk4M38hwvgC1zPOAstB0K4R1Q4
         tbQGhn3xIieVxOsYD0U4uibxOJZlgeQALce5Ui6rh413YVpi5aSICMbf7yx0sMqop3Zq
         A7O5D9+hrcYdpnHLJpG+qEtC1JYEbZPLDykX5swDZOvucftTKhrqXGzKyGvzne8J6QMj
         tnxA==
X-Gm-Message-State: ACrzQf3DUVbsqa+V57c8Sl6xEysbAU5Vc+frQQLq2YHhy5zhZr4EFceZ
	iwrb2Ee5Z+D7wkuPryv62/9gYpqrLv1IwI+s6owXpg==
X-Google-Smtp-Source: AMsMyM44/4lmkJnwlFZ4jkHjH1tzKco6W1np3dHDWnE8gN2xk1BxjeMb6W4Zs9wA7u4Wlvz1r9guvdbO7Gov4Hza580=
X-Received: by 2002:a17:902:f710:b0:178:a692:b1f7 with SMTP id
 h16-20020a170902f71000b00178a692b1f7mr23009123plo.112.1664810976929; Mon, 03
 Oct 2022 08:29:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Oct 2022 17:29:36 +0200
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org> <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
 <bc64b69d-3d65-f5ca-a688-2ad1a055ba4b@linaro.org>
In-Reply-To: <bc64b69d-3d65-f5ca-a688-2ad1a055ba4b@linaro.org>
MIME-Version: 1.0
Date: Mon, 3 Oct 2022 17:29:36 +0200
Message-ID: <CABnWg9sJFBAXi1bu_yHDppFOmg=H=G7QTn9Bzqkr-t7qm5vUFw@mail.gmail.com>
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_082941_755427_E4C4A76C 
X-CRM114-Status: GOOD (  12.65  )
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

On Tue, 27 Sep 2022 16:28, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 27/09/2022 15:04, Guillaume Ranquet wrote:
>> On Thu, 22 Sep 2022 09:20, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> On 19/09/2022 18:56, Guillaume Ranquet wrote:
>>>> Add dpi support to enable the HDMI path.
>>>>
>>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>>
>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>> index 72049a530ae1..27f029ca760b 100644
>>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>>>  	  .data = (void *)MTK_DPI },
>>>>  	{ .compatible = "mediatek,mt8192-dpi",
>>>>  	  .data = (void *)MTK_DPI },
>>>> +	{ .compatible = "mediatek,mt8195-dpi",
>>>> +	  .data = (void *)MTK_DPI },
>>>
>>> It's compatible with the others. You don't need more compatibles.
>>
>> Hi Krzysztof,
>>
>> It's a bit confusing, because this compatible is used in both
>> mtk_drm_drv.c and in mtk_dpi.c
>>
>> Albeit it's entirely the same thing regarding the mtk_drm_drv module,
>> it's pretty different
>> regarding the mtk_dpi module.
>
>Sure, but this does not explain why do you need these entries here in
>mtk_drm_drv.
>
>Best regards,
>Krzysztof
>

Hi Krzysztof,

Sorry for the late answer.
The mtk_drm_drv is the component master of the full mediatek drm stack.

it "binds" all of the crtc/dpi/ovl/mutex/merge... components of the stack.

That mtk_ddp_comp_dt_ids array is iterated over to find all of the components
from the device tree.

Hope this clarifies things?

Thx,
Guillaume.

