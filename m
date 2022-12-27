Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BE6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4WOFJC3+GGomEraH0MtLwuk0uKDt7xRnEHtEwTn8YI=; b=yGTOudCdzWaRZwGZWH+rRE13u4
	1dZYmWXc09ZPA0YfOOX9jqlr/C6//S/5skPi+ntALfb8/Fm4IxxXQLKzDz6IS/gujgoBuc6kTPOMc
	VgQI712HfE075Jw0Fu7T2SIjRefnGQvie5iy+ijbsO+hx+iygJDhPM8QAgQNwq9oavdgbbR/DyvT6
	FZzO0R2YQ+eQxRRPp7J2hTCv5Wi4I9EWLbgO1YHF/rWXjdueW8H32WdUZlthqFc1Efjt/r5W5mlwT
	SqiibuhD1NLEhBpcNr4TzdMB7UnYH7LYCHpG+7gOzjLbme/LKANOL0lhfRMmcsmaGhIiD1cfO2V+g
	MhKymxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pABFs-00DnHg-7y; Tue, 27 Dec 2022 14:48:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pABFe-00DnDv-UG; Tue, 27 Dec 2022 14:48:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B6D3B81091;
	Tue, 27 Dec 2022 14:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6B3C433F2;
	Tue, 27 Dec 2022 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672152500;
	bh=jqL3XyDgY3Ey7DTK7sHa3MuIBkD0jIuOEQLQVq/Hrlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IBbete1yh0BD/uhMYUy7eUj+fev+CAFzDVwsUKwqUiVxSqsM49QiqGUfhKbUPHM7f
	 r/fzOXEa+CAZSH17WU6bR3QOMItLvVzOU0GNtXJsi4EaNUlVlC6HGgR13PpIyA53Tv
	 dixYoEhRouZtPO564urRIaHqV08Uf0/2gce1FrtZ96pZInO0m1n+f91CbCevoE3mZp
	 48zUIWr3/zp3WHpvSl9a+5m/PeLMSajTai5SUJMJAUP3UP56ceFym+SQkFZMkRaAhl
	 bv/ocMAn54bjpDSASmmPftVT0B1TUr+BsByd92r4AHw+5MXoClz8EGQsdAgX1nlvt3
	 qXC1OrKzsrlTA==
Received: by mail-oi1-f172.google.com with SMTP id o66so12576101oia.6;
        Tue, 27 Dec 2022 06:48:20 -0800 (PST)
X-Gm-Message-State: AFqh2kpEYnFpLaimtMHhlWLWQNqBdozQLPiK+F12Bp5r2FMJcUwFj3sC
	Cjrsur0vQfqG2Bi/f+sHGsG1OKUytgdUjynsAw==
X-Google-Smtp-Source: AMrXdXt8qrPi/XGI5OMJ7zrbkLbCdS61CLMOhnibsjHheE2V80tcdVo2fHqCXJ9wAk2cjt/Qi8NeMBkbqziuHyv+VrM=
X-Received: by 2002:a05:6808:130f:b0:35a:eee1:6710 with SMTP id
 y15-20020a056808130f00b0035aeee16710mr976417oiv.69.1672152499282; Tue, 27 Dec
 2022 06:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20221206020046.11333-1-nathan.lu@mediatek.com> <20221206020046.11333-2-nathan.lu@mediatek.com>
In-Reply-To: <20221206020046.11333-2-nathan.lu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 27 Dec 2022 22:48:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-aW4xHvSF-yTZdwO1yiN7tVdq=9Fyfu2uWJ=xDfCg0nA@mail.gmail.com>
Message-ID: <CAAOTY_-aW4xHvSF-yTZdwO1yiN7tVdq=9Fyfu2uWJ=xDfCg0nA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: mediatek: modify VDOSYS0 display
 device tree Documentations for MT8188
To: "nathan.lu" <nathan.lu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_064823_390335_D3760C34 
X-CRM114-Status: GOOD (  14.90  )
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

Hi, Nathan:

nathan.lu <nathan.lu@mediatek.com> =E6=96=BC 2022=E5=B9=B412=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Nathan Lu <nathan.lu@mediatek.com>
>
> modify VDOSYS0 display device tree Documentations for MT8188.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
>  .../bindings/display/mediatek/mediatek,postmask.yaml          | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
>  8 files changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index d4d585485e7b..92741486c24d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -31,6 +31,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-aal
> +              - mediatek,mt8188-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
>            - const: mediatek,mt8183-disp-aal
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 63fb02014a56..fe444beff558 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -27,6 +27,7 @@ properties:
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
>            - enum:
> +              - mediatek,mt8188-disp-ccorr
>                - mediatek,mt8195-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index d2f89ee7996f..62306c88f485 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -37,6 +37,7 @@ properties:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8186-disp-color
> +              - mediatek,mt8188-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
>            - const: mediatek,mt8173-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index 8ad8187c02d1..5c7445c174e5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-dither
> +              - mediatek,mt8188-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
>            - const: mediatek,mt8183-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index a89ea0ea7542..a5c6a91fac71 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -28,6 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-gamma
> +              - mediatek,mt8188-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index a2a27d0ca038..065e526f950e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -36,6 +36,7 @@ properties:
>            - const: mediatek,mt2701-disp-ovl
>        - items:
>            - enum:
> +              - mediatek,mt8188-disp-ovl
>                - mediatek,mt8195-disp-ovl
>            - const: mediatek,mt8183-disp-ovl
>        - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,postmask.yaml
> index 654080bfbdfb..27de64495401 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-postmask
> +              - mediatek,mt8188-disp-postmask
>            - const: mediatek,mt8192-disp-postmask
>
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> index 0882ae86e6c4..3ade2ece3fed 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -31,6 +31,10 @@ properties:
>            - const: mediatek,mt8183-disp-rdma
>        - items:
>            - const: mediatek,mt8195-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
> +          - const: mediatek,mt8195-disp-rdma
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-rdma
> --
> 2.18.0
>

