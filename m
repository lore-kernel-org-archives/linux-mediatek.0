Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 01:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+G5vrMheUscNqcqfe/Vgn/7QPQWiVKmIQiHsQqGhT4=; b=rpRM5V53fB5dOSGaRdK1D06xCY
	g2oRA442aQtE0vlktZK3kO7yte8cUVmk9FUwdX9pT0WAxWLBKkvikaLFsEi2+JwF5gtGVXdE0tGgB
	0zYMxLY0AqduPGWKnN42aqK2G15yt1EzrSNsjcseSrAc/xRzyOyV0xcZZOFeyds882rmnc4aoVGEs
	M/YaAhwgO6MtgzC/JajvyyF5SGfLCmqTK2VwhrIpwrFq7lz3Re0tU1aww+pQmhHBPVKnKiMNT+eOP
	DSyBgHwDmN7CVmzmxqUkuHf46J4YVoxDp6VWiBbpf3kK5WDE/Evoc5bwLRg4iGlwOnKJEgIL28YDx
	5gKUF3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2N9H-009tgB-4Z; Sat, 18 Jun 2022 01:21:15 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2N9E-009ter-1q
	for linux-mediatek@lists.infradead.org; Sat, 18 Jun 2022 01:21:13 +0000
Received: by mail-pj1-x1034.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso5524113pja.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 18:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=F+G5vrMheUscNqcqfe/Vgn/7QPQWiVKmIQiHsQqGhT4=;
        b=m3E2TWWtMPsLtGy3UNkP6R2CyUrzzErld4HxIC7V5BUUbuMycPgbuQxuJXJI6bqpUX
         XL+ggljtounUakjSM7xIXhsd/6cboev8E1hTu0iwWKgRcPu7clb6PDXCSIleNBhl+Acu
         My7gjrw+AEcNH+ZcO6+Z0yZfIHrR1Ym+7US0r2O92V/+PiDyw+zptZXEFo8bGCLQMxEK
         DCYQ+RsB952kDvDBvnI0U9NkgKgGASPBXrpFOwpt+BdM91H/3rQnHWsLR6vg+kNpLbyw
         qs/Ub35o86VjzVCU6iZr5CUT3ozgGtztWiPl41S9nRLkdFp89euxhhJUwhH2I7thst5c
         iu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=F+G5vrMheUscNqcqfe/Vgn/7QPQWiVKmIQiHsQqGhT4=;
        b=lD4pes2qB6AFp8TTFf4skfFUHSNoZSqV8hL5s5Ayj1buKlpPiLF307560mbMtdWxpY
         KLEoemJvwtqJviuWWgDO0Lu+HoGtGB6vt+J8QQbTXRBqEIV9LPxIVmx3vhlK48wDePt/
         /Trnytw1WoxCBWCyyP3lzXzsgXMl0Kgqglr0XW1p8xp2A8dXLIfebXk1UU1b7BEm26ep
         OsLk9kS11e0tYOtojwO43Zqnf5CVWMb80tCGiSpxCtyLQxOrRz5uyIFm4A7PemF/8ww/
         MD+fLqT7Xu9IiLkFKjC5UP1PZbE8phUP/nxmC+DDJ2ZrFAvr90cmtaAp/0FgxkMNICAg
         qSQg==
X-Gm-Message-State: AJIora+bWC3MMSS4cvx9IKCn3CiAIZmz3cZbMEr7V3V/HLhFJlM0Ie9e
	RA5tieVf24mxqCoD0yiGw08B/w==
X-Google-Smtp-Source: AGRyM1vG4KjjPKtlm1wgmX54+UP4p9y1x0Anp/mA9ON9D45XnW3TBdS/hae7OlqnJfOS0AB4kGjomA==
X-Received: by 2002:a17:90a:df91:b0:1e3:4dc8:46e7 with SMTP id p17-20020a17090adf9100b001e34dc846e7mr24426222pjv.106.1655515268980;
        Fri, 17 Jun 2022 18:21:08 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id o22-20020a17090ac09600b001e2a36fb4aasm6038921pjs.43.2022.06.17.18.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:21:08 -0700 (PDT)
Message-ID: <91395246-7d94-c35b-b336-9c193e5d2b9e@linaro.org>
Date: Fri, 17 Jun 2022 18:21:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Set clocks based on compatible
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org
References: <20220617230114.2438875-1-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617230114.2438875-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_182112_137958_C7A2954B 
X-CRM114-Status: GOOD (  18.63  )
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

On 17/06/2022 16:01, Nícolas F. R. A. Prado wrote:
> The binding was describing a single clock list for all platforms, but
> that's not really suitable: mt2712 requires an extra 'bus_clk' on some
> of its controllers, while mt8192 requires four different extra clocks.
> The rest of the platforms can share the same 3 clocks, with the third
> being optional as it's not present on all platforms.
> 
> Move the clock definitions inside if blocks that match on the
> compatibles. In practice this gets rid of dtbs_check warnings on mt8192,
> since the 'bus_clk' clock from mt2712 is no longer expected on this
> platform.
> 
> Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 115 ++++++++++++------
>  1 file changed, 81 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 2a2e9fa8c188..ba48ff041299 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -10,9 +10,6 @@ maintainers:
>    - Chaotian Jing <chaotian.jing@mediatek.com>
>    - Wenbin Mei <wenbin.mei@mediatek.com>
>  
> -allOf:
> -  - $ref: mmc-controller.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -48,28 +45,8 @@ properties:
>    clocks:
>      description:
>        Should contain phandle for the clock feeding the MMC controller.
> -    minItems: 2

Keep minItems and maxItems matching the widest constraints.

> -    items:
> -      - description: source clock (required).
> -      - description: HCLK which used for host (required).
> -      - description: independent source clock gate (required for MT2712).
> -      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
> -      - description: msdc subsys clock gate (required for MT8192).
> -      - description: peripheral bus clock gate (required for MT8192).
> -      - description: AXI bus clock gate (required for MT8192).
> -      - description: AHB bus clock gate (required for MT8192).
> -
> -  clock-names:
> -    minItems: 2

ditto

>  


Best regards,
Krzysztof

