Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E8FC07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPFy//wmMRAK3ZwpN0cSFOYjXlo5NUKCjzjgKPF+ukU=; b=T1+ZPhI7/9LdqIKzCHoOkG4UPK
	D54fQRnswkwfo61ORdvU5v7NSP7rjzA/9PSzNQ0H/TN4PUctg2Z6c4e7jnqnfGkWyThDbHAYcrDma
	VuI16b8p+Mb/pRcACqO8ZvmdoBGQFqS0BQdrlWi6qH99bp5OGF5N7oeAoGGasu5hJjGnw8AlKqC3d
	e1zDVafoQO/VvQf2D97KZhnoC/bAFYCyNfyPKnqKC/35WOGdkZb1TnYb2VPWRDsS8PTaRoax5qS8E
	mu1Vc3WAs5wdV7MjefwYE1EcwK4uMfVyz6YN0BRVXPgy0nW0iIVd8+Cwa/hFdMTIAtH7mDIZNq7ti
	ILX3iGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocpTI-005Vi7-EP; Mon, 26 Sep 2022 14:52:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocpT1-005VbT-RQ; Mon, 26 Sep 2022 14:52:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49A0860E73;
	Mon, 26 Sep 2022 14:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FCAC433C1;
	Mon, 26 Sep 2022 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664203938;
	bh=K88cm8bIsC2QQhtkF90EpbOoiLRIjlE5ymW1VbMAKXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tk6RJbMHalAj8Tp1/kdQw39Ie/imvaxkRVrFrJjf83J7bkWYPgN/RHc6QDA1L1/t0
	 z+22Am2AK52EaxI/LJbYrcUxYQHUIgIVx8E+HigPAwnxoeAWRVOfhIzjFFQQY/Zw+Y
	 L/r+kFbHtN1MC4ilwIZQ4Yoo6MuwF5YokIXyB85Vl2sELURjcCEIFt138pxVhcZ7oF
	 yA3jJkyv/DRnvg7J7+6v8ca0vleDjYDq6uIRczUw135JUXy984NFOW0ok8GTYsoado
	 77iAlTkHKUW+BDkPKoweHJBfWqM5gS06ZDdegZDWO9IKno72YAgYt+9AAV9e1yejzw
	 sWo/A3xxf1gcw==
Received: by mail-vs1-f47.google.com with SMTP id u189so6813798vsb.4;
        Mon, 26 Sep 2022 07:52:18 -0700 (PDT)
X-Gm-Message-State: ACrzQf2Ve06z7nMqttm2ks1j7XPU+6oqNIXfqIWl4F4x+dan2U2ZtMaB
	ELTfPy4SJ/azwdzu1LNokP6swOT8PIxdNIVflA==
X-Google-Smtp-Source: AMsMyM6A4G2VcWkO0zSLltuACdwFlc6zLZwHVE03TNWf8kj1nI9vAIwsB/GOnQVGeoo8Me9LSXI2N6k2vK9MmxSy5SE=
X-Received: by 2002:a05:6102:3211:b0:398:87ba:a1a6 with SMTP id
 r17-20020a056102321100b0039887baa1a6mr9369144vsf.0.1664203937059; Mon, 26 Sep
 2022 07:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663254344.git.chiaen_wu@richtek.com> <9382254831bb6ed8c228398a68896b0e8e61c7c4.1663254344.git.chiaen_wu@richtek.com>
In-Reply-To: <9382254831bb6ed8c228398a68896b0e8e61c7c4.1663254344.git.chiaen_wu@richtek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 26 Sep 2022 09:52:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Zkgfq0q_XgpLEjHLPGSuG06L6y5YbzbiberNMWtAuJw@mail.gmail.com>
Message-ID: <CAL_Jsq+Zkgfq0q_XgpLEjHLPGSuG06L6y5YbzbiberNMWtAuJw@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] dt-bindings: power: supply: Add MediaTek MT6370 Charger
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	sre@kernel.org, jic23@kernel.org, lars@metafoo.de, broonie@kernel.org, 
	mazziesaccount@gmail.com, andriy.shevchenko@linux.intel.com, 
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-iio@vger.kernel.org, szunichen@gmail.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_075219_983759_E061E905 
X-CRM114-Status: GOOD (  24.93  )
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

On Thu, Sep 15, 2022 at 4:49 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add MediaTek MT6370 Charger binding documentation.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> v11
> - Add more detailed description of irqs.
> - Adujust the order of irqs
> ---
>  .../power/supply/mediatek,mt6370-charger.yaml      | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> new file mode 100644
> index 0000000..fd491c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6370 Battery Charger
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-charger
> +
> +  interrupts:
> +    description: |
> +      Specify what irqs are needed to be handled by MT6370 Charger driver.
> +      We need to use the IRQ "MT6370_IRQ_OVPCTRL_UVP_D" to know when USB
> +      is plugged in, and then the driver will enable BC1.2 detection.
> +      After the hardware of MT6370 completes the BC1.2 detection,
> +      IRQ "MT6370_IRQ_ATTACH" will be triggered, and the driver will know
> +      the result of BC1.2 detection.
> +      When the IRQ "MT6370_IRQ_CHG_MIVR" is triggered, it means that the
> +      hardware enters the "Minimum Input Voltage Regulation loop" and
> +      a workaround needs to be applied at this time.
> +      In summary, "MT6370_IRQ_OVPCTRL_UVP_D", "MT6370_IRQ_ATTACH" and
> +      "MT6370_IRQ_CHG_MIVR" are required in this charger driver.
> +    items:
> +      - description: irq of "USB is plugged in"
> +      - description: irq of "BC1.2 is done"
> +      - description: irq of "Minimum Input Voltage Regulation loop is active"
> +
> +  interrupt-names:
> +    items:
> +      - const: uvp_d_evt
> +      - const: attach_i
> +      - const: mivr

Now warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
charger: interrupt-names:0: 'uvp_d_evt' was expected
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
charger: interrupt-names:1: 'attach_i' was expected
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

