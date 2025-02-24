Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697E0C021B3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqF2oB0fOJ00qITszHytsg//Jw5NU1rfZI3/hzZUwto=; b=zV1Qmz62aD0vRLfhmXS8JsBHva
	jehfi5KurFKWD1x4g58yt/ifoERaVy8jy5tvvnqkZl9eAOTW4E4amG1bovLzLyaiF6CSMFKDMYjn4
	mGgbi+nx0wIGUqSXVtqPoSQJWf5XJMQiw7okXCAtmwQesE0n8NqDnwJ0aeOpZDEOfJWPHujSw5jgu
	76ru7Oc0VD526FSpperaFa84C3+hDcQrMbrRdjUV8fMv9NzUK9cuAlOuRnWuXS+RUWVz+elbMPJkP
	+xgI5VPwZSTHHHWJegy4nIUVR+TLEX5kZR2ic4Fb0IM2QSj6v1prEbi6mh1qKF5W8R8fvYZlJS04j
	CleRSvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRHd-0000000CNtf-1TUb;
	Mon, 24 Feb 2025 05:45:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRG4-0000000CNoE-3DY3
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Feb 2025 05:44:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2211acda7f6so85655205ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Feb 2025 21:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740375839; x=1740980639; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sqF2oB0fOJ00qITszHytsg//Jw5NU1rfZI3/hzZUwto=;
        b=apTyROOAUmkoBvayYNbD5xUWBmUqLmVikyV6ybqRvo6NzByzVcyJ2JimVgomXCwjgV
         AMhYkEfEVodNHnc5/9yqPGNMA6hbBzug4SFsLzlDc42BtFvS9myg8D+jtoHiC+prnRQM
         iuzKQ6mbYEtQ9kz2x9pbvN71OKB/NdVsp4d/KS10Vhv0DlekbMNk0I9jHWpnZr2W6qyb
         fWmdMUCa/gfH5YleZTvPHOJrSiVJLFKBkXVH3IzuXVQiFhF9QEFJa1ci0wHJ/5qLgw0G
         u53eJCcf51SbEjFs1XOTEE3qll3+1DPo/P0peyZXlm9KoOKY7dlqOl9J6voVbiPxZbFq
         6Mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740375839; x=1740980639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqF2oB0fOJ00qITszHytsg//Jw5NU1rfZI3/hzZUwto=;
        b=jORYUxxuujymdNy8i1NATkd5zXb/1b0kgo60KzACxV8vDWu9LhiEN2MUqj7W51Yu9Y
         KnTKVdMi9+oVVamuk01h1BX9bbO44w2K+TpcMfYPC2HPO0WDqv+4Q5gvZ7M9JYaMLALw
         oRj336XlAIqGERQoT8KEYGiYKouCExQwzi6/gAQXebiacHMazVep0AvSqzDhXqaB4Pt8
         QwLLQop+rItVymzngIIgWixevK/QDhwQ545k2QKsGMAY07R7MrKJRFOBVtDa2rEFwPGU
         Cd0ZyUL++T+4YGg0KIsscpL3wwGE6ygTLyV6pxIAXnktcYrBszGcebl0ZbSzTUV1Vc0B
         JLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+Cc/926CTz84ZxTfJi19+ea1samP9PRpUQRAWxXGVGVRKZW7IqU2C3VUDtL1a2nqBkvcI9dBy9+uBEbfPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcu7wKUu1EoESjoRuuNRGX9oT0XwUhUBAh+UZiRaldyGVXuyrL
	p4W8lUQgCdt6GH3QcQJ6DTHQRmCw5Z/gAi993UDQ/TCxEyQP54i/UeNmpG91JQ==
X-Gm-Gg: ASbGncvJ0nmux8SRr3H0skgzH/LOK9pYKcuXG/JIa0eS6+KVlusIIPCoNYOtpPoOFEG
	irhKCFVcyfThAzR2VVRFvnd0KCdweR/0MexFkh5k55jg10Z1LG6zoSwplw6BTg8mo++R61ShCSW
	6fgKWkYqhpsqhGEHRZ+gMahdN5o59ZkDUdfoN8znQnlDsmS3wWZkaOpnmjvY64/Rm7nztmq3Rwr
	FPgg4Sh72wWAhkKqzUpbPTZCcjcmMOPBfrO3DdwNO5jcXNb9Avd6lXADRl32MWFlqAyE81ee0Nr
	NSYHx/3Vy7/6FVKJ0WTMpecQ7keDDdxOFFOH
X-Google-Smtp-Source: AGHT+IEiXXDmNWiIoyS4g/sMa+CHtSKXB9iHnryoV5l5+xYp1a39XIVItxTv64eAI9cSRTAKN1SUlg==
X-Received: by 2002:a05:6a20:6a0b:b0:1e1:ad39:cc5c with SMTP id adf61e73a8af0-1eef3c7718dmr22630530637.14.1740375839448;
        Sun, 23 Feb 2025 21:43:59 -0800 (PST)
Received: from thinkpad ([36.255.17.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adf35fb47c4sm11085874a12.31.2025.02.23.21.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 21:43:58 -0800 (PST)
Date: Mon, 24 Feb 2025 11:13:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle array property
Message-ID: <20250224054353.c24rcplzsvskzceq@thinkpad>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_214400_844206_9CE9C5B8 
X-CRM114-Status: GOOD (  16.16  )
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

On Sat, Feb 22, 2025 at 11:43:44AM +0100, Lorenzo Bianconi wrote:
> Introduce the mediatek,pbus-csr property for the pbus-csr syscon node
> available on EN7581 SoC. The airoha pbus-csr block provides a configuration
> interface for the PBUS controller used to detect if a given address is
> accessible on PCIe controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index f05aab2b1addcac91d4685d7d94f421814822b92..162406e0691a81044406aa8f9e60605d0d917811 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -109,6 +109,17 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  mediatek,pbus-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to pbus-csr syscon
> +          - description: offset of pbus-csr base address register
> +          - description: offset of pbus-csr base address mask register
> +    description:
> +      Phandle with two arguments to the syscon node used to detect if
> +      a given address is accessible on PCIe controller.
> +
>    '#interrupt-cells':
>      const: 1
>  
> @@ -168,6 +179,8 @@ allOf:
>            minItems: 1
>            maxItems: 2
>  
> +        mediatek,pbus-csr: false
> +
>    - if:
>        properties:
>          compatible:
> @@ -197,6 +210,8 @@ allOf:
>            minItems: 1
>            maxItems: 2
>  
> +        mediatek,pbus-csr: false
> +
>    - if:
>        properties:
>          compatible:
> @@ -224,6 +239,8 @@ allOf:
>            minItems: 1
>            maxItems: 2
>  
> +        mediatek,pbus-csr: false
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

