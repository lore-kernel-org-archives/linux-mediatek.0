Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD0CC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7OwgyFYxvUdy54LeDh4J8bkZyrATaQx+kfaOB/n8Aw=; b=LWFYqAC7ryst+d8z0EURsZT7B2
	Zes1PH0F77deSxoMEaYZlrWrcwqbX7c/VIgBDdruO4/m76uuoeELpf7DoAROMPYDQTJdQwAIpNCfY
	pbKov4bfcHmW69inhlfGkxgcN7uMDa+fI/NBMcOZYXCIVApAsH1EyT8MCZqbs726+6iUACF+279eK
	LJXLXSg3vQh5RcEJPli68/ScIHD8NaYPGJfi9viA662ssRkxjQ/FVvDyJJuYzVXcxnkXo2XRVdPf1
	3uMtwV8FsOWbwH1FGdEG4d9Y0WwFkGu2IedyitsjNEv5EqRTw194bexjKzU5kUmi6eaWpykkihnuR
	3uoNz2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1posKM-003Kkv-1f;
	Tue, 18 Apr 2023 20:53:26 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1posKJ-003KkD-0K;
	Tue, 18 Apr 2023 20:53:24 +0000
Received: by mail-oo1-f46.google.com with SMTP id b8-20020a056820134800b00546f139ded4so835811oow.11;
        Tue, 18 Apr 2023 13:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681851200; x=1684443200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7OwgyFYxvUdy54LeDh4J8bkZyrATaQx+kfaOB/n8Aw=;
        b=SKUH1YFTknbvYTkml+TR9AYK59fvBs7kfOcEhkvok8G9R1zFXz1J8u6jcnsuDr7+gV
         GEXTOQB+qapi6+kna12UTN4kQ/bxJtrnBPl4WnZ3+1GDt1hhltH99yZ0H1Ir2JCmxsUu
         WOP6OJ823BP8Kv7bRbC+JKbJh1rqC475FPeoMZeBPvxfgT5SZuNj+HtQESI66d3y15oC
         AjcO1774oXrkaR7afFy5fuTrfNLkJb0tyCgml3yBmVCjJvHZlXvEj7b/PFrfYuXieDtR
         dxMLGeslU6Zqp6EYNFFEZzo5a/h4A9BfYyot/mSWml/XTh8yjsCP6N/0NRm5LuQRpTv0
         cMxA==
X-Gm-Message-State: AAQBX9fN5ABQzI/cZoNOIu2RmVTUnZMwkNbLZsDEuJ4bWIk84vW5zJMN
	ExvJtjYA62YUD/Sbly0pQw==
X-Google-Smtp-Source: AKy350b/EDQ8ntn392NFJwpfJRHYL6UKPciQC7U7cGvat7A1qfFG6PLLKiTz+v/L8nLz3JGXjYYDtw==
X-Received: by 2002:a4a:410a:0:b0:542:59fb:949e with SMTP id x10-20020a4a410a000000b0054259fb949emr6393003ooa.2.1681851200085;
        Tue, 18 Apr 2023 13:53:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m21-20020a056870a41500b0017b21991355sm6045739oal.20.2023.04.18.13.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 13:53:19 -0700 (PDT)
Received: (nullmailer pid 2322029 invoked by uid 1000);
	Tue, 18 Apr 2023 20:53:18 -0000
Date: Tue, 18 Apr 2023 15:53:18 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: simplify compatibles
 syntax
Message-ID: <168185119638.2321910.8021835045798003240.robh@kernel.org>
References: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_135323_143024_D42ADB2E 
X-CRM114-Status: GOOD (  11.43  )
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


On Fri, 14 Apr 2023 10:33:11 +0200, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just enum because it is shorter,
> simpler and does not confuse, if one wants to add new entry with a
> fallback.  Convert all of them to enums.  OTOH, leave unused "oneOf"
> entries in anticipation of further growth of the entire binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: angelogioacchino.delregno@collabora.com
> ---
>  .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>  .../bindings/display/mediatek/mediatek,dither.yaml  |  4 ++--
>  .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 ++--
>  .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,merge.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,od.yaml      |  7 +++----
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>  .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 +++++--------
>  .../display/mediatek/mediatek,postmask.yaml         |  4 ++--
>  .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 +++++--------
>  .../bindings/display/mediatek/mediatek,split.yaml   |  4 ++--
>  .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 ++--
>  .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 ++--
>  14 files changed, 41 insertions(+), 54 deletions(-)
> 

Applied, thanks!


