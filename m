Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0823CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXVAQ6YCxaql2PnrFc8uwn29EJDszDo6Iic48te9xOI=; b=H6IGz72Mfshp3QU0Fe6ETQHFKi
	R3DxmTAmYex8J4SGkz0+I1TJrly2hTXZSGfbcZfm9TeEd8tzQ/SQlZjJkUxKGHm18svO3pQtZ6bFe
	gHj6QHuWvt0026wVsTrzKxY0S4WL34ofw9rRg1RBeIJjNLg8Zcg69XePlUowBtz4Y1uvTgWVkqYNb
	7vM3Ip90bKxhsgqhNsKX3dkLEIPnRQejoLAzAjWiDp8OnA/x38Yq8KyOhV+iOr1GD70zX/dRCkaM/
	kBnDsrbsh0pEM/+GKxduYntuuGmH2LzEk1eMvReEuVSXA5l4ze9sZarrQ5pIV8HkQF7k8XRtHJm3z
	kjsyRZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPEJ-000000005Hh-0APS;
	Fri, 07 Nov 2025 16:22:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPEG-000000005GX-1UT7
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 16:22:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-421851bcb25so517784f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762532542; x=1763137342; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eXVAQ6YCxaql2PnrFc8uwn29EJDszDo6Iic48te9xOI=;
        b=UnZtZxWNJK1IYTYGrCtF7RW4MFPOWF3ErCD4/KMhCCHSAVRrGl6Kd9cWRPHSZuULXp
         acYF/PmFKiphtj7wxzRmjuyZB8OUnmg5YythszAcYgjvaEO3o7jrGPyskh6fQF6DX26N
         a4haKMsahJjMi1tVKoqrhqiw+LCYDWSr8tU4RlEJYGgoUuVLpYGLCRTELo1BQ5Spkq1E
         CmdXga4qnkZ9FsOnSwIA98LKPw+bXqnoJJoGSMXOH3fngOXW3SJgoaY94aN5rIEDHhn4
         EtaO2o++D31dlRvIr6XJnrycOxt0n4PbFEsiXxF6IYhJcmcz2qT6UkPfvNcVVFtaS+EJ
         UJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532542; x=1763137342;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eXVAQ6YCxaql2PnrFc8uwn29EJDszDo6Iic48te9xOI=;
        b=QadOFVZCiC+2ZwbhYmkqblmLF9RIKBOaHPp39ES99vDwGHrWiWq3XgTLzeKdO0kmDm
         76QXtZqaEEw/O6ADL46N4RisfTdtc6biEuRl+LEF6NcesL49knqhlxF1NpcKLgwI78W6
         g1PWdTFjuWyUbB3fprplCEbds5rVl2pTYm8xUS2dzgsANPLVxnToENJVsyjJTfmzsxGK
         arBfCKczvMrQ7zEPRZQsxbizQUE8IraESnrf09i5qp+zluwbiwxn8ikU2vTmWyBeGSfb
         t6oQ4v6spKCPDgMGWJTGGrF7e715/pGkdutx3cj9MvST4+YJ0Ume7TpOyQkRzW3HAsIJ
         BG4w==
X-Forwarded-Encrypted: i=1; AJvYcCW4EF6O6gnDvVBBRKybACNfyGvwjCgpiTU+QMw1YOpuo5nyLaL5sxSidsfLGcJCr8US7Hm/JPO9xI0brM79fQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbJfUPQCO1dMrdUYXCCqqxVSwfJxSukhdZkW76Rjpl8aeb0lzq
	wV+vWOy7wA/72lAvDTEa7tI6ESlXmmOWggiNTEbBBNLzb2G2BrSeelT6
X-Gm-Gg: ASbGncull9HaXkRsPayaSCxbFf5k2ZDNlHfPBtuJl9Z1dnURi97Zg091rtDX/Q0R4rS
	epO64dc2f3Fi6g8xJcD7UA1tBb1efPEZsz1+OmlNaMkr59Kyiso/v16HJAfb8PjVspgZqv7jm6b
	u25a5BfhT2DSsD0Lw1wjK6r3+yMnxK2wvbRf9/qc0STNq2gJ3RXwWCZmhZS1hpWRUWkfXbOz6bu
	xphoXa318t0ruH3UKA33prmjdfUfGJ16jjlErHwfzLJT60ePAfCNUOu+Jce1kNDp6vLqI4W3LAu
	pXPsRgdOaeoKtvyQxLUeDgtgwGi9Go6XeVzFKhPfWMAWg77rG3TOZuCLpv4qCcX0f2VahMB/+8X
	/NSyFoQU3/QXCNf5Cf3zOSL/x0Lg9Re3FCTsPs2C96SnhW4ob2eGPMMjNSCE+wKDUpiemp8OpFL
	AV9VWwAvrzxW23I/OHR6EhhefLyAwbF9UaK+emhQo=
X-Google-Smtp-Source: AGHT+IGFfr9CT1eblajtZCP2XVFU0Vr5uVwdsTRLDJcCXPnjm3McVM0mCmW9P9Gky5idSjyeK+nn1A==
X-Received: by 2002:a05:6000:2905:b0:425:7e45:a4df with SMTP id ffacd0b85a97d-42adc6896abmr3482205f8f.11.1762532542447;
        Fri, 07 Nov 2025 08:22:22 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b29e4b9bdsm1826631f8f.32.2025.11.07.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:22:21 -0800 (PST)
Message-ID: <690e1cbd.df0a0220.25b002.6c64@mx.google.com>
X-Google-Original-Message-ID: <aQ4cugRUZrJVqR3c@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 17:22:18 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 Airoha AN7583
References: <20250925155330.6779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925155330.6779-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_082224_403690_1D02EA69 
X-CRM114-Status: GOOD (  17.83  )
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

On Thu, Sep 25, 2025 at 05:53:08PM +0200, Christian Marangi wrote:
> Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
> binding.
> 
> This differ from the Airoha EN7581 SoC by the fact that only one Gen3
> PCIe controller is present on the SoC.
> 
> The compatible have -gen3 tag as the Airoha AN7583 SoC have both GEN2
> and GEN3 PCIe controller and it's required to differentiate them as
> different schema are required for the 2 PCIe Controller variant.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Any chance this can be picked? All the 2 patch got review tag.

> ---
> Changes v3:
> - Add review tag
> - Add comments for compatible inconsistency
> Changes v2:
> - Fix alphabetical order
> 
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 0278845701ce..1ca9594a9739 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -58,6 +58,7 @@ properties:
>            - const: mediatek,mt8196-pcie
>        - const: mediatek,mt8192-pcie
>        - const: mediatek,mt8196-pcie
> +      - const: airoha,an7583-pcie-gen3
>        - const: airoha,en7581-pcie
>  
>    reg:
> @@ -276,6 +277,26 @@ allOf:
>  
>          mediatek,pbus-csr: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-pcie-gen3
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          items:
> +            - const: sys-ck
> +
> +        resets:
> +          minItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: phy-lane0
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.51.0
> 

-- 
	Ansuel

