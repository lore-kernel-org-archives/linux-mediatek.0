Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1ADECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGOksTlx7HPSEJ3tGiKUBW8haHMuXJVe8E31nOF/Xns=; b=RKau7l+zNSrcP4a5n/hWfoLXc+
	3J/WqKxKaXsi4gdKZ5cugHJDnb3dIL5tdCoK8mTOygH02pZPrS8MtkEDhcDt8gOr3QITKAeIT4DnF
	Dz0i0IfgFQq8rimj8IQqtdXCm7DIpmu3rDhZ4IXgqJQ683D4v0f7KqVG/fQ1ePoWbp0+9Pof2F2fM
	HC/b5gARMFXzo2f6ItD2MSslf6la7RWuPDwxvEnjvBylfznzP8H85nnE9O5gTD8Voue3plzjofFbZ
	wgZU/BaCHHDmMLAks/PNYOfw/uWLHLV6DpWSGrJh4AbFxCtRZB3VTDo7H8Encoq+SDk7EtMMssRCY
	bxxhQN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaC0Q-009wAo-96; Mon, 19 Sep 2022 08:19:54 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaC0A-009w0b-DR
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 08:19:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id w8so45689581lft.12
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=cGOksTlx7HPSEJ3tGiKUBW8haHMuXJVe8E31nOF/Xns=;
        b=u9l2LNU0CtHKm3nLxR0sboWaatfqLlHDDYdD0KtG6vgT7rByAJBdDqLIW8xoizWSpI
         JGuIrGSoS+YC8NMafiKedkZhmmi6H/JQYvKgLkyUK/5eayLL6wwCI6JxE9atMQsxVTgs
         bJeBcOaTgwbYtcLzCjy/WdyZxxlMpidrQ35dwPmsE86vsSzlOw5dM7Fc5Q/ZOPz5Fppr
         eGU+rUIJV0ltdyeqopkPtnju4ZyfTrJyvglKK8OnEs9lZOiVZhn9lYqC7UpKFozAe3xL
         IETBbJCmkOd3KzcDUzrmzPfsKEoDZl4iu8gJKe/VB+Bsn87Knwfwnhm5R6FBhOWalmfl
         EILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cGOksTlx7HPSEJ3tGiKUBW8haHMuXJVe8E31nOF/Xns=;
        b=BhFUvv3uN+DibMGMaX4YpVPD0G6I2KcEwhaBDzGasbEBB/S50cP82SovuRnl3anIOb
         LIsPUS9zfCTra9j4fZkuzkbjuVCwU1hKXNMqegU1RSPZXwhKtPeUr2b+p/gZQAiULF0V
         4TqgNsuzwB3u4bxG8Ip+uAKFjfgSaUhdjA/Yzy3kr/MsOekIfIi5jDnsOtrI4pnKlOHr
         wy9ZGCsa2UvoC4poLDMtsl7Q+xg1/SOnQLh3Inwg0+7QNgj6T1hXop3FsfKiUpq6iGv0
         dMo7yKY/z6/M1YeVO/AenrFiqNE5PHHcuzxxwwW07RvEutik9yi7ZU9nYRbvMVrM3PiV
         OObg==
X-Gm-Message-State: ACrzQf04GeBHPdpC+t7bHETG5GH0qkLPSnAZt68VtbbhXtvXba7wkhgv
	tZu8SpCYjkvyCvrG9/mVo/SQSA==
X-Google-Smtp-Source: AMsMyM4bsPPOk94vI7dWhP43voq8RX38StuUfrTlgpjKh06SgkNvXLTG2zWq+zZzzqFCbHg8+VZQtQ==
X-Received: by 2002:a05:6512:3d9f:b0:497:a108:544f with SMTP id k31-20020a0565123d9f00b00497a108544fmr5478197lfv.688.1663575573570;
        Mon, 19 Sep 2022 01:19:33 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j20-20020a056512345400b00493014c3d7csm5059793lfr.309.2022.09.19.01.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 01:19:33 -0700 (PDT)
Message-ID: <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
Date: Mon, 19 Sep 2022 10:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] stmmac: dwmac-mediatek: add support for mt8188
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-2-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919080410.11270-2-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_011949_615113_2935B2B3 
X-CRM114-Status: GOOD (  15.75  )
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

On 19/09/2022 10:04, Jianguo Zhang wrote:
> Add ethernet support for MediaTek SoCs from mt8188 family.
> As mt8188 and mt8195 have same ethernet design, so private data
> "mt8195_gmac_variant" can be reused for mt8188.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index d42e1afb6521..f45be440b6d0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -720,6 +720,8 @@ static const struct of_device_id mediatek_dwmac_match[] = {
>  	  .data = &mt2712_gmac_variant },
>  	{ .compatible = "mediatek,mt8195-gmac",
>  	  .data = &mt8195_gmac_variant },
> +	{ .compatible = "mediatek,mt8188-gmac",
> +	  .data = &mt8195_gmac_variant },

It's the same. No need for new entry.


Best regards,
Krzysztof

