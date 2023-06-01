Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221FEC77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opz6VtahvCDdjyoo3Ecdy1ZlcAUEXCiP9UvfN37Ndpk=; b=crModgoY2LNTILMmWPdqa4zGjW
	njT7kCcCPXR/aUx86WbiVzA9/TA/tA1WbtUsxWiFJhwVVi54zKc2rOJObqvmchE2p7Llrt4bvDJMe
	oOmHnyUC2LM3xNzc6EZrQukeW8uRReqviV5/nabEPkyyVJaFce/6sDMYJEoOuAth6jluMyV/97g/0
	vUf5VWdeBnT2zLC7b9Fug3UQBZ+PzyV2U8xu8z/PpfO7v4pJY+wgVKLxlbsz1kieIWqbrU7qolB3i
	/KEjxMvX5J5V2VZGjdVb0hy6w97vKi22m4BHQf6ToMbUlu/lZHEUSMBO5+dPO84dT0x4z182Yolt8
	alq4sSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4lYy-004JvH-30;
	Thu, 01 Jun 2023 16:54:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4lYv-004Jtl-2V
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jun 2023 16:54:11 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96fbe7fbdd4so151820666b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Jun 2023 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685638447; x=1688230447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opz6VtahvCDdjyoo3Ecdy1ZlcAUEXCiP9UvfN37Ndpk=;
        b=LWiOQG5gf2rvyRCi1hD+vLSYQSgpTH/vSRYQQhyNujIB/uPUK2XWADRlsvTql/4J82
         BF2ybxrrQpTSvzQEwyxf22vytjqI225LKfzVGpHfDeHTVCI1DUka6VH7rTVPKJkqLdaa
         3ZuJDNavqa52M9MqOU5RA9FWijgAoecjc72kyQ9uckeTvgyDm7jepG08wZvR/cnI5U8C
         JnYsaTggc3a7wTwzU8FHddVovstp29IQQqjUvPsMzhVyJ5VGyDTDsOfTzfDaKO3aUX6K
         6MQ8kenQ+HDkoAyDnOW+cdmWNNUThF0ZOdb1qhghqu/U9VOeO09+v4OneIN3iRFWWWly
         6Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685638447; x=1688230447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opz6VtahvCDdjyoo3Ecdy1ZlcAUEXCiP9UvfN37Ndpk=;
        b=QCvXHhE2nbe72FA8Do35/acSKPGYVsclQR6rVX64WoqCiz7RCxIfHPS3AyEmO+2FhG
         lk38EkWXXN/sPTOi837uZO1swNnQ4JKzq3ZDyj1mUQ/0Fahifodr4o+WgNNlbAl4jiHi
         s1OzjBMnJLKyB+Wa0SvnR9r2G+Qb4tCr+oU2ARagAiKlB3W3SGOVqZjnexKtr1/I1HRQ
         TcpFHLqd2CLlGhKpftvbZm96BXRNJr50ozYAZIYkM0rMusVMFRp2uZDHEJj3qqJZ5EwE
         KK51CgPv6uELLwEY0fSg0zi3xFSeZD8mRfKCRDvCi6vyAzjJPfTtCWZWB1ZjcHRt49Rc
         VR3A==
X-Gm-Message-State: AC+VfDyUTLFeimXHjGQMvZUvU/7jEExK9gXrTWAJs9rhmS15WBiVrNuA
	3hYN4sv3m+d73+V3dC9brOH8bn7k73OwlvcIhwU=
X-Google-Smtp-Source: ACHHUZ6Ib6fkHHOhU4CvPzpBJDbe8lHmjCmfmV5pzq4uXm82lIkWnme3xzB+iaqpqS1+gQ5oQcjPPQ==
X-Received: by 2002:a17:907:6e11:b0:958:801b:9945 with SMTP id sd17-20020a1709076e1100b00958801b9945mr8590711ejc.31.1685638446879;
        Thu, 01 Jun 2023 09:54:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j13-20020a170906474d00b0096a5d341b50sm10759628ejs.111.2023.06.01.09.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 09:54:05 -0700 (PDT)
Message-ID: <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
Date: Thu, 1 Jun 2023 18:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>
Cc: =?UTF-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_095409_816183_C9F7B025 
X-CRM114-Status: GOOD (  13.95  )
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

On 31/05/2023 18:10, Daniel Golle wrote:
> Add pck and mck clocks which are needed to access I2C registers on MT7981.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index fda0467cdd954..550795f6573c5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -78,6 +78,8 @@ properties:
>        - const: dma
>        - const: arb
>        - const: pmic
> +      - const: mck
> +      - const: pck
>  

Adding names does not magically add the clocks. This wasn't tested.

Best regards,
Krzysztof


