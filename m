Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611D1C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 19:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1Fy0CpFtgcJshYzVPax3hE6Wvgw3zG9+HWgIo8OoEY=; b=aMqKVm1oKoB5+hklr9RFW/dffS
	Tb7R3fhMct82+jhL5120hVqXvaTHlVbo6WcHWZD9+hqQIDKIDY24AREFkPPzRzBTd1ndbXDdPevr6
	ET0kY1EDIErMlmSal0Yl3BQ5izP2kccN88lB2DlkyMMFAJwtiIXuJNxNGJ9NXwXdZ6baKbC55LrV2
	EfHOoqcs82QqvoZMKtM6dKgl8j+AiQd+7bLuCALd+LpFzUEw8gNUXo7ytxiAJi5Lo++phmdHpsI6A
	Kz1BTW3fwG+5XtJobA8VvgYBXHLnY15T2+o4VIBFgTLfR/cf04xDQ0yPuhng72P/PevuG7auuaJyM
	yEgB65Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXqS-003usz-1d;
	Mon, 30 Oct 2023 19:22:40 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXqP-003us4-1i;
	Mon, 30 Oct 2023 19:22:39 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1e98e97c824so2988009fac.1;
        Mon, 30 Oct 2023 12:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698693755; x=1699298555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1Fy0CpFtgcJshYzVPax3hE6Wvgw3zG9+HWgIo8OoEY=;
        b=C2w7kBYtOff4CS4hmCi2E1qGWSqbEYqK7qAQtvD43lnPBAzADlHYIIdyV9PcT/8c7h
         Xat5mAFqvevkQrHK5X8c2QlftaSad6LEqDFNf2hFXsiJlv5Uf6coBjQ/VPfSCaqn3WIX
         zRH5lrtzRBRxw2KXKUKtFY+YlIrhYTIfZhJNZ5sbwyn/xkcsTIvZ2Z/EP6Zi8woh23OJ
         fq8kw5CJGGo0Y4MUfhptWP+dK6a0YuY8Yrhc4jlm0a56S2XgTz6pBIQI+tvYc/dFga8j
         Ccw8URqtgqIvKtnlWVEJsDu6AXYCv0gyRQZqQ0/PfiuQwBf3dlh2GqAr3z2O/L7waVMX
         EHcQ==
X-Gm-Message-State: AOJu0YzvWMX7MPQpZG71kGiNyIh/WOfiePrOUiRpaBD+LkQeGU4ok01C
	uAwPYJUnU4KhQZhQrTBw/A==
X-Google-Smtp-Source: AGHT+IFqCpZAhcTsmCaH5gXcwYyQqwa/kJtNlFwsxXctOhLFSYJq+4Kpo0+H1/CaGdSxDzUCwVUNkA==
X-Received: by 2002:a05:6870:a18:b0:1e9:f0c5:4496 with SMTP id bf24-20020a0568700a1800b001e9f0c54496mr301891oac.1.1698693755333;
        Mon, 30 Oct 2023 12:22:35 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
        by smtp.gmail.com with ESMTPSA id w1-20020a056870854100b001e1076a668asm1695993oaj.36.2023.10.30.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 12:22:34 -0700 (PDT)
Received: (nullmailer pid 1962342 invoked by uid 1000);
	Mon, 30 Oct 2023 19:22:32 -0000
Date: Mon, 30 Oct 2023 14:22:32 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Message-ID: <20231030192232.GA1922580-robh@kernel.org>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-3-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030100022.9262-3-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_122237_656294_29D348D8 
X-CRM114-Status: GOOD (  19.65  )
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

On Mon, Oct 30, 2023 at 06:00:08PM +0800, Moudy Ho wrote:
> To simplify maintenance and avoid branches, the identical component
> should be merged and placed in the path belonging to the MDP
> (from display/* to media/*).
> 
> In addition, currently only MDP utilizes RDMA through CMDQ, and the
> necessary properties for "mediatek,gce-events", and "mboxes" have been
> set up for this purpose.
> Within DISP, it directly receives component interrupt signals.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 55 +++++++++---
>  2 files changed, 45 insertions(+), 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml


> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 3e128733ef53..c043204cf210 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -20,8 +20,9 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - const: mediatek,mt8183-mdp3-rdma
> +    enum:
> +      - mediatek,mt8183-mdp3-rdma
> +      - mediatek,mt8195-vdo1-rdma
>  
>    reg:
>      maxItems: 1
> @@ -49,17 +50,18 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: RDMA clock
> -      - description: RSZ clock
> +    minItems: 1
> +    maxItems: 2

Keep the description here and just add 'minItems: 1' and...

>  
>    iommus:
>      maxItems: 1
>  
>    mboxes:
> -    items:
> -      - description: used for 1st data pipe from RDMA
> -      - description: used for 2nd data pipe from RDMA
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
>  
>    '#dma-cells':
>      const: 1
> @@ -68,13 +70,46 @@ required:
>    - compatible
>    - reg
>    - mediatek,gce-client-reg
> -  - mediatek,gce-events
>    - power-domains
>    - clocks
>    - iommus
> -  - mboxes
>    - '#dma-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mdp3-rdma
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: RDMA clock
> +            - description: RSZ clock (shared SRAM with RDMA)

Then just need 'minItems: 2' here and...

> +
> +        mboxes:
> +          items:
> +            - description: used for 1st data pipe from RDMA
> +            - description: used for 2nd data pipe from RDMA
> +
> +      required:
> +        - mboxes
> +        - mediatek,gce-events
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-vdo1-rdma
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: RDMA clock

'maxItems: 1' here.

The same thing applies to mboxes.

Rob

