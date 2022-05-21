Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BE9C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5i+TdmnM1HJcYolDR1G7BFNFaZcmgh7c/qAxqekog0=; b=LlGsFbXjq7ivkW
	SVgdxrgjeBXYEFKYG5WCgDUN28tc8ibCfffbybYKByGB8pWYT/vTQlgPJpQySxcrS8wg6Dg+Vqn2u
	p0b+Gs0D8qzR3WdPreCkAWfpHXld4ozDi7sKuIkGai15Wfp/BE3gRg5Y6ftuqkFptjo0b27fG9MOu
	HvVcmHNqq05JCpb9VnYhIl116mk35YO5B7iEVc+pRvH2LCAek8QmxplbsnX5NaJfPbaF2huTV3XVj
	5BjuB8n1GPQRpUCB3ARXAhAqWGxYCIACmusQiVmCJjzPMjftDEnwI4zjGjTioSg3hTavczQs9RkjL
	bAMRIpH1asL6i6RRzvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsQHN-00GmuR-6O; Sat, 21 May 2022 14:40:29 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsQHB-00GmrU-N0
 for linux-mediatek@lists.infradead.org; Sat, 21 May 2022 14:40:19 +0000
Received: by mail-lj1-x235.google.com with SMTP id q1so2771042ljb.5
 for <linux-mediatek@lists.infradead.org>; Sat, 21 May 2022 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j19Sjx0q6UvsLhEfsptOk4fcD1qgJ70N5tv5+7J6N4M=;
 b=alP6nMeEFFKqlxICurlpjOsnDodmbu2wDTZ/WazBNZR51QfPcBwHIOzxh8NzDQAC11
 iSghOXLvvDwXPZXa1Ds4wAWZwGurFAuV8/FXsqJdQrdE8SyT8GKR22Trxm/dOhM9rWzt
 nqwKfoqkdVSgUZQj/jvrUKOnRERmucVST+Zd6Gc1UpS0x3vpV/wybI142eOY6CXg3QVE
 P44CofAAclyPl5l5Co4DN6UwB35wwtgzXRAmk3g6i9BCfuirDW2BXT6qWIPRi2AouOZa
 /Mk64xT3eAnzWa5ADV6dAyEMrcfZNqueCZnCyVKrAnioFz8iyTlmYPGNTo+zitDwggQu
 iaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j19Sjx0q6UvsLhEfsptOk4fcD1qgJ70N5tv5+7J6N4M=;
 b=o6jdN7PgJYGxJI1LCYH2Xcxzr7N74J+Sx0VEfp9bmTBPJp1CW/T/E2UGYHwfr8zMox
 JeDt0oxFsj65majw2Z4pH/yqBjVaTwlj/77huV2y6iDwIZUYGJtfHgxF21NF3lLvC/6X
 EX7o1DFHQWi33MakF4+qyZ9v2uxDh3uWcQzrsVRwq+CWE2GJHD4GIVgY/AbHlT+UddN4
 5tI6HkkT5B//N91ia8nZ2yyhF3y/8FtO6UfEYIxa6kRmnDJOxrUlgiMjUmnRLS3GFF0X
 I1/kGfxcY5wcH12A95C0GoVD5FUytdTl3Bow82U5B9udqXwYpztEP7I+pL/KOeolIV1T
 sGaA==
X-Gm-Message-State: AOAM533vTRDiWSvPWQn07pzkP0fKzLMyy+TxXLYSJKXkeGEM7k6rZDdx
 kgQWoW1Q0craxzbsjhwqYhnBlQ==
X-Google-Smtp-Source: ABdhPJzgO95+ZPSch9T/8e1MpH4o+NvJ9OqA4NNkB8w8fbIUHjj+4ntJjdXDnYPIbvxY74DW+LcR4g==
X-Received: by 2002:a2e:81c6:0:b0:253:dffc:8093 with SMTP id
 s6-20020a2e81c6000000b00253dffc8093mr3621977ljg.165.1653144016010; 
 Sat, 21 May 2022 07:40:16 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o9-20020ac25e29000000b0047858fca29bsm539740lfg.42.2022.05.21.07.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 07:40:15 -0700 (PDT)
Message-ID: <77e013bf-feba-268d-5cea-18008115f478@linaro.org>
Date: Sat, 21 May 2022 16:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Add bindings for MT6331
 regulator
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
 <20220520133305.265310-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520133305.265310-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_074017_822791_3639CE71 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20/05/2022 15:33, AngeloGioacchino Del Regno wrote:
> Add the bindings for the regulators found in the MT6331 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mt6331-regulator.yaml  | 272 ++++++++++++++++++
>  1 file changed, 272 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6331-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6331-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6331-regulator.yaml
> new file mode 100644
> index 000000000000..333c74cdbcbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6331-regulator.yaml

mediatek,mt6331-regulator.yaml

> @@ -0,0 +1,272 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mt6331-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6331 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  List of regulators provided by this controller. 

I don't understand this sentence in the description.

> It is named
> +  according to its regulator type, buck_<name> and ldo_<name>.
> +  MT6331 regulators node should be sub node of the MT6397 MFD node.
> +


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
