Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A9FC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dOJVIGMX/56gfv9vT65ZzraMpImyEbSMTyJtUPlCLo=; b=ndfrKw+BaO4bXDY4YTBV9m5kUa
	LXmD3TaCMWND8kJ+lHcT2nnT5sh4li4SfoKnrgy7VQIxX7nQCBRDNDrFiMUDleUsIfnVpa7SkA2br
	H8vhMUpNoXbkwmozctnN7nASjPhCkJCcoUH1LPq3SWqdWh72WNjNtC8e8p5SwpIUoNGE/xCcZ8jhZ
	8wSyzXgcFBz3Z9423GRK9OZL28zDZrY7gt19w9fMDgjY7ixEcBDsjYspxkvpaTlJXe+6qsye28ILb
	gOwrXoIkOY9PlvAR66fVP3SiFacBWg9CBBrHDVQPjfl6nE3sqVnZwtrSpbg5LXmQPfUu0q6uxcN0j
	DWNXtSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzKOj-00AWLs-2H;
	Wed, 17 May 2023 16:53:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzKOc-00AWJ7-32
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 16:53:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f41dceb9caso1980355e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684342379; x=1686934379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dOJVIGMX/56gfv9vT65ZzraMpImyEbSMTyJtUPlCLo=;
        b=2BVmhZvz4oCFmI5/DV5GvMVrMDeSuoxTJrL4iNd3Jxd8RMgHHaG2zBP3QGXd4XOrKH
         hnCaxYsoji/6w9ykNXsu7Fi6zdPHszF1Q4gQwaYtYi+alCroMmK3dTCvf76H24m0hBNH
         uPYMxYIcvwsv9oLoqcnRqkuJqG160ovtznAlXlPoISd+6G5FUe39gNEpXnHhlVhKSgAr
         j7cJBOpVpVr6bIWkD/AWH7j1IIm/DQGL+hgxy/nADAKFAC150PQwk4fwE0f01qyGHD+P
         Cp76uAflMqRUWC6k9pvk/7rn+QHXpv19LDYyCPOIgLeWLoQ8+IfQ09AyPHmlKEGKrCXG
         SwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684342379; x=1686934379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dOJVIGMX/56gfv9vT65ZzraMpImyEbSMTyJtUPlCLo=;
        b=Tq8Wqy8HLieZRQ5RgN+xEEki28AOczg1pWQkHKa7KmZtueCqffvsuhqh+zNFGIPdCG
         uK8HVxXgKS0Oh8unsb6SsplZlM2GUvR8e9lmaYgoblfoYDg6hCfIjzzdVs+uZKCyi1Rp
         70XegglcCRRel9Kei+EeVmE9RcCVaT1Lv5alxr6d9B/rII42CJ3Zm4qPO9LeU2Fu6Ueq
         gR86o6Y2BWiGLYOz/ejp+/QdwrOMi3EeBlSJxSy7f8C1qsDWwhJFJD35j1YuG3+ZqdQ8
         UK9bqKWcYTywI201Q9oxa0NvPCp8Li9p2JpjJ5YRQCAyssYy7Drlc16kT+5HTKMMY50Q
         BVqA==
X-Gm-Message-State: AC+VfDxMEjkQW6olomgYjYK//qTQ0Kg5VRn8XXNzBIoRzANr5KC+Q3qZ
	D7eDTPI5ORvZ1aV13l0Som1LvA==
X-Google-Smtp-Source: ACHHUZ5oWXHIEKdFAwIxANhWR9lMlqKmEiYA0FORJIMDBWG4zKRbrOzb0ppHIUnnzPT2YmO1WjO6DQ==
X-Received: by 2002:a7b:cd01:0:b0:3f4:fe7f:3d18 with SMTP id f1-20020a7bcd01000000b003f4fe7f3d18mr2318552wmj.2.1684342378813;
        Wed, 17 May 2023 09:52:58 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u15-20020adfed4f000000b00307c46f4f08sm3267555wro.79.2023.05.17.09.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 09:52:58 -0700 (PDT)
Message-ID: <94f8af4a-2555-052d-d04a-a0e54e0e2d13@baylibre.com>
Date: Wed, 17 May 2023 18:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] clk/mediatek: Adjustments for MSDC rate accuracy
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 chun-jie.chen@mediatek.com, mandyjh.liu@mediatek.com,
 miles.chen@mediatek.com, zhaojh329@gmail.com, daniel@makrotopia.org,
 nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 Garmin.Chang@mediatek.com, msp@baylibre.com, yangyingliang@huawei.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_095302_981606_A7321B7C 
X-CRM114-Status: GOOD (  15.22  )
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

On 16/05/2023 15:52, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>    - Extended the changes in this series to MT8365 clocks
> 
> This series stops unconditionally forcing CLK_SET_RATE_PARENT on
> MediaTek muxes, as that should be set in the clock driver for each
> clock requiring it, and removes CLK_SET_PARENT from all MSDC core
> clocks to allow mtk-sd to select the right clock parent when doing
> mclk setting, improving the rate accuracy and avoiding both under
> and overclocks of the eMMC/SD/SDIO card, both improving performance
> and stability of the attached storage.
> 
> This series was successfully tested on MT8173, MT8192, MT8195.
> 
> AngeloGioacchino Del Regno (2):
>    clk: mediatek: mux: Stop forcing CLK_SET_RATE_PARENT flag
>    clk: mediatek: Remove CLK_SET_PARENT from all MSDC core clocks
> 
>   drivers/clk/mediatek/clk-mt6765.c          | 20 +++++-----
>   drivers/clk/mediatek/clk-mt6779.c          | 24 +++++------
>   drivers/clk/mediatek/clk-mt7981-topckgen.c | 12 +++---
>   drivers/clk/mediatek/clk-mt7986-topckgen.c | 12 +++---
>   drivers/clk/mediatek/clk-mt8173-topckgen.c | 24 +++++------
>   drivers/clk/mediatek/clk-mt8183.c          | 22 ++++++-----
>   drivers/clk/mediatek/clk-mt8186-topckgen.c | 24 +++++------
>   drivers/clk/mediatek/clk-mt8188-topckgen.c | 40 +++++++++++--------
>   drivers/clk/mediatek/clk-mt8192.c          | 23 +++++------
>   drivers/clk/mediatek/clk-mt8195-topckgen.c | 46 +++++++++++++---------
>   drivers/clk/mediatek/clk-mt8365.c          | 38 +++++++++---------
>   drivers/clk/mediatek/clk-mux.c             |  2 +-
>   12 files changed, 155 insertions(+), 132 deletions(-)
> 

I will try to test it next week on MT8365 SoC.

-- 
Regards,
Alexandre


