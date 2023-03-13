Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF6AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yghTjwmYI9uEVYDFL2Nwk0M9ZxsrOb3Hz6jNkyaXYc0=; b=yAn02wkBOhxePBnvWTX5FpZSMv
	EKYDjhwh4ETE7WLsPrceoU4T3Dju/MEmMNSikGlR9eGHL9cNLTsa48a71UN6In0UFfneNDEwZcYcd
	+zsMPpK10X2bUhMkcgnVkRqzf9oUFOgzlyscYXuN9qF+B7ULP0g9Net63CAEYLxAcW9/WQb0ljPZ+
	OCeVcu0ZqBPwpAcKPuFUgFM8Rzp7NLxOduQ0QsJXakaiACgZpmOjy9HEYrWM+fmud8KzChcFHiGAG
	X6PI0o5HSi/hRlLXlE7p5jrub6vMvT+31lQKh32TF07ypBFlyZl5xm51Nij6J9c0J6ogx1jfi+ypW
	Rg05kl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjfq-006Ixm-AR; Mon, 13 Mar 2023 15:01:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjeG-006IIX-OQ; Mon, 13 Mar 2023 14:59:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68D40B81186;
	Mon, 13 Mar 2023 14:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9103AC4339C;
	Mon, 13 Mar 2023 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678719577;
	bh=aor2P1UgUGdPxdi86bjLDcwfFhylwJzACimW7kInbvY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohdN82SqGXRPJX3cyxSWQf7frIUq0JfGIXjdIMSBt+ODshEooBncUrzBJMWUejGvQ
	 TVqEgCw1SAcdZhShx4HKRmVC6L/jo1TumrNmv9IYzJ6uGQqseaqe+WDQkSiz1X6EAA
	 /v2Uuj4zRaNcWKEeeQdjMhl7OasG/jyZN5TFKVR4cik9TUFUl2im4NPDP/nvqosyZ9
	 OnKo0gCMIuvWcubKsDfYYfBa4CNZXMhXxEVIByMn1gEzK3ALcplzpXbjE6JbtKl2Ak
	 5PhETfpa+eNm/MkD9yBHkR6T8DYaHd2I9LoPQzTIzri9QWBAOSnJEhPGQ4ysBPrxma
	 8TkJR2PgPrcUA==
Received: by mail-lj1-f176.google.com with SMTP id h3so12906308lja.12;
        Mon, 13 Mar 2023 07:59:37 -0700 (PDT)
X-Gm-Message-State: AO0yUKVF5xSooyOA2EAVhiD5ElVWm8WSPPFac4+83hIhpJrDhBTAatam
	CVKD3+cKIJBdcjktP/+jsrRS7B6lu/A3SDaN7A==
X-Google-Smtp-Source: AK7set9FaEtus4V62k/yFd+Xl5REF0wUiIoL+llixgQGs2HHbtV1FOqc3QoH58tm6Az3ceEjZOG27aSTKnhUcRUDXCY=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr10851484ljn.10.1678719575627; Mon, 13
 Mar 2023 07:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-4-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-4-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:59:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9zsX1CF6xf3TRm6+ZWkMNuXijYC_ErOHdgUi=O2kVVzA@mail.gmail.com>
Message-ID: <CAAOTY_9zsX1CF6xf3TRm6+ZWkMNuXijYC_ErOHdgUi=O2kVVzA@mail.gmail.com>
Subject: Re: [PATCH 04/21] dt-bindings: display: mediatek: dither: add binding
 for MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Xinlei Lee <xinlei.lee@mediatek.com>, Guillaume La Roque <glaroque@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_075941_117913_47D13362 
X-CRM114-Status: GOOD (  13.91  )
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

Hi, Alexandre:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Display Dither for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index 8ad8187c02d1..a7706cd65675 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -29,6 +29,7 @@ properties:
>                - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> +              - mediatek,mt8365-disp-dither
>            - const: mediatek,mt8183-disp-dither
>
>    reg:
>
> --
> b4 0.10.1

