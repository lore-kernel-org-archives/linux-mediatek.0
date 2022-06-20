Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BD0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQNnWPsziPC1SmS5aZTp0Suc53ezplFzfg3ZbuVfw7M=; b=S7S6VPsX3P8MMurpRBSiL2/uYz
	933Sh+Y4eSZ1/qZc5nba6U625Vf6Fv0c1Ej/ygDBiDOIx8iOn50d1ty+6yTdXHIv1iFnLhpi3m1e6
	Xnzw4flQSVSbXCl61FIOSkRqvhvH2iTxHDfSO6VPqsAh8eI6dGjgxEaKJnjvNHh6rvDrAoiqCnK+B
	qPf/qTLjhSuUp1398h39DH+QmoZwY4ftHZoP8zoc4BG2jp5nDne2MlJJEDZC7wXLo815FVUbvuPyB
	wiyTqc7MhR0kJh44NcIrpMoW38RiPZT+/iUTYKtfmITPtw02L8T2tvqRClYHAQoiYSk5fPPGkKYPa
	0pjSoNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3HQ8-000pRo-2g; Mon, 20 Jun 2022 13:26:24 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3HA4-000hDa-QB; Mon, 20 Jun 2022 13:09:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id v1so20970158ejg.13;
        Mon, 20 Jun 2022 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HQNnWPsziPC1SmS5aZTp0Suc53ezplFzfg3ZbuVfw7M=;
        b=JAm4CNB1mieJHG28GtsoulU5qJktSuTperR7nsyCe+Jc2fJpXkaCEDSdi24RGydEvS
         fuLAoRvFMIPTj5GzzEzxjazgquyP0XluN1pJAyM5pSdmPWwlt7fKrmK9lcTj/FjWe+Q6
         lpOKysnDWcByVg9rTRCiMn2D7vnT6OYueapPoLwwmeKSfHjH1L/sUWTMI2UiKaKuRdqV
         IztH6jXwzGqlVTgDJ7RXZmOFVDjTKNP/a4ldeYUaxvXi5278Re4XT53IeO6oTpWOPtI/
         L7pP4dre5dSkc30RQOuxQT2VJXFueVcgp//dXm/e/6ZKM+ywVtw5dxbIhBwd5Uu0CQSo
         ZOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HQNnWPsziPC1SmS5aZTp0Suc53ezplFzfg3ZbuVfw7M=;
        b=yuCupUB+HzCbu+pHJMpzcjTMaLw0aO7vA78Is5SNUKw1vs4zBZErZU4+CQ7C6+cx7u
         Lb35HOaB5e/tNRvdlSC6YL7Z4bPmFQ5qeRITOIVd3M1BS2DCRS1nmUwN/Gi+NKs14Qhx
         SBkd9im8JkPAgDogfBFLOebBScQ8TbaphffMDLNRNREAsVPuf5Y+f9rYgqH/aiJY4ZlF
         wrUx1MdBEm74ShtZzX6nFlSBKE4wxK3zPnVAgGPfrpi+tUlXABSLcO0MrsYGbdBL4XWY
         RAy48WLXo6WPawfkR4/KRhL7YIHF6TknegviUjQbqhNYG5UN7hG3krpRIS3JovpP3KO7
         yQIg==
X-Gm-Message-State: AJIora+KEHNgpIHwljNIBcqc5AJPu2v879/HDvZD0wX8IpOqhmylUiWZ
	82RIWTxONlZk5wVHMRdbK+w=
X-Google-Smtp-Source: AGRyM1u+8kf+6IMcIYUy52H9mYA44RaQlKO499WuZ8oDezmfoRb5xFw+7LFlrBwsnuxmpsV7d3wclA==
X-Received: by 2002:a17:906:72d4:b0:712:1fa8:a685 with SMTP id m20-20020a17090672d400b007121fa8a685mr20303254ejl.709.1655730586456;
        Mon, 20 Jun 2022 06:09:46 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id eg40-20020a05640228a800b004356d82b129sm6067638edb.80.2022.06.20.06.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 06:09:45 -0700 (PDT)
Message-ID: <49b8723e-bc5f-6119-cf9f-047a856f5b6e@gmail.com>
Date: Mon, 20 Jun 2022 15:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v20 0/6] Add mutex support for MDP
Content-Language: en-US
To: "moudy.ho" <moudy.ho@mediatek.com>,
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
 <5f53e0a4-f6d5-f9be-222b-e6361b837071@gmail.com>
 <a982aa2fb069e498ee259e43501025936b005091.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <a982aa2fb069e498ee259e43501025936b005091.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_060948_908368_F1A1FF73 
X-CRM114-Status: GOOD (  21.87  )
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



On 20/06/2022 03:36, moudy.ho wrote:
> On Fri, 2022-06-17 at 15:54 +0200, Matthias Brugger wrote:
>>
>> On 10/06/2022 08:34, Moudy Ho wrote:
>>> Change since V19:
>>> - Reduce parameters pass to function "mtk_mutex_write_sof"
>>>     to avoid redundant action.
>>>
>>> Change since V18:
>>> - Rebase on v5.19-rc1
>>> - Remove unnecessary functions:
>>>     "mtk_mutex_set_mod", "mtk_mutex_clear_mod",
>>>     "mtk_mutex_set_sof" and "mtk_mutex_clear_sof", and export
>>>     "mtk_mutex_write_mod" and "mtk_mutex_write_sof" to
>>>     set MOD/SOF directly.
>>> - Remove unnecessary SOF tables and add new enumerations of SOF
>>> instead.
>>> - Adjust the error checking for CMDQ operations.
>>>
>>> Change since V17:
>>> - Rebase on v5.18-rc6
>>> - Fix undeclared identifier causing compilation to fail.
>>>
>>> Change since V16:
>>> - Rebase on v5.18-rc4
>>> - Fix misplacement of definition "CONFIG_MTK_CMDQ" which
>>>     caused compilation error when CMD is not supported.
>>>
>>> Change since V15:
>>> - Rebase on linux-next.
>>> - As suggested by Angelo, split common parts into independent
>>> functions to
>>>     make functions more concise.
>>> - Based on safety considerations, increase the returned error
>>> number and
>>>     message to facilitate error handling.
>>>
>>> Change since V14:
>>> - Rebase on linux-next.
>>> - Add new SOF and MOD table for general interface to integrate the
>>> requirement
>>>     of different modules.
>>> - Remove unnecessary MOD structure.
>>> - By Rob Herring's suggestion, revise the description of
>>>     "mediatek,gce-client-reg" in MUTEX dt-bindings.
>>> - Delete the redundant definition of MTK_MUTEX_ENABLE and modify
>>> corresponding
>>>     function.
>>>
>>> Change since V13:
>>> - Rebase on linux-next tag:next-20220316
>>> - Adjust the MUTEX MOD table structure and corresponding functions.
>>> - Adjust the definition style about 8183 MDP MOD.
>>> - Remove redundant definitions and enumerations.
>>> - Adjust the CMDQ operation in MUTEX to be backward compatible
>>>
>>> Change since V12:
>>> - Rebase on linux-next
>>> - Remove ISP related settings in MMSYS
>>> - Removed CMDQ operations previously used by MDP in MMSYS
>>> - Move mediatek MUTEX dt-binding path
>>> - Add additional property in MUTEX for CMDQ operations
>>>
>>> Change since V11:
>>> - Rebase on v5.17-rc6.
>>>
>>> [1]:
>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next*soc&id=5f9b5b757e44de47ebdc116c14b90e3cc8bc7acb__;Lw!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5DQsUzWs$
>>>   
>>> [2]:
>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next*soc&id=831785f0e5b919c29e1bc5f9a74e9ebd38289e24__;Lw!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5AuVaksc$
>>>   
>>> [3]:
>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next*soc&id=15f1768365aed810826a61fef4a744437aa5b426__;Lw!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5NwN4SIb$
>>>   
>>>
>>> Change since v10:
>>> - For some ISP application scenarios, such as preview and recording
>>>     at the same time.
>>>     The routing table needs to be discarded, and the calculation
>>> result
>>>     on the SCP side is used to write a suitable mux setting for
>>>     1 input and 2 output.
>>> - Adjust the GCE client register parsing method to avoid redundant
>>> warning logs.
>>>
>>> Change since v9:
>>> - Add API for MDP getting mutex mod.
>>>
>>> Hi,
>>>
>>> This patch splits mmsys and mutex settings from Media Data Path 3
>>> (MDP3),
>>> and original mailling list list below:
>>>
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/20211201095031.31606-1-moudy.ho@mediatek.com/__;!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5Ov7mlf5$
>>>   
>>> Corresponding settings and interfaces are added for MDP operation
>>> in the
>>> mmsys and mutex drivers, which increases the independence of the
>>> modules
>>>
>>> Moudy Ho (6):
>>>     soc: mediatek: mutex: add common interface for modules setting
>>>     soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
>>>     dt-bindings: soc: mediatek: move out common module from display
>>> folder
>>>     dt-bindings: soc: mediatek: add gce-client-reg for MUTEX
>>>     dts: arm64: mt8183: add GCE client property for Mediatek MUTEX
>>
>> If fixed the commit subject to arm64: dts: mt8183...
>> Whole series applied,
>>
>> Thanks!
>>
> 
> Hi Matthias,
> 
> Thanks for the correction, I'll fix it as soon as possible.

I already fixed that when I took the series. No action from your side needed.

Regards,
Matthias

> 
> Regards,
> Moudy
> 
>>>     soc: mediatek: mutex: add functions that operate registers by
>>> CMDQ
>>>
>>>    .../mediatek/mediatek,mutex.yaml              |  14 ++-
>>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   1 +
>>>    drivers/soc/mediatek/mtk-mutex.c              | 119
>>> +++++++++++++++++-
>>>    include/linux/soc/mediatek/mtk-mutex.h        |  27 ++++
>>>    4 files changed, 159 insertions(+), 2 deletions(-)
>>>    rename Documentation/devicetree/bindings/{display =>
>>> soc}/mediatek/mediatek,mutex.yaml (81%)
>>>
> 

