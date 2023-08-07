Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A6EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 06:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3A446E/kT3GEJ5OdOfp6vlTjEoG2ufXKFcEfUJuKEMI=; b=GxirTy+OhRkxSi9RTSG2vuVmcE
	Kx4FJ03/o3rpMRhDROIUJpAJqGY3cPaMUJwcQ/0q6HSOkDUbRFoYCflQmT2kC+NVNYa6fQMh6OuLZ
	VXFIFR0u/XTduGDOmlK0ITka5X6l9emfY8+BoMp4bSykxk3pD5CDQaZwmZgsuVW0WLbYoifo2/t/7
	Ou0pppEwkuMSSvmIlZRulpUC+z2M9T3mivbHSFXwHIGaBFVOC2j1cM4sDteex9zWG2Hrj5b8Nc3Uh
	4qKs2heDrv9G4DoPOt5NzLKYGEo0ckyaJ+giezSNzaiOd6vnhny5L/hjnoCuSo2zZ4Ymhc85+a5d+
	KO2xSwkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSten-00GGK3-1I;
	Mon, 07 Aug 2023 06:23:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStek-00GGJ0-0N
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 06:23:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so24868895e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Aug 2023 23:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691389431; x=1691994231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3A446E/kT3GEJ5OdOfp6vlTjEoG2ufXKFcEfUJuKEMI=;
        b=wY2Bp5xhxoMYp9AWapejnTHfg+ixw+U4HdSL7LFDfxm1JL3Sd3BL4myGDItmJgB6/s
         zV5taHSANXkoO8LH9RME+CUJLq4IgqsXy6oZRYJjWa7b+FLh+ec28dPyngJlywQwWSST
         Rfj+3Hujx0jViEih2fanVRArvPyRS348FK6ZIXEydCv7x0nvC7JTz3h5ggDqtScEpfYh
         sI/YoU6nhDalj3uqCPbhdKZ+v3FBy5xJp8Hy3hd7AckJJxUMGa6yqx+paVcadbX/FxO5
         PklfjvLiwNpWgZ11q/yhX3nh9dXdHsMitzgLHwl/3lej+1dFTGXN7CELuu2MU89O/th1
         +aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691389431; x=1691994231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3A446E/kT3GEJ5OdOfp6vlTjEoG2ufXKFcEfUJuKEMI=;
        b=g0obWoPVq0gvJHV6bewPMNf+6lRAu6czmCDEm+UFeQcDTyBhoiuvGmhrA7u9637f5i
         XWvsBKOVWIgxXEYak1VyQpkjOJv9gBuSF5YQk/AT0LgwgPHytSJC8r21WXhqeiDHgszb
         inFcRxfD+r9JPRs7phttSb855i/4VhpKC4ycMGw3wQhE6V5HvGYMU6dpqIpaPErZdeDY
         Yxhg9ywqt0n6pLwF4mm/puvWeY7S9JqqIWBeQBFnb6QITeDiUnrvWjae+iFZ+4awRxza
         UuUtQfP5zV21zOmXt1Xs2yOomKTtFxpFC6V60iAgrpCD7+sXCrPfQA6ik7Z5hLrVP8+1
         yaSw==
X-Gm-Message-State: AOJu0Yw8u777dpidxMHRv4nBJq0AXP5zTLvMfuUsOrK8xw9mkhJl0aOV
	gZnOFr/WQMNr9jfhBzdRCay5cQ==
X-Google-Smtp-Source: AGHT+IG0HwQnerR7/Jt+ZlEFWrzo/YHVAHF7jx+cIf1OJDRkcHOwo7Ixn6i8JDQMCLC5UL0HXqh+Aw==
X-Received: by 2002:a05:600c:2286:b0:3fa:8c68:4aba with SMTP id 6-20020a05600c228600b003fa8c684abamr6193638wmf.25.1691389430634;
        Sun, 06 Aug 2023 23:23:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b003fe2b6d64c8sm13923548wmi.21.2023.08.06.23.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 23:23:50 -0700 (PDT)
Message-ID: <6bf91ced-076f-ecc1-f626-f531f7d991bd@linaro.org>
Date: Mon, 7 Aug 2023 08:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/9] regulator: dt-bindings: mediatek: Add MT6366 PMIC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230803074249.3065586-1-wenst@chromium.org>
 <20230803074249.3065586-5-wenst@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230803074249.3065586-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_232354_153130_8AE1359B 
X-CRM114-Status: GOOD (  20.32  )
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

On 03/08/2023 09:42, Chen-Yu Tsai wrote:
> From: Zhiyong Tao <zhiyong.tao@mediatek.com>
> 
> The MediaTek MT6366 PMIC is similar to the MT6358 PMIC. It is designed
> to be paired with the MediaTek MT8186 SoC. It has 9 buck regulators and
> 29 LDO regulators, not counting ones that feed internally and basically
> have no controls. The regulators are named after their intended usage
> for the SoC and system design, thus not named generically as ldoX or
> dcdcX, but as vcn33 or vgpu.
> 
> Add a binding document describing all the regulators and their supplies.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> [wens@chromium.org: major rework and added commit message]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since Zhiyong's last version (v4) [1]:
> - simplified regulator names
> - added descriptions to regulators
> - removed bogus regulators (*_sshub)
> - merged vcn33-wifi and vcn33-bt as vcn33
> - added missing regulators (vm18, vmddr, vsram-core)
> - cut down examples to a handful of cases and made them complete
> - expanded commit message a lot
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20220823123745.14061-1-zhiyong.tao@mediatek.com/
> 
>  .../regulator/mediatek,mt6366-regulator.yaml  | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> new file mode 100644
> index 000000000000..715c6ffcb3ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6366 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> +
> +description: |
> +  Regulator part of the MT6366 PMIC. This node should be under the PMIC's
> +  device node.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6366-regulator
> +
> +  vsys_ldo1-supply:

Don't use underscores in property names. Only hyphens, if needed.

> +    description: Supply for LDOs vfe28, vxo22, vcn28, vaux18, vaud28, vsim1, vusb, vbif28
> +  vsys_ldo2-supply:



Best regards,
Krzysztof


