Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F29CA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PYwwhRwHai6qdPQmcUW9f23VqcVsA7+gT4FjE1J2AQ=; b=1jqvrkYQF0D/3Lu4uEkyPG+v7j
	u+ZJ9lHb0furUIfDHS4wrnQ4B0PpU5h5WM7LYTVGj8ETdLakJBAermlZqJXoJ9wegYL4KRWPH/7N/
	DvSo9B9kXqS6P/bmETFurzNQCcV0ECjXzR2bSa5BPtrj6Hg+vYvvFfeB4VDpybSvxIUJsW6Ms3e2J
	H4RFqXoo5FTyPbXOgiL08/fk1NG3oyAz0FwAzoIrTU/qOI4DfOUpVgGSeZ2jLFxtHVWnl8OsGFyO/
	Ijc2PafANZiukubm+8TSqKsHt6QVU4GXV/buWuA5vywRx2CBsd47djxImgBQUVRmcQdrfWTh1Xuii
	uDv9q69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0ba-00000006BQq-2t6L;
	Fri, 30 Aug 2024 12:19:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0a7-00000006BEC-0DDf;
	Fri, 30 Aug 2024 12:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ECEACAE41C1;
	Fri, 30 Aug 2024 12:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C154C4CED8;
	Fri, 30 Aug 2024 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020300;
	bh=fzW3G+TfB+bO5ebL/bX9LdeCTen9lbExGhAdJz/gUE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YX6Gpw1iAM1qcXKu7BASnn7Qo45teZi4XXjDrmwn/Vm4TnZW3bXHuZf+aIV8rnhz0
	 7VJ9gf240vFlFx69v7Gytuo+daKbx/S4payvqKJCL+wpO6Oj2vwKuHWo7VYnjGJPaH
	 41rQ1hCheK7YWyiteSj1QCLB193pxleVPtw7pyJvPaKHgasT2isgNCGwpSMjSXlqGC
	 ec5a8ppcWoJn+0Tc8EDxaWlAPdgEfZCp/oJarZBv6gWXXd/cQRri2pRcMwEFPnD7H/
	 vm9Fdfxn+WilUW8TBmM/UkaC0ahgKu+wuig8BUCdyRxxq9ujl/xkxdJs1NJJWOBhSV
	 9hwmywR7owrdQ==
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20230059241so15580055ad.3;
        Fri, 30 Aug 2024 05:18:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUY2D4/EFAmaiilNlhgQEeeFoZk/nP8K6myLNPFunUXrfUdsyNNWf5jy4PDeECW9Fgtibzvg9ZcFVg6EW3nwz8=@lists.infradead.org, AJvYcCVckVzFjs7UBaN20MoNY5lO+MMfYbUJFxXlQw6AdV6Bwr4pCQY+5RhDJmoWZA3tAXQGXdGzV3SZo+SabyGDfgX8@lists.infradead.org
X-Gm-Message-State: AOJu0YyuRrndnjO6SaknIbFCY5c1RbGN5KUK9wF3yxDj1a5Gtj485di1
	uyY/gzTcvwlPsWPFxVO4J4dijZszNklWjxrqxjFXujtM6HBnTwOqF2+zdKSOAb52fBLXOVlvxED
	auxTrZCHOfPNeJ5ZM5uQR8o7ylQ==
X-Google-Smtp-Source: AGHT+IF2p5CQY3b8HPQl1+/RqA1ZHqHcuWEQh2qoVHx4PAKoc7yqtJdfN0iZ0lNlEvXu5ud9ENOdM8aJpEyK48XB/pY=
X-Received: by 2002:a17:903:124c:b0:202:18de:b419 with SMTP id
 d9443c01a7336-2050c524e84mr78003075ad.63.1725020299631; Fri, 30 Aug 2024
 05:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240830084544.2898512-1-rohiagar@chromium.org> <20240830084544.2898512-2-rohiagar@chromium.org>
In-Reply-To: <20240830084544.2898512-2-rohiagar@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 30 Aug 2024 20:18:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-1bT-=jU4vCZTfe18Ks6WiAL=7M3y0eK3DyGkfWmsFKA@mail.gmail.com>
Message-ID: <CAAOTY_-1bT-=jU4vCZTfe18Ks6WiAL=7M3y0eK3DyGkfWmsFKA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: mediatek: dpi: Add power domains
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_051823_387993_A5A70C6D 
X-CRM114-Status: GOOD (  13.45  )
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

Hi, Rohit:

Rohit Agarwal <rohiagar@chromium.org> =E6=96=BC 2024=E5=B9=B48=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:46=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add power domain binding to the mediatek DPI controller
> for MT8186.
> Also, add power domain binding for other SoCs like
> MT6795 and MT8173 that already had power domain property.

For this patch, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 5ca7679d5427..3a82aec9021c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -62,6 +62,9 @@ properties:
>        - const: default
>        - const: sleep
>
> +  power-domains:
> +    maxItems: 1
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
> @@ -76,6 +79,20 @@ required:
>    - clock-names
>    - port
>
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt6795-dpi
> +                - mediatek,mt8173-dpi
> +                - mediatek,mt8186-dpi
> +    then:
> +      properties:
> +        power-domains: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.46.0.469.g59c65b2a67-goog
>

