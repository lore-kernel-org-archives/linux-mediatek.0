Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1892BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqbgRqyTVLRbe/zevz7M7Ult5EWX7ZO+3KY6VnfNffA=; b=ZTDOxt5kLGPrMR0MlJccuIhmEz
	9uj7f/lqzBvnyR/aW6+4+dGpYygFZzXQcma/nGkJOJjIiIENaXRohRkQJidcvMQJEuOPo1NNb5Zoq
	TXhDykX6RTn2mb4T9BF2dqPxqzYr6AXzPFV4r8r36coJDdF+ro2lrvKsoSh5bCattGE7rXXWbRoZN
	6IPrePMiik7aVet/c0TQSgwXtAFrV+fkTuJvgtE8Ovh7dlsPyruLNEY/45sdhd+aOGUtYXi8Qfs15
	im/MHj8QCdVBiTu/FjDWGrHicTCmLd403G/5bqfQ923qSBJZh9vDbA8mC1FFarIKSyKbO3WSwbeP3
	kFCSVCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYtb-00FpdA-7T; Thu, 02 Feb 2023 12:40:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYtQ-00Fpb4-IA; Thu, 02 Feb 2023 12:40:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id h16so1557454wrz.12;
        Thu, 02 Feb 2023 04:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqbgRqyTVLRbe/zevz7M7Ult5EWX7ZO+3KY6VnfNffA=;
        b=ixgo/Ztz3YhqK1Tx+im0ksvpFeC9dnwA2/UW2untG+lMVxspfHWYpARW9LxbP9SRts
         dDuJjo4jT7LYiDN5FDwL9k2ZZJAgWMl2dOdNBwmm5puMrGvO0v3F957GfhPrvSBnxP40
         irwbeX9UEowPJxusMiZOQt4qGQhijxzzU+J1PmoQ5xeIAdc8pTSAmyUv6Yl9CFq9G/5F
         xhraGrt7MeUNKrfWB89vrdxMCswvQeFEKJiJfRMD6Rfohrm8OpdfexlubS+WBNT3ypHF
         V5fGeF84hG13oEEhUcn6gfk+xftOtDgUtyavflq//SV9lOfxLdRadIXCvi0eFXfD+G76
         8OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqbgRqyTVLRbe/zevz7M7Ult5EWX7ZO+3KY6VnfNffA=;
        b=nksgLyUgNmJzVzu5skgnh+eGQsaGT8HUtaT4xSuNKo7Hd2JjCI/ft52rvWc5CRdlEH
         hXeGxD9pDJDVsrzBRSCLCnQP4vfwkLA/g4G+WTGZJVQwi4UubKKmpYJgUj9vDLGSFE15
         RnCHNxSpTMnfRkh2E8/IbB1kiebmO7u2Wae4mJN5E4fcdPtcWxcIVCz5Assz8fqYe5Mz
         d2cUaG02BgSeqAhYdR8BjPMTfB4HeRITl8WFLcIawYFUbYECNfoMIk4QVoUYHMv3CGGC
         gd+km5UYUpU3SbQkXC7FjwR4gpI+64lupDHsrmqxSUJk1vhlYC9C+D0rXbPbmPsV48xb
         +3sA==
X-Gm-Message-State: AO0yUKXQKTLJlLOwiZfy5PgSf9vVYpomildneAQJkRMBeqiUBdKpEOuL
	94c10KUaK8zfX/dVYuACv64=
X-Google-Smtp-Source: AK7set9aEuxXXfoNrQHqYo270n4J50ZYLhNmtpJb/+iD6yWf6MxfBT/EoBt7tbs96HbAiffh857HzA==
X-Received: by 2002:a5d:6ad0:0:b0:2bf:9527:ce62 with SMTP id u16-20020a5d6ad0000000b002bf9527ce62mr4907395wrw.60.1675341642666;
        Thu, 02 Feb 2023 04:40:42 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r28-20020adfa15c000000b002bfd137ecddsm18017534wrr.11.2023.02.02.04.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:40:42 -0800 (PST)
Message-ID: <cd82e2a1-dbf4-88ee-f658-f695ae9ef56a@gmail.com>
Date: Thu, 2 Feb 2023 13:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/6] add support for MT8195 VPPSYS on MMSYS and MUTEX
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118032122.29956-1-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118032122.29956-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_044044_632597_226153D3 
X-CRM114-Status: GOOD (  18.93  )
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

Whole series queued for the next merge window.

Thanks!

On 18/01/2023 04:21, Moudy Ho wrote:
> Changes since v5:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=713031
> 
> Changes since v4:
> - Rebase on linux-next.
> - Remove MMSYS fallback compatible.
> - Migrate MT8195 VPPSYS0/1 from clock to mtk-mmsys driver.
> 
> Changes since v3:
> - Rebase on linux-next.
> 
> Changes since v2:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
> - Split dts settings into two patches based on belonging to MMSYS or MUTEX.
> 
> Changes since v1:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
> - Add compatible names to VPPSYS0 and VPPSYS1 in MMSYS binding file.
> - Fix VPPSYS's MMSYS and MUTEX dts to pass the dtsb_check.
> - Rename mtk_mmsys_merge_config() and mtk_mmsys_rsz_dcm_config() to
>    mtk_mmsys_vpp_rsz_merge_config() and mtk_mmsys_vpp_rsz_dcm_config().
> - Clean up mtk_mmsys_vpp_rsz_dcm_config().
> - Add a comment to mtk_mutex_write_mod() and clean it up for use in more
>    than 32 mods.
> 
> Hi,
> 
> This series add support for MT8195's two VPPSYS(Video Processor Pipe Subsystem),
> under which there will be corresponding MMSYS and MUTEX settings that
> need to be configured.
> 
> Moudy Ho (1):
>    arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS
> 
> Roy-CW.Yeh (5):
>    dt-bindings: soc: mediatek: Add support for MT8195 VPPSYS
>    arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS
>    soc: mediatek: mmsys: add config api for RSZ switching and DCM
>    soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
>    soc: mediatek: mutex: support MT8195 VPPSYS
> 
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  26 +++-
>   drivers/soc/mediatek/mt8195-mmsys.h           |  13 ++
>   drivers/soc/mediatek/mtk-mmsys.c              |  42 ++++++
>   drivers/soc/mediatek/mtk-mutex.c              | 135 +++++++++++++++++-
>   include/linux/soc/mediatek/mtk-mmsys.h        |   4 +
>   include/linux/soc/mediatek/mtk-mutex.h        |  35 +++++
>   7 files changed, 245 insertions(+), 11 deletions(-)
> 

