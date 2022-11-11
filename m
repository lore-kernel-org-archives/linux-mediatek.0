Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB49DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpJrWqQ4CmduKv0xmnoR71zLFn6VuVuiVCxb/WoP7jw=; b=inDbltiCV1zK+WqnrJBbaC/LNu
	kWW+4QBy4qnTIXhyH41B8nIoO87UBdSPoqKqC9Ipid4qH5unIzscrYR0Xzf51rXaNd0S62Sv9VoQ1
	+V07cFUOsmpTmlVTbT0moTNKTI9GZ+rjh0NgcjB7kce69SWEy8VEfrtS4d8haVq4ppLNUfoPhRuCB
	OqrcN1kjdeMl5mW84rx3RdD+VV4U5cs77hJCNR7Wk5CLrQ9oHY0pVeexhtm61IfRWWUONUoopBykf
	ZekDdT03Iqc6aAB5bqcsmASMiIs+Lsb1QREQwRFURz2dMlghx/jXs+7dxINXudZ5JPMVdrAvmRvbp
	N+scA2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVO5-00GM0D-6U; Fri, 11 Nov 2022 14:52:09 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVNv-00GLtE-TV
	for linux-mediatek@lists.infradead.org; Fri, 11 Nov 2022 14:52:01 +0000
Received: by mail-lf1-x130.google.com with SMTP id b3so8665131lfv.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Nov 2022 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpJrWqQ4CmduKv0xmnoR71zLFn6VuVuiVCxb/WoP7jw=;
        b=fqxlXcq+FU5VCkPezsP78XhBSunFUXqWZOGoLYNGWvIlsFzDrxH+fffvMyy8/zyQz7
         7aVn6RAHyDHtwmUbiie5n7b5fsdBa0s64JmTGm+mqRM+bt10Rk7/XHhXwCdAx51WOnmR
         SZv2DFEna/mE8TJ6qpoMczqimg2TQFH7kvC3Cn/oo+D0bbOD3buxxpMGHGqqymqNNVBN
         Z0mOmBaaa+8sWxTCDXyxI7JJqC8HsZYwe+jiF/FccH+v3o7Q/4CdWSZb7/buaw0X7Q2K
         mJOVSQXYMZ5wYhCyS6tOE25ezrGtn3tNSKeU+yRCAGAYULNK6vWB7wxSS11k1vJPIMZ0
         9fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpJrWqQ4CmduKv0xmnoR71zLFn6VuVuiVCxb/WoP7jw=;
        b=kRiZzkQx0djNMF1ypE75sIv20VIIAiX588iaeYBp81hivNRKO1LDwoGy+9taoy+rtz
         AEOe3khT/ACBd8sn1Sp9zflV5yqo8Md/69kMECUQg/+STvI0BKQhX46GXzsxeBIgiXM6
         IinnCX8RVvGSdNuJzQsNP5dBJKxSDx7MwG6rNS49GV9KaQgPPF7Cpm5MbYy2O5vwXylD
         +ZjhK13m6djRArwoFffvprhFJzqoCx5i0Qn6MXC0l3PIJtQGF842MCmOmFXru3wzOD+M
         gTdjBiFKL8soT56YkB20dPO1y7Iy8rJQ2DiH0+aGQq3PNdGdUAD/nnxZoet/foOfgp4/
         hfww==
X-Gm-Message-State: ANoB5pnj6S28JQmi4fkG6thGttN9yNr+t5ocbYhgErJPcWt5eFM1kxDo
	LWK6UuN7Yjmhv9gJNAIpsG/FzQ==
X-Google-Smtp-Source: AA0mqf6s1mgFbp0tWuMwPtCgw1cwtoLS3J09NnMzCfNlJmqztP9DDfkjd2V5z39BtLIJeTuIt490jQ==
X-Received: by 2002:ac2:48b4:0:b0:497:ca2:4e74 with SMTP id u20-20020ac248b4000000b004970ca24e74mr868206lfg.488.1668178312891;
        Fri, 11 Nov 2022 06:51:52 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id w26-20020ac2443a000000b004acbfa4a18bsm360465lfl.173.2022.11.11.06.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 06:51:52 -0800 (PST)
Message-ID: <4be61c49-c16a-0725-3b90-216ac808eaa1@linaro.org>
Date: Fri, 11 Nov 2022 15:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 4/9] dt-bindings: mfd: mediatek: Add bindings for
 MT6357 PMIC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-4-5d2bb58e6087@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v4-4-5d2bb58e6087@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_065159_974016_904FA808 
X-CRM114-Status: GOOD (  21.87  )
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

On 08/11/2022 19:43, Alexandre Mergnat wrote:
> Currently, almost all MT63XX PMIC are documented mfd/mt6397.txt.
> Unfortunately, the PMICs haven't always similar HW sub-features.
> To have a better human readable schema, I chose to make one PMIC schema
> to match the exact HW capabilities instead of convert mt6397.txt to
> mediatek,mt63xx.yaml and put a bunch of properties behind
> "if contain ... then ..."
> 
> - add interrupt property
> - change property refs to match with new yaml documentation
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> new file mode 100644
> index 000000000000..7b421f21d3f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6357 Multifunction Device Driver

Multifunction Device is Linux specific, drop.
Driver is not hardware related, drop.

Instead describe the hardware. It's PMIC right? So call it a PMIC.

> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |
> +  MT6357 is a power management system chip containing 5 buck
> +  converters and 29 LDOs. Supported features are audio codec,
> +  USB battery charging, fuel gauge, RTC
> +
> +  This is a multifunction device with the following sub modules:
> +  - Regulator
> +  - RTC
> +  - Keys
> +
> +  It is interfaced to host controller using SPI interface by a proprietary hardware
> +  called PMIC wrapper or pwrap. This MFD is a child device of pwrap.
> +  See the following for pwrap node definitions:
> +  ../soc/mediatek/mediatek,pwrap.yaml
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6357
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  regulators:
> +    type: object
> +    $ref: ../regulator/mediatek,mt6357-regulator.yaml

Full path, so /schemas/regulator/......

> +    description:
> +      Child node that specify the regulator.

Improve your descriptions. "Child node" - it is obvious, it's an object.
"Specify" - no need.
"the regulator" one regulator?

> +
> +  rtc:
> +    type: object
> +    $ref: ../rtc/mediatek,mt6397-rtc.yaml

Ditto

> +    description:
> +      Child node that specify the RTC.

MT6357 Real Time Clock

> +
> +  keys:
> +    type: object
> +    $ref: ../input/mediatek,pmic-keys.yaml

ditto

> +    description:
> +      Child node that specify the keys.

MT6357 ...

> +
> +required:
> +  - compatible
> +  - regulators
> +
Best regards,
Krzysztof


