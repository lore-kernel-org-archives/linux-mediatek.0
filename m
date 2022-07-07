Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D6ECCA480
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhGXVYTI3y8DQIyLbAUR63DvhKZD5q4V66nvFencTLk=; b=EZaFxoiFgdp2KyCzliorH/Qk8E
	3I1J/B4xX3TEE8cM68zMFnbkqsicYOH8kSUk1kj2tGq5la/o///4o43IjRKGVFs4afObhkeAk82JA
	QgPmQEOVmBDSFOD500CfRb3vF1gDQDWHJx7VXAG3rXM79ziuzfpW5y94r5GkSmtthQBIcdGDyVd++
	220ByXYD/owvvBjxE4TpTAGBkXvYqzxVAYgSa8+snvdqu+8lOurDUF3ptWreTUJk+9vOovf2V1Tez
	PlhnYkXFtybZqZEfRergx9nBKfCnED2zShj5m4+XAi+xdiGolQk5lx5pNC3AsnRBtfhF55kHMNmJ0
	mLBzvnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mmr-00FBYi-8E; Thu, 07 Jul 2022 08:23:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mmh-00FBVR-Bf; Thu, 07 Jul 2022 08:22:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id f2so19828919wrr.6;
        Thu, 07 Jul 2022 01:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qhGXVYTI3y8DQIyLbAUR63DvhKZD5q4V66nvFencTLk=;
        b=JANdJtCKSYGSLRjWg5hHnlbZIlWenXHZf7OwKO/iz4ZkE0C5zRGbauFi2RFsendG3S
         CuWitByG9S1tvGSCsJtTdPl/JvlumojnNy0sWeZimrn8deIg3HrFj46zlFlT+UwaEmgS
         9iMqLbiYuDldjB4x3ah17Kt+SxJ2mZovhXphhZMpnMnNdwiaK1zpQuKLfKXjOh1q/OaU
         PxX7spWKgC4hZMXDQTHvS6sFBVoRExNYSEwWBy1C/kEEtdID92rGO5eeQ5yaLwgh9Hc/
         4a5IG7ax2SPiET044buBxgqeM/J/+miTPgJJSvY3WwX4MNEBjRjGo/FgFS0SjcXRXgfz
         M4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qhGXVYTI3y8DQIyLbAUR63DvhKZD5q4V66nvFencTLk=;
        b=kSiGJVp+tKY1+TqzIFXthmOY2Jm0ATY7NRK6ZGe5ycUorhRwhiA+3RfWJj59g/24Ie
         e6oLwdSy4vV4l4rlqJM7LQwFzAtZ+TM925qpon3aDtNI1lDK66tENoAOdbdEEPDI/Txj
         sIOiNWgXn7/k+FF3z9kBlmEbf0vCHlkGvmsjDTpbQAeak+YJgzhI4rLr6CBg932WzF65
         A8a7YgPmCkhwEtg+XBO65880685I8bxbvmiXe2b8+uYizRUB6GfWyf8i5iuzW/EwmZ6I
         F7qE1ZBwY4QH1IRo3O+R4+sanZQd2tVIYV5Gmz29uN0yRdxRT3Mb5Zxux4RFDDwuDISL
         mixg==
X-Gm-Message-State: AJIora91Q1S4TmiYo8aJt2ofZWOyz8TFoJbq/nL4eq3bqVF/uxJJh15n
	j1Hi8mnV0Ik45+UBC4Stj9o=
X-Google-Smtp-Source: AGRyM1sHiG77D0vjoRwIBlJ8Gd7/ObAkRjVGUunFWo8VBLXawqC8R+7+zUbbAO8F9/OrcLlvKKY6Xg==
X-Received: by 2002:a05:6000:1689:b0:21d:22d0:8e5e with SMTP id y9-20020a056000168900b0021d22d08e5emr41859376wrd.574.1657182168406;
        Thu, 07 Jul 2022 01:22:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 22-20020a05600c029600b003a2b8461ddbsm8424500wmk.41.2022.07.07.01.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 01:22:47 -0700 (PDT)
Message-ID: <a0059fb3-c734-84eb-88ee-e0d34fcbca1b@gmail.com>
Date: Thu, 7 Jul 2022 10:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/2] Allow getting regulator on MFG for multiple SoCs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wenst@chromium.org
References: <20220623123850.110225-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220623123850.110225-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_012251_449272_A85988E7 
X-CRM114-Status: GOOD (  19.23  )
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



On 23/06/2022 14:38, AngeloGioacchino Del Regno wrote:
> This is one of the steps to enable DVFS with the Panfrost driver:
> since Panfrost is already enabling the (required) MFG power domains
> and since the mtk-pm-domains driver is already responsible for
> actually enabling the SRAM PDN, it makes sense to make sure that
> the VSRAM supply is ON when trying to reset/enable the SRAM.
> 
> For this reason, the MTK_SCPD_DOMAIN_SUPPLY flag was added to one
> more MFG domain, ensuring that the SRAM is actually powered and
> also not relying on the bootloader leaving this supply on; on the
> other hand, this is also making possible to avoid setting a
> sram-supply on the GPU node, making devfreq happy about having
> only one supply and finally allowing DVFS to happen.
> 
> If no domain-supply is declared in devicetree, mtk-pm-domains driver
> probe will anyway keep going, so this is not breaking old devicetrees.
> 
> No side effects either when this supply is declared for both a MFG
> domain and Panfrost together.
> 
> This series has no dependencies.

Both patches applied, thanks!

> 
>   Changes in v2:
>    - Squashed all mtXXXX-pm-domains.h changes in one patch
> 
> AngeloGioacchino Del Regno (2):
>    soc: mediatek: mtk-pm-domains: Allow probing vreg supply on two MFGs
>    arm64: dts: mediatek: mt8183-kukui: Assign sram supply to mfg_async pd
> 
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
>   drivers/soc/mediatek/mt8183-pm-domains.h       | 1 +
>   drivers/soc/mediatek/mt8186-pm-domains.h       | 2 +-
>   drivers/soc/mediatek/mt8192-pm-domains.h       | 2 ++
>   drivers/soc/mediatek/mt8195-pm-domains.h       | 2 +-
>   6 files changed, 10 insertions(+), 3 deletions(-)
> 

