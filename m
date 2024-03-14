Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D10C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfhA2rcacs4IE2CXjPGRD2+G776hpGDEtkL4YcYM5Ig=; b=U2ef/ApQQ62+LS4HOX5m8KEnqO
	NXn2uIjzX0wPs8DcWFX/u5QROqbnm7GiF3m9Ay7IKW7eeA64Mkc/mhDreDoWyYwN4/Qyl+BkGm+bZ
	IuCBlEnClEhcJDDSIajcW0ffUdOjcvQazJFwZtqBH1rVW6kKA4vZsFDUcvWpqkRQy3Re0sax1CyB3
	lryfBFu7BQrRpR685nqAWu07R26sPU2ZEYrEgPDhuCJz+YTdBuq8uzhStxnhXZp51Hgokyzz9a8FV
	gj6q9lCtXMScvsf/r142IQI+pCrTA4kdCWoLKhIfhMaxnsJrDlDfF250FsQA2IElwgFYrWvjjQw+N
	QhFFQfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklwv-0000000Ebp7-198V;
	Thu, 14 Mar 2024 14:20:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklwq-0000000Ebo1-33os
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Mar 2024 14:20:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-41312232c7aso13205265e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Mar 2024 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710426040; x=1711030840; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NfhA2rcacs4IE2CXjPGRD2+G776hpGDEtkL4YcYM5Ig=;
        b=ceoV5zLXNauPYXAu7SQYDiCgbAFQgqKbwMAc2veY6IS5DlUA2sNvm58QsQUW8bmdf2
         JapGu8GovfcvVF5zm6jmFFGRhV3cIh3qff0opQJ6FgXyfWA6FA2uOlyC2qf6P0v2IzLV
         DdpseW3xvfhei3+rlmtEmbuLrrt5S4s9VMjVmNW7l8M5XPD6uSeZSqdCnRTyKPhuwqld
         kqa4vUUiOI6c1rlb1ePEcvvunN+v9JCXa3s3UXXQwThhpoeN4+dJJVY42TVnWsREgM3H
         BTQwzBvZj+uwETPux1d2L1nkglvAS5hTPnuzXZqGHcb72VyFdP2ibqb+TrfE9a7Z81lq
         fIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426040; x=1711030840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NfhA2rcacs4IE2CXjPGRD2+G776hpGDEtkL4YcYM5Ig=;
        b=tPjLpf1JXHaLIPjhWClYI+ALlaQbImHe1yT9bh+c3vfngjtny6S7b73uAbKdqoet0P
         NLFCXO6wrpum5DyJB1SitRI3+paDJJPQNa2RPa3oDqd0Hy5xz0Ttpd8ukZjIhG8os45J
         JruiL/Bb0hvel6Ct5EEBeC3nMot4HWn66rqOcI6r7rm7DwFcSPplr6t1S5dppQ1h/Gug
         xkyVSWCbwnyd8cctE5YQ0EjLhe0o6GCeyXLlzvS29fW8GALruUzP1aStYoNi35Qtz9xa
         2ln29odpQbZVuPLpj3haE+EJdb4iJOioT5MEnmgiseTEqZ1yvIAj6uh9maYt1urQ4axi
         qMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnYZHf55DtCefIFIaM7vwQFWe6dBZiekUxdA3cy0jruh250h2/ocj7CbI+hVmYAnUTGolRWZKZYCPV2ZUCBJzrGd7UKOU7g2MHPdXwWlPQNm66
X-Gm-Message-State: AOJu0YzNHOeyjV8dtLUQmqlgBravpGAuLywEOHDooQ3I9ZNszR9XF10+
	kvKpPE6ooJciTWxRnU0nvPviScUeYiDCCGfhTF9e0MRUy0h+rpvlprkkliIa7N4=
X-Google-Smtp-Source: AGHT+IHkGwyJQaOjxzAn/h0Hw8KEduL+99EUU5TnzJA1fh7kH1MCPQ+RoIlJDqkZKMILpKwSNp8oKw==
X-Received: by 2002:a05:600c:5026:b0:413:e93b:cdf with SMTP id n38-20020a05600c502600b00413e93b0cdfmr2123996wmr.13.1710426039834;
        Thu, 14 Mar 2024 07:20:39 -0700 (PDT)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b00412f016a151sm2606983wmq.9.2024.03.14.07.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:20:39 -0700 (PDT)
Message-ID: <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
Date: Thu, 14 Mar 2024 14:20:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple
 DT
Content-Language: en-US
To: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org,
 linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072045_005256_D291119A 
X-CRM114-Status: GOOD (  31.44  )
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

Hi Amrit,

On 14/03/2024 12:11, Amrit Anand wrote:
> Qualcomm produces a lot of "unique" boards with slight differences in
> SoC's and board's configuration. For eg, there can be SM8150v1 on MTPv1,
> SM8150v1 on MTPv2, SM8150v2 on MTPv2, SM8150v2 on MTPv2 with a different
> PMIC, SM8150v2 with no modem support and so on. For instance, suppose we
> have 3 SoC, each with 4 boards supported, along with 2 PMIC support for
> each case which would lead to total of 24 DTB files. Along with these
> configurations, OEMs may also add certain additional board variants. Thus
> a mechanism is required to pick the correct DTB for the corresponding board.
> 
> Introduce mechanism to select required DTB using newly introduced device
> tree properties "board-id" and "board-id-type". "board-id" will contain
> the list of values of "qcom,soc-id", "qcom,board-id", "qcom,pmic-id" or
> "qcom,oem-id". "board-id-types" contains the type of parameter which is
> entered. It can be either "qcom,soc-id", "qcom,board-id", "qcom,pmic-id"
> or "qcom,oem-id".

Thanks for working on this, it's nice to finally see this logic
documented in the kernel.
> 
> Qualcomm based bootloader will use these properties to pick the best
> matched DTB to boot the device with.
> 
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 7f80f48..dc66ae9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1100,6 +1100,76 @@ properties:
>        kernel
>        The property is deprecated.
>  
> +  board-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 2
> +    description: |
> +      Qualcomm specific bootloader uses multiple different identifiers
> +      (qcom,soc-id, qcom,board-id, qcom,pmic-id, qcom,oem-id) to select
> +      single Devicetree among list of Devicetrees. For different identifiers,
> +      the selection can be done either based on exact match (where the
> +      identifiers information coming from firmware should exactly match
> +      the ones described in devicetree) or best match (firmware provided
> +      identifier information closely matches with the one of the Devicetree).
> +      Below table describes matching criteria for each identifier::
> +      |----------------------------------------------------------------------|
> +      |  DT property  |  Individual fields   |   Exact  |  Best  |  Default  |
> +      |----------------------------------------------------------------------|
> +      | qcom,soc-id   |                                                      |
> +      |               |  Chipset Id          |     Y    |    N   |     -     |
> +      |               |  SoC Revision        |     N    |    Y   |     -     |
> +      | qcom,board-id |                                                      |
> +      |               |  Board Id            |     Y    |    N   |     -     |
> +      |               |  Board Major         |     N    |    Y   |     -     |
> +      |               |  Board Minor         |     N    |    Y   |     -     |
> +      |               |  Subtype             |     Y    |    N   |     0     |
> +      |               |  DDRtype             |     Y    |    N   |     0     |
> +      |               |  BootDevice Type     |     Y    |    N   |     0     |
> +      | qcom,pmic-id  |                                                      |
> +      |               |  Slave Id            |     Y    |    N   |     0     |
> +      |               |  PMIC Id             |     Y    |    N   |     0     |
> +      |               |  PMIC Major          |     N    |    Y   |     0     |
> +      |               |  PMIC Minor          |     N    |    Y   |     0     |
> +      | qcom,oem-id   |                                                      |
> +      |               |  OEM Id              |     Y    |    N   |     0     |
> +      |----------------------------------------------------------------------|
> +      For best match, identifiers are matched based on following priority order::
> +      SoC Revision > Board Major > Board Minor > PMIC Major > PMIC Minor
> +
> +  board-id-types:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +       Each field and helper macros are defined at include/dt-bindings/arm/qcom,ids.
> +    minItems: 2
> +    items:
> +       oneOf:
> +         - const: qcom,soc-id
> +           description:
> +              Matches Qualcomm Technologies, Inc. boards with the specified SoC.
> +              2 integers are needed to describe a soc-id. The first integer is the
> +              SoC ID and the second integer is the SoC revision.
> +              qcom,soc-id = <soc-id  soc-revision>
> +         - const: qcom,board-id
> +           description: |
> +              Matches Qualcomm Technologies, Inc. boards with the specified board.
> +              2 integers are needed to describe a board-id. The first integer is the
> +              board ID. The second integer is the board-subtype.
> +              qcom,board-id = <board-id  board-subtype>
> +         - const: qcom,pmic-id
> +           description: |
> +              Qualcomm boards can be attached to multiple PMICs where slave-id (SID)
> +              indicates the address of the bus on which the PMIC is attached. It can be
> +              any number. The model for a PMIC indicates the PMIC name attached to bus
> +              described by SID along with  major and minor version. 2 integers are needed
> +              to describe qcom,pmic-id. The first integer is the slave-id and the second integer
> +              is the pmic model.
> +              qcom,pmic-id = <pmic-sid pmic-model>
> +         - const: qcom,oem-id
> +           description: |
> +              Matches Qualcomm Technologies, Inc. boards with the specified OEM ID.
> +              1 integer is needed to describe the oem-id.
> +              qcom,oem-id = <oem-id>
> +
>  allOf:
>    # Explicit allow-list for older SoCs. The legacy properties are not allowed
>    # on newer SoCs.
> @@ -1167,4 +1237,24 @@ allOf:
>  
>  additionalProperties: true
>  
> +examples:
> +  - |
> +    #include <dt-bindings/arm/qcom,ids.h>
> +    / {
> +         model = "Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform";
> +         compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
> +
> +         #board-id-cells = <2>;
> +         board-id = <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(1)>,
> +                    <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(2)>,
> +                    <QCOM_BOARD_ID(IDP, 1, 0) QCOM_BOARD_SUBTYPE(UFS, ANY, 1)>;
> +         board-id-types = "qcom,soc-id",
> +                          "qcom,soc-id",
> +                          "qcom,board-id";
Forgive me if this is a particularly cynical view, but this seems
incredibly blatant, the "qcom,board-id" property is deprecated for
various good reasons, just using a key/value map where "qcom,board-id"
is a key doesn't change that. There are two main issues I have with the
proposal here:

1. This breaks backwards compatibility, millions of production devices
with bootloaders that will never receive another update might be
compatible with the downstream "qcom,board-id" property, but they won't
work with this.
2. A top level board-id property that isn't namespaced implies that it
isn't vendor specific, but the proposed implementation doesn't even
pretend to be vendor agnostic.

U-Boot also has some ideas around this issue, there you can pass in
multiple DTBs and provide some board specific "best match" function.
I think there's definitely some value in exposing this information, but
there's no good reason to define the same data as `qcom,board-id` while
breaking production bootloaders.
> +
> +         #address-cells = <2>;
> +         #size-cells = <2>;
> +    };
> +
> +
>  ...

-- 
// Caleb (they/them)

