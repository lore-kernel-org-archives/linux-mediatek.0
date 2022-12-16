Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36215C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mY6hvYGx7u+jk29wg+M7U2/g98Fn1qPUIlj1RP+5vA=; b=MfTcEFzmCqFpbZjY0PoUI77jJQ
	ZhRC+OMSRGMjqAwOKigpbUDAT57QxnATDw78ht+QHbvybDsVn6VqqQObDF8u68thJlQlQmMkXt5td
	H9t7skHbAeVdNBcksYMYwHGsjMvKIMO3mqrydHkGWRWQgfUBRsDTeOsbTDSxJsgX0sGSDJJf0LMBR
	a7whtFwLaUnFPWYuaNSsdGwj9vRFwYBy/mO/yOHvoRFghP0g8lfbcjRfo7yzVDKtaVaQwD96iE3Lz
	CUcq3LD9AL4vpGzs6KIOzGtSK63dPVxm0p4A/keHBgOfB5W9vgTPv0TCbVluUK21aU1YWgpPgUOVU
	cfk+0dSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69uL-00EvE8-02; Fri, 16 Dec 2022 12:33:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69u8-00EvAK-QE; Fri, 16 Dec 2022 12:33:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a17so1178617wrt.11;
        Fri, 16 Dec 2022 04:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7mY6hvYGx7u+jk29wg+M7U2/g98Fn1qPUIlj1RP+5vA=;
        b=kJLYLpYrHfoGVjP1cZeR6X2VGPLRZwIe29aHbmv2eFnDizp2j5/Ny8/k3J/Bt2Pipu
         wvPiFlmNVAGuoFb3yHGT2Wm08XDr/n3qVRUq55Ko5SJl3lOfkJC1ijoxJmqaHBHexjhX
         CWnRwhwOaLecC5UmlcJxLonCS9S1AYEj1tuqfdGsc2fKZmdHQ3z+LcvIG3cSBtJXL22B
         9cPrAXx66Dvq9KaOvHQcJFJICYONOAabiOIJzGoL2UrKhtFSe23oQGqaps/vWoyXWvWw
         3kDMGxAtmn8O6YFNvAMds41TyMf69qg1/fkg3pH5yk4HzFjjZXrQFX5sxWdCmBqfDq7u
         si5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mY6hvYGx7u+jk29wg+M7U2/g98Fn1qPUIlj1RP+5vA=;
        b=2qZNYuKZZlLZPADN2gD6HFdxkqt4Qe0jgT8snRJ+Ff0afgxCUjDE+GVldBYIby5rAd
         Go6KBJ4FNb8C38No3ryRf3wGDoc7TXzKiDfGgBbKcuNsbHWok98RaHDuQImuEmIGPyM9
         lA5wdBPAO9XRJbteAjs6FMBVfLALoFCiQdImcnUrt2l5b7yonOdVR3S3Ci+6ajfJsDoI
         t4TaNWa12dZ6fBmKOdFZkcGgQg4FOJKQRsh4joaGwJkTgAhAiPppSJ9kwqQDBe67MNLn
         tFHIv69GF8hSCVGR7fVpzPjksxPZWdzK281KR2PkxmyEJIO8fcuOD0/YCW2gTxv68Dnv
         C8xA==
X-Gm-Message-State: ANoB5pn6CIIreeKj0MoFzJ5j0rrjnpKP7XbewTrMhSUEWsuglzAL+89n
	EuQz2cDWPOZjzmIGEp4F0y8=
X-Google-Smtp-Source: AA0mqf55vRtatDTlwaKTgKD5DnqowdBO7bXUP96iLxcg9l1yFDr/VSB+vMbcLVk2+WtfVL7Y+m90xA==
X-Received: by 2002:adf:f645:0:b0:242:1e1f:2d89 with SMTP id x5-20020adff645000000b002421e1f2d89mr19712565wrp.60.1671194009946;
        Fri, 16 Dec 2022 04:33:29 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id ba12-20020a0560001c0c00b002549b649b62sm2213551wrb.50.2022.12.16.04.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:33:28 -0800 (PST)
Message-ID: <5692faa0-6d7e-774f-9d6a-a495b44bdb3e@gmail.com>
Date: Fri, 16 Dec 2022 13:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 0/8] add support MDP3 on MT8195 platform
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221207094921.15450-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_043332_906809_E95481F3 
X-CRM114-Status: GOOD (  17.39  )
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


Whole series applied, thanks!

On 07/12/2022 10:49, Moudy Ho wrote:
> From: mtk18742 <moudy.ho@mediatek.com>
> 
> Changes since v3:
> - Rebase on linux-next
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
> Moudy Ho (2):
>    dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
>    arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS
> 
> Roy-CW.Yeh (6):
>    dt-bindings: soc: mediatek: Add support for MT8195 VPPSYS
>    arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS
>    soc: mediatek: mmsys: add support for MT8195 VPPSYS
>    soc: mediatek: mmsys: add config api for RSZ switching and DCM
>    soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
>    soc: mediatek: mutex: support MT8195 VPPSYS
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |   5 +-
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  28 +++-
>   drivers/soc/mediatek/mt8195-mmsys.h           |  13 ++
>   drivers/soc/mediatek/mtk-mmsys.c              |  64 +++++++++
>   drivers/soc/mediatek/mtk-mmsys.h              |   1 +
>   drivers/soc/mediatek/mtk-mutex.c              | 135 +++++++++++++++++-
>   include/linux/soc/mediatek/mtk-mmsys.h        |   4 +
>   include/linux/soc/mediatek/mtk-mutex.h        |  35 +++++
>   9 files changed, 274 insertions(+), 12 deletions(-)
> 

