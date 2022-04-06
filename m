Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F861C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1spXNIrssH7NDBGRqP41ykEsbEGpJsrp1XSqueAS6G0=; b=VTOeNuHiyd3Bth
	j3c50uBv1N8mklDpq+51dqC/ObuiQN5OulS9JIjoUnhCtzml5sK7ZBIEHZmwlcOi4JGZ404ujc09d
	WGWKYmDinFmw3c6X6DXPINaclEwz0oph/TrPNllYAWf4mkTKsDZ7gAwSCqLh2jl2ilB7gs5GJ9pF3
	yntAfJ4oIiugivwW/98GWI7ecPNvmG3U6X1flkKnGAph0aWlY8fpHSRT3hgdI5uzjh20i29EEEpOg
	gcfuFDN+itgBsxOHR6hx6ff5gC4NDfLnXgTdxXBDd0NmL4NInP+ln6uoSrON1yWm/DMyWhwnPvCMf
	YmiEfaJxuqM8a5CohKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc74r-006gwC-8O; Wed, 06 Apr 2022 14:56:09 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc74n-006gtW-BB
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 14:56:06 +0000
Received: by mail-lj1-x229.google.com with SMTP id b21so3535605ljf.11
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjZsIlWat2l9xa0WL8zf0EcIa39YnrACHBR8m9uiowg=;
 b=i0VWJ/CcY+PT4qCa51i9Z/+RQM6wM31bqZg7yGxOdPFdaSyaELt34pNi7DWyXMf3AG
 WXD83h28rJeK4EgMYuCCuD5fe9jF6KH4rWQpVj/3cUs4yrnNKZDAWubfWr75miD376WI
 oBdQRhew6e05nFOa8K00j19JHU8L+Eph8x0o9K43NhkHmp4iaN9mwWstTLsaAKXwDjJK
 kO8xIEUNFf47dleu2O3HEAEFrP9TIsD8IWDfZIt3BO7SioHh5JuZgTLBCczkRk07n8B0
 Vt+ZutQNBKu3fDmi4scBVQIYfWSGcR/chLdoAMMUOWkB1tsw7fFYmkQeojnOWvDJNySk
 TCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjZsIlWat2l9xa0WL8zf0EcIa39YnrACHBR8m9uiowg=;
 b=NBQ9Cfw3HVylV7WqKXoMC/DNk/TgrShWMBlb/guPw8wOk6vFJVJG7jOpl+1hzGF1Md
 sMokPmiAbY7bY68dZEj43SXsvklBT/eFxQEIxsWQrjaxpDgsMZqJltXWBxPwhMXSULku
 PzXSm1fMU04G6w5CLckPzm9+3VKopJBW7i7C+a/EKlSukK9+XX8/ApA5iSc8KOMy90e0
 EwRmxN7pUICQTlBEOgHIBzH7hdLPZDFRXYd1w1J+jJ8uzZNI2IAgnfrMQGa6duZvZtdA
 5rgCcw2rDda6mcj3F1wOwZWn02Mt+gtT/b/DiFBeWIoJ81730zS2p2yXrtwjTYZ1Y9F+
 PTbQ==
X-Gm-Message-State: AOAM533MMbKOXmZLo5rBQklR6K04gsb6rXpff0k4W5srb87Th7Iy5ZnL
 7GYNT1RFmUiiHsCNIntoldCX7YD0v6e4t9Txsuq0ug==
X-Google-Smtp-Source: ABdhPJy47PzYbVHxRygS9k3I7UM424f+F/oaYXHLgaJQLSEiHC0Rd1l8oyZGSl9sentgHmXai/d7/1qGj5x8MjT/lCQ=
X-Received: by 2002:a2e:9048:0:b0:249:78bb:375e with SMTP id
 n8-20020a2e9048000000b0024978bb375emr5601838ljg.229.1649256962784; Wed, 06
 Apr 2022 07:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220330094532.21721-1-tinghan.shen@mediatek.com>
 <20220330094532.21721-2-tinghan.shen@mediatek.com>
In-Reply-To: <20220330094532.21721-2-tinghan.shen@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 6 Apr 2022 16:55:25 +0200
Message-ID: <CAPDyKFoVrDMwteeBc-xTzD3HAe4wsG361mXs2fmHZpQSv662bQ@mail.gmail.com>
Subject: Re: [PATCH v13 1/2] dt-bindings: mmc: mtk-sd: increase reg items
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org, 
 wenst@chromium.org, chunfeng.yun@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_075605_404116_67771D3C 
X-CRM114-Status: GOOD (  15.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 30 Mar 2022 at 11:46, Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> MediaTek has a new version of mmc IP since mt8183. Some IO registers
> are moved to top to improve hardware design and named as "host top
> registers".
>
> Add host top register in the reg binding description for mt8183 and
> successors.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 297ada03e3de..2a2e9fa8c188 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -40,7 +40,10 @@ properties:
>            - const: mediatek,mt8183-mmc
>
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: base register (required).
> +      - description: top base register (required for MT8183).
>
>    clocks:
>      description:
> @@ -168,6 +171,16 @@ required:
>    - vmmc-supply
>    - vqmmc-supply
>
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mediatek,mt8183-mmc
> +then:
> +  properties:
> +    reg:
> +      minItems: 2
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
