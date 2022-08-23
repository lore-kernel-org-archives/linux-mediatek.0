Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E55FC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hl2ZhT5jYud6nqmuitdZrPDQAyGkFVueC+KbleXIJi0=; b=FQRsmcCY0BymIyJ8RHqUAFMg8A
	8+JBJ7WRyXF8loqaKWmaJgw2tJsmon8sO3549IwVfdaVTnUc8TBCkhwnsabyDQ6YeoW7bNc3mo9wb
	+UllLTdZ/9uv+IJ40OnjD5/jv7SETIBCtq419q3o9kIFSDvzMgMS7RwX33Hg/ZUPJrk5GvBS3/jq/
	Mv7w67zVCoc8o9PUCgKa+y10cFQFaDM3/ff8cJRbYKFebJYK8jPW1g+GNfhWKxRwloHXf2OR+7g69
	OUdraPBue1AjZXaILLg1bjp0afb37D973EjPnK2NBFJ5AOwBXrzCglHyPMR6pI0rAuAc2UlVPEKbo
	Q4ERp9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYYu-00832b-1c; Tue, 23 Aug 2022 18:23:40 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYYi-0082zJ-7a; Tue, 23 Aug 2022 18:23:29 +0000
Received: by mail-qk1-x729.google.com with SMTP id g16so10939289qkl.11;
        Tue, 23 Aug 2022 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=hl2ZhT5jYud6nqmuitdZrPDQAyGkFVueC+KbleXIJi0=;
        b=JrIa1OFDqt41Da0UO3IcnulL7dkdWXnYr6hnZMzWYSbcrkSN7ou30SIEnzMbJrKsY6
         u5CuHohXigZbEbyhpYK9JlS6swj+dpVrb1cli96GwuysoJtnaf2+65TX34uEdUsOtCoN
         Fr6Njl3SuprVW+ahKp2U4qoTQ3hDUR702g2c1SyBlYjS9leEBj6OQiQj0QI40xwIp8pV
         juISk+iYdvTEfJSIedYrRpGdJbMj8Zp6RupnPX6dBLSeTZSa1DM96OsTPNrOMaxdFA9J
         8dbyE9d9W5uHSlC468z302NWFPX5zLLvxWhAtaTmnaK2pV/VKA28fCze7L4vEn2F+6jT
         7DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hl2ZhT5jYud6nqmuitdZrPDQAyGkFVueC+KbleXIJi0=;
        b=zf5W+XQsmpMlKPrvcViwET6HlxVEjGd3CMgUcv5pOpigvY0zneuQQmYbBybgCYc0HD
         ZkN3uJLFMbQF9fRDKlm4kwEah/vsNPqtupUz6h/yWvALRWfc2nW591veZGBoQ1h+NfZO
         vfzoVQZUHom/mbRsTxVVHAH/YUny0HLmucRzYVDkd6jkDAfsxG3gMzrR5Whc6wn1BSrx
         CIi9Zhl29gZZcweGM5Lt47fKW07Dg2WRWB90XjeZcp8tJaURIsvbICJNMLE7DrEFcV2G
         BxkkjOlvdRFZrvQnLAq2KcTTPNhTVNgYp9eRu2AskWYZtcwiEgVKFNntMAMZk9Y+oNJg
         eijQ==
X-Gm-Message-State: ACgBeo1/2f5EhOL959Fc64JwWmAFKWYWkENH6cDRpHpbxMlxtaluhS2Z
	MFvMaje4Bn1zkVC5Eb8z024GkxRASKrJ29FWl7o=
X-Google-Smtp-Source: AA6agR6uzuFu5gu6+eBn1q09mUSGCdjReoka/EFxwiWXrFCxt/cPbOLXqEiSJanMMVL/Mgl9gFFX4Aap050CjTsOfDM=
X-Received: by 2002:a37:27c1:0:b0:6bb:41b5:2d89 with SMTP id
 n184-20020a3727c1000000b006bb41b52d89mr17033459qkn.679.1661279004133; Tue, 23
 Aug 2022 11:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145649.3118479-7-robh@kernel.org>
In-Reply-To: <20220823145649.3118479-7-robh@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Tue, 23 Aug 2022 20:23:13 +0200
Message-ID: <CAOX2RU4u+v9EPAPoxZmL4iGAmt+VuuxNJW-_AE7TZaFHZBTaEA@mail.gmail.com>
Subject: Re: [PATCH] regulator: dt-bindings: Add missing (unevaluated|additional)Properties
 on child nodes
To: Rob Herring <robh@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Javier Martinez Canillas <javier@dowhile0.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Adam Ward <Adam.Ward.opensource@diasemi.com>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	ChiYuan Huang <cy_huang@richtek.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_112328_319511_C9C4AFAE 
X-CRM114-Status: GOOD (  16.83  )
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

On Tue, 23 Aug 2022 at 16:57, Rob Herring <robh@kernel.org> wrote:
>
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/regulator/dlg,da9121.yaml           |  1 +
>  .../bindings/regulator/maxim,max77802.yaml       |  1 +
>  .../bindings/regulator/maxim,max8997.yaml        |  1 +
>  .../bindings/regulator/mt6315-regulator.yaml     |  1 +
>  .../bindings/regulator/qcom,spmi-regulator.yaml  |  1 +
>  .../regulator/qcom-labibb-regulator.yaml         | 16 ++++++++++++++++
>  .../regulator/richtek,rt4801-regulator.yaml      |  1 +
>  .../regulator/rohm,bd71815-regulator.yaml        |  1 +
>  8 files changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/regulator/dlg,da9121.yaml b/Documentation/devicetree/bindings/regulator/dlg,da9121.yaml
> index 24ace6e1e5ec..63e1161a87de 100644
> --- a/Documentation/devicetree/bindings/regulator/dlg,da9121.yaml
> +++ b/Documentation/devicetree/bindings/regulator/dlg,da9121.yaml
> @@ -83,6 +83,7 @@ properties:
>
>    regulators:
>      type: object
> +    additionalProperties: false
>      description: |
>        List of regulators provided by the device
>
> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> index 236348c4710c..71138c611b6c 100644
> --- a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> @@ -79,6 +79,7 @@ patternProperties:
>      patternProperties:
>        regulator-state-(standby|mem|disk):
>          type: object
> +        additionalProperties: true
>          properties:
>            regulator-mode: false
>
> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
> index 4321f061a7f6..2b266ea43716 100644
> --- a/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
> @@ -111,6 +111,7 @@ properties:
>
>    regulators:
>      type: object
> +    additionalProperties: false
>      description:
>        List of child nodes that specify the regulators.
>
> diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> index 37402c370fbb..364b58730be2 100644
> --- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> @@ -29,6 +29,7 @@ properties:
>        "^vbuck[1-4]$":
>          type: object
>          $ref: "regulator.yaml#"
> +        unevaluatedProperties: false
>
>          properties:
>            regulator-compatible:
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml
> index 8b7c4af4b551..3266cd0c580f 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml
> @@ -35,6 +35,7 @@ patternProperties:
>      description: List of regulators and its properties
>      type: object
>      $ref: regulator.yaml#
> +    unevaluatedProperties: false
>
>      properties:
>        qcom,ocp-max-retries:
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> index 1ddc1efd19e2..f97b8083678f 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> @@ -20,6 +20,7 @@ properties:
>
>    lab:
>      type: object
> +    additionalProperties: false
>
>      properties:
>        qcom,soft-start-us:
> @@ -33,11 +34,19 @@ properties:
>          description:
>            Short-circuit and over-current interrupts for lab.
>
> +      interrupt-names:
> +        minItems: 1
> +        items:
> +          - const: sc-err
> +          - const: ocp
> +
>      required:
>        - interrupts
> +      - interrupt-names
>
>    ibb:
>      type: object
> +    additionalProperties: false
>
>      properties:
>        qcom,discharge-resistor-kohms:
> @@ -52,8 +61,15 @@ properties:
>          description:
>            Short-circuit and over-current interrupts for ibb.
>
> +      interrupt-names:
> +        minItems: 1
> +        items:
> +          - const: sc-err
> +          - const: ocp
> +
>      required:
>        - interrupts
> +      - interrupt-names
>
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/regulator/richtek,rt4801-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rt4801-regulator.yaml
> index 091150c4e579..4a8a221bc902 100644
> --- a/Documentation/devicetree/bindings/regulator/richtek,rt4801-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/richtek,rt4801-regulator.yaml
> @@ -42,6 +42,7 @@ patternProperties:
>    "^DSV(P|N)$":
>      type: object
>      $ref: regulator.yaml#
> +    unevaluatedProperties: false
>      description:
>        Properties for single display bias regulator.
>
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> index 7d0adb74a396..d61e8675f067 100644
> --- a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> @@ -27,6 +27,7 @@ properties:
>      description:
>        properties for wled regulator
>      $ref: regulator.yaml#
> +    unevaluatedProperties: false
>
>      properties:
>        regulator-name:
> --
> 2.34.1

For qcom,spmi-regulator.yaml:
Reviewed-by: Robert Marko <robimarko@gmail.com>
>

