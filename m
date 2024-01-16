Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B944DC47DA2
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 16:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEOjtDtYVBOB1Sc9meCvWqA+RQADIvF7Dvcqsf5Mj80=; b=VGoTOnmGyOTt+iBgxvRIuFaPBb
	YGPocIRaEE43KDPzGIOVhj61tomlposxmzMZdfXRznljEGxTWpGdN8PEV0nizAcpC1XoEai4efj6V
	m/b9d/tEEnPEjTHX+WNu7YfxoGqcopO4RNd6qRzcfItl4fz8tMIjd8acNpz8X5C+qh4suygZRfWC2
	6UZOZ2RHSKzb694VGQ+frBvqDrpkfl7T8IgfPUdzR6ymagRVvK1+RROyPzexI9DBmHv0e7XlhUzjj
	vyBdFbggp6lRp5tIqDMf3OagMgXRJ526yZH3jeXmqLKvWCcRn7ToUGXHLpb4/EbEX0mxrUBwwAZ1m
	3SI98KfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPm4a-00CYxj-1x;
	Tue, 16 Jan 2024 16:13:56 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPm4W-00CYut-2W
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jan 2024 16:13:54 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so5000271a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jan 2024 08:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705421629; x=1706026429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEOjtDtYVBOB1Sc9meCvWqA+RQADIvF7Dvcqsf5Mj80=;
        b=PxYisJeijN5gN5tAMqDp2H1WYIcwABMJAiGPCmWDgjQNJ4LpYqCGxkGMpYQtsfX3XY
         vmkgmDHmOiu78i7QrWXMZJXp2fG5gB8VMUxOIJ6wFGBI3Xi+05zhisg19v4BNBwO/RD+
         SOd32Tqj7ZWPSzUnrpDj7ZiUyQNeJ8MRpauhOduTvz0ptKCdpTzbfw9D4i8inahqPnY2
         dSa1gkxZSYrX5ZC4Br5QiCbo8xpZ6iSv9SG6GSwUDiG9d7rLyega3T8V7Aqs28p5T6NN
         ggtP60XMcqvZYwkxVXw1XZpejMp5K6831ShzMsCeujV970MyOuNRp2KDUSqcfcL8rCNh
         Ngqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705421629; x=1706026429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEOjtDtYVBOB1Sc9meCvWqA+RQADIvF7Dvcqsf5Mj80=;
        b=q1S+TLJYvM9iaCy8ioGI+rm4QLJFHyZmnfsDXA0MmpGFqAqpBCzPp4lubBva4jL7rY
         U6rhTG4AgnuEFjrzGEYEZXEs++I1q099FXE3V47iB4IlgyGBrpBxJMSjQCB6y5NKfa7p
         PjKGTuxlbYOb/X/FhswuhD2xBi8EFFf/dBhNGbP7jpR4z30RrDAlm/Rp+qhRbMYxLzNP
         +O2xZrkEUA2XvitYcgrwql1efhu/7fjm3FLlyAdu825exKpb5gFZtsmibsC8AwA6Ye5+
         0C2LP0mehqmRePLQNGKGtH5rvHPQbl/dZ3BoPWmLhDoJS1dF6sv8XblcSuQAOSmahPob
         U1Gw==
X-Gm-Message-State: AOJu0Yyjo6URu0J/WFRR0Xd+uIC8eDBw8aeHX62tdrXqoPhkxPiSxWYs
	qrnOX0nkI6j+9RYOtPxojjIhXymclt73bQ==
X-Google-Smtp-Source: AGHT+IGqo6AFxOY/lJm+DyF6xmEXUShCosfyfZqWOZaC24dFB/lBB7V8xo1CdgEHQp2/QnY9hCKm0A==
X-Received: by 2002:a17:90a:ad8b:b0:28d:b72f:a63b with SMTP id s11-20020a17090aad8b00b0028db72fa63bmr3758818pjq.69.1705421629666;
        Tue, 16 Jan 2024 08:13:49 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800::5ced])
        by smtp.gmail.com with ESMTPSA id sd5-20020a17090b514500b0028d573397dcsm14451049pjb.42.2024.01.16.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 08:13:49 -0800 (PST)
Date: Tue, 16 Jan 2024 09:13:46 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: do not override firmware-name
 $ref
Message-ID: <ZaarOuqx3jzftWU3@p14s>
References: <20240115182031.1610088-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115182031.1610088-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_081352_823215_41BCE53A 
X-CRM114-Status: GOOD (  18.19  )
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

On Mon, Jan 15, 2024 at 07:20:31PM +0100, Krzysztof Kozlowski wrote:
> dtschema package defines firmware-name as string-array, so individual
> bindings should not make it a string but instead just narrow the number
> of expected firmware file names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml     | 4 ++--

For the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  .../devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml       | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml       | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml      | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml       | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml       | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml       | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml       | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml       | 2 +-
>  .../devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml        | 2 +-
>  11 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 09102dda4942..507f98f73d23 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -47,7 +47,7 @@ properties:
>      maxItems: 1
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description:
>        If present, name (or relative path) of the file within the
>        firmware search path containing the firmware image used when
> @@ -115,7 +115,7 @@ patternProperties:
>          maxItems: 1
>  
>        firmware-name:
> -        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
>          description:
>            If present, name (or relative path) of the file within the
>            firmware search path containing the firmware image used when
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
> index eb868a7ff4cd..ad45fd00ae34 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
> @@ -46,7 +46,7 @@ properties:
>      description: Reference to the reserved-memory for the Hexagon core
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> index c054b84fdcd5..66b455d0a8e3 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> @@ -45,7 +45,7 @@ properties:
>    smd-edge: false
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> index b6bd33438584..9381c7022ff4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> @@ -80,7 +80,7 @@ properties:
>      description: Reference to the reserved-memory for the Hexagon core
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description:
>        The name of the firmware which should be loaded for this remote
>        processor.
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
> index 4744a37b2b5d..45ee9fbe0966 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
> @@ -42,7 +42,7 @@ properties:
>      description: Reference to the reserved-memory for the Hexagon core
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> index 028287235912..758adb06c8dd 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> @@ -47,7 +47,7 @@ properties:
>    smd-edge: false
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
> index f7e40fb166da..c1a3cc308bdb 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
> @@ -42,7 +42,7 @@ properties:
>    smd-edge: false
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
> index 3e4a03eb4532..7286b2baa19f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
> @@ -36,7 +36,7 @@ properties:
>      description: Reference to the reserved-memory for the Hexagon core
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>    smd-edge: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> index 238c6e5e67c5..d67386c50fa4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> @@ -46,7 +46,7 @@ properties:
>    smd-edge: false
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
> index 53cea8e53a31..4b9fb74fb9e9 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
> @@ -47,7 +47,7 @@ properties:
>      description: Reference to the reserved-memory for the Hexagon core
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description: Firmware name for the Hexagon core
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> index 45eb42bd3c2c..8e033b22d28c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> @@ -51,7 +51,7 @@ properties:
>        - const: stop-ack
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description:
>        Relative firmware image path for the WCNSS core. Defaults to
>        "wcnss.mdt".
> -- 
> 2.34.1
> 

