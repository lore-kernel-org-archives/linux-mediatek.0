Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3803C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 13:57:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697F9207BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 13:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YggPISwa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697F9207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tlc/4SHSjW6JVadhlS92s4Oyp8vNyy8gkMcJ9B9bypI=; b=YggPISwaPvR5SYWo760JIGB+T
	f/ZDSrdiYliDmy//ah6o8raXZMwaaDAKrW5dUR9ILtuW+AF9d2gprVagGf3DwI7CJikvp/kOB8a/w
	CSKeZBsUqcoZSeu7At8PVbZ1g0mBTR6+5KdZ1t6Iv3tFjHg/jYTkDWbhK6m8U3En8F4EUBHwHkSsG
	iU6QOhq5k3N0lVerVlrLpWjN9znsAtzgfO5X1RrvYgcGQbpLyjKCSFU+jX15kmplV2plx2O0BsBPB
	3wRmJFAioFCuMG1MS52Oh0SVpzARe1Gq9l8/ChXv/Y8V9+cbUgpwhR+6KagyIXYQiuclAd6XTCf7Q
	1QjkFyVIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPQzr-0005q3-D5; Mon, 05 Oct 2020 13:57:47 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPQzl-0005ol-Nv; Mon, 05 Oct 2020 13:57:42 +0000
Received: by mail-ot1-f68.google.com with SMTP id n61so8637546ota.10;
 Mon, 05 Oct 2020 06:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HLXvvMEroZCyEvFhhBCVsUsG4CTHlceWSEkbwHb7abs=;
 b=POZXjqPh+JPQw4NckLZH1EIiyAhH/kKZZGwNmU92LPxyxTup0afK6Y7l2QdKEoB2Rv
 H7gPioc//DsBXtjpm/L77VmJgAXLtnMmeD98gjCwauBbKT0IcnDMuXVO3HnSAKhRuQTs
 i1kmmY/4WtJvVNAbU8Y0e5fSK4Qky6oVXp7l72E1n9iD/2tr5HCuD0FHXPKAMSpc9EeH
 FIhIkR0Kbk9dlEzaWl4vJIvppYuqF8ksS+UZm2UM3nPPVPVpES2xxsO0/h+aQERCmDnq
 GVhWfIz4lS6ZTY64jRnnOjgK5zbP1Wj/y9x1OJ6mN2PILfFkkdrf30foch/gBGd/fYHI
 Py7A==
X-Gm-Message-State: AOAM532smE4ZFsahjDLvO6eVu2MI0NoXv507SocZXVaP7sudnS8beW6a
 YsQSYA9G9KCpijbfkK2KOA==
X-Google-Smtp-Source: ABdhPJxLkuPrQ//lVhFii7F2n6/PROn58UkLIGod7jgA8Wt9oD/eivK+XCX5n8q/tj7bRI/v6tqR9w==
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr11762976otq.302.1601906261016; 
 Mon, 05 Oct 2020 06:57:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f11sm14515oot.4.2020.10.05.06.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:57:40 -0700 (PDT)
Received: (nullmailer pid 90619 invoked by uid 1000);
 Mon, 05 Oct 2020 13:57:39 -0000
Date: Mon, 5 Oct 2020 08:57:39 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
Message-ID: <20201005135739.GA87274@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_095741_784225_E0365382 
X-CRM114-Status: GOOD (  17.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 maowenan@huawei.com, tzungbi@google.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 02, 2020 at 03:35:40PM +0800, Jiaxin Yu wrote:
> This patch adds mt8192 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> new file mode 100644
> index 0000000000000..43852315f1867
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek AFE PCM controller for mt8192
> +
> +maintainers:
> +   - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +   - Shane Chien <shane.chien@mediatek.com>
> +
> +properties:
> +  compatible:
> +    contains:

So any other string in addition is okay?

> +      const: mediatek,mt8192-audio
> +
> +  interrupts:
> +    maxItems: 1
> +    description: AFE interrupt line

Drop description.

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: audiosys
> +
> +  apmixedsys:
> +    maxItems: 1

This is an array?

> +    description: The mediatek apmixedsys controller
> +
> +  infracfg:
> +    maxItems: 1
> +    description: The mediatek infracfg controller
> +
> +  topckgen:
> +    maxItems: 1
> +    description: The mediatek topckgen controller

These all need a type reference and and vendor prefix.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AFE clock
> +      - description: ADDA DAC clock
> +      - description: ADDA DAC pre-distortion clock
> +      - description: audio infra sys clock
> +      - description: audio infra 26M clock
> +
> +  clock-names:
> +    items:
> +      - const: aud_afe_clk
> +      - const: aud_dac_clk
> +      - const: aud_dac_predis_clk
> +      - const: aud_infra_clk
> +      - const: aud_infra_26m_clk
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8192-power.h>
> +
> +    afe: mt8192-afe-pcm {
> +        compatible = "mediatek,mt8192-audio";
> +        interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
> +        reset-names = "audiosys";
> +        apmixedsys = <&apmixedsys>;
> +        infracfg = <&infracfg>;
> +        topckgen = <&topckgen>;
> +        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
> +        clocks = <&audsys CLK_AUD_AFE>,
> +                 <&audsys CLK_AUD_DAC>,
> +                 <&audsys CLK_AUD_DAC_PREDIS>,
> +                 <&infracfg CLK_INFRA_AUDIO>,
> +                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
> +        clock-names = "aud_afe_clk",
> +                      "aud_dac_clk",
> +                      "aud_dac_predis_clk",
> +                      "aud_infra_clk",
> +                      "aud_infra_26m_clk";
> +    };
> +
> +...
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
