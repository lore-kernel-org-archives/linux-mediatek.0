Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FE3CD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 03:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98HjqpVnhziiB+tCaWwhwMYDm4sqJVU4VjSmJrU5jEA=; b=bPDGW0viDfugiQTw2hdmx+rqM9
	TGxE3MuoGgJLQ1kRxCE/+VgNx0DPOG/PmrWEWOAvSFfAdbgv8C3VaUo8nZILGoaHMRPNjhT+vtW32
	s2GJKupaP68EHvGhzM4Mtr8GQ3RmjJFvRvsQEPlzVBJlTmdv9CJz3zUF6KI9ATa/HlPyUgEU8Cw4w
	1euX2AczcBotBIOLkhnIcslWzzvwGRz25CBynqMzZPhNSaSGInTl4jHUpOXZyifIRz/NfJMjnUK/G
	X3bSv+9pIN9XUrYAtdlPmM5ZngFj3Vfm5pCWjo4uWsCnZyrveVOADcN6IWfS98EnghL1pJ6R41tKG
	4UiiE+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtfYu-0000000EAso-3yen;
	Mon, 08 Apr 2024 03:20:48 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtfYq-0000000EAqn-1icJ
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 03:20:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-516cbf3fe68so4794529e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 20:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712546440; x=1713151240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98HjqpVnhziiB+tCaWwhwMYDm4sqJVU4VjSmJrU5jEA=;
        b=N5qJAWfVAlHt22QSha9UHtSn4fcgayPM71btkXZ37W69cp40Jg8dnDsZMd4Gd2N6Ch
         2ecFZIYJ2R66RqKCrEs+tewQKpj5l6knamUrH1UO7GwYZq+UJI4cWpZsg0T7Jc9Kn6vW
         Fvt2FB/rDW5oYJ85T/73AbBrFpajqhsJOzhFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712546441; x=1713151241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98HjqpVnhziiB+tCaWwhwMYDm4sqJVU4VjSmJrU5jEA=;
        b=FnrjbRQ0FTd6EoBxkwuKNsCdzIN0M3Iq+lpEAaYH/+Jgp9gQwZ4DInmQFh8tTnOOep
         R+K93aMfv2V7AVd60qh0kcyC/hupBHx7Kx/D5ZwooUMk2Qt8iKMsXLFyylW3iGGrdR4J
         j9TmApI3/Z217m/1D/75Jbc7vcIPUFJTmkGfte424x8aLdLt38AKxXUmBg0hyVro6qhT
         IoPR8RQ4HQ60i2exauoB8YX9VJAeq1cRz1z0+74tm4ndfAHCeTXp9VZK0tSyGtfSxj0D
         DFeftrxPcstjTW8HQCp4TUqY2PrNpokgSvYsbNY70kxljQUxRGlmABIwAvY5LqzyYmHT
         bSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyAq0bX+0c+65IasGNmcVwtQZFE5fd99P1GlYZVhPY2jaaXejdNm1r1fsu1IUP/iRsfTykNeFTIb4MlcAupJDk7Y2Bri9D6Ytj4h5POm1pnC0k
X-Gm-Message-State: AOJu0YymDGBpuVrpFkola9W0RRXcH9thye3M8dTzWaTX4hwyecDFmF7t
	KQkKQWK1xTY+hPgcoAEKyUxgWD8TmiOYMqfcWByCtpxJ0CWRSnfNH4TBgDGQGpPVCpeLkMij5kI
	H1VZ7lZT1CR4Dp+V7eW6XYhJSCB2DyF+72AGG
X-Google-Smtp-Source: AGHT+IHuBtoFanL6B/nTcj9Kemw5PgQtwvNM2fnCIIxrkvDK6Jp2siBTaJuK5OcN28aTlKvZ82j9f5EXF+Ms0ZDwh3M=
X-Received: by 2002:ac2:4c13:0:b0:513:d71e:eeab with SMTP id
 t19-20020ac24c13000000b00513d71eeeabmr5343840lfq.45.1712546440562; Sun, 07
 Apr 2024 20:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com> <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 8 Apr 2024 11:20:29 +0800
Message-ID: <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_202044_547785_1D2B2975 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, Apr 4, 2024 at 4:16=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
>
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsy=
s.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b3c6888c1457..90758bb5bcb1 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -93,6 +93,29 @@ properties:
>    '#reset-cells':
>      const: 1
>
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Output port node. This port connects the MMSYS/VDOSYS output to
> +      the first component of one display pipeline, for example one of
> +      the available OVL or RDMA blocks.
> +      Some MediaTek SoCs support up to three display outputs per MMSYS.
> +    properties:
> +      endpoint@0:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the primary display pipeline
> +
> +      endpoint@1:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the secondary display pipeline
> +
> +      endpoint@2:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the tertiary display pipeline
> +
> +      required:
> +        - endpoint@0
> +

Technically the mmsys device serves as an glue layer for the display
pipeline, providing things like clock control and signal routing; the
device itself is not part of the pipeline, and probably shouldn't be
part of the graph?

ChenYu

>  required:
>    - compatible
>    - reg
> --
> 2.44.0
>

