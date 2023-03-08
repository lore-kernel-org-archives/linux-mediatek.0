Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F542C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNa/cVQhueG20Tof7moqLUCFmD+BmRjr+NvaKX3Ihsk=; b=1oznVYK3W60Yn3ZQYnfMB7ctCY
	XNicjJK28wIMKRVsS5lgLl65vtjlocV1/TBPr2G8pGQUxPfjcU74pOCubXxtMssNP4Bux7rxGqjjA
	ICKWARzRD7V5RMW0fn1yPZFVAyDWVtQMP0svgRUtikAwJduYmEU1E7Six8ZlBaCBjx8OyERnXyXFN
	+I0ghMfN+pqR7Ysuepd2ff19SmEoEb70mmuhcwM/rThF8JnhI9WNiu22gSOir8mOdrzXclL0Blsay
	poueLxpFJ7LIVW8nGbHOE3af4KfbF0SpkakrKWPCaE477EKT0zUcJE3lW8Qo0jCoAcNP6eBzc9npa
	jo2OeQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz1Q-006SEJ-7D; Wed, 08 Mar 2023 19:00:20 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz1M-006SCb-Aw; Wed, 08 Mar 2023 19:00:17 +0000
Received: by mail-oi1-f170.google.com with SMTP id bg11so12950609oib.5;
        Wed, 08 Mar 2023 11:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNa/cVQhueG20Tof7moqLUCFmD+BmRjr+NvaKX3Ihsk=;
        b=zE9wMGRbPLMdP/i9cW87hEQUI9N8Lvc1juZQdJ54HpjQncTAYX+MO7O0T1A4Bpyu6R
         suIJEuTM1ZecFc+QsdVILEjAXbjVuM7wj2sSln8nODIZV5BwHMgXkR8wh5MCDeobzq9/
         yyzxIuzpPPiGQ5U/SXlmXndHd9jf8EY0ntBlKsR8IyJ6SD/4Og50W+gcGkA7njeWteFc
         iL4cFpnb63AA82/eHrIc9FU8pKTsqAgWfBtrlIGGgaAhca/jF+b2YEGQc/dee2xIpdwe
         uU+23b6/IxrCsxXqOjdWeCBvbyPsupuF+Ps+BLy9c9s45awBmPkgQhQd/0jETbntfrCJ
         Qx2A==
X-Gm-Message-State: AO0yUKXFCYlTXbsoMs9jKg2l1r1i5zNzN8lvLgXabzLZdM7MVA+nxCpt
	VYsjA0myJyo9rGWkjcvsNQ==
X-Google-Smtp-Source: AK7set+m69vr45bRObydhhWKNDty0kaMDB6eJGD8k3EItoKQM01NjxIxem4W68C07DwYBRVbhBjmmQ==
X-Received: by 2002:a05:6808:b14:b0:384:59df:189e with SMTP id s20-20020a0568080b1400b0038459df189emr8580664oij.55.1678302013673;
        Wed, 08 Mar 2023 11:00:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bg23-20020a056808179700b0037832f60518sm6591779oib.14.2023.03.08.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:00:13 -0800 (PST)
Received: (nullmailer pid 3600642 invoked by uid 1000);
	Wed, 08 Mar 2023 19:00:12 -0000
Date: Wed, 8 Mar 2023 13:00:12 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, steven.price@arm.com, matthias.bgg@gmail.com, wenst@chromium.org
Subject: Re: [PATCH v4 01/12] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
Message-ID: <167830201182.3600568.17557629958296302697.robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_110016_394710_1E9B45B9 
X-CRM114-Status: GOOD (  14.36  )
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


On Tue, 28 Feb 2023 11:26:53 +0100, AngeloGioacchino Del Regno wrote:
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domains variation from the `else` in the current
> mediatek,mt8183-mali conditional.
> 
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


