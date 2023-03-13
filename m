Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27434C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx3Ww5trE5wYKh+Iqe0HkL5+0lfhZkTlxMwS8p6lYRM=; b=p50ZrWtXY73yA5ghe9tft2fKEi
	fFsS89ZUqqQ3Pwd6Rujf2i+CW8W96pblkz7LNNooHYoIpYx4bK4ST3vtFUV/J0ZzpTfA39UvEJYNw
	xsnx3lgx+NJq21WFWe3qiGsFqbWqWFsobQKYHGT5Vdd8jixodEophbhYDLo8itTXadKWoZmI7Czob
	1THJ01iQ+hGzG33aIWW3O77NJo+Vk+KCXsWx5Di6nthcRcpjN9gDY3U5T3dgecj+xf+1VDXrZNqZL
	xdY0uySDNAX0dwUMBpq1/5RdAPgOcqU9Jtin+dkRchph1ubczCqAO5VLiMv0LlxFzqpb2pUXSyy52
	Qj3dhTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjhX-006Jkq-Gi; Mon, 13 Mar 2023 15:03:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjfS-006Iox-TE; Mon, 13 Mar 2023 15:00:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76E28B810E7;
	Mon, 13 Mar 2023 15:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3E4C4339E;
	Mon, 13 Mar 2023 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678719652;
	bh=/mxq7bx0e9p7jd2Kj0W+O7Zc4664zzC5vmbERGlg66g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iFwjua8OGVggM4sfpQ9KgxLSLt4uBF1MOtTfLhvNRBTbNOMJCwXEoE7e7M91SfpES
	 FSrLneeE9XgQisUwS9BO5PqmND8Cb8OmxiC2cjhQ4+IOdsuNSic0WJYb64Nsns4d+d
	 NeJoAxRdplQnOTB0/h2pXDwTrc5rgNGu/SE6rMWTsAv6swP1E8IMWY0mNApQgZT9x7
	 8sKmNbhAxRlJhu53RY5FxiaPsBsjBuRKvXLKH1vNZoeWmr09S4eCZCUVp7M3YwpfjD
	 OTw2sTYjq0OO/LIioiMTrAxvteeFya8nJFSCmgf64FjyhD44XFfvNPQYjYfX9JdXgc
	 AjT215WTKtCaA==
Received: by mail-lf1-f43.google.com with SMTP id g17so16102783lfv.4;
        Mon, 13 Mar 2023 08:00:52 -0700 (PDT)
X-Gm-Message-State: AO0yUKVhwnkuEKvBdHzFDSaHxOJ852GzDjxQUG6HmjEMzWbz3fUJs5aG
	fe0mcn/v7u3CkN8nMnKgUo97KjM6DjY0UCh8Cw==
X-Google-Smtp-Source: AK7set8zrrbbtS8sEEbPCUPfJ/BEkN2kiXEVCuZmMkm1nZIYMFYYfy8iRGqjSuNJSp0syMyV5E7eVcRe57T2GHwh+EE=
X-Received: by 2002:ac2:54b9:0:b0:4d8:62e5:4f66 with SMTP id
 w25-20020ac254b9000000b004d862e54f66mr10694845lfk.7.1678719650288; Mon, 13
 Mar 2023 08:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-5-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-5-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:00:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-FDv1uDy8CNRKT5qeecmc9UDTwSLaB1KtAeBzM_JXjqA@mail.gmail.com>
Message-ID: <CAAOTY_-FDv1uDy8CNRKT5qeecmc9UDTwSLaB1KtAeBzM_JXjqA@mail.gmail.com>
Subject: Re: [PATCH 05/21] dt-bindings: display: mediatek: dsi: add binding
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
X-CRM114-CacheID: sfid-20230313_080055_272033_18BB3C36 
X-CRM114-Status: GOOD (  13.78  )
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
> Display Serial Interface for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dsi.yaml       | 19 ++++++++++++-=
------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.=
yaml
> index 4707b60238b0..b6579d3effc5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam=
l
> @@ -22,13 +22,18 @@ allOf:
>
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dsi
> -      - mediatek,mt7623-dsi
> -      - mediatek,mt8167-dsi
> -      - mediatek,mt8173-dsi
> -      - mediatek,mt8183-dsi
> -      - mediatek,mt8186-dsi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dsi
> +          - mediatek,mt7623-dsi
> +          - mediatek,mt8167-dsi
> +          - mediatek,mt8173-dsi
> +          - mediatek,mt8183-dsi
> +          - mediatek,mt8186-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dsi
> +          - const: mediatek,mt8183-dsi
>
>    reg:
>      maxItems: 1
>
> --
> b4 0.10.1

