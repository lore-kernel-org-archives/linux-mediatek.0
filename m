Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D10BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 03:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SE25ecLLQueDZVJGIUzlZ80duKMDp6p/S+fzvbjlO8Y=; b=I/QxfWtVQoBCjC
	cD2UjdhNT6r5D2nQDjZ+XlcyZBMBVubO6shmZmCt9nElP7GO/swnGNg27tuA0UimQ9TtTvFr8KiWj
	A1ao9uA0WEZSN8wcxInm+JXGHtiirn96KJoMJz8B7QIcuP5MSXnasGQtJ3c8tZ1xQs0w1rB4ZHSEx
	KwL3Zmp2dH0fnF2LzvVtWav5Rdfa/mB8b30FiF+RHuuNZipDY1yj7PeDeAYx7SpuligU78OIlVoTQ
	bcios9lOghv4/FB0bFN9sVWbYbCZmHW+MxRJYXvR75SjNAWi9fYdNGn3OtExsZEQ09D8U6B1+5mEI
	9CTkqzSKvQQ/CU3YqBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npM5h-00EM3Q-0t; Fri, 13 May 2022 03:35:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npM5W-00ELz4-97
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 03:35:35 +0000
Received: by mail-ed1-x52c.google.com with SMTP id k27so8456152edk.4
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 20:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hp5XW+EPUgNO9juHKBfPepcJCtSp8113Ul6jaPu0DAQ=;
 b=GDSDCn+HYVu7o6UcrQY7lfpYOfUai0qVrApLd9h412Qrq2pirSRC/X/vIGsbko6Xzr
 u3u5darEcYyz1M2dEJRf6XEL1U+gNibYj54aLOA6Sy+/Fx6sALMc8GvkVgl/2TEaeP51
 6K5WH0O4bOLy61rVkroPJh9crDW+fddMKEZzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hp5XW+EPUgNO9juHKBfPepcJCtSp8113Ul6jaPu0DAQ=;
 b=2i6d7pcwMh5pYj0urOurpEtvy0Sw8JC/X9VucwB5+Lkcu5PF+0SBuj8uaE1VwXDIBr
 +E2p2tDVZK622yZGyw/Q07uHrr5rADcyLgJq4vw07JNYBK4GCe0oXoxKCLkRQOi0c24J
 NxMBbx7GRayNJf8CFSF0XlLEDdTJqxzk+91fPvB8Ew+w3x5O8j3Uw7RzzdOqsQmGVAyr
 o/VIqmu2w5u1zOVOTDLvhOmYFwN5hi2RPIaSycJeKdsvIk99/MRggRlcOC63QE756H7c
 0alX0dWi9bebLP02bhX7Wr4J6LfdLbkrcK5BndMV1/NbDyPU1eesyGhcHnh7APtIPbDd
 Xwdw==
X-Gm-Message-State: AOAM532xMcw5E32SYiNSXO4Zxo5NNAnS/S5kxqqjJjX40Vu9M0apabpF
 tL8eZaZL8eSQnNBZDZjxRPT3e/BLJ1Rbt/hOoaavvw==
X-Google-Smtp-Source: ABdhPJwCxuakH0MPfmD4BsVGbk8H/0s+6mFVVZ6p1DZEFE3K2V6LRK/oXrI3wQNquf51Rr/hHpcAOHj5MVbVUnJKE6w=
X-Received: by 2002:a50:9ecc:0:b0:428:73bd:4667 with SMTP id
 a70-20020a509ecc000000b0042873bd4667mr34262382edf.165.1652412931525; Thu, 12
 May 2022 20:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220513032832.17645-1-johnson.wang@mediatek.com>
 <20220513032832.17645-2-johnson.wang@mediatek.com>
In-Reply-To: <20220513032832.17645-2-johnson.wang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 May 2022 11:35:20 +0800
Message-ID: <CAGXv+5FqjDX7y_bR0Y=2xCnCqwtAB2S+3Fn==adxJJqanv8=YQ@mail.gmail.com>
Subject: Re: [RESEND v4 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: cw00.choi@samsung.com, krzk+dt@kernel.org, robh+dt@kernel.org, 
 kyungmin.park@samsung.com, djakov@kernel.org, khilman@kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, jia-wei.chang@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_203534_351929_22668619 
X-CRM114-Status: GOOD (  17.16  )
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

On Fri, May 13, 2022 at 11:31 AM Johnson Wang <johnson.wang@mediatek.com> wrote:
>
> Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  .../bindings/interconnect/mediatek,cci.yaml   | 140 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
>
> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> new file mode 100644
> index 000000000000..034c3b38ca3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Cache Coherent Interconnect (CCI) frequency and voltage scaling
> +
> +maintainers:
> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> +  - Johnson Wang <johnson.wang@mediatek.com>
> +
> +description: |
> +  MediaTek Cache Coherent Interconnect (CCI) is a hardware engine used by
> +  MT8183 and MT8186 SoCs to scale the frequency and adjust the voltage in
> +  hardware. It can also optimize the voltage to reduce the power consumption.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-cci
> +      - mediatek,mt8186-cci
> +
> +  clocks:
> +    items:
> +      - description:
> +          The multiplexer for clock input of the bus.
> +      - description:
> +          A parent of "cpu" clock which is used as an intermediate clock source

Replace "cpu" with "bus"?

> +          when the original CPU is under transition and not stable yet.


And also, "when the original clock source (PLL) is under transition ..."

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
