Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED13DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/ZwI6/BN3As4V+Hk45i5RGBnBZ09YbFMnFnKVxdi/0=; b=YS163uxh7E/u5W+ywT/euQfW84
	2+6XVI8ECiXgOMKToU7kHCSmVuXOOHUsCV5cD9fUWNnG7vqMo9BgdHeWRZeiqE1enOyY1TloUq1So
	gl1JVms+yLWMRVxbB2lxM6jkPd30rIoMCLpYodBkCck8ImrBBrnCVniT6bjG+dw3z46J6HTFOLOhy
	YPsZvRF1QUnlrnWo9rLZ9AO1gBxtUahbt5bn3zcBMzLI3jujSTxAbkVM+SeyqRis92fW8WygqFZzh
	t13MGZz9eeEiT6hMRKWlKwsG6rC/JqN9U3HX1g4/3uN/87A1clrJlz14ZbzhJ7DgK+dKIJh6HzQ1Y
	l7eMbo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2CQp-007sg5-5E; Fri, 17 Jun 2022 13:54:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2CQd-007scK-8j; Fri, 17 Jun 2022 13:54:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id i10so2121307wrc.0;
        Fri, 17 Jun 2022 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e/ZwI6/BN3As4V+Hk45i5RGBnBZ09YbFMnFnKVxdi/0=;
        b=mxbO4JHVFPGycvF6Kck5+xt1v3pUIG34WdSxN3Zscw1aDTFFvMISdJ577B/pQgeHLS
         6GA95yiYw9ruQFUuR6O/DNo3LRe9oMkbr14DfuZnL43GWrKrLoMhaSAKSm2AHGwI90lN
         JveYcstlfj5EOCJ84SnTJ+aVKptbPbWlM3VXv2cN6I1+nezx3UwepoVWJjlc2cA590Et
         1GsAbh3PZPNol33H1hRx/O+amN7Vae0rMaPPy2cHp9UjqQJuBuaf5aF0hT8RQxSdc/CH
         RnXPg95UwcC9mgfgARh4njHEucCC6hHOHxIPdKMaCB/m5JNRv3MYzh5xwRjpr5nlcDsq
         PCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e/ZwI6/BN3As4V+Hk45i5RGBnBZ09YbFMnFnKVxdi/0=;
        b=FkTk8PkIkA1Hur8cpaRPPAeUVgaRidDikNRqn+pITdcLVFdG8HtRjzQtjXZ6YQxGQa
         pJjGW1FC1nOByMmrjpNnrsnr+5TB5R+c1/Gz/IAQEfuTUYZ5iEbuyn+HymxgUhYJ3Y/G
         zPmm3fWL9Bj8Jl3F+R6jW5hdUEdyI2ziMkbxRFC7HhY2MCoBYp7HhOaZX+V29D6OBMda
         pQWQgrglpoYn617JHcW5N7eTXOsrvjnic0cKoREpiDCuMSay+eNH65QqPAeZuQVe6E5v
         o+iFS6V9aeoIahjhXVRFbZK9NFRDKLCdExBx0RcYifsoVHN9V+eYMYaA/Z1ndfDWFpdo
         X6Bg==
X-Gm-Message-State: AJIora8kh4Sk13mi1hK5xhYY5Tf4IXpEemHDmIb7J3d4iwBSHw/kqUH4
	9uoJPvfwTq7bSApS583H1Gc=
X-Google-Smtp-Source: AGRyM1sSLJUnCFbcAfX8EfAMF/K4WBamM2ADKZuuEFvt75ViRCv5x+dyFKeJE6a2Tzxcv53Oy5ls4g==
X-Received: by 2002:a5d:5190:0:b0:217:1567:d311 with SMTP id k16-20020a5d5190000000b002171567d311mr9600267wrv.225.1655474063515;
        Fri, 17 Jun 2022 06:54:23 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d4a0d000000b0021a2c923c72sm4824146wrq.69.2022.06.17.06.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 06:54:21 -0700 (PDT)
Message-ID: <5f53e0a4-f6d5-f9be-222b-e6361b837071@gmail.com>
Date: Fri, 17 Jun 2022 15:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v20 0/6] Add mutex support for MDP
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Courbot
 <acourbot@chromium.org>, tfiga@chromium.org, drinkcat@chromium.org,
 pihsun@chromium.org, hsinyi@google.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 cellopoint.kai@gmail.com
References: <20220610063424.7800-1-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220610063424.7800-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_065427_360409_7A3AAE38 
X-CRM114-Status: GOOD (  25.20  )
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



On 10/06/2022 08:34, Moudy Ho wrote:
> Change since V19:
> - Reduce parameters pass to function "mtk_mutex_write_sof"
>    to avoid redundant action.
> 
> Change since V18:
> - Rebase on v5.19-rc1
> - Remove unnecessary functions:
>    "mtk_mutex_set_mod", "mtk_mutex_clear_mod",
>    "mtk_mutex_set_sof" and "mtk_mutex_clear_sof", and export
>    "mtk_mutex_write_mod" and "mtk_mutex_write_sof" to
>    set MOD/SOF directly.
> - Remove unnecessary SOF tables and add new enumerations of SOF instead.
> - Adjust the error checking for CMDQ operations.
> 
> Change since V17:
> - Rebase on v5.18-rc6
> - Fix undeclared identifier causing compilation to fail.
> 
> Change since V16:
> - Rebase on v5.18-rc4
> - Fix misplacement of definition "CONFIG_MTK_CMDQ" which
>    caused compilation error when CMD is not supported.
> 
> Change since V15:
> - Rebase on linux-next.
> - As suggested by Angelo, split common parts into independent functions to
>    make functions more concise.
> - Based on safety considerations, increase the returned error number and
>    message to facilitate error handling.
> 
> Change since V14:
> - Rebase on linux-next.
> - Add new SOF and MOD table for general interface to integrate the requirement
>    of different modules.
> - Remove unnecessary MOD structure.
> - By Rob Herring's suggestion, revise the description of
>    "mediatek,gce-client-reg" in MUTEX dt-bindings.
> - Delete the redundant definition of MTK_MUTEX_ENABLE and modify corresponding
>    function.
> 
> Change since V13:
> - Rebase on linux-next tag:next-20220316
> - Adjust the MUTEX MOD table structure and corresponding functions.
> - Adjust the definition style about 8183 MDP MOD.
> - Remove redundant definitions and enumerations.
> - Adjust the CMDQ operation in MUTEX to be backward compatible
> 
> Change since V12:
> - Rebase on linux-next
> - Remove ISP related settings in MMSYS
> - Removed CMDQ operations previously used by MDP in MMSYS
> - Move mediatek MUTEX dt-binding path
> - Add additional property in MUTEX for CMDQ operations
> 
> Change since V11:
> - Rebase on v5.17-rc6.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=5f9b5b757e44de47ebdc116c14b90e3cc8bc7acb
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=831785f0e5b919c29e1bc5f9a74e9ebd38289e24
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=15f1768365aed810826a61fef4a744437aa5b426
> 
> Change since v10:
> - For some ISP application scenarios, such as preview and recording
>    at the same time.
>    The routing table needs to be discarded, and the calculation result
>    on the SCP side is used to write a suitable mux setting for
>    1 input and 2 output.
> - Adjust the GCE client register parsing method to avoid redundant warning logs.
> 
> Change since v9:
> - Add API for MDP getting mutex mod.
> 
> Hi,
> 
> This patch splits mmsys and mutex settings from Media Data Path 3 (MDP3),
> and original mailling list list below:
> https://patchwork.kernel.org/project/linux-mediatek/cover/20211201095031.31606-1-moudy.ho@mediatek.com/
> Corresponding settings and interfaces are added for MDP operation in the
> mmsys and mutex drivers, which increases the independence of the modules
> 
> Moudy Ho (6):
>    soc: mediatek: mutex: add common interface for modules setting
>    soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
>    dt-bindings: soc: mediatek: move out common module from display folder
>    dt-bindings: soc: mediatek: add gce-client-reg for MUTEX
>    dts: arm64: mt8183: add GCE client property for Mediatek MUTEX

If fixed the commit subject to arm64: dts: mt8183...
Whole series applied,

Thanks!

>    soc: mediatek: mutex: add functions that operate registers by CMDQ
> 
>   .../mediatek/mediatek,mutex.yaml              |  14 ++-
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   1 +
>   drivers/soc/mediatek/mtk-mutex.c              | 119 +++++++++++++++++-
>   include/linux/soc/mediatek/mtk-mutex.h        |  27 ++++
>   4 files changed, 159 insertions(+), 2 deletions(-)
>   rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (81%)
> 

