Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A80C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLTU3nSeEj+pv/QQ/MFqrbZajVZiW8aw7Q69NCxaqnM=; b=iarIi7iE22kSAG
	mfZcL3WjTbZasttTWGeEkQCY/BbGQGlFQOsYwQzm1MWnnTSLQE+GVtQbmvlCrbHeLvucfbk+4lZc1
	WRTmpg6KPl4pcWg/Ho/TSOZjMlq9u2nroEoBrTN9pcfNRt8H3hHcUDSISHzMxmBloov3pPw61r4HS
	pOXyf3Jkc05vkMga+DhD3QP28Y7sm1hR5CeKE8djwnkM+6LhTPfa+tsbqTHpJGqk3vn3eQlO8TXv7
	sIVu8ee69fKusA8xyFjwy6C0gQQtyCzND3rGkk2JNlcm9lT1t48DGaGXYE3FBpUuwU3pOjcCkjPQh
	Jhy4Tiw3ELlpEHz78dPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtwJ-000j2s-R0; Fri, 22 Apr 2022 14:07:15 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtw8-000j05-6u; Fri, 22 Apr 2022 14:07:05 +0000
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e656032735so7457161fac.0; 
 Fri, 22 Apr 2022 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3V7/FkjgPIImwE7vieGYRnxFo4xm+FPjV5H1CZWqMaI=;
 b=RjQQZasrIq59WD1uHnAp2UmSfFySylFa8OTx7/1Z1+ZImPZ89ndttGKkXFpckhx/Bk
 yS5aG0OklHvD1OxkRhc1KQ0pfHuUsxJVeNn0EIjR/ezEM4UWrcQVi8m0X9mhDhmyk2/V
 obTBkAEM/Gse/y53TipttERUGI3o91AGFcfBLpD7ATqq4v/iRT/avCUTKiVBqNIGcCWJ
 HVDFJQV4SqiKj6PPevjznWTiS2E4TbyWD1ygRPdUQ6oTWSqla0yOurbHZj2PTLuHVbut
 mHde9GCVMDUGU0t7tRhoi9jLG6aYKEAR96dPrY4Ryvzi8CMYwppDUqunWil+XkilijxK
 bbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3V7/FkjgPIImwE7vieGYRnxFo4xm+FPjV5H1CZWqMaI=;
 b=zmBkWqLaFPKaKy6FpjCtMeMOnK9us5Gc0aDYvdks23m//msFTAbCHpN2dwUz0zOp7s
 8KhE/TYGuy06DB1x5clGEt7g5C/oxnI+vFbbeG501sUCvRpCvHc08gSqOtzAGDejbsPu
 SZNQALWvBW5N8GxSwMoYywYk4r2bNzBWQ6SjDVFSWMeXVtF0XS9eAu9+p/wio1phRW9d
 M3KUxtW1DVw+J74vGrzaa74TG+kYZDUsieNmM4wLg0K7y+z+RLgKU9Hg/Zik2MxT8jww
 6k47Vi5jZjyKazKuBmNZaelC9jWIhTCeXtABZvTnhLPXanhgH/umSvtQzDvXE0I/28dp
 yXhA==
X-Gm-Message-State: AOAM532w5fa9mPpvm8B07p1RyUBXd86ocQEmTAx5tl4F3OWTAJiKKlNi
 KPCqnTMsnPhCVInOV60+854=
X-Google-Smtp-Source: ABdhPJzCQ/gkh1glXSZsTTs2riuKFOrVud0Csh7Rl0iPN7oYbY27y6gk7hPGyxdC7M5eXtYemSt4Uw==
X-Received: by 2002:a05:6870:c222:b0:e5:b047:5a03 with SMTP id
 z34-20020a056870c22200b000e5b0475a03mr6111660oae.219.1650636421788; 
 Fri, 22 Apr 2022 07:07:01 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a4a3850000000b0033a3c291f3esm839301oof.40.2022.04.22.07.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:07:01 -0700 (PDT)
Message-ID: <ced3772a-a965-23b1-83b0-f4f8a634450c@gmail.com>
Date: Fri, 22 Apr 2022 16:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: arm: Add compatible for Mediatek MT8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220419092030.30519-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419092030.30519-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_070704_317993_39B7EB1A 
X-CRM114-Status: GOOD (  13.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/04/2022 11:20, Allen-KH Cheng wrote:
> This commit adds dt-binding documentation for the Mediatek MT8192
> reference board.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index ab0593c77321..3a9b92ee915b 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -131,6 +131,10 @@ properties:
>             - enum:
>                 - mediatek,mt8183-evb
>             - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-evb
> +          - const: mediatek,mt8192
>         - items:
>             - enum:
>                 - mediatek,mt8195-evb

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
