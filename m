Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz9w4iTtt8VD0pnGuSpcxv01lLWgKdls9jQI3u/cJVU=; b=oEelp6gWcm/jnUlCrdZ5ErKnZF
	/UMM5341CKG5EKLOBFNpFKlfcg7fqAoxhuROmYTov3fzp6bUA69eWZFhul0uvUsClJ7JKGD2kzV08
	U9SOe6lj6Rr9yrcAy4xIftt9DdzVTxrHCS1hjxY0c157lcmwOo1ghv/ea4RXG5pzDOM3la9lWKlXG
	iHy61I3f73goSHVN3gkEBiACNnf2e7eP3jJkg2N0yj6gE28Gf4Xpg2MMFBHNowDSqkqcI0clz1LR1
	3n4+VnYg/4KjP/9WB70N92YupSKFZ86uxywjDpLZsV9PXRz2Ax45cx3K68KFQwIlptAlwwdtHfDCN
	c5HTcfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNpl-00FQCz-Bz; Fri, 14 Oct 2022 16:46:53 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNpZ-00FQBT-Pk; Fri, 14 Oct 2022 16:46:43 +0000
Received: by mail-pg1-x52c.google.com with SMTP id l6so4777366pgu.7;
        Fri, 14 Oct 2022 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz9w4iTtt8VD0pnGuSpcxv01lLWgKdls9jQI3u/cJVU=;
        b=YQRZg7ylX38gOy7LKdvCrTSm9oFdeFDGd0Xij4RxwzL0ecgSKg40kNAmatIs5yfwZV
         nXbrs3sM02YGmZ6jHV+/15BP98e45vDRYl/sM+3MLvYjhmFlJA6pOKaZFrh7j+8beANm
         yHnwlj0XohANnG2Lb1Rxxou9IHa/nzJtN6LlbN1gSOipa+scrRhw920tiwlsDlleqIN5
         vwZGuWjjpHgLS9DZ70Nmm/4czGT2KCJCSW/3pskeC5P55uAD+e2cfgLuCLAQwZu6oj7F
         RBiJdfRzwFRauSB52rp37qhnppNpTcnPWxBeCTjxD2c37bY0rT2f+b/FPdHb3L/f1rw0
         nTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz9w4iTtt8VD0pnGuSpcxv01lLWgKdls9jQI3u/cJVU=;
        b=5YKDRYmwBTuQoH7rapbvLO0cAEh93Stwn89jeLVlpIw6M8+KUaTzT5sAnngfER3bAU
         694KACzKLnYwg9V7P0gzhzU2bmIw019t9TXaKMK5xFIROnl1XltVOTpGqv38/QNOnEQ1
         0tJkckKTt5LA4nOTKi7m8+GlJe3TBeIo8fcgOHCZEovq41YTCgZ0FdYDpR4MvAiO0HZO
         5mt70FitZ+/Qv25uy5V4964m0fWE8jb/msb9tcd8kZgIRDvheSKa5YhZKg6HbWij8HLD
         YI57kKSmFO1zv9kNt9ZGNeoYzI3vZlYtJxe+2nijw5QXtqONBOQQiKBwFAN2nV4pm9+U
         XYaQ==
X-Gm-Message-State: ACrzQf0amgWYO52uLVHYLJY+BoYPc8kPqYed46YLqWGncHroj1z5v0IS
	mbNrHcMpTuYd3VdVpaZ+fA8=
X-Google-Smtp-Source: AMsMyM6QVHntIHzZcjcTu7mS9KR6yMVgRd9YU9txRkHoQcGcebgSfqyGhkXCfRnTkqBoEAjG+nZdIA==
X-Received: by 2002:a63:1917:0:b0:43c:1471:52b7 with SMTP id z23-20020a631917000000b0043c147152b7mr5295980pgl.522.1665765998174;
        Fri, 14 Oct 2022 09:46:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902cec800b0017f7b6e970esm1976920plg.146.2022.10.14.09.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 09:46:37 -0700 (PDT)
Date: Fri, 14 Oct 2022 09:46:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	allen-kh.cheng@mediatek.com, seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6795
Message-ID: <20221014164637.GA150807@roeck-us.net>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005113517.70628-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_094641_853398_421D05EF 
X-CRM114-Status: GOOD (  12.33  )
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

On Wed, Oct 05, 2022 at 01:35:16PM +0200, AngeloGioacchino Del Regno wrote:
> Add the mediatek,mt6795-wdt compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index f43b5af92d40..54dfe7941d53 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -23,6 +23,7 @@ properties:
>            - enum:
>                - mediatek,mt2712-wdt
>                - mediatek,mt6589-wdt
> +              - mediatek,mt6795-wdt
>                - mediatek,mt7986-wdt
>                - mediatek,mt8183-wdt
>                - mediatek,mt8186-wdt

