Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDE0C2BB85
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQqlQw/uK0Fx2j4TLa09boR+rscMZtWiagS3Uu/7LQY=; b=KaQovzdpZkbzI21fCNbiAHjz/5
	SKi/81qcioMx9BIfKUmiYyha4t1iUlp+LlskF13+h7oUwQbCLKuewPs+XYpfFtiSYBOQKaMQZ7kN8
	xcf6ifCeM9CEaiV77gNsR/guvyR+HujJPcNWucpZOhgwp34CUFn9MzVcDJe4lfcK6Ovo6r0kTXUZ0
	9i8AC4AdfivZbG/vWJm6z4YN5rqwCFyn4AuevVNwCtvrXXcnEO/x3thH/ZAdj+G2o7VacE6aiwBqO
	9oYxHzbcBDwG5el62zaWQj3jVXuYrygpxBDiMvowivan84h0kzcWkw2MkMDRlyd856phXSQr/SgeF
	OoYTm1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfuA-00000009g8Z-34dZ;
	Fri, 21 Jun 2024 15:10:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfu5-00000009g7E-0o5M;
	Fri, 21 Jun 2024 15:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 677F7626A9;
	Fri, 21 Jun 2024 15:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16215C3277B;
	Fri, 21 Jun 2024 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718982615;
	bh=iQEwxLn6QIG/MkdhhWiNcsV9/fo3VpAg6CAxSi6yeTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r53N5aYq9bMISOM9Z8jqS6gNw8mqhwaOtJUwiUiWPg7/Gc0tYEK89Z0mFayJAsRm0
	 QxToqdrG+j1YBgz2BwI7/ellh2Rp8y7o6d2Co8uHTfq3QurDtWcvBYNR3wdjJjhtSK
	 9SuFj+vSWRviLCFl0yI2yqiQTSAn0m+NpyeRVeWdiCNz294m82+ERyflg4v7ZC61UP
	 Bv38hwCXemtGG4joqifpJRGXKroK8EcXxU1xTIQKuzubHAwA3N1+zEXj6yF8f5cSBR
	 RrO548PhjkHhd3gKIIGxBcLO4aSoU7D9/oBgIOb0s3Te4OSDsCQLRnq98Q6IjxP8lk
	 fNQLWBbiUe3Ow==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f47f07aceaso17166635ad.0;
        Fri, 21 Jun 2024 08:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9KgEd+jC4nSEIJuC//s0YvxmllLruzFHRcw4GRgoXNXurxZaG9oa7P+OLranseI4ytj4CiFJB/3ik5a3O71oCJD+BctU8aGLf2anHp0MZzTEayMHFW5YXkxDH+G3M7Sm4VGd132auLPrJTbX7gdhZmGtZDXWZ7hU=
X-Gm-Message-State: AOJu0YyrIWiJC/7H+o8rqSm9rDIFLEtxYPvg217he6XcK1QxJuOC4GKe
	2WWTszM6gN4YtXEjyP0+VWFCKN0CeRDV6g5y8S9faoL5D5ze1aHtbYyZN8Kqvs3BJ8o9ySoKYbc
	gEoGFrNjpipouu1m7x0UJ7GICiw==
X-Google-Smtp-Source: AGHT+IF2PuJp1a6SMbW/SdQNvApziWiiOJt+0KEve4Q/7ExVqLow2RhqAS5x8tGBSiZlziTGDOzHeXpmGi8gvfXWw+Q=
X-Received: by 2002:a17:90a:d42:b0:2c8:655:87eb with SMTP id
 98e67ed59e1d1-2c806558914mr4058671a91.9.1718982614665; Fri, 21 Jun 2024
 08:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com> <20231023-display-support-v4-6-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-6-ed82eb168fb1@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Jun 2024 23:10:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-sk1aoXdG=Wq_fMAtCxqA=VC+GVOMURhaDadXnBqm_kQ@mail.gmail.com>
Message-ID: <CAAOTY_-sk1aoXdG=Wq_fMAtCxqA=VC+GVOMURhaDadXnBqm_kQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] dt-bindings: display: mediatek: dpi: add
 power-domains property
To: amergnat@baylibre.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_081017_378971_728F07D7 
X-CRM114-Status: GOOD (  15.40  )
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

<amergnat@baylibre.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=8823=E6=97=A5 =E9=80=
=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.

I've tired to apply this patch but has conflict. Please rebase this
patch onto latest mainline kernel.
Other binding patches in this series is applied to mediatek-drm-next [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bin=
dings to yaml")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5=
 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 6607cb1c6e0a..169d054d81ff 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -80,6 +80,9 @@ properties:
>        - port@0
>        - port@1
>
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -99,11 +102,13 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      dpi: dpi@1401d000 {
>          compatible =3D "mediatek,mt8173-dpi";
>          reg =3D <0x1401d000 0x1000>;
>          interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks =3D <&mmsys CLK_MM_DPI_PIXEL>,
>               <&mmsys CLK_MM_DPI_ENGINE>,
>               <&apmixedsys CLK_APMIXED_TVDPLL>;
>
> --
> 2.25.1
>

