Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F97C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sComzmbCpABMxGUkRsCiLtkyNheYwmjw48ljpFz3J24=; b=BcD4trYJrwgE/kdthwM5wgaucb
	umUphKQIVPKdIGrlQdOImwr2vA8XXP+k3uELhruPjwIeC53j94uR+oBEYKFmifb21BRrdgIBtALr0
	3zS+ef7oNkF7QUDzmIP8MjuC/gio2otC3t/+7ZvwAqGQ0mTtCtEfqGwPuuc5Ixgh/Ux80UL2FU0x2
	baG7U0XSDYQV7ZbeGzX/zBflrseI9mjVfuC4X9l7IwEfZv9WJOZHHfqtmmeFI9VeOB2fM/SBkT++7
	AoVsVvIAoEyHBV/exNaHitLiEO8OoVSrfGaLTfI3sMU8tfhdxq6ltvgRuhLHiQRIpP5bBtgHtBDgY
	1UpNOicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUkdU-00BFjD-VJ; Wed, 22 Feb 2023 08:38:00 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUkdR-00BFiX-TJ
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 08:37:59 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id u14so7297988vsp.8
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 00:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sComzmbCpABMxGUkRsCiLtkyNheYwmjw48ljpFz3J24=;
        b=lj5Wy8MK1mwapRAvUlPMKSor05OyZO5FDMUF3vmS3b4AA19H4/OTNnPn7urBRBWgNH
         pDCjTxYoDNOOE7BuYRmNwu8P0aIwLJ3yduJkfc4bTH71uQwH93SttIJkswsYVXhj1J2Q
         T6Ad3ZCsTfC91iXkA1tnIcoklpBf4kIODobuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sComzmbCpABMxGUkRsCiLtkyNheYwmjw48ljpFz3J24=;
        b=kx7UOF+bfhcfeNBIEA62yGAGW+LeLMzeHC2hzOm5hdbOg4iUgOerupSt0BEtyikF1P
         kYti1CuWkIrAUihhrfYu+6ht6Auq1pu65F28s60apt8GC/U00zqJtL2RZLdcNm2O3WUV
         8soVxZRtTO99S8b5ubA3jk0Gi5rvcfpCQrI84sdBsIQq4ivtEG7dAIN3L/L0VhWBdRtX
         BvOQfB1hU0uSB5SlVZWouIOjo3APICam4PUJiTadwd+IeBl0JZiku4vXMfunQDFzfcNV
         Tqpingyh/3Vgv0K/fAkwqbJGBAtXx9gnDoqDccHdco1ksXfXT9tVCjQocPKMnxGJgGrp
         RNlg==
X-Gm-Message-State: AO0yUKWXuiA1PkcOhuVj18KgrdNrttpJaXlYfDWX4uY3X8j7Woxw+Nyd
	TqC4z/STF0XP4jVn/31kn9aXoiHwBiOncYEIYeIRJQ==
X-Google-Smtp-Source: AK7set9FVEBAsLpdo2AF0VsdpWJoDj/pIevIOUHBKq0lW8mgWZ/QSNKhLwdL5NxD1KgYlkJH1/ua8amP+kkHXYKWlsw=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1571526vsb.60.1677055076838; Wed, 22
 Feb 2023 00:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:37:45 +0800
Message-ID: <CAGXv+5Ed-5Nq0zNzCGzez3fnW2yxW7zFx9B6k58Y4yb8P+hvpw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: gpu: mali-bifrost: Add a compatible
 for MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_003757_982204_19190811 
X-CRM114-Status: GOOD (  12.95  )
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Get GPU support on MT8186 by adding its compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index be18b161959b..43a841d4e94d 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -15,6 +15,11 @@ properties:
>
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-mali
> +          - const: mediatek,mt8183b-mali
> +          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable

The MT8186 has Mali-G52 MC2 2EE, while the MT8183 has Mali-G72 MP3.
So we actually need a new entry with two power domains.

Our downstream Mali driver & DT use just that.

ChenYu

