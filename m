Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75347C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWdX4tvEDe9KXAQIvWXUpR26N6THyFmklq+pYn7/wck=; b=Ep7sxBuYQaizCG5esJaxAVFJXF
	klOraFtjVErBLzLPkIAVDQnOYmAQYlfOgynEC7Q5VpomDby7tBErjFk9Pv2vE3apGJp11MkMuLpGq
	BXea039fRh6Eh6YlVCAsPa5gUa9B6uVIvOiMsLkLufdGnpwqtvJNp09Sm9zwLyTLCvjgyxBQU09Ln
	E1xmYuvYs5KNsrtgW70/vhV3fNTx97vkwWZLkboZuN1/7Phn6E0SOqrCZn+nTdoRBbIdHkwsid4Ed
	ChJtqOg8jXYvt7fNV8cMxJ9WfYpiOrWzoLNSdPurz1LL9BV5Agx3bBB3n1zh1+S/sj5qVTUK5npo8
	kkuXCQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofjTy-009zWa-2N; Tue, 04 Oct 2022 15:05:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofjTu-009zVW-OR
	for linux-mediatek@lists.infradead.org; Tue, 04 Oct 2022 15:05:16 +0000
Received: by mail-lf1-x130.google.com with SMTP id bu25so21558863lfb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Oct 2022 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CWdX4tvEDe9KXAQIvWXUpR26N6THyFmklq+pYn7/wck=;
        b=v9qAcpY/EulrMR7IHMzcNeWHI6LbF7pg8NXAg+ErSDmILTlVv9VuATHeiDFUuS0GDk
         fMPUpg+ZIm2fvpOjwhU0jNrO51zTdX5Wo89TE4EpRBM2U6EglD08H2D49MIHAr+WLhko
         QutFGm6gKSaXJOgqQqp0VLMjpvhTVkSYKRXOY7lsbEpK7hpvEMVYv/IOjeuYVy2lpDuy
         RIbwA4QZi5UsdDLDWczQYuAqCNJVPlYdCGswtZoaf03Nol5+mrQy953CxoP1IFoIOrTU
         nFaOMmcYVh/vGEvNaZPxeKoSDLmFz2Hx+xOXxbVYjjLs1Y6XZTdt5PUigU9+DBfhOe6G
         ScPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CWdX4tvEDe9KXAQIvWXUpR26N6THyFmklq+pYn7/wck=;
        b=HhgoN/HzsW/K5244owq+JSTheAz6ogZvZPMxlf2UvAceMWnyElgM0kmKNHm3KnaLOc
         EM52EKkZerG4U5iwoxVksaVCESkOKF17s0WcNgPGCbF5S0Q/EQMt07cAuzwAFGJIQM8U
         uuPXoB87c/5wVP6KiTBaSq8Ca8supLzZ8QfgOyWGFu2kHksjZPektQchwHWQe8ydW+3f
         9sHLKGm05t+I4bP//1Tdy5DMQ8gWBH2YJymYDd/pAvAFfyLgcgacSkkZE5EGuCjPV0Co
         Nh1rLblX6awpZ7Hbh+92VsbIPwFqGY2vk+mAeFpRlNrfj2bUrXlGoQs4+5fmLAvSs/OS
         iMcw==
X-Gm-Message-State: ACrzQf3h5hFTIsFd0upw3THtV6CB2DngloznJ2cq7ZwxwvGSGawl42ql
	jVYa7ujAAim0Q8+OlJIDFUY/og==
X-Google-Smtp-Source: AMsMyM4AtZAJOWtGqNYNncGG28gDj+M6F6V0yMuWIAJhpHtFLCOUuhev79xS5vLvDH12H9Ljm6wesQ==
X-Received: by 2002:a19:6909:0:b0:4a2:5d5a:2f49 with SMTP id e9-20020a196909000000b004a25d5a2f49mr430421lfc.66.1664895912921;
        Tue, 04 Oct 2022 08:05:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a16-20020a19f810000000b00494643db68fsm1952030lff.81.2022.10.04.08.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 08:05:12 -0700 (PDT)
Message-ID: <49daae86-e922-9a17-ebed-2a33a5eeb18e@linaro.org>
Date: Tue, 4 Oct 2022 17:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
 <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
 <bc64b69d-3d65-f5ca-a688-2ad1a055ba4b@linaro.org>
 <CABnWg9sJFBAXi1bu_yHDppFOmg=H=G7QTn9Bzqkr-t7qm5vUFw@mail.gmail.com>
 <db1abf9d-ba40-f71c-0d37-c3912ac1bd8e@linaro.org>
 <CABnWg9vOHWpdLPAFdXAG3GNgsxpbzgh2gTq_tm72Tk2uR54LaQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9vOHWpdLPAFdXAG3GNgsxpbzgh2gTq_tm72Tk2uR54LaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_080514_828784_F45AB924 
X-CRM114-Status: GOOD (  22.38  )
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

On 04/10/2022 13:55, Guillaume Ranquet wrote:
>> No. You said what the code is doing. I think I understand this. You
>> still do not need more compatibles. Your sentence did not clarify it
>> because it did not answer at all to question "why". Why do you need it?
>>
>> Sorry, the change looks not correct.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I need a new compatible to adress the specifics of mt8195 in the mtk_dpi driver,
> the change is in this series with:
> [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver [1]

But you do not have specifics of mt8195. I wrote it in the beginning.

> 
> I then need to add that compatible to the "list" here in mtk_drm_drv.

No, you do not... I checked the driver and there is no single need... or
convince me you need.

> I don't see a way around this unless I rewrite the way mtk_drm_drv works?

Why rewrite? You have all compatibles in place.

> 
> Maybe if I declare a new compatible that is generic to all mediatek
> dpi variants?

You were asked to use fallback. Don't create some fake fallbacks. Use
existing ones.

> and have all the dts specify the node with both the generic dpi and
> the specific compatible?
> 
> dpi@xxx {
> 	compatible = "mediatek,dpi", "mediatek,mt8195-dpi";

I don't know what's this but certainly looks odd. Some wild-card
compatible in front (not fallback) and none are documented.

> 	...
> }
> 
> Then I can "collapse" all the dpi related nodes in mtk_drm_drv under
> "mediatek,dpi" ?
> 
> I guess would have to do the change for all other components that are needed in
> mtk_drm_drv (mmsys, aal, ccor, color, dither, dsc, gamma, mutex...).
> 
> That's the only trivial way I can think of implementing this with the
> current status
> of the mtk_drm stack.
> 
> Do you have any other ideas in mind?

Use fallback of compatible device. That's the common pattern.
Everywhere, Mediatek as well.

Best regards,
Krzysztof


