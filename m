Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 20:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsGXONk8NHMc+Ouuuz0n5DIppbte+ODnFw+dCWHoPlk=; b=XqQTFOpKjPfbWo/5xheoB38JLg
	TigMBGfG+/Y0ML/O3Yje7xH0eqTbcyIw9N5VY9SsgqxHZOVZR9HLEXZSfDR2ffSZVdgi5NfRAwsWE
	QVY9N3w/ja8v0FKrrHHsar09oBhg/HKAACvzmOxWgz2Ps0TpuqF+lKXFKVNsYKP6bhXAl7J49vVjU
	FRo/fx+cLKsAAW4uIwu9w0rOD6JIa6vW+TgWDRGEnMWL+ol6BnsVg8HAL7r/FdQoFNfBeNhO65qtf
	6iivM89l18kspOgfO/PMelqweR3Um+MCBc5uZQ/d5ar3dFtKwsFEybBmu3U23d2J5kjCApENtJHpQ
	Gg57cbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Mz2-006kKp-2n; Fri, 01 Jul 2022 20:11:20 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Mz0-006kKB-3j; Fri, 01 Jul 2022 20:11:19 +0000
Received: by mail-il1-f181.google.com with SMTP id h20so2038809ilj.13;
        Fri, 01 Jul 2022 13:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bsGXONk8NHMc+Ouuuz0n5DIppbte+ODnFw+dCWHoPlk=;
        b=AAuluv6NVa0cMMLq5TAoC3pcjaTVz5YaT3k8fpqs0Gr5OUi8NjM0pgH+/J7UwRV87x
         E+FsMsv/9dMZm6LLaYtOcO//dGLhknE/4i6uLyRH4L0bugpZV1bbFWvH/w8M8PRemivP
         sNh1fPDjK6K2q/jWP+MpbA5ccu8LVv2ovZ37Ctod7AeqKJmX0zgILyV0DLhyu45e9+Rg
         nEyO5OMv6TbfpzfHJx/tFwMwd18GLNPIWUowu+nr99TwuE3kbADmvlF1BFx741DkfbV9
         WWKhmnlYoxEfSemmAGDsHuUiF2Hx7bwxE72uQ4dk7Uc8NtVYSkAY98mXMm470a2HAKq4
         0ZSA==
X-Gm-Message-State: AJIora84s7PTPL7LKJksBxoe3jq5enkaMJ67JAz6rtYXG+XcGLXww7Qw
	5TFws5PQu6ULX8dquGud5A==
X-Google-Smtp-Source: AGRyM1sQr9on9f/i3W+HzDLrop3QB8HUNE+suPlqzim3Ia3W9/3g2hWw9BJyd/+X2qBvEEHcaQiZqg==
X-Received: by 2002:a05:6e02:180d:b0:2d9:26a6:d016 with SMTP id a13-20020a056e02180d00b002d926a6d016mr9294139ilv.170.1656706277255;
        Fri, 01 Jul 2022 13:11:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f7-20020a05660215c700b00674f80edd63sm10897632iow.23.2022.07.01.13.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:11:16 -0700 (PDT)
Received: (nullmailer pid 1439506 invoked by uid 1000);
	Fri, 01 Jul 2022 20:11:15 -0000
Date: Fri, 1 Jul 2022 14:11:14 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: nfraprado@collabora.com, devicetree@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, sean.wang@mediatek.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Fix name for
 mediatek,rsel-resistance-in-si-unit
Message-ID: <20220701201114.GA1439444-robh@kernel.org>
References: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_131118_192082_5189278A 
X-CRM114-Status: GOOD (  13.25  )
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

On Thu, 30 Jun 2022 14:23:34 +0200, AngeloGioacchino Del Regno wrote:
> When this property was introduced, it contained underscores, but
> the actual code wants dashes.
> 
> Change it from mediatek,rsel_resistance_in_si_unit to
> mediatek,rsel-resistance-in-si-unit.
> 
> Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Note: No devicetree uses this property as of now.
>       Even if any DT did, it wouldn't work, as the pinctrl code checks
>       for 'mediatek,rsel-resistance-in-si-unit'.
> 
>  .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml    | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

