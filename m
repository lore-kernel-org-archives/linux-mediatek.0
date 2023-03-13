Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F279BC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrBK90vd5KcZYhvtp1mbMopWcjWhjVU4kikuRAyckyM=; b=pCX1Bq2oUpGwrFvXG8KtkSoI7p
	5/bilVcDlZ9/dlE0RgDCJgBXs+z48sT3ZVRBri8WW51Dwe4++we+o5liWndUjIZ9XoElowGt23BS1
	vyTzWs8zMKpBcz7GfOOezMBOR3Po09gFDnrb/Eq+5gNBb7ESXv+RxqvCTNRbqUlvQkqHvPTJdwzZI
	eMHfPGC+MDzOtniPG94cFwyVyIgk1SFeUtIniuxVUYs3RBwpZHHuFI+jPkvtiCr3RO1Y6kbFXqoPR
	IIQToJ0xYiSKfS/nu2u44QIZFgM7tiVCQJ2o2K3dKWMXB+ocotLJ1MRG/CX207NAdpAmwEcqELcbC
	YR0up1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjHu-0069j9-4f; Mon, 13 Mar 2023 14:36:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjHi-0069gm-W2; Mon, 13 Mar 2023 14:36:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50C486130A;
	Mon, 13 Mar 2023 14:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9804C4339B;
	Mon, 13 Mar 2023 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678718181;
	bh=yHmE3CK4PUjMZSs461uAsslkr23vQXpACGQ1NBY42hs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B8iz5g5WCveFOEXQqlPaoTjL1SmG08N4own9rMBVqtwLNVbyMloglGRtWK/nm/IY8
	 aVuyS0lwoAVQKESQPaakANgwDTdb3ulyqUKJyJSZEuAaGFh7DDncsF9gT1C1ozpWXJ
	 m9bYZhE4Naj6XYCJY2dHCR1uofheFiPM9IXwDzqTt5RV3ujuGi0X1+SY+P6upkY98i
	 79f6AzFhfoS/5ssuhr50H94mDSE9dMhrGZMgzvgfOgGZYBRg3SoujSFOYc9lp6H3TL
	 IS0dbq92Auy8Wbo+Fjg8kBS9RTYIfr+X9cEMalEMismk25YEChlIOUw580WkQ/P0Gr
	 dR8XNtzJ9hu6A==
Received: by mail-lj1-f180.google.com with SMTP id g18so12870032ljl.3;
        Mon, 13 Mar 2023 07:36:21 -0700 (PDT)
X-Gm-Message-State: AO0yUKWLLpPHkaHSwgVs214Qf8TeF3RwUomChWy6tjOeuAhJsx4pC2xa
	/Y/OQGa4+qeTlWEa6fvztBv5pBFHZqTJITYudw==
X-Google-Smtp-Source: AK7set/Dt6QdzPA2g5/CmVOJgocA2bwpvyNuirK/Gl06x9LG1R7kvogNrTf8a1qUunnCZkox9DzU0vUuHivXacBmt5M=
X-Received: by 2002:a2e:b55c:0:b0:295:d632:ba20 with SMTP id
 a28-20020a2eb55c000000b00295d632ba20mr10841792ljn.10.1678718179737; Mon, 13
 Mar 2023 07:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
In-Reply-To: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:36:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
Message-ID: <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: mediatek: Fix the duplicated fallback
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_073623_152550_5DC24070 
X-CRM114-Status: GOOD (  17.68  )
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
7=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:20=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The item which have the mediatek,mt8192-disp-ccorr const compatible alrea=
dy
> exist above. Remove duplicated fallback.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback fo=
r mediatek,mt8186-disp-ccorr")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Fix MTK color correction binding
>
> The fallback compatible has been duplicated in the 137272ef1b0f commit.
>
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> Changes in v3:
> - Re-order compatible.
> - Link to v2: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v2-0-4=
822939a837d@baylibre.com
>
> Changes in v2:
> - Fix commit title.
> - Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0-1=
77d81d60c69@baylibre.com
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml         | 5=
 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index b04820c95b22..bda86e6857f5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -27,13 +27,10 @@ properties:
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-ccorr
>                - mediatek,mt8188-disp-ccorr
>                - mediatek,mt8195-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
> -      - items:
> -          - enum:
> -              - mediatek,mt8186-disp-ccorr
> -          - const: mediatek,mt8192-disp-ccorr
>
>    reg:
>      maxItems: 1
>
> ---
> base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
> change-id: 20230306-ccorr-binding-fix-718c6d725088
>
> Best regards,
> --
> Alexandre Mergnat <amergnat@baylibre.com>

