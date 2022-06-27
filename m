Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8987ACCA47F
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGLjigKahLIbEiIjs4vb9AiZqSJH2kvHBxMmjbNszGQ=; b=l4wUjk/6k+8d87m7nnAdta2jyy
	WYSbGlhNMOc7YJQgb9BLGnMxDNnptP4EoDS1nXPy38Eru/94BKIs0fSKSQnMIhQHE5Hi2Oa08SJ84
	HlVFzIPTW2238GuClNTCDzQWrib1ydHgXD90vraj1wGztXDKX+IbevkT4CFo+BTRkC4Hm1U58T31z
	2xuU63XCtQ/Ag+y4OzNPCimu+R+n4339CzhSgw/rBejFqvuBZzmUO6/MU7Vvzo2sBwcrRhOUXI9pU
	zzj3ZOFk+aKQihAZudvilqtNLxpuSIgfBpLiCJassXPmvOmCBuKynUIx//doeakV5nXHGwJQdWaOE
	b+0cOUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5n7j-000bva-RE; Mon, 27 Jun 2022 11:41:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5n7U-000bkq-UG
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 11:41:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i25so7130992wrc.13
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XGLjigKahLIbEiIjs4vb9AiZqSJH2kvHBxMmjbNszGQ=;
        b=aPvmFznj7yqy4vj7LQLlbbcOIzC9aADXBp0AZlgIo456NCt8eVi6q37s5G+UG6Iigm
         9iY7kl9/Mq2qyMAK3FgNVLrJ6oiNEeBtvY431Q0iuqZIUYR0lSTG+VhgSDRM9bc7ZOwI
         nazBwO094kgX/wWej7vNXtwHePuuulFp46SC7Xif4L7pR+BmyneLm+h656KBMtrqAXHN
         eZMaLz3fYaWmtX/DFKq13ZM9PQtYu/F5iMSJJgNgcG9tgD10XAl6Po+wAZIr01kQkSev
         osJenA2uOk/VHO2aYlLGGMs7IwgYseZB3BeP32J5XhOlIdOItPsOT8/nQ5eZufUuRDC4
         pD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XGLjigKahLIbEiIjs4vb9AiZqSJH2kvHBxMmjbNszGQ=;
        b=cCrz4a22vOqaDfRXt0bbMJcairrtxhLrFe0uibvhlPhBI8bbCfnJ6ScelEbru6kkHU
         G4hNnFNLO4nGwhxrwj3b0VRm0dI/LtdnGbK9W8Z981eTax/2Fl8sKk0ThpEwHsH/Vjka
         qBnC+0couyLAamtQ4sdETJTy4zhEVimTDip5yls+/FZMU5pmScPBUEZihpuXy6wWpyma
         JbjXmPTUlEG5ajc0aPN1EIh3QiggCBPUH7/iK9WVcJNDy8ANMO4UPAxt3l2DXLx23KZc
         1tq7dnbv/B+Tgb5F+mlk4YfTXTsTP6892KQEWOtHwjdN7zJQy6f6tW0xgryAahwYET1i
         bXhQ==
X-Gm-Message-State: AJIora8qX3AVSKjDUI50EZp4EHx8OH7qVsOTeeIM/apIY0Ae2bFmqZsd
	6Lijb8Wrd1RmopuVxwoz+jm1uA==
X-Google-Smtp-Source: AGRyM1tano6gA3YQd1oWYRrXYlajjDR3D5/RPCRCXOlsa7JV+jUhPYwOBPQeaAZ+HX6xShSm0p7Hxg==
X-Received: by 2002:adf:dbc1:0:b0:219:e994:6ba7 with SMTP id e1-20020adfdbc1000000b00219e9946ba7mr11742596wrj.229.1656330090193;
        Mon, 27 Jun 2022 04:41:30 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id m12-20020adffe4c000000b0020d106c0386sm10066389wrs.89.2022.06.27.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:41:29 -0700 (PDT)
Date: Mon, 27 Jun 2022 12:41:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: mt6397: Add compatibles for
 MT6331 RTC and keys
Message-ID: <YrmXZyNHNrHtzOUC@google.com>
References: <20220617110728.90132-1-angelogioacchino.delregno@collabora.com>
 <20220617110728.90132-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220617110728.90132-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_044133_022941_ACEC67A5 
X-CRM114-Status: GOOD (  11.16  )
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

On Fri, 17 Jun 2022, AngeloGioacchino Del Regno wrote:

> The MT6331 PMIC provides many sub modules: regulators, audio
> codec, LED controller, keys, RTC and some GPIOs.
> It is always paired with a MT6332 Companion PMIC, which provides
> thermistors, WLEDs (display LED backlight), secondary AP cluster
> regulators, modem clocks, battery charger and fuel gauge.
> 
> Add the necessary compatibles to start implementing the basics.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

