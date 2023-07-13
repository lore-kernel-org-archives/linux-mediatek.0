Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A8EEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiV/7q29Lz9ovivX2FWAx1Ldp08v14j+trL88mxoLRY=; b=z9h8+6h8M2D/42VAENTW+kc3wV
	qOjW3HnT0HxQBcQgxLqYefiGhtQCFpgCtZMvPk+aVmC+F5kbfbez5dGM8Ckscm3BfbwQQ8gFWWJkT
	2IIHPBk7VBiWsu0IO3eNYfpT60oPDio9VvKacA+K15/HMJE4JSRjHXKqU/SOYNj0SfCE0oAXQWiNX
	EKf+uQa5ZhlwxkMAmx5BB3RN67/p0uV1eXqDcQ/FzDnCkV6H5jYhSVBdxiHfzWR9wgGCb5B/gb6c9
	UarTlSKbELMvtP3c+nStNftfxxH9RD7WEtba2MXAOrRpXBMKa50L6CbB/B8kz9bd/1xCjlpBzHpXJ
	gLnPmmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJu9S-0031wB-2y;
	Thu, 13 Jul 2023 11:06:26 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJu9Q-0031uc-0O
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 11:06:25 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-c15a5ed884dso505930276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 04:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689246380; x=1691838380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WiV/7q29Lz9ovivX2FWAx1Ldp08v14j+trL88mxoLRY=;
        b=eHuodEMDmc0gaOLGxz4ZOl2QDUjscsSR534Yb0lsjWkR+iDaGKmcW504dn05tzvAjx
         1yz4d5P/2M+6vgpGuNhuApckUlcmKYeE3f1/lU1wNBBnn58JW5MniNKq5Z/dRKuYaEgR
         MA5xl2XLjoVlTuurE4+ycjzM5DO6556A+sVkde3usYGkl+JnZwJYRsHzxbI1NoG+pgd0
         a3KeCvwvYTkQoOzQAc5KAe7VvTb7jqrEaxPixzse8rw3QIl2IVD+oi4gqdVV5ihaHu4p
         wTfflQTZZd4gb/zcdeUUWlkA6KrsMxQ4FJOWZIknrqw79Xe16SUChZkpfheZoAS7wiib
         jvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246380; x=1691838380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiV/7q29Lz9ovivX2FWAx1Ldp08v14j+trL88mxoLRY=;
        b=X3XYFqK6CLP4GY/ton695pLfAK2iR5OFY2BEoeXKM7I7HpVUPoAeIs/pVwzOiRRabz
         xWHPwL/ly4EcBcGVbHQrrN+p0WbmTDqNnAEySXI6gvIRCapXSfEWxA0RQd7MaOchKlKp
         tyDz7LyjPf2+RGb2tXVkkZBJ6Cfl0XaUmMk/YtL03c8S6xzermlYLnJITySN3JqPd7wy
         vED/3SwWkI5BC6X9HlYM42WxqnTPh1fNK/LrRlCsM6FaPVylCeiZ5y8/5X/+fXfDQl0n
         WfBSNOoLXE5Es0CzQAFSgLv+qZeAkx3xNxdNmvj7IvbZPegEbu2mrD+qz5dlytVlCzw7
         jvRw==
X-Gm-Message-State: ABy/qLak17z0Wk9MtitJxWebiqIgPPYxNtO4kIUVTHxkujt4uN09Y/d9
	9NZMd0ssdHfpWQ5+gSB/AXGbxw2wk3Bc/EqVyFePrw==
X-Google-Smtp-Source: APBJJlGvdFT1I5LlLlSZ1vXvHoB35pTHYRo+rkqezmhzn+Qzriqe/07gvMGjawbihGymi4kllx31OgEP5eBDfTAEQME=
X-Received: by 2002:a25:8550:0:b0:ca7:aad7:3091 with SMTP id
 f16-20020a258550000000b00ca7aad73091mr918328ybn.27.1689246380252; Thu, 13 Jul
 2023 04:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184318.551317-1-linux@fw-web.de> <20230629184318.551317-2-linux@fw-web.de>
In-Reply-To: <20230629184318.551317-2-linux@fw-web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 13 Jul 2023 13:05:44 +0200
Message-ID: <CAPDyKFrvQWUQuT_SX=hArY9TP61naN0gzaZ+8qo6PnOMntn9gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: drop assigned-clocks/clock-parents
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_040624_156731_0C257357 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 29 Jun 2023 at 20:43, Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> MT7986 has 2 clock-parents and these properties are not needed in driver
> binding. So drop them completely.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2:
> - drop assigned-clock* completely based on discussion with Krzysztof in v1
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 46eefdd19a2c..3fffa467e4e1 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -91,16 +91,6 @@ properties:
>        should switch dat1 pin to GPIO mode.
>      maxItems: 1
>
> -  assigned-clocks:
> -    description:
> -      PLL of the source clock.
> -    maxItems: 1
> -
> -  assigned-clock-parents:
> -    description:
> -      parent of source clock, used for HS400 mode to get 400Mhz source clock.
> -    maxItems: 1
> -
>    hs400-ds-delay:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> --
> 2.34.1
>

