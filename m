Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863D1C76196
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XOcFenNFYRM2N6pSiUZEbD6uIJrjdKx1WKwhR0xs50=; b=bxSZf0UuoEk7p0KH3Z/atZ86OB
	NaUTfROzJlg4BsKiX/eZ6lnvEffEwySgAovNzSOykxEELZy/CmbE+MChXt/4dyWzmP+HklBxCSBr5
	9XEFJCxI/Qi3517zS9bJCZXTPEJU8Pxn4dbqMSG/YeKzLH+i9ABdhr5UV7KVcZylbG/VKMHSZjY5A
	fcQVMcOLiNyeogEa8IghsibSkKdJdCXiV0g5yof+5B0Z3NGlYkBGkuxViqYCmrWmDYa4y5bq6fkBZ
	UffvRuf5/CH1C8S3etQCfyrK4lfGrJBnkdEVVtneQ3Av2Dp2ctA5C5gd3ERPEH/fgN6BXB1J39cwj
	JA/EyohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj161-00CsT0-1S;
	Sun, 02 Apr 2023 17:02:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj15w-00CsRq-2F;
	Sun, 02 Apr 2023 17:02:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso18388851wmb.0;
        Sun, 02 Apr 2023 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680454938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XOcFenNFYRM2N6pSiUZEbD6uIJrjdKx1WKwhR0xs50=;
        b=ANvfbaiKo3Ki0oNGRBd1f4nF1CdD94/r/tSNwSH2W84rQPO7CvX91q1a6VO6WIsAY7
         OmvFaKwmqKmzraHyhi/OmKWXeD32PilzRPQm6rv/ZL9ZrmHGgFm9kWcfR29khOPVERMq
         UACKwxqDUcMdeo+6bLN4uhNW4Wi0VCBqZCJyX9ugYLr3ZLUKVpOplzCTQlyuztXM02hy
         gSZ3Q5Kqiu8SwMU7+vbjUZgyiwIb/Pt+Mlqkj1Gc9tPct7O3pPNuYSAHXJkdQDWKAuz0
         rt8t6s2cP8EcYkwUEvCmHwogU/6aqPHBwko98v9KS6CxRwftRn6vc8jJQt4MSbXXyKa3
         5Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680454938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XOcFenNFYRM2N6pSiUZEbD6uIJrjdKx1WKwhR0xs50=;
        b=cDG95LPNCzxaHrXrxuHJ90L1nSmxW4CvL33clrW4FYUwb5jfdmFlJCwlqwKHYOHJZt
         nMFT1R7Q5MrlGNEUwdFu0GtgrLv0TtMqTpXtCaSafePJ70fiDvGKREzJLpffllGO3ph2
         i4le+2EYABKOkb2c2evtmz9stZrpDDgL5W2lebLOFPqADt993QzzepviLjPuUnuhcsB7
         F6Eq9MOSWTEmx2e70gz9FdfYnEU9ixGjyoaMKISDGERFXZX2E1iZVqIFjX5wk3bcD7F8
         qHRO+XTq8MLG//PxmrG6rs46leeBgW7EWQZgJgxBf6gHI4sxMWPW+T5ndeT7r/h6FB/c
         6rOw==
X-Gm-Message-State: AAQBX9cyswENIiGp0zv2ET0f011vFAKYiLqrFjNodmJflniuwvpTJe5l
	1Ezga8Miw43nsgBpFTEXpBQ9RjcgTUZkOg==
X-Google-Smtp-Source: AKy350ZtNnms3pkR6oY30xJO9bNT2YpcPIXQrGO9yFnNaFcPLTQCJs5SU35WATc1Hlmkrsg5F9bxqw==
X-Received: by 2002:a7b:c045:0:b0:3ef:6fee:8057 with SMTP id u5-20020a7bc045000000b003ef6fee8057mr17170245wmc.25.1680454938275;
        Sun, 02 Apr 2023 10:02:18 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c029800b003ed246c1d28sm9463189wmk.44.2023.04.02.10.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:02:17 -0700 (PDT)
Message-ID: <00fb6b73-5327-13f6-8df8-6f1f4d1aa671@gmail.com>
Date: Sun, 2 Apr 2023 19:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/3] MediaTek MMSYS: Split out MT8173 and add MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_100220_764790_66CA2950 
X-CRM114-Status: GOOD (  17.65  )
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



On 09/03/2023 11:26, AngeloGioacchino Del Regno wrote:
> This series migrates MT8173 to use its own mmsys DDP routing table
> and introduces support for the MediaTek Helio X10 MT6795 using the
> same routing table as MT8173.
> 
> Broader explanation goes to that MT6795 addition:
> 
> Both MT6795 and MT8173 can support more usecases than the ones in
> the current routing tables and the ones that are actually supported
> in mediatek-drm!
> This is mostly about MERGE, dual-DSI, WDMA (for command mode panels)
> and others, but, again, right now, these are not supported.
> 
> I could have created a mt6795-mmsys.h, but that would've been a 1:1
> clone of mt8173-mmsys.h, creating unnecessary code duplication hence
> raising code (and kernel) size for no practical reason.
> 
> As a side note, if more MTK Smartphone SoCs land upstream, I expect
> to see more re-using of MTK Chromebook SoCs mmsys routing tables.
> 
> P.S.: MT6795 dt-bindings are already upstream in v6.1 [1].
> 
> This series was tested on:
>   - MT8173 Acer Chromebook R13 (Elm)
>   - MT6795 Sony Xperia M5 (Holly)
> 

Applied, thanks!

> Also, this series depends on [2]
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml?h=v6.1.15#n28
> [2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=724014
> 
> AngeloGioacchino Del Regno (3):
>    soc: mediatek: mtk-mmsys: Split out MT8173 mmsys DDP routing table
>    soc: mediatek: mtk-mmsys: Change MT8173 num_resets to 64
>    soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10
> 
>   drivers/soc/mediatek/mt8173-mmsys.h | 95 +++++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c    | 16 ++++-
>   drivers/soc/mediatek/mtk-mmsys.h    |  2 +-
>   3 files changed, 109 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8173-mmsys.h
> 

