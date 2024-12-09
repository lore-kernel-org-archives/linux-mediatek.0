Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156CDE7717D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 11:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=; b=PSmvTubbp59/P7qNdAyQpqUl+W
	SI9xw5EC6Yt+dW2N/Z8QZ8FP1mHzatcmJZ2ppi+sz0IgNeufZmVezpA+MgyBYel4q/rgUiZVCNvL3
	dD+BnRCTg4gCGz9OcGhTiKIeL0WTzEvq5M+qCebiM9Ncbat29YhKWuG3q5Whib/84ATVFXSJDMQdr
	ovq6LplH/vaQ7tdJGi3fbi42PIr0CMgGddj9DxxVk8L5oNtGxtf7EkjxeX8xB0RstGdNeMK/zU0Jw
	2sfsaSI3oLAeBXxYUEJ9HSzp32nUu/jR5Y7G9fGwfKuaoAFXqtEeTYkNjoUDF0u6x7uQ0Fk1pQZYG
	7IUJ8owQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcBz-00000007Xzi-0zsB;
	Mon, 09 Dec 2024 11:44:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc9x-00000007XZU-082w
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Dec 2024 11:42:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434e406a547so13550735e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Dec 2024 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733744559; x=1734349359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=zmo1RrCs9bP8gU+1vuikj5QfH0MKM3yUTNtgTXG8Az/P6ctBNqy1/xxfc7EGgRkniG
         /y+ofcBj3nRUr/fXlsYw35+1zGOSddY7xuvR/DA76VZvL8sYqO2e6KMmv13MPG/PK4Rq
         oy3lRmJ4MkRgfU0/SsW43YreRA7UYwkRJy87LkFuN+yJFRY1YuWHSJsTVXAMDSZQ+9up
         dRFYZ6PaRYG7Elhq8fgDAaW3tuqzxP1dWbh2rOtOSwwWIGcW4y34pI2yANRu2IORLNUW
         IBJrT/rgjGLw0p8v39WJAb9zbiF7+01kb6wtuHHXWpZnkFvPh/5zNkacgJOeeE/qzAxl
         wd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733744559; x=1734349359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=Ye/WfpPtzS5ojgTB9r12xY62aPYBV8L5cYOY1knoF4nKP1Fo4mx2r6Gclcedgig2AL
         hRmEjakMaxKSuqf14zL7i/4yVj9iELA/I8z849nGB2uFPiq3jbO9IBQKMGRE+cI9u78X
         qp76Hy+J7hQyJBBSBTTBeSquLLMewLZue2E+HgJOlfpqbv9/cqo18HtUkScSZm+Daem6
         MilsF5S1AUhmlYeFF0T7FX1El0LbXA5S5f7zycl9HlZ9EX+v80B3BbD0G5AVdBLUrHpA
         O0V9H4PPUjkisP1fBULnGoYmr9j6FHC9qvdoG9LDufdSbFoTeghToZq2G7uGmvNu7ToT
         OmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiUCCmduhYl7kGIg04uq68JDalN0cZo3uo3goeTeh2oQRjzDtZzemh/+JfB8wJCtcLuvkjMZYJ/YKh/608nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzmMSrvmYUN+ZhkyoNpsXbHwkCLNnK5QeNkNVkkHNFqJGtLKhM
	t6Mb8QQV6TTtAkZ1/e9Yl0sBx5eYaZqwDaOJGGAALESVuU/69rHNpZmwFLwaNSI=
X-Gm-Gg: ASbGnct9i+0gC85Dwin611DOkiIJMj8OMl5ZDRNwMmr2Tcfyw5Sw4hQdvvsKo2fJafs
	+mdq7NEzAZy+kHkjOqF6y3PILZSi4HNwZHUBr/VaD0Oby/iB6ZaQ+kNGIFekmGijZT+mV18JmSe
	H5n2y1ccsMtbXwkWlWGoeJ2z3MAyftaGbXUgrH4SpmLRQ4jAlhM/pKyoA4n5xjW+rkJzvmUzBNw
	k/dWLbOBw6u4iHKMFjl51kz6FP8ZM+f8Vby31eWJt+ZkdwZcqW4ySuIJh6PhbE=
X-Google-Smtp-Source: AGHT+IEbIQYg8EnIUDUPigKjpDEo3nHZn5oUqp1eGUTq6LEGGzSr1WjwD8bOZqQ7VZz3k53CLChrPw==
X-Received: by 2002:a05:600c:1da7:b0:434:f871:1b97 with SMTP id 5b1f17b1804b1-434fffca42dmr648225e9.33.1733744559181;
        Mon, 09 Dec 2024 03:42:39 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f2b08972sm60014355e9.27.2024.12.09.03.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:42:38 -0800 (PST)
Message-ID: <c8f42175-3501-4d65-92ba-5878fe5ea5f4@linaro.org>
Date: Mon, 9 Dec 2024 11:42:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Shijie Qin <shijie.qin@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_034241_903201_A4F14BA5 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

On 09/12/2024 11:34, Krzysztof Kozlowski wrote:
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 9cc0a968a401..3469a43f00d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 5cb0e337ea6e..644646de338a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 584106e275f6..68d8670557f5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index d32daaef1b50..289494f561e5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index 06db2c1e6079..a372d991e652 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

