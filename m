Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DEDC7EE29
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrbBiasFytk1Nckd/DEhj6S74ay42QVWNjVsOI0QOaU=; b=W32h3H8Xji/ZffIfG885RifS8B
	Zj14klxkv2u9n7R0FSvUQWyRupe/X5Bktzb3oelzym3GRh15+RwpiFG3KK/VsN4PkDny+QsJ7GxSw
	WpxgP1NNfs+IKO47QA1OuXyI2CC88Peg4VPnvMiPvQOyA+630tFn4qcp+X8gfoO/4lY+2La/VW9E9
	0IrOzps4oVXmthXk+9AC4BvH+Er5L1b3BTWv9cCVMrZmfdblOwXO+tsrkbv/npFZBZ1hRRY++GVEQ
	tx0F4zBLtfuhyPGRKCAQXscxlfoBq7HeNYRk9VGUH61kNbnORe+sUrAAV2aVl6QxhYjSkJlBOSonj
	P0/RizmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6na8-004jgO-1K;
	Wed, 07 Jun 2023 07:27:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6na6-004jfT-0c
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 07:27:47 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so725288a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 00:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686122865; x=1688714865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrbBiasFytk1Nckd/DEhj6S74ay42QVWNjVsOI0QOaU=;
        b=ga5a6+ukcKvhCnCPtrFzfCApYNa14klTsW9G8sLRCTHvPthZP3P8YCyGxcTksH8lzG
         53OYquxkw+acOpZHWdq2fcXeAWcMYhPtbGx6X9PcRFYydCAPZ8RfjD8GTPhfqtXY136+
         PRISb+AEWJEpljPJo9v+j9597drXfOhcuCBtHQPSNL5YuuBMVrKB7Oa+OTodJd8/G7TY
         YDCpvHD6XruCv4jeMkhp1Hwc+H8RxYRGNZhMwXl+ivy/9fD5DfzvE5Y6VRsNF1M4Vfc+
         G5vFnA9uObVtDCBhvrTqt57LmtX42e+eO98EGw3Il8U2GqqzkNd/ZuhyvV509Fre0Z8f
         RivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122865; x=1688714865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrbBiasFytk1Nckd/DEhj6S74ay42QVWNjVsOI0QOaU=;
        b=hnpPbk9dH8wWhzn67yYBwbpEE2K+onCbB0ZJ61Dse3g8VzFF5AsM68yGj4HnnAHPyP
         IrXLo0VwGpTRHRN50s0uqtn2UFICVeBCjWJgqy0X/LAyhIxUK0h43oGAWmrOdRwRFeRc
         yvZjD2zexf1cB8DIT1/ilrMfMALHEx3bc0CoRZHlxCQgvHp0LY36mJoc/apMWBzoNwHU
         TlXsBgznczch9lif0DgZxvXT6KWGvKEtUJMPM4BfolFEcQrhriaUfl24gcIJiXOd65D3
         ezbNIVwIjgBzW+nov1IJ0PpMJmMwdNxzb8HSH8aPP+8+aBAHgkh/ktoIhkevs3Ci7WjF
         2fsA==
X-Gm-Message-State: AC+VfDz2fIFjeRHlJs6WIBQyOx5B4x9Z5wHUciNGoRk4SIvUReCx/+Ff
	cXVsaq2wBNwREnPyMljfHdxi6YaZEhjcJ6qGpPs=
X-Google-Smtp-Source: ACHHUZ4HJUTQNoMCxDs0ERIn2tW+n96xfANYG3S01OWKfCvbG1Af6Z1YzmJVLqK8u+vpuyUSG8iYTg==
X-Received: by 2002:aa7:d54e:0:b0:50b:c77e:b071 with SMTP id u14-20020aa7d54e000000b0050bc77eb071mr4135216edr.18.1686122864819;
        Wed, 07 Jun 2023 00:27:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p20-20020a056402075400b00514c4350243sm5748879edy.56.2023.06.07.00.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:27:44 -0700 (PDT)
Message-ID: <93eb3e7d-eff5-b040-5290-2de13699ed95@linaro.org>
Date: Wed, 7 Jun 2023 09:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 2/6] dt-bindings: reset: mt8188: Add reset control bits
 for VDOSYS1
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Fei Shao <fshao@google.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
 <20230607061121.6732-3-shawn.sung@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607061121.6732-3-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_002746_230737_7635B94D 
X-CRM114-Status: GOOD (  13.14  )
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

On 07/06/2023 08:11, Hsiao Chien Sung wrote:
> Add reset control bits for  MT8188 VDOSYS1.

Double space -> one space.

> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8188-resets.h | 12 ++++++++++++

This should be squashed with patch adding compatible.


>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
> index 377cdfda82a9..439a9a25ca19 100644
> --- a/include/dt-bindings/reset/mt8188-resets.h
> +++ b/include/dt-bindings/reset/mt8188-resets.h
> @@ -33,4 +33,16 @@
> 
>  #define MT8188_TOPRGU_SW_RST_NUM               24
> 
> +/* VDOSYS1 */
> +#define MT8188_VDO1_RST_MERGE0_DL_ASYNC         9

Indices start from 0.

> +#define MT8188_VDO1_RST_MERGE1_DL_ASYNC         10
> +#define MT8188_VDO1_RST_MERGE2_DL_ASYNC         11
> +#define MT8188_VDO1_RST_MERGE3_DL_ASYNC         32

... and are continuous.

Commit explains here nothing that it is for existing reset, so you got
such review.

Best regards,
Krzysztof


