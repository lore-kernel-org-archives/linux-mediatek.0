Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E2EC00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J72ZCMiP8be+FmTbKr7cCJxSbCeOBd7SRmuAXWbyv8U=; b=dxl/zPD1YrIfpGAI1znoJSv30m
	Fh7cugHnCuXhTn/FNp3CGRz8OsXjRNr+9Wr78jR7e0IEq7bkvF2iuuSQ3/xlfsloIQ7xHVmf0iCYe
	6hXd+QiSfdvIjiqoP9ZkkiXsduoXIGcVXEN5wdwLOFP9zpYFPLAUeY1HZLYFx0zVKDWLtue/nSBF3
	2Rc/1K5rL8q1sESixOCkUSqnxNDNxUEUlfOGGJUBlfDHzlPs+ByUl+MBfzs67GmwdQO/OwGX534fx
	a1jYOgcfM1L9xpYDjntG5WQAi9O1VkOm9ENQzjUxRj2/McZP1mBk0qCN7knyC9VT+aQAtPyQ7e7Dq
	pRQcHqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU4X-00750K-2b;
	Thu, 03 Aug 2023 08:52:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU4T-0074xt-09
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 08:52:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-317b31203c7so640645f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691052752; x=1691657552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J72ZCMiP8be+FmTbKr7cCJxSbCeOBd7SRmuAXWbyv8U=;
        b=szM+YrFrkDalypCo/0ZG9zFLnFzwXVhzt0iiecWcnIJFc/3kt8xPLF04oeNEvquc9I
         ocXSVfi7/4WHQ0c+INJgOg4ecn1KlV3XGkAmvsPWRZ7wqbYmF3MYsJ6bYVga9Emvcv9X
         2BIJwTxTixPJ5OqrfF/4F2L6hNNjevwjSRXZtym46OvLe7pDMEMO5agzer8cq+CsuemI
         KhCdHna1IVEeJJq8d5IMCHmNpayXweMawtuZyKWFSXR6RQBzyJCPFCrEAl6S0gg/+ZGg
         zxCplFDzjGJyommM0qIjAyhyCUYicZ0C2kF8WMovz440F87ELuV8Zdy3KaMGtb3VQDT1
         Y/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691052752; x=1691657552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J72ZCMiP8be+FmTbKr7cCJxSbCeOBd7SRmuAXWbyv8U=;
        b=EKIbhROFF0+Zw6TDHFf28IEVucloqOjcg7SEPiyteKMSiFFZUM9jAwrf5cYlhfixnQ
         ycyyTbaO/HRfJSWXFwZB2b/hN6fkdKNOejiXTMJwW8m+e239t84fAgt1mFCkndXBcsYo
         +Xxmnoz1Iw/cuR/uDfVcN0VSEvMDGSAoecXr4HlhNK+5PziYLYiDGGI0+B5rfid4UKa0
         E3ZUm6u+/gRpeMxDLahuT0PjEgV4dbgdrUrsGedneyqK1xvvZMPIiA5WCwJ4NhGnknA8
         02M+hv8i7r1Ue3copkpYjO2iHeAZkNhZwAgeu68FcQM4f6+shVUnvodWtQJ61GligT8s
         z7IQ==
X-Gm-Message-State: ABy/qLZTTLLCramUgbCmpuVuBkBfznw444yS3OFsVs2e09qZeCyDkF37
	jM8jxb8JiE4cHk2/MiXTpXcPaQ==
X-Google-Smtp-Source: APBJJlEN9R4IgJNpMlQ3xJMdsGaNvKhN1Gc4doOaCc43QqlOvQrkehbZtA+GP/6VFDnvSP/T5nnNhw==
X-Received: by 2002:a5d:5389:0:b0:313:ea59:7ded with SMTP id d9-20020a5d5389000000b00313ea597dedmr6210883wrv.24.1691052752109;
        Thu, 03 Aug 2023 01:52:32 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b0031773a8e5c4sm21141347wrn.37.2023.08.03.01.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 01:52:31 -0700 (PDT)
Message-ID: <04f1f2f4-fd22-b22f-7285-2884ae92c7d8@baylibre.com>
Date: Thu, 3 Aug 2023 10:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 0/8] soc: mediatek: MT8365 power support
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230713150414.891893-1-msp@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230713150414.891893-1-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_015237_282113_D1CFAE3B 
X-CRM114-Status: GOOD (  24.42  )
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

Hi Matthias,

Gentle ping, because I think this serie is ready to be merged. Do you 
agree ?

Alex

On 13/07/2023 17:04, Markus Schneider-Pargmann wrote:
> Hi,
> 
> this version just fixes some small style issues and rebases to v6.5-rc1.
> 
> Thanks for any feedback!
> 
> Best,
> Markus
> 
> Based on v6.5-rc1
> 
> Changes in v7:
> - Rebased to v6.5-rc1
> - Fixed a couple of small style issues pointed out by Angelo
> 
> Changes in v6:
> - Change flags field to be u8 instead of u32
> - Use macro concatenation to simplify BUS_PROT macros:
>    BUS_PROT_WR(_hwip, ...) etc.
> - Use the final bit values for scpsys_bus_prot_flags from the beginning
>    of the series.
> - Changed scpsys_domain_data->caps to be u16 to accommodate the new flag
>    MTK_SCPD_STRICT_BUS_PROTECTION.
> 
> Changes in v5:
> - Create defines for all registers and bits in mt8365 power domain patch
> - Redesign scpsys_bus_prot_data to use flags to store reg_update,
>    clr_ack as well as the difference between SMI and INFRACFG. The code
>    uses the appropriate regmap depending on the flags.
> - The WAY_EN patch now uses two flags, one for inverted operations
>    'BUS_PROT_INVERTED' and one to use infracfg-nao for the status flags
>    'BUS_PROT_STA_COMPONENT_INFRA_NAO'.
> 
> Changes in v4:
> - Redesigned WAY_EN patch and split it up in smaller patches.
> - Added two documentation patches.
> - Added mediatek,infracfg-nao field to the binding.
> 
> Changes in v3:
> - Mainly redesigned WAY_EN patch to be easier to understand
> - Rebased onto v6.0-rc1
> - Several other stuff that is described in the individual patches
> 
> Changes in v2:
> - Updated error handling path for scpsys_power_on()
> - Minor updates described in each patch
> 
> Previous versions:
> v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/
> v2 - https://lore.kernel.org/linux-mediatek/20220725081853.1636444-1-msp@baylibre.com/
> v3 - https://lore.kernel.org/linux-mediatek/20220822144303.3438467-1-msp@baylibre.com/
> v4 - https://lore.kernel.org/linux-arm-kernel/20230105170735.1637416-1-msp@baylibre.com/
> v5 - https://lore.kernel.org/linux-arm-kernel/20230619085344.2885311-1-msp@baylibre.com/
> v6 - https://lore.kernel.org/linux-arm-kernel/20230627131040.3418538-1-msp@baylibre.com/
> 
> Alexandre Bailon (2):
>    soc: mediatek: Add support for WAY_EN operations
>    soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap
> 
> Fabien Parent (2):
>    dt-bindings: power: Add MT8365 power domains
>    soc: mediatek: pm-domains: Add support for MT8365
> 
> Markus Schneider-Pargmann (4):
>    soc: mediatek: pm-domains: Move bools to a flags field
>    soc: mediatek: pm-domains: Split bus_prot_mask
>    soc: mediatek: pm-domains: Create bus protection operation functions
>    soc: mediatek: pm-domains: Unify configuration for infracfg and smi
> 
>   .../power/mediatek,power-controller.yaml      |   6 +
>   drivers/soc/mediatek/mt6795-pm-domains.h      |  16 +-
>   drivers/soc/mediatek/mt8167-pm-domains.h      |  20 +-
>   drivers/soc/mediatek/mt8173-pm-domains.h      |  16 +-
>   drivers/soc/mediatek/mt8183-pm-domains.h      | 125 ++++++----
>   drivers/soc/mediatek/mt8186-pm-domains.h      | 236 ++++++++++--------
>   drivers/soc/mediatek/mt8188-pm-domains.h      | 223 +++++++++++------
>   drivers/soc/mediatek/mt8192-pm-domains.h      | 112 ++++++---
>   drivers/soc/mediatek/mt8195-pm-domains.h      | 199 +++++++++------
>   drivers/soc/mediatek/mt8365-pm-domains.h      | 197 +++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c         | 157 ++++++++----
>   drivers/soc/mediatek/mtk-pm-domains.h         |  51 ++--
>   .../dt-bindings/power/mediatek,mt8365-power.h |  19 ++
>   include/linux/soc/mediatek/infracfg.h         |  41 +++
>   14 files changed, 972 insertions(+), 446 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
> 
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5

-- 
Regards,
Alexandre

