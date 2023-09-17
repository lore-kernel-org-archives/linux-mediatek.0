Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54413CD37B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECgwhafg3/hjFYGez4Lfo2Lk7AlEQkzhPQOhVe/2Q4Y=; b=ArvdTKdGX3zDLkIQAqu1mqdjrB
	n3aVd1jH3xnU/ZyAlSZxsASAor5XIFaw5QuG/5GOo9CTlI3DJ+b4rYBkaw+SqLklZ27L6VO7zFqJq
	KkFCeSAoqZGRqGpRsJ7XoFZ1FmLqSGcM0UHBngF+AqkRMFuw1fX4+RdDatuV0d3V75J72xMgxYAt5
	JBMQAkosxLAJqg2oXDc5qJkmF3rLLCQ+xxptadWRO6pPt2CLyxDKCJuZnYOGiG51XBCAlZQTwdVSv
	+763e465vZupY4JFXzhExIy3nymoNmsT1G3McRRHdpk8cceBl4cyLnOJzqlU0DehuTraovVcB1r0P
	1Xtodtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhn6e-00DJw9-0u;
	Sun, 17 Sep 2023 08:26:16 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhn6b-00DJvX-23
	for linux-mediatek@lists.infradead.org;
	Sun, 17 Sep 2023 08:26:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so7623680a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Sep 2023 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694939172; x=1695543972; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECgwhafg3/hjFYGez4Lfo2Lk7AlEQkzhPQOhVe/2Q4Y=;
        b=eJ4rqZkf/n1zJZ/c7YUm5KQh94nx+lDThHn0S2FbfrgR0jb0uHE3+9C+2mAd4Ym/yR
         iNehdrmfcuegOP8Z7vn8e8s038k8U64ryIhyQ6M4w38Mi9j7dl0b/yo5nwb66GzOpLgL
         j9OW2wIHgqEcR5r0XjYmoNZlte9MLrZd6iLOpy9HhHBuxVHIh2lEbitY7/CERZccu9cK
         bdIuFZ+zp/xbCE3+wi6Z7l3uTvNoyqNxlda/cHIR2Kyj/oUgDOmduurkIME9cMuU6lQa
         0LqpzMN1pIhTXiExP3p1RWzkuaBseknCSp11HxlW+omlvFgsSMrPTlK2GYNbU0NfgVZG
         CRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694939172; x=1695543972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECgwhafg3/hjFYGez4Lfo2Lk7AlEQkzhPQOhVe/2Q4Y=;
        b=lV+SHhLIMcQTQOR1NcflvuxrAcP24gRySKLI6bsUpSKwQHMt2jO4IhTLhs5I6N7i5R
         p2FCNBigf4k/V53AC8wbDgwi7MnQIAEd45ZmpoMXAd5hMS3PJ97XX1EcS1A0kbFg1bj3
         cUCYUuQXwpS4ROISyTo2voLWzXe/jP6slg2IiW3f7MrHIWpCeRbyLhe431yzDUcn+nA/
         rzjxhOZP6d2vfiEfDJhwDnnJW7HiSosFKU+p1y+DnxIYbirlAupisp2r3p56aMIaYR0L
         4ECB8ObyGv9wS1fsuWlLGmUgPVCn1CH+k6qw/S/HHkVeE5J5ULwvKBiUOXqCGwTf99LP
         GH9A==
X-Gm-Message-State: AOJu0Ywmo+hb6ThanWpvKDrRDYMLCBmYd2AemtTU20dFru+LxVVQhSPT
	ewnl9WeX14PmXjioFFeG/ApQbA==
X-Google-Smtp-Source: AGHT+IFgDjgI68oBB35B+lNMXppqHwPyG7kpxwszDiieF6pp/UNLwKHmoSE5dOg/U7+Qx6+GIuBFww==
X-Received: by 2002:a50:ec8c:0:b0:52f:a763:aab4 with SMTP id e12-20020a50ec8c000000b0052fa763aab4mr9366082edr.5.1694939171635;
        Sun, 17 Sep 2023 01:26:11 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id v21-20020aa7dbd5000000b005256771db39sm4371991edt.58.2023.09.17.01.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 01:26:11 -0700 (PDT)
Message-ID: <3e7bc476-ffc7-fb07-8e64-246427da736c@linaro.org>
Date: Sun, 17 Sep 2023 10:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 3/3] dt-bindings: hwinfo: Add mtk-socinfo driver
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230915152607.18116-1-william-tw.lin@mediatek.com>
 <20230915152607.18116-4-william-tw.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915152607.18116-4-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_012613_695032_4AF05378 
X-CRM114-Status: GOOD (  16.45  )
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

On 15/09/2023 17:26, William-tw Lin wrote:
> dt-binding documentation for mtk-socinfo driver.

Here and in subject, drop driver and instead descrbe hardware.

> mtk-socinfo driver provides SoC-related information.
> Such information includes manufacturer information, SoC name,
> SoC segment name, and SoC marketing name.
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>  .../bindings/hwinfo/mtk-socinfo.yaml          | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
> new file mode 100644
> index 000000000000..74f03f1dc404
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml

Nothing improved.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwinfo/mtk-socinfo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC ChipID
> +
> +maintainers:
> +  - William Lin <william-tw.lin@mediatek.com>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Kevin Hilman <khilman@kernel.org>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  MediaTek SoCs store various product information in eFuses, including
> +  Chip ID and Revision fields, usable to identify the manufacturer,
> +  SoC version, plus segment and marketing names.
> +
> +properties:
> +  compatible:
> +    const: mediatek,socinfo

What happened to compatibles? No, this is just wrong and no explained.
You ignored other comments as well. Really, that's not the way to go.

NAK

Best regards,
Krzysztof


