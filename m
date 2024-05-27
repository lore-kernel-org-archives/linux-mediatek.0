Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270E3C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nsle90kquxqyGATVLGaUwfEqMygpQJmcBP3wYD4Xyos=; b=lRJDnGQ6RGTscQUI5FqbpEuhWr
	iELp1FkcTakiEDAtsPJGJwX5yMJ+K62FWBrC4EaEwsYIebMO3quhVZ0lKiwojBUNksSkQLIHSs2Sv
	p81zNnsoh8PvXPKhZPrhhkpVRUoayYiTIJYRPP+69VQd8Jl34NnxU8igQUUWOnEiVIVl/VxPPp2fZ
	xfdLSHNOR5BAySxuG0xaguNyeiU80DYPzYpK/Jk7UFm0p0+jkoXIlIDRTlzRN4XKdm+42E8Bf1pNS
	se8UI01epMSmPcOUP7zXUQL4BVaTFmBqer0vWiolc+E9PmCcQD/YvR2xznzD8dW8skeKTK/up+XmF
	qsHDz20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWhY-0000000EPgq-2fWi;
	Mon, 27 May 2024 09:31:32 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWhV-0000000EPdC-0HCX
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 09:31:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-529648cd69dso2984811e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716802287; x=1717407087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nsle90kquxqyGATVLGaUwfEqMygpQJmcBP3wYD4Xyos=;
        b=EH7e72nluw927C9qsh08ToMXJXDD4HgULO9zEBogXhpkO6XMvQbaVXFFzm++GAkNQ8
         ueFtOMGnL161rR8bX6GRPkJFNaRd49xFlcTtNx3tt2Uv7evSrIqIq+pWOlRh8vUNp/NQ
         R7LHtRdRz0e/Lamym7OAkNio5D1MpSMyPaNMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802287; x=1717407087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nsle90kquxqyGATVLGaUwfEqMygpQJmcBP3wYD4Xyos=;
        b=nyHauxbbpYxRxpcAuGFtIsyrQzEXSNVrA64INYp3xzyvfr90Cg3cAieGEe03/kw35P
         pcjzNEvnADkqGbXven3jhn/lgTm7na0hBoPRrBlC2aMJoLrCGlFPj+KY5kxfd2LG3+GM
         aenrYjRCZv28hyoT+7fVcwIsLEU7Iev2YVska3SJ2ux5cwILKfofTfKu1U2dfMF7QtaU
         bR5VMtFF4u3AbhWBDT2aviYanj+u0weT3awCTi94CgLMjmgBsmZThwgpPZGsjNBT6B0t
         kv+hDtSyF4p/RcuarH4s9K1mjWSd3VzZNSGqkzg2MaVGP5w4m8DQNCGXzTiYKd7KSQjK
         ncig==
X-Forwarded-Encrypted: i=1; AJvYcCWpB7h9KtGXtLxAfF+U/SN66YVYl71IwnNkNvf7mcZEXrICZUCHrjPQPwwM7GLWZ9n+EltiJjMDnpbwOtzZM8U0rguYQ576Wt8IaFglXQXZDDXK
X-Gm-Message-State: AOJu0YwMQ7QbibOhPP9ryx8GRtxS9x5f4Dmesk9RX6UFqPrUkDRXqBme
	+CAkxHaSjelrmaGPC1bGcyuhJk/pXHyJAMyxWCNfa8SZD+BAmRuZN40kD69U8kaGDYJtlYlyzsU
	lFiVHx0UastM8iFnKP+GRMRCKDo4pEwkmqLS0
X-Google-Smtp-Source: AGHT+IEkCNM2qY1QxwWMjQ5Y6VGnSYpnCwe9tanGjyyeQWcnQ9MczhIoPwNeqRZhqbClYjaT+d8vnb65A/W5+FPMd1k=
X-Received: by 2002:ac2:4d91:0:b0:51f:53e0:1bc8 with SMTP id
 2adb3069b0e04-5296556f885mr7749628e87.25.1716802286862; Mon, 27 May 2024
 02:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com> <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 17:31:15 +0800
Message-ID: <CAGXv+5G_n1B0yaoOBx0k8syRPma=7NnuRcSL4M0N0BJONa5fCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8188 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	steven.price@arm.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023129_292925_DB3D0314 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, May 27, 2024 at 5:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml =
b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index e796a1ff8c82..4cf676190ae8 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -34,6 +34,7 @@ properties:
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable
>        - items:
>            - enum:
> +              - mediatek,mt8188-mali
>                - mediatek,mt8192-mali
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable

I believe you also need to edit one of the conditionals below so that the
number and names of the power domains are properly constrained?

ChenYu

