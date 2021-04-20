Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E816C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:01:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD43760C3F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD43760C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9rTPFFdNHGph5HwOrlcfyrWUSrCyF66ICYv+ae/+vbQ=; b=Fp6wZc2QkszFP+uKlVnGBKT3u
	qils8B4OfkD7A5y/e4sNrv9OnYjRwnLdQDxSKTcv1ipl8GoGFTUBZEPr9LOSTmbL7VtjQYR26ivXL
	Tcimi55hQT8uMfORD2Of1ghi6aRN734CZui9CwwsYQDbfPrOXmjCYdjI05awYq5bWM5teSyLZjDLi
	d1bnqVRJgG8m23SdNE+ItaPVe0J7ioMI3ebUrzUT7Fm3D4o02XkNWYcfIKchrHUyvqCrY9jmMq+BX
	g4u4Xjrb4h+INnIqIj1rCMQ6QmLB/OldrneR1gbEXbcGXDbhE3YtldIEv7Ta7GNkhOxw0PHI69qLE
	z4nU4UUkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYq0d-00C9Mp-V3; Tue, 20 Apr 2021 13:01:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYq0Q-00C9K8-0A; Tue, 20 Apr 2021 13:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oI3WLoc16emqFSJUBXgZsDmVKNulmKDlxyGPVJHIlck=; b=nuAtdCxJD/xUcpgNoALzZTw62T
 nLtxbJl9otDI/KSQPfpbcUgJekvSdcXvVS0T2JyQHlXoPZpFSMTVSMxAutFed8y2tQbpQvc4vLNTy
 fVyd8VUzhjFBWwOBZZNmre8lNGdHE8Et8DHvhB2jXYDoBhvhascijSG2Sc4LwtwVWI+WcqdkZ5aN+
 3M6YIyG+t9YdBcrWl64YIjp8JCtokkbq8CVt913nvoEXWjtlwfqXbUkM7qJRPdmYN0AMCU/5jju/D
 wC9tmnLcN4FQSudPVaZyHJOTxi8esg3e4BciYDbFEVM6UfUM2syI83fC+V0h02VfY6Ov3B9eKxAcE
 HkVSDsNw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYq0N-00C7bi-CH; Tue, 20 Apr 2021 13:01:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC08B613C8;
 Tue, 20 Apr 2021 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618923686;
 bh=rtORbGc3mPMhlArrUrjghPvRhVtKXaf7d9TRrasS6l0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VMumAygSE2Ss89tpuyftaMuLsWVlHbuUiOCbE8Ai7UM5E6RsNHIG9Vf4xtaC5qwKr
 O/qTpB4pkucmnZ3hez0dd3jHy+B2ziZ24j2pdzihRTrnG631AEEeFTonndrokzneRV
 fAlejQkAack3j+VindxNlgBzaFt6E33gc8tfDylJhzkcXhrUMNnxV+lZ6QtSmdN5EQ
 +1QNhVUNNq7EWbL1+0+jlludkTmVA2DTA/EPQmmN7+A2XDrkH6E/Edh5Is/S5zN1UY
 Dm+m093pRdDh3yhZFuuV6lxhG7ADpLJlcxGCBoTiokyTGU3rhh236EaQmxjuveju2R
 kvvrKuGcEAYbA==
Received: by mail-qk1-f170.google.com with SMTP id 8so5407421qkv.8;
 Tue, 20 Apr 2021 06:01:26 -0700 (PDT)
X-Gm-Message-State: AOAM531n5LUhDJ+PGVl/MxQb/S/kgmt3F3/KBYyza9iqCHFjNVfyLvOo
 KmcQbK1eqIiYabn8A2H0eRJJH5vqhLdTWCoJ8A==
X-Google-Smtp-Source: ABdhPJytCtVfQJCSrxQnJlrByY2ajWXURyVePKmlcnaE97mOqQU4IvcMx9ee78uVQZawM9qyCusf98X4PqudjDjJq+I=
X-Received: by 2002:ae9:f819:: with SMTP id x25mr9783240qkh.68.1618923685847; 
 Tue, 20 Apr 2021 06:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
In-Reply-To: <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Apr 2021 08:01:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+gWm+94zF1XN2KiRYgAZewiDkCk5B5bhLB=M+-HbD=fA@mail.gmail.com>
Message-ID: <CAL_Jsq+gWm+94zF1XN2KiRYgAZewiDkCk5B5bhLB=M+-HbD=fA@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Steven Price <steven.price@arm.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Fei Shao <fshao@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_060127_503400_25B3B715 
X-CRM114-Status: GOOD (  17.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 7:18 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
>
> Changes in v11:
>  - binding: power-domain-names not power-domainS-names
>
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
>
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
>
> Changes in v5:
>  - Rename "2d" power domain to "core2"
>
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
>
> Changes in v3: None
> Changes in v2: None
>
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 184492162e7e..3e758f88e2cd 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -17,6 +17,7 @@ properties:
>      items:
>        - enum:
>            - amlogic,meson-g12a-mali
> +          - mediatek,mt8183-mali
>            - realtek,rtd1619-mali
>            - rockchip,px30-mali
>        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -41,6 +42,8 @@ properties:
>
>    mali-supply: true
>
> +  sram-supply: true
> +
>    operating-points-v2: true
>
>    power-domains:
> @@ -87,6 +90,31 @@ allOf:
>      then:
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mali
> +    then:
> +      properties:
> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt
> +          minItems: 3
> +          maxItems: 3

This won't work because the top level schema restricts this to 1. The
top level needs to say:

power-domains:
  minItems: 1
  maxItems: 3

And you need just 'minItems: 3' here and 'maxItems: 1' in the else clause.

And drop the description. That's every 'power-domains' property.

> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: core2

Blank line

> +      required:
> +        - sram-supply
> +        - power-domains
> +        - power-domain-names
> +    else:
> +      properties:
> +        sram-supply: false
>
>  examples:
>    - |
> --
> 2.30.0.280.ga3ce27912f-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
