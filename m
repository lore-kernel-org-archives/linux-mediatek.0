Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2BFC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jl7BVtQwBTSlw5Q7jIravMMMPvXbs3wbcyyUN/ZkIBg=; b=U5J5HF7sMEpiS8CkyrKMmJkK93
	NTvTzSSwpRi8gbrpYwGqsyrgvb2SpK2SQqpkgmwu8RFVP6SDQzHAnIH34iWO+W65K6xQ5muz7DKit
	5PLJt7IMcCmeEhS3NuLUwE9QChs1dQg3LzYrZR3g86WvxHCSEI4o48S+4QeET/Cs16q5tWAhaeXWv
	rtaJMuy4MsJolMeQBdoUxo37+vIlevSm44WPFjDpeBREUyZzkxBk+DMOMgv3miRRCGCqXzoaFcNpb
	PQX53vqTb0s/+k+IWigdoUVOkE2qngoUZ+EMZzMlivE4uNyW/+GuLMaphteTs7/FZg4QYOXIGvIXy
	j911rCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkBT-0000000CdU3-0H7o;
	Tue, 16 Apr 2024 14:53:19 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkBP-0000000CdSh-2OUH
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 14:53:17 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d82713f473so84277021fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713279192; x=1713883992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jl7BVtQwBTSlw5Q7jIravMMMPvXbs3wbcyyUN/ZkIBg=;
        b=soY7IXdxjNPDgCdYiA8Ag5gcRSjMgJb6rwpm5HIzCaZa038m6HVBxo8pr0Ox1nHK2O
         CbDBR/cNt8gBkM3UWZozud/0sCFTf6a/HFxft0i8L1ZhS/uuZyr+HwC12CV+Zn/Zi+Zo
         YDqSg7mgIXVSe41lqjObauFTIWQ5GCtN6Ozus6UkSt54MR+EEbRhsZ09Mjb/AbqbybDl
         wC85ZsMD4Wrr+K5Hpk2TQ9ZMHSldVncW/OxNqBrPg/YBBVh/iEmbY9Ad1CrWRcxG993B
         YuHT/5SWjFhPt4vEspbzoRCuzi0R5tncDwm6fmgUpswnu7+3iPU2+hR+F+ffEjMOJQSf
         2kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713279192; x=1713883992;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jl7BVtQwBTSlw5Q7jIravMMMPvXbs3wbcyyUN/ZkIBg=;
        b=J0xjWBwTsXvJVAhzvJa4rKc2zgdVnfI80iIV/IIjQEXDQaWyes4FseL9CLug1V5ThT
         VQOkH/p5yzA3JsUxRPdyUPkHLjCMcQ1J69SeyDtwh2AafOahCBdRvOStcE6mH/BL9baq
         L80KSpTagHEFthKAVi26a8/pqkr+TT0tE+xRr7/4++/Ir0Yy7+NQZ0YZdLqNVYNytf7O
         9mgzSBm/DUOoyiBd6XoATJNRmOUV4TR7OAYz973aUvR9SjDx556YQtTslQbPAhonP10X
         9ea/2ct5znzWwGpB/lmwg7k7d2v4XadzuMUaDGRd45+9ZuQXYWN5VJht37P54NqYB3kI
         DJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfdLnM7rQuWqsuNIwLvcFhg/C0eicBSLVJFHO9qW9ehA0ROOl2/DZ669eqkjNK0eEv8G66ov7sCGWOCGE1fOd8vHOfnPlJ7lNnTp5piVbOXs8m
X-Gm-Message-State: AOJu0YyaeU0VtEiSBPisR0Vzv/aa/XeDai6JeONrq7Oe6LgkCFc729aK
	bYEadSSzi7KCoqNAJMPM/0tFwG+WiKrzNpxgrxrs//UhTPmmwapu10KKUCRP9U0=
X-Google-Smtp-Source: AGHT+IEBkb7ExU6KDoUwKQB+1TjGigkCAfuqOmSxkIfxlJN0jQEFEyh9q8oXdurLDbr/zM7/PUjBBw==
X-Received: by 2002:a2e:9517:0:b0:2d8:19fe:4863 with SMTP id f23-20020a2e9517000000b002d819fe4863mr10223169ljh.41.1713279189026;
        Tue, 16 Apr 2024 07:53:09 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c19-20020a170906529300b00a4da28f42f1sm6995974ejm.177.2024.04.16.07.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:53:08 -0700 (PDT)
Message-ID: <96d90ddd-2910-4419-ba90-64a09a3dbf1e@baylibre.com>
Date: Tue, 16 Apr 2024 16:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 14/18] drm/mediatek: dpi: add support for dpi clock
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
 <cf25a3cc-6411-45f5-bc7a-6b69cf28c860@collabora.com>
Content-Language: en-US
In-Reply-To: <cf25a3cc-6411-45f5-bc7a-6b69cf28c860@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_075315_758566_8ADB6925 
X-CRM114-Status: GOOD (  17.58  )
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



On 24/10/2023 11:12, AngeloGioacchino Del Regno wrote:
> Il 23/10/23 16:40, amergnat@baylibre.com ha scritto:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> MT8365 requires an additional clock for DPI. Add support for that
>> additional clock.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> I'm not convinced that this is right... at all.
> 
>  From a fast check of the MT8365 DPI clocks, I can see that the DPI0 
> clock declares
> parent VPLL_DPIX (a fixed clock), but nothing ever has VPLL_DPIX_EN 
> (which is the
> GATE clock, enabling output of DPIx VPLL?).
> 
> But then, there's even more: no clock ever references the 
> CLK_TOP_DPI0_SEL nor the
> CLK_TOP_DPI1_SEL gate, which is a PLL parent selector... in other 
> platforms, that
> is muxing through the TVDPLL, but on MT8365 that is LVDSPLL?!

AFAI see into mt8365 documentation, there is no TVDPLL, only LVDSPLL

> 
> I have many questions now:
> * Two PLLs are apparently brought up, but which one is the right one?!
>    * Is the LVDS PLL really used for DisplayPort? (dpi0_sel)

Seems to be LVDS

                                  enable  prepare  protect                                duty  hardware
    clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
  clk26m                              18       19        1    26000000          0     0         Y
     vpll_dpix                         1        1        0    75000000          0     0  50000         Y
        mm_flvdstx_pxl                 0        0        0    75000000          0     0  50000         N
        mm_dpi0_dpi0                   1        1        0    75000000          0     0  50000         Y
        vpll_dpix_en                   0        0        0    75000000          0     0  50000         N
     lvdspll                           1        1        0   283999497          0     0  50000         Y
        lvdspll_d16                    0        0        0    17749968          0     0  50000         Y
        lvdspll_d8                     0        0        0    35499937          0     0  50000         Y
        lvdspll_d4                     0        0        0    70999874          0     0  50000         Y
        lvdspll_d2                     1        1        0   141999748          0     0  50000         Y
           dpi0_sel                    1        1        0   141999748          0     0  50000         Y
           dpi1_sel                    0        0        0   141999748          0     0  50000         N
     mmpll                             1        1        0   456999909          0     0  50000         Y
        mmpll_ck                       1        1        0   456999909          0     0  50000         Y
           mm_sel                     15       15        0   456999909          0     0  50000         Y
              mm_dpi0                  1        1        0   456999909          0     0  50000         Y



> * Are you sure that CLK_MM_DPI0_DPI0's parent shouldn't be dpi0_sel 
> instead?

I'm agree with you. After few change, it works.

-       GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "vpll_dpix", 20),
+       GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "dpi0_sel", 20),

-                       clocks = <&topckgen CLK_TOP_DPI0_SEL>,
+                       clocks = <&mmsys CLK_MM_DPI0_DPI0>,


                                  enable  prepare  protect                                duty  hardware
    clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
     vpll_dpix                        0       0        0        75000000    0          0     50000      Y
        mm_flvdstx_pxl                0       0        0        75000000    0          0     50000      N
        vpll_dpix_en                  0       0        0        75000000    0          0     50000      N

     lvdspll                          1       1        0        283999497   0          0     50000      Y
        lvdspll_d16                   0       0        0        17749968    0          0     50000      Y
        lvdspll_d8                    0       0        0        35499937    0          0     50000      Y
        lvdspll_d4                    0       0        0        70999874    0          0     50000      Y
        lvdspll_d2                    1       1        0        141999748   0          0     50000      Y
           dpi0_sel                   1       1        0        141999748   0          0     50000      Y
              mm_dpi0_dpi0            1       1        0        141999748   0          0     50000      Y
           dpi1_sel                   0       0        0        141999748   0          0     50000      N

     mmpll                            1       1        0        456999909   0          0     50000      Y
        mmpll_d2                      0       0        0        228499954   0          0     50000      Y
        mmpll_ck                      1       1        0        456999909   0          0     50000      Y
           mm_sel                     15      15       0        456999909   0          0     50000      Y
              mm_dpi0                 1       1        0        456999909   0          0     50000      Y


> * Where is DPI1 in this SoC? Why is there a dpi1_sel clock, but no MM clock
>    for the DPI1 controller? Is there any DPI1 controller, even?!

DPI1 isn't documented.

>    * Why is there a DPI1 MUX, if there's no DPI1 controller?!

Good question, I don't know. Legacy of the downstream code.

That will be fixed for the next version.

-- 
Regards,
Alexandre

