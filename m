Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F8FC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIbNvnDJkbKIDG9W40wHYyYsAJM6e0/VxMfL2/QQhNY=; b=bN+dFy+XIsKbjVpcsQWdgCOFP7
	99LKyAbm7fYussrW4irMM1uIjl6n+LqpGYTq9cQjDlMdmkCJbP4kkTabJl+rp1bvByFP1CUruTvPn
	+wFw/M9mX2OLBHCrR6NiX+4t9Wr0YBqqjXKv4OrRzh7Q8DAqBgkFW72QB5SCzAGt5ySADAQE01mTR
	9uxdTRyRaj6KI0/ecQENLQtfQwGlujWkhFbgmKDjze2YAFJvxPTUcoNudYKX4f74wWIQT24Sc/EDT
	PjfDuFAfMu+bmXUutKSq09n7f9EmWz06HMw6gxd0jq7NRwaZpW2rA8miM8acI9/HWAVHCm7LNxEv6
	o9pYabdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLae-009zek-1j;
	Fri, 14 Apr 2023 15:43:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLab-009zcz-1b;
	Fri, 14 Apr 2023 15:43:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id he13so15604464wmb.2;
        Fri, 14 Apr 2023 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681487030; x=1684079030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIbNvnDJkbKIDG9W40wHYyYsAJM6e0/VxMfL2/QQhNY=;
        b=QXpobAtYXuuja8eAnUitUYYdJFXqaConoab7s3RSbwHCOgxUoVFacXpnQJBcpA+JQb
         5N5tvC74yxQMqIqvqsop1XuZ4P+M7IaoRPqSbiY/1c2NeOfnuh57dPnBNRYtuvpOuOYQ
         d4ovTXDqN0R67vvA11ZrTveMDsLXR57NkWxMv0PtrbwpGTIEWGxabu7b6Kc4D1VC/yVL
         ftBSnh4ajvZ0aKZhcFea4GRL9sEGf22K7vufTD/WbjkwkdvB2NQi/q4ApF1oXBGDeC/I
         rZ1ZyK37G8LoSePqAYSqaAqTRIwbVHk0FT/40JaT1ZT4QJ2nRUPTFVGP/TsKf+MDR3mA
         gvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487030; x=1684079030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIbNvnDJkbKIDG9W40wHYyYsAJM6e0/VxMfL2/QQhNY=;
        b=jwZ0eqAB1EK+HjbMu1YdeVsgGsIn9bAeLt6Ai2Whd3Uo/JABrrPtFbo7kULbCrG71P
         8hiPglrtbFouI6g7Z8JAu3oHdy8VzZEFsombXUqEcBFnNpNTW8w8hELi91wg8NkVr9hY
         jx8paoYNv/0DMPRXURsJUmNXv2sAgH5nH6dg3E2dkqfmskXAYMUcIddmLn/nTpRyynjo
         rk3q7DBcN1rbutqcc93k7zI2COVAol1ipiZgh5bwV1pKt3k3VuzU7M3mvUBrOjI0AfnT
         g6BiAZFmWUcX5nCzfRGbH4+XxwfRP3DoPnUHhdqDa//JMmT9QWHX2Itz6y3ChDPl4CfC
         VbDg==
X-Gm-Message-State: AAQBX9fnQsvKJpbv+0hZ1iBAyvQytesn8MywRqWbQgRDf8bPs61mgiba
	xX6ZKeDwUvEmH3upCU1jWGo=
X-Google-Smtp-Source: AKy350a/b5Qg3ihzSVs/aHO9rCG1Yz359ZRWoVzo+MEmLSGdlhob8RT2eGiZbxTyHZHZZ5H4owZGGA==
X-Received: by 2002:a1c:770d:0:b0:3ed:95a5:3257 with SMTP id t13-20020a1c770d000000b003ed95a53257mr5261946wmi.2.1681487029517;
        Fri, 14 Apr 2023 08:43:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c458400b003f0a090d798sm6510629wmo.18.2023.04.14.08.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:43:48 -0700 (PDT)
Message-ID: <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
Date: Fri, 14 Apr 2023 17:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com,
 nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_084353_539142_5964C051 
X-CRM114-Status: GOOD (  13.73  )
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



On 14/04/2023 14:22, Tom Rix wrote:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>          if (ret)
>              ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..c63294e451d6 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	if (!(digital_div <= 32 && digital_div >= 1))
>   		return -EINVAL;
>   
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> -			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> -			    txposdiv, digital_div);
> +	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +				  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> +				  txposdiv, digital_div);
>   	if (ret)
>   		return -EINVAL;
>   

