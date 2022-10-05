Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0333AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nV8sn5fckcM1r2PSkDjQFkbKbz4kB84l0Mkh4PCptDc=; b=itkPBp5KRQ7C77kl6vKA+QwD9Q
	skL3f5V/GIpzjNgav3xutGWcSTWm2hbI5iU68+Gbq1mqqTZYQpyl5XSJ3jfLdxSJ3AfOWH3Aapdj2
	KuJN/B2VTxYkRn7VQ5y+jWule0GIpHRIhSSLfnKsNXfmvqCWjgFXzVVMP56g+yMVC+cTA326yHDhj
	+G0ZtOnqqsc6Q0C91J4mM2OcoQoXN/MnuSF/lDI3go+jqqP86SDkKWK/d8XyqE0TPE60UdbuPDrm+
	j4UNYnhD0h7kLqtwYfcduRf2Ips2jhNVeqKBVNkfWXUD423K3xo5w5n0Ay1LdghoP2ky+nNcNrpLQ
	XrKQz9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og6qo-00F0ac-B7; Wed, 05 Oct 2022 16:02:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og6qm-00F0Zu-7Y
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 16:02:25 +0000
Received: by mail-lf1-x132.google.com with SMTP id 25so15928230lft.9
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nV8sn5fckcM1r2PSkDjQFkbKbz4kB84l0Mkh4PCptDc=;
        b=biOadCqVTkYihS9A1lwozegpbBCWdVtjyxKTngIIPs12kKTrrqxLkyqBFwbV9Zi5Vp
         mWjjRHPwcQ1Lfv3PSm/ifX0D44ssDjl9q9WkvYgoCXuee+OugiTH4468hnvddQMr82T1
         wpsSWEGM8XCqZVMy6x8Fjw1PaJ8uf1gzeILv/SdgXSJVbAFOOmyB3+jy9QQIMv3aMGb4
         aYm0Q9vGLXxgaCxbPw9SeSAy/HYYRBnIfb+yGu1EMRPlJa922+Ha7nNXJm8RlD13ptH9
         bxnW3Gv/CODYMekSycuKsZYNqkPe1O9nvGFB7YSyiWC5qqAGhzCZKTKI6XHt5WSTay0/
         v2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nV8sn5fckcM1r2PSkDjQFkbKbz4kB84l0Mkh4PCptDc=;
        b=iirMJkX5TBtVBUyZhgERuWocy67Ih+YkGNAMlyz1z7hETapXQWQMNUtei2ZxFqt4aE
         tuLjD4+pvFXZYKXt+6i9rdfR+3QaxCr4UxDGe7b9YelYpsGIqD5XYkWuYkHJf5s0pG1z
         G7SMKFH2cjE3R/+aoxo658VETEpH8v2BDlGYP59x1ZeK/u45FWvVxVjMROuOSQzDKZHF
         nnvwTqRydoHA2rPTxEVCwcQ40Mtfk6YbP2b7UI2lbqXs0nu8qhNUeV0zn29nHsQAaNnI
         Wf+D9glOaExqjSuXMrYBWSY6I0+wTk+qo6sius5ucrjrKYVfQtHPtqH/YzwfD7WS0fQA
         SkKA==
X-Gm-Message-State: ACrzQf2E9dzQu4ywgdZWztB4rkkMwu+OAo68POCR99oAtRsklGVAFrBM
	/S8J6yxcD7O2IdDfmXAbLiACNQ==
X-Google-Smtp-Source: AMsMyM5OSRk7h6UVPriBwCMY+CnAJExrUJsFeU6ZP8I38AN34glsQMeVrQOJadHtOCXG6lkgJT58Ew==
X-Received: by 2002:a05:6512:3996:b0:4a2:1c8c:c9a1 with SMTP id j22-20020a056512399600b004a21c8cc9a1mr213297lfu.230.1664985742272;
        Wed, 05 Oct 2022 09:02:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j15-20020a056512108f00b0049f87fb416dsm2396484lfg.12.2022.10.05.09.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 09:02:21 -0700 (PDT)
Message-ID: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
Date: Wed, 5 Oct 2022 18:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-3-f17ba2d2d0a9@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v2-3-f17ba2d2d0a9@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_090224_394403_2994B289 
X-CRM114-Status: GOOD (  17.00  )
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

On 05/10/2022 16:57, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add YAML schema for the MediaTek MT6357 regulators.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../regulator/mediatek,mt6357-regulator.yaml       | 284 +++++++++++++++++++++
>  1 file changed, 284 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> new file mode 100644
> index 000000000000..83ce2cf287dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> @@ -0,0 +1,284 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6357-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6357 Regulators
> +
> +maintainers:
> +  - Fabien Parent <fparent@baylibre.com>

The email might be not correct.

> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |
> +  The MT6357 PMIC provides 5 BUCK and 29 LDO.
> +  Regulators and nodes are named according to the regulator type:
> +  buck-<name> and ldo-<name>.
> +  MT6357 regulators node should be sub node of the MT6397 MFD node.
> +
> +patternProperties:
> +  "^buck-v(core|modem|pa|proc|s1)$":
> +    type: object
> +    $ref: "regulator.yaml#"

Drop quotes.

> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(core|modem|pa|proc|s1)$"

Why enforcing particular name of the regulator?

Both comments apply to all other cases.

Best regards,
Krzysztof


