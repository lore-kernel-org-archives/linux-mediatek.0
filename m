Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA3CC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okt3hitsQsPj841I3mK3xWBDcq/Cw75EuCvU8qcCu1E=; b=vXJCYvw8RBBQFzI3QgaShr+lq0
	iV+VdEKwSjaNUtjbgCt++8vX+Y/jacCIy37f6FWufnCs3legMTmhfgc62J42x/77D7i/wCbgo5Lk7
	nOideAQOIq6anR3QuBkhE1H+WTxri5eiWvfdrd74DpI9FISw08ICBniP/8t3VC9pqS7BRSzUMGZdn
	vdYKjJ3i8f6Z1lugB2dDR+SS45IOxgb591VxZDRaGXhLu6VoDkLUvYtVvrCMi2E2PFrHwTakerTMn
	cb++/FUX7QQmcyPWW/7tN7j7Rb4nuAJOFIhFTuVwAtPCLLciH7edoGpi7S4rydLtIjED0Dygf/hdB
	2D7a59xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjoR-006Mjs-Rk; Mon, 13 Mar 2023 15:10:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjni-006MNl-NJ; Mon, 13 Mar 2023 15:09:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6AF5BB81186;
	Mon, 13 Mar 2023 15:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162E3C4339E;
	Mon, 13 Mar 2023 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678720164;
	bh=ABGxWlMLqbyavyMKxfAJ8Yv5/bIE4zdXAaxBqDMvysU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UOK8+pPJnG1oG72RthJEFWUXiwBteXj9z7goUmZjJyuoFCrla1DIG+1l38K+v+H2C
	 ZLWLbIx+PyRlzubEWGyr9Ebmo8yjjbnNRL0RvToc+qH/zjQvesaeLam1r3juwHdYR6
	 thokqpK3Sk9e43sXmeOi3zbKTNwz5CxQ4guel8dojAC+6PmvpihPTqSSSmrsu0Bu/+
	 bhu7gsGexK949o6DN5v4cWzQZWE7mEndUFGWjgesPyhLS7GfpETnNBfQs1Ucv2tZft
	 aYUaFPdHLdT8xWfI2Ex2YSTxIUbmt3BTjvonCoM+omnx87EyJSGKZUCIcDLrE8di4N
	 xGNeS1cDCcv3w==
Received: by mail-lj1-f177.google.com with SMTP id a32so12946973ljr.9;
        Mon, 13 Mar 2023 08:09:23 -0700 (PDT)
X-Gm-Message-State: AO0yUKUXW2NISPvL3lRLiCpYB8gH2SGVXmMuyYdyJ2CepbusFh+3hrqH
	OfkKuZqrdPcSmVpxM1mkU/1cL+xfkoSbvQjBOg==
X-Google-Smtp-Source: AK7set87aBjxPKP90yGcSHiuYgmixt1jWtk6mNAEmALcrl1Kxtk5Rvp1SIvV36Rvbv2XbdaMPVz/gU4SP9I5l+DwFNU=
X-Received: by 2002:a2e:aa1c:0:b0:298:7998:4e36 with SMTP id
 bf28-20020a2eaa1c000000b0029879984e36mr4244033ljb.10.1678720162162; Mon, 13
 Mar 2023 08:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-10-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-10-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:09:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__oYGD4KwK8enhy4WGiyJ_aoAPm2yTVY4vZodkAkaVdDQ@mail.gmail.com>
Message-ID: <CAAOTY__oYGD4KwK8enhy4WGiyJ_aoAPm2yTVY4vZodkAkaVdDQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] dt-bindings: display: mediatek: rdma: add binding
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
X-CRM114-CacheID: sfid-20230313_080932_006351_DE7E0956 
X-CRM114-Status: GOOD (  13.99  )
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
> Display Data Path Read DMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> index 0882ae86e6c4..3bc914785976 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -40,6 +40,7 @@ properties:
>            - enum:
>                - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
> +              - mediatek,mt8365-disp-rdma
>            - const: mediatek,mt8183-disp-rdma
>
>    reg:
>
> --
> b4 0.10.1

