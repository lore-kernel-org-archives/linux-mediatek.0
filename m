Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D92C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kBVJI7OvqWZE9hdBUgh4+a/Q7ktxLZDNcwhb2und9c=; b=WHDkTi6T/mTBSiVOH2ZwNKEkT9
	dm1TR56eQQ/k3+Ud77o38zO8380V60EQK4QpvTvC51d2xf2oO4zNF9mo5WYk3SUEQCsLWXJo7Yopg
	PoK6HcS7H+OJOOTvwg/2xG2HWuXDiibmEXIUnDnYu93gf5Tybw7LM8u1CceLkcy1HcSl7TorlwWoT
	EminHVJW9E5RNvlBFC5Am6djvfZj5gO++8g8dLvMEVVEqxpLTrdnEFBCqEwhiKvo06rLXDyielrCi
	l8pu7d4oSHT/eZA7+XQ2v9+HhskVt3CDvODDkDMl7TdLdBJNPzKDYfdXblN3Z+5K9KMm5PGLJ8FK5
	MYwfHC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7JOo-00GM6L-Nk; Mon, 19 Dec 2022 16:53:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Htd-00FFvd-F9; Mon, 19 Dec 2022 15:17:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id h12so8949566wrv.10;
        Mon, 19 Dec 2022 07:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kBVJI7OvqWZE9hdBUgh4+a/Q7ktxLZDNcwhb2und9c=;
        b=Ha4Z2OcgAoz2LEInTogCsaKCZXddqQ9UB5FOvc9UhBrIGHDQ+2ZkFlrxvRqbLBHoVG
         NmccLpFL/En5rI+fISPTwcZFN9eMKZ5S2Zo7D9q1K4QlgWyK4vUugMwbsdsDbqGa14Ta
         iQ8G98pXSVLw8Pf5KK43NVJ9n88bwAy5E78bjA69YrccGiyC4UBY1fghpGHCNUKGmWN1
         nvyldkhGNW3si3rVVBodXFmPTPmmesJfW0l4L+vdvG5B/BEqHtfHeKabjTIQJeEioZE3
         YvKidXdeZ5Rp4yp4liSNPLApCteIg/8TS/5m9DhsOIhd3JCvE1j9wZQefnOw/PN0XCYn
         hm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kBVJI7OvqWZE9hdBUgh4+a/Q7ktxLZDNcwhb2und9c=;
        b=XlG0MH+/zCIaFtCKktZ6vIuWHs4FiP6dnI4egRuhwfnEavJwcgVIoQIp3Nc3waTojA
         nCmsQKJC5oNbwS/GHfoZtLegfSIK6F2VhXtNqEGK9HpIT53m7m3b/elPky5qNcXY4W0+
         qbwv5hknbEM/tyYMU3a7TXxWVf5irbdRCUw8UIdTDmVe/83GZVVLb1HRpVvuaRwDBozp
         OlKoPNiofGoEm93B8gQaN5DdTqw9dyDMEUbQ/Nc54a6f3SjMDwc844JESASEQUYjaqDZ
         5q4y1b15UNjSQX8HPsH+tTrCPj79BSYwvXv4qXZRfnPuAqmPzM+qNoHPyOAE8NQlS7DI
         Eqhw==
X-Gm-Message-State: ANoB5pnqS0ZPH6qN/d/ctBuh2xCYnr3UPqiaIll34Z2EVV4vdyc3LZiY
	Hi8EH8U2/mfYHV0/0v+/6us=
X-Google-Smtp-Source: AA0mqf5un/vop7IAv+jq6P5DcAumqLb5kyLRJQKNVxLI2D6Ulm6t0jX3E3Lx3H9oWGLLXMV/u53jTw==
X-Received: by 2002:adf:ef42:0:b0:242:647d:9c57 with SMTP id c2-20020adfef42000000b00242647d9c57mr27045971wrp.36.1671463057586;
        Mon, 19 Dec 2022 07:17:37 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d698c000000b00241c6729c2bsm10231832wru.26.2022.12.19.07.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 07:17:37 -0800 (PST)
Message-ID: <dba479ea-968f-89eb-fc59-8235cbb2783a@gmail.com>
Date: Mon, 19 Dec 2022 16:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 0/8] add support MDP3 on MT8195 platform
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
 <5692faa0-6d7e-774f-9d6a-a495b44bdb3e@gmail.com>
In-Reply-To: <5692faa0-6d7e-774f-9d6a-a495b44bdb3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_071741_750426_8FEACD8B 
X-CRM114-Status: GOOD (  15.45  )
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



On 16/12/2022 13:33, Matthias Brugger wrote:
> 
> Whole series applied, thanks!
> 

And now, whole series reverted, please see comment in 1/8.

Regards,
Matthias

> On 07/12/2022 10:49, Moudy Ho wrote:
>> From: mtk18742 <moudy.ho@mediatek.com>
>>
>> Changes since v3:
>> - Rebase on linux-next
>>
>> Changes since v2:
>> - Depend on :
>>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
>> - Split dts settings into two patches based on belonging to MMSYS or MUTEX.
>>
>> Changes since v1:
>> - Depend on :
>>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
>> - Add compatible names to VPPSYS0 and VPPSYS1 in MMSYS binding file.
>> - Fix VPPSYS's MMSYS and MUTEX dts to pass the dtsb_check.
>> - Rename mtk_mmsys_merge_config() and mtk_mmsys_rsz_dcm_config() to
>>    mtk_mmsys_vpp_rsz_merge_config() and mtk_mmsys_vpp_rsz_dcm_config().
>> - Clean up mtk_mmsys_vpp_rsz_dcm_config().
>> - Add a comment to mtk_mutex_write_mod() and clean it up for use in more
>>    than 32 mods.
>>
>> Hi,
>>
>> This series add support for MT8195's two VPPSYS(Video Processor Pipe Subsystem),
>> under which there will be corresponding MMSYS and MUTEX settings that
>> need to be configured.
>>
>> Moudy Ho (2):
>>    dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
>>    arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS
>>
>> Roy-CW.Yeh (6):
>>    dt-bindings: soc: mediatek: Add support for MT8195 VPPSYS
>>    arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS
>>    soc: mediatek: mmsys: add support for MT8195 VPPSYS
>>    soc: mediatek: mmsys: add config api for RSZ switching and DCM
>>    soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
>>    soc: mediatek: mutex: support MT8195 VPPSYS
>>
>>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |   5 +-
>>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  28 +++-
>>   drivers/soc/mediatek/mt8195-mmsys.h           |  13 ++
>>   drivers/soc/mediatek/mtk-mmsys.c              |  64 +++++++++
>>   drivers/soc/mediatek/mtk-mmsys.h              |   1 +
>>   drivers/soc/mediatek/mtk-mutex.c              | 135 +++++++++++++++++-
>>   include/linux/soc/mediatek/mtk-mmsys.h        |   4 +
>>   include/linux/soc/mediatek/mtk-mutex.h        |  35 +++++
>>   9 files changed, 274 insertions(+), 12 deletions(-)
>>

