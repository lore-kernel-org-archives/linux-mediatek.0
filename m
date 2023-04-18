Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0F2C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M30du5mqmgKvrK4t9HuuHfHAn0tr6/r+1Nuzg/l+qDw=; b=T7VITbmoIyNbYZSBD/bA7jucpg
	7kCf73C0BgkvnLHgTo+emCrYQQlCJcGmmaBOZSHLLQ/Ilg3Ie8VEacfvlhSd9WjDrnnEV/R1RtUf9
	ojQAblOjXOxSUR13vJVGQ93tORCE15+0sfp417gZ+P8lUlFR/kHyilqAgaExtg5QbDg1q7NsHHaJ0
	Rk3mzHtxK1uqpgbrb+XTspoZ/nfDKVJuMrCObwuRzjoyIjSsjYVedxAxwntdDbNmpbtvSJOuHtCdN
	bIN4B77RdiTzvrDPGjAeKfVt3NMixPPjzGfCi6sNximjYsArMcHv/yogWfD9llnPB3EzjoEpf6too
	XzpIz8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1popir-00318P-00;
	Tue, 18 Apr 2023 18:06:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1popio-00317e-30;
	Tue, 18 Apr 2023 18:06:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o6-20020a05600c4fc600b003ef6e6754c5so270007wmq.5;
        Tue, 18 Apr 2023 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681841187; x=1684433187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M30du5mqmgKvrK4t9HuuHfHAn0tr6/r+1Nuzg/l+qDw=;
        b=aCFj1du12kahKPc813jpwjYOXhr5FL7OFbCUYDvNavWqd0SK6oPxKM2dMsxip95R6a
         4/03EZc+qS79tO4AruGAqF5tD8wrk3HvYkbuTFMlMKrtCPMvCRs/aNl1bpoJtldQ9HCN
         uOpyl6p8LXdvzbDD4gRNPiQqWyiIA3PDpjIc4XHRaTO4UmWif9MAa21W/tEpYWQFNa9C
         /fbzoBhh+Go6lC97jomf/vHXaJZ40IA+jKnTOkzJ19J1aZ9+dL29RbP7CZVrvTblP8U5
         MQ2yQsE5upoSJ6/BkX3VSoEOQZ3TVAUDzsy63IsUV9Hn1Klx99gVdfbeVcn+mvLuwFZx
         Z8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681841187; x=1684433187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M30du5mqmgKvrK4t9HuuHfHAn0tr6/r+1Nuzg/l+qDw=;
        b=GUwN9C+WImuzQ8uO3dQ/jC6B6uPzU7qQtcrRt2einC3RbzBQeRCEUY7YIFv0yqlyIY
         gvYyQ6gxTmxBnDZhHlk2bbFCb4KpzXdfeQiDCQ1/0AYP2H7AT6b5URB94LqC9FaO8MXj
         Tnt+25qdoN9y1HRmUab8KZvuSV60lCGeIaAvkaaplfUUBzGf4UarCe3629kVJqbLN00U
         y9mWDYGe5FgPNylbd6Y4GcPrj8JpwnZFlWKBI099Qzkkk4AxalVkM/5ni/5s2TVzmcac
         MS0Afo3yabBNwYhiCOPT8WF2iL+G6UGAwASt3AW7r5uyLN4eH6aukTJk7JzFgkayVBEX
         VUYQ==
X-Gm-Message-State: AAQBX9cO24g7PDq1QnjNcU3a5MGfL0UTdFUCIw9DRHtAaZn/HUC6Fn2A
	HthiFfiudRlr89Dph08QAcI=
X-Google-Smtp-Source: AKy350affcKRPRnr6w7/Il+mJ10enRJnyp2KpkDOKh2W7Jw2M7JNi/J3H08mo2ox0CzAMVjiUCBrdg==
X-Received: by 2002:a05:600c:218c:b0:3f1:6980:2cff with SMTP id e12-20020a05600c218c00b003f169802cffmr8162883wme.14.1681841186582;
        Tue, 18 Apr 2023 11:06:26 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d480b000000b002f2783ba25asm13649277wrq.65.2023.04.18.11.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 11:06:25 -0700 (PDT)
Message-ID: <d05f3ba8-5e89-82f2-73e0-175250e3e8fd@gmail.com>
Date: Tue, 18 Apr 2023 20:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] phy: mediatek/mt8195: fx mtk_hdmi_pll_calc() return code
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230414075842.4006164-1-arnd@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414075842.4006164-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_110630_968281_444C1A22 
X-CRM114-Status: GOOD (  18.48  )
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

Hi Arnd,

On 14/04/2023 09:58, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added function returns an uninitialized variable:
> 
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> 
> Wire it up to the return code of the function called just before,
> assuming that this was the intention originally.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..c8e540665fcb 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -292,7 +292,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	if (!(digital_div <= 32 && digital_div >= 1))
>   		return -EINVAL;
>   
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>   			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>   			    txposdiv, digital_div);
>   	if (ret)

I think this is the third patch that fixes this :) Your solution look quite 
similar to this one:
20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com

Regards,
Mmatthias

