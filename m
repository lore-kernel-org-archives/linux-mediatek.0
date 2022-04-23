Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98F9C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucpt67UkOjJb75hnd1Eeft4WH1rpmGK9C187DnCBHzw=; b=q5N6Zo+OJjEzZ9
	2Y3TDPGU8xlNYAf0Um4qpbI0WV3XHxzGC32pT7mIrgRTXQUEyHrxYDGESz8Y/vdPjhR0j5GLsS4xM
	KUif+hEilczx+5jf+y/aLBE0Ck67py8oiaTxzcixwa/b8K7jSJmw/badvhIuhA0uOEtJf++dH6JzI
	h8N5VEXF4LEHRowgCpNi/pg+AUMCFnmGbz+RYwLqGvXxyBsAbYLqv/FaTuEbAf++L0VN3ZMEpwHa4
	I/vtddcGuSKkaAM/Yl/i2oGL7/1V7BTvft0ugvOZzHZC9r8vA1FWnWl89bieyqKn+OdP28+I0Vc2x
	8c8+LjrqvYVwABwAX4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niD0U-0046JD-FD; Sat, 23 Apr 2022 10:28:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niD0H-0046Eb-9B
 for linux-mediatek@lists.infradead.org; Sat, 23 Apr 2022 10:28:38 +0000
Received: by mail-ej1-x629.google.com with SMTP id m20so39865ejj.10
 for <linux-mediatek@lists.infradead.org>; Sat, 23 Apr 2022 03:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rEPflbqVq1mwFueQyojCpMmcKQ/e36y3oykipPSeFRU=;
 b=tG3JcefyPmF6/GrC/QJTrF6f5MpDidoi27/C1CIVpJIIzMgykgvW+RWmmiuDpBawlr
 LMXsyNkcwWvwDMUMcjlOQIZYF93Vxljkd/IkIDfHE7DzIlteLFPfUqmTnf/wJJrD4KOu
 BNMCkjeck9KI8/41gw9Kh4jIjya99qSm54prDXHt2DCnpPRbSKeCdhAxcDBU0U2mZTmR
 x5FjHPHzR3JLSmYk++9mSLZEo+g9K5ypkPt2qNzVmLxXBjkbUSJBhZvOVCk/W21xFZtq
 cLe6Lp76kMfmR+m/2jb+W+6rXnu7UjdPzCiaY51/6JB63t+UWVvxmOPZC7uPf/9/zbz9
 hsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rEPflbqVq1mwFueQyojCpMmcKQ/e36y3oykipPSeFRU=;
 b=BWydkhJBOBkTmz6wJUrjQGcdo/WUB0MsS+QFD9nFwhLbfRmmg5uAkIwEVegnkwNZNn
 RIVoumQdYI7kTfYxUpXnsSl/arDzEkPYrO9/BqsTuoKJM4kp+M8TEM1YpUylSC4pMg6F
 jkFQ8hl+D+zYJ6+Rgl3H0/F4qgBzSyzQ44ZHnfbfEVJ+7Zujnn4bheEMik5U5b62qI1w
 3hHPoruOnVIG0FoCPh1vcOlXpaqk+vSkZF1yNbQ54xnHJClBfzeAIYbXprVE4CGaXIOc
 uJ/K69XVtWULTOeevD5JtHQHuOFl4LKD9eZpfrVOnlvbfl2dMmQjQPq5jplyDBx2CpEb
 e19g==
X-Gm-Message-State: AOAM531mRoCzyPSWtwMN0cKGFFlpaq7962KVnMMFiqN9VE8Uuuv3XC6B
 cBFB7p6h4QtveBSw398tYwcLkg==
X-Google-Smtp-Source: ABdhPJwu4TU8jIiiy/g+V6aSryzHQOlfKpEwLod4n/B0Gps/UtOcoR7DPUCkVDSY6/TR/WKuWYhQRQ==
X-Received: by 2002:a17:907:9482:b0:6da:8ad6:c8b5 with SMTP id
 dm2-20020a170907948200b006da8ad6c8b5mr7771140ejc.372.1650709715250; 
 Sat, 23 Apr 2022 03:28:35 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gz15-20020a170906f2cf00b006f3802a963fsm52298ejb.21.2022.04.23.03.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 03:28:34 -0700 (PDT)
Message-ID: <e5b18654-ce83-44ee-e4c8-4cdfc4ceaa1d@linaro.org>
Date: Sat, 23 Apr 2022 12:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 12/17] dt-binding: mt8192: Add infra_ao reset bit
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-13-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422060152.13534-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_032837_352664_955858E0 
X-CRM114-Status: GOOD (  12.49  )
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

On 22/04/2022 08:01, Rex-BC Chen wrote:
> To support reset of infra_ao, add the bit definition for thermal/PCIe/SVS.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8192-resets.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> index be9a7ca245b9..d5f3433175c1 100644
> --- a/include/dt-bindings/reset/mt8192-resets.h
> +++ b/include/dt-bindings/reset/mt8192-resets.h
> @@ -27,4 +27,14 @@
>  
>  #define MT8192_TOPRGU_SW_RST_NUM				23
>  
> +/* INFRA RST0 */
> +#define MT8192_INFRA_RST0_LVTS_AP_RST				0
> +/* INFRA RST2 */
> +#define MT8192_INFRA_RST2_PCIE_PHY_RST				15
> +/* INFRA RST3 */
> +#define MT8192_INFRA_RST3_PTP_RST				5
> +/* INFRA RST4 */
> +#define MT8192_INFRA_RST4_LVTS_MCU				12
> +#define MT8192_INFRA_RST4_PCIE_TOP				1

These should be the IDs of reset, not some register values/offsets.
Therefore it is expected to have them incremented by 1.


> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
