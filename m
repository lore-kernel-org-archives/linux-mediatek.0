Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17639EE57CD
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHuepiwfpiT5E2m84O/h2coQFZ+OoqbWElsLLeZ4r84=; b=flAfXiWfFJz789r/FsMytkG7LY
	LUMVhbABEkLqJVyacBao9NNyxGXC++yF9J1Oxo2FdmPWpGv4XyC3koEOq+VZV+mIjzkIeCqMcmxoj
	P+hTTJUJhJL0cCYTx0phvmeq8ZKj/ludpoJNHYQt3RExT80YoH9VF5u1oEzZkqan2lRIyhDbMDWxe
	OTkJPIeWhb1MAWG2Nvx58maohfcw01wUc+ZqteZtycN/X0jahFMDgML1WwrRADyUoEnTduNMrF/k2
	kZ/jqakO75NZrt7lFihyUu9seNo8VZa8RRh13Hr/lM8P6/N6r7Kz2dV1U5EzpFMtgbGVB6MzwPlx3
	MWMYrHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfI7w-00GXza-1q;
	Sun, 10 Sep 2023 10:57:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfI7t-00GXy4-04
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Sep 2023 10:57:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5007616b756so5689920e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Sep 2023 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694343423; x=1694948223; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHuepiwfpiT5E2m84O/h2coQFZ+OoqbWElsLLeZ4r84=;
        b=TW2QK5zWDr0Awa4N6eAvUDltMjDs6QZJ6XILJ8QkQZv/KQ4EqHfvWaz82aqCX1Zxzk
         aWdJIb+lg/z8dySaGocp2JBCr59Ii/tZUVSfpw2sMfGSgHPiL6xh/9LXtQAbzXuQTPyF
         Dek592a+mHuecb2Ytp3Bz3TYX+GoiaTleZ6mZsbU0hytRV79OAQqDiCy8+40UhOCbBrs
         PD4UaQNoxGZHg7KMDJJd7LBml3e1aYTnE5XslsPe9m48yfuKqUZ/pfY89OWTZk6THRe1
         15qaCA4hYlCJQz7mRZsktiNQGgb+zPo5gRd6QpJUVCG1fwiHd3d0S0tcs1CVJbg55YxB
         uH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694343423; x=1694948223;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHuepiwfpiT5E2m84O/h2coQFZ+OoqbWElsLLeZ4r84=;
        b=fH4sdjt0cogN7FbFUQuyx1fXYJtRV1lWy5TUUAFi1+aTJyQNFpimL4tp1vXV5/tdNJ
         w2tD9LeypntMUYcOdFXI8YDe0xF46yFFfwGejz+UVVxpoiNm6I/yHd6KdNEbONIB3FQb
         O1w9pi/XKOWX11F3IJG4kcB/B/C1eC1c0hMgq2rVWEw73Z/gC1Jv9chx2OjRbxbhi5zN
         wgDiv70yKR3OhtwlD6I/Xi5mkiTJUX2dtX5mu7yDY2ZBsvE4BzFI2fyjX0SQI6cGXuUy
         movlrsAGVew00B4I5N70keG9hGnGU6s/rfGUx7tps/nGhiRJEQ1lmQPKQ08fph0UBlvD
         3HVA==
X-Gm-Message-State: AOJu0Ywb+ceThO7H6m9VnHEZuHdIgEg5ZpNdDatKpYqsO2ZZBM7g1/8g
	2Sa1IzxRfvRx/w3bvdnfAP82LQ==
X-Google-Smtp-Source: AGHT+IENYOcIOKUXqh4Gp3/XzUedAb32p3g3zQAcg4rTgFr6JX7zn+UYrGyIuCNVk7/QwuvbUY26uQ==
X-Received: by 2002:a05:6512:14a:b0:4fd:d470:203b with SMTP id m10-20020a056512014a00b004fdd470203bmr5440584lfo.69.1694343422475;
        Sun, 10 Sep 2023 03:57:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id va17-20020a17090711d100b009929ab17be0sm3628305ejb.162.2023.09.10.03.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 03:57:01 -0700 (PDT)
Message-ID: <2318be3d-5687-8b6c-3669-1d2ae1c94d2c@linaro.org>
Date: Sun, 10 Sep 2023 12:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230909132819.21626-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230909132819.21626-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_035713_066386_1A101EB2 
X-CRM114-Status: GOOD (  11.53  )
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

On 09/09/2023 15:28, Macpaul Lin wrote:
> 1. Add compatible for MT8395.
> 2. Add bindings for the MediaTek mt8395-evk board, also known
> as the "Genio 1200-EVK".
> 
> The MT8195 and MT8395 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
> 
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Confusing. You just sent a patch changing the same hunk - adding
description, without any explanation.

Best regards,
Krzysztof


