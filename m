Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2818EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VUY7671QYRMc/cXgTi22UTEvLQKFmkZ4mq/8MUBSOU=; b=J0G/ns8vhX7L+Pvq5xBulceCBh
	ORuCV6y0S7TWF1PYILEAejSX64qECRxRTldvU0dAJj7E4j43T9dPZa3AspziHwYUb84Xs6m+Wyc6t
	+XdECZ8q2Or2qtvaQI7Sqi/WB5ZEyLqMGACbOQKN5y9CmqUoLGBn32Wlc5qrE1Y/9712dksYctdsX
	N7TMdPqfgk8K+4uJPQkoMLRMjlkmxk2ZhrDVuFHriEK17LN2GE+7F8VF5tru8CO3SX5+Mo/a8lsCT
	aTK7SNn1UKFNcRQDCYmU2/qjU8DqSIwIMxd0J7puKSecMvTa0w4oSyTT6juflGY3ZGaJFqVvGj1Dz
	4b2fY1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDcF-008hEg-9Q; Wed, 20 Jul 2022 17:36:07 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDc0-008h3Q-PB
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:35:56 +0000
Received: by mail-lf1-x12d.google.com with SMTP id t1so31350635lft.8
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+VUY7671QYRMc/cXgTi22UTEvLQKFmkZ4mq/8MUBSOU=;
        b=WuhbcQGCM07g8PxlzDwXWu4Q0+gU6wXSleBaqwNSxpr4ez0Tl6UiELTxqOPsY5XJCL
         c9m6kJlYoosF/pUBt5g7dM7Hx5Jw0osbPFB2tgrlWLUJUi0vij7aDkF03mICIwuOUj1j
         T20UQGIoZOwDlWmfK0TgR6rAmei8GXfFtrt54LIIS0Xtye9hLNehKqO46XrbEvPxCM1t
         kCVq9EdbDB8DXAstlBCN5hcK0GTT+9bDhl9wZvJ3UNgIfQ+LSSMFLOO05xSeum5+UNbu
         q4UWhkwr+hVvqaCBjloRBJ+ti+ejZYCVNA++cGK0nqzLObHCfBOxzdVvoJC2Inku+kAY
         TGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+VUY7671QYRMc/cXgTi22UTEvLQKFmkZ4mq/8MUBSOU=;
        b=QHsFUxeklaZR59u+CDij1SsYHzx4GmvMch0IdHNp1VeCZj8UmDKs6k5imgNkz7l+7b
         56h7eURBBDw7Pd9Xbq/oGEFL7WAQmL6CStPG2rGYHc0FWwyS5GClZ2eQ7jitNjpsDmnv
         4oKmREcnZqpYkXVMgMmu1IKLh9OLcXvlXWUsoi81h3ZQtlew6LU1Ma/pGNWN3tGsfaQA
         zp9Mg3TIXeQJ2pMppQmoeCsLttATXamcPCAWaKoywE2QJ9zRDnlC/JdlVUGPwPJBpHAT
         gP8sHaYATAGo1DqB0qOUjwXprMIqlIFj5n7ma3H7cO7v6+RULFQDbxOsQGe0R+TNNqsQ
         wXmA==
X-Gm-Message-State: AJIora+XhzbErld4BziZSXpkJ1dISIMTNXcRTfXTC0+BWow42EZnAO3Y
	w+/2z5m6EtE6CArNn7QAmuX86w==
X-Google-Smtp-Source: AGRyM1uY3bw40ky2fyHO3gLmhER9ViMzHUUQc2mqlW923j48d+elYuxDaT6AIwbrPqOqmiWkdx13Wg==
X-Received: by 2002:a05:6512:3452:b0:486:eff:739c with SMTP id j18-20020a056512345200b004860eff739cmr20214593lfr.549.1658338551068;
        Wed, 20 Jul 2022 10:35:51 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id u17-20020ac258d1000000b00478a311d399sm3918205lfo.0.2022.07.20.10.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:35:50 -0700 (PDT)
Message-ID: <57b0cf62-0312-05cf-31ff-d38f83a35578@linaro.org>
Date: Wed, 20 Jul 2022 19:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/21] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-7-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720123023.13500-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_103552_856793_851AC9FA 
X-CRM114-Status: GOOD (  19.30  )
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

On 20/07/2022 14:30, Tinghan Shen wrote:
> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,mt8195-scpsys.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> new file mode 100644
> index 000000000000..4117a6dbc19c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Control Processor System
> +
> +maintainers:
> +  - MandyJH Liu <mandyjh.liu@mediatek.com>
> +
> +description:
> +  MediaTek System Control Processor System (SCPSYS) has several
> +  power management tasks. The tasks include MTCMOS power
> +  domain control, thermal measurement, DVFS, etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8167-scpsys
> +          - mediatek,mt8173-scpsys
> +          - mediatek,mt8183-scpsys
> +          - mediatek,mt8192-scpsys
> +          - mediatek,mt8195-scpsys
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^power-controller(@[0-9a-f]+)?$":
> +    $ref: /schemas/power/mediatek,power-controller.yaml#

We talked that unit address might be useful but it was with an
assumption that you will actually use it. I think you don't use it, so
it is kind of meaningless now... unless you plan to use it?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    syscon@10006000 {
> +        compatible = "mediatek,mt8195-scpsys", "syscon", "simple-mfd";
> +        reg = <0x10006000 0x100>;
> +
> +        spm: power-controller {
> +            compatible = "mediatek,mt8195-power-controller";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #power-domain-cells = <1>;
> +
> +            /* sample of power domain nodes */
> +            power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
> +                    reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;

Wrong indentation.


Best regards,
Krzysztof

