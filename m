Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DFFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcvaOke7jkvckUlxkfXNqVWcuWhusl08Nquzy0vPQtQ=; b=oI6GgHD+3g9/w9
	zIKs+YYAtHkMC9iH71JXrnNRrAhjFNbwaBxTV4YhybJLXvTV9MZ9KKZynRBliB22qmr+PfNnaXH7E
	AYMODjnKKvWo+btaxaHeu08nUmtIGEt0Yo3J6EspXX+rXhGW+oJuo87FvOcjCI1AvTN1mZRqRNY8S
	WszJ1kjhjmVZ4nS13/iVVMIsLTxCnZ2iB+uDCBEV0G0fdG4/VDSLttA+sh4xI1Wk7s5JuaQgHATDO
	s72TodcMii0cj/uLsEeFIDL0iM0i0vBdgytkTPFaVB6VRFgd63U/Tix1YpQE5AOE4ZP2hxcr3VcIC
	ztHQG+U9mluVPLk6I53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noMt5-0017B6-5M; Tue, 10 May 2022 10:14:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noMt0-00178P-FY
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:14:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id ch13so3496710ejb.12
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dbb/ygIPwle8pAxWJvLtaKiiriFkDuqy8P36ttqmEG8=;
 b=yycP2wQZ9HF/b/5FrlR8y2OYTYX3t/FNxIguneIPCWzzxuMa0ywg/+isW+/xZ0N47N
 ftjZJcdDRDFJt1uCggycsLqPYeBjkUN247gzZUe+mmvza6I/+tCsx32K2B9ZCr3V9yF6
 RKrYdcQT01qPTOa5mRH+Po281aWca4Ubd245sIIXjuRV7GQt03eS85g1ST1oyMq9hc8O
 fDegD87KKu4LBgM39oiCem643VRaY9frJPO784Rv7P/OOIklEqi9CCoMsaGLPvvAIAwK
 Si7cnMCsNwVQqMN4rRFLobj8ZoLw1qSoG04rGJKd4aktEiJJNk5jvixFdKG+0fFl6ZpQ
 lDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dbb/ygIPwle8pAxWJvLtaKiiriFkDuqy8P36ttqmEG8=;
 b=SxgbaRMx3jHC4Qd/g/Zhg8QG0/eWoISgb86Hc+IundbMiAuGfitWW+Kolv3CMIzVld
 Gh2cWW5I1xcE6eiypoWamhIrCiiB75CrHy3W8zHK7W8GGi2xPE1WC2tFbJVsKuprEANi
 E2JY5880ckBw9ksVJauDzxUA9Jf5oZO0FXGAuvHgtC0SCloOkd0mWZGvovAiq/UApm5P
 CYenG2OYRThrOWYcxjPemLVF6SCDfK2cS7/GXD6qC3VIe00/pQf3T9n/HovRxmJWuue+
 dK75FDRO7YA5GKsuNyI8XobGmxlSi9HjS70frW04YLcOuWgqzjYY6jmjNLUpQVDjoih2
 CXfQ==
X-Gm-Message-State: AOAM531JqI+G3BTWVcLnfFwTw21Nx3zTPhAKlvSqtfj9srTlIwgB5WQu
 cOBDXR4xQLCwWLXhWPJfdJ9YQQ==
X-Google-Smtp-Source: ABdhPJydVj8m9S+WzagJO2lkw35EdeHC09Xmn2fKUVMjIUdi8GsSf/3KkrMZdALGKxBPh4z0+VaMZw==
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr18248840ejc.572.1652177669239; 
 Tue, 10 May 2022 03:14:29 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w1-20020a1709064a0100b006f3ef214db4sm5972354eju.26.2022.05.10.03.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 03:14:28 -0700 (PDT)
Message-ID: <ece7675a-a386-0a16-a087-2469758917f7@linaro.org>
Date: Tue, 10 May 2022 12:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: pmic: mt6366: add binding document
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 tinghan.shen@mediatek.com, hsin-hsiung.wang@mediatek.com,
 sean.wang@mediatek.com, macpaul.lin@mediatek.com, wen.su@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220510064603.15920-1-zhiyong.tao@mediatek.com>
 <20220510064603.15920-2-zhiyong.tao@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510064603.15920-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_031434_595663_02F482C6 
X-CRM114-Status: GOOD (  15.73  )
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

On 10/05/2022 08:46, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> The commit adds mt6366 binding document.

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/regulator/mt6366-regulator.yaml  | 405 ++++++++++++++++++
>  1 file changed, 405 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6366-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6366-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6366-regulator.yaml
> new file mode 100644
> index 000000000000..1f125f5ba860
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6366-regulator.yaml

Filename with vendor, so "mediatek,mt6366-regulator.yaml"

> @@ -0,0 +1,405 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mt6366-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6366 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |
> +  List of regulators provided by this controller. It is named
> +  according to its regulator type, buck_<name> and ldo_<name>.
> +  MT6366 regulators node should be sub node of the MT6397 MFD node.
> +

Missing properties node, missing compatible. How is it supposed to
match? If you plan to use it as part of other binding, please send
entire patchset (including the binding which uses this one).

In current form this looks untestable, unusable.

> +patternProperties:
> +  "^buck_v(dram1|core|pa|proc11|proc12|gpu|s2|modem|s1)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(dram1|core|pa|proc11|proc12|gpu|s2|modem|s1)$"
> +
> +    unevaluatedProperties: false

Put this one after $ref (other places as well). Makes it more readable.

> +
> +  "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":

No underscores in node names.

> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":

No underscores in node names, in all places.

> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
> +
> +    unevaluatedProperties: false
> +

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
