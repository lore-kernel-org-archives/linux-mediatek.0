Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ED0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hF5DI1Ap8pc0jlcLM3Y4GFWl2SI/lCdpmBhgX6LUmWU=; b=f5rltTQF3UqQL4
	kw7N591xSLIoTd7bMtEv47IrG6SJow+Fkn+e9WKmdcGzOr9ncWMmYupF/Uwb/HpLj14iixmLUCePo
	xw09lzKEIxRv/Rj2oJlEyCOhp90HN1KVEriOkVtiijsZAsW2c8ulpCG1GFXYzomdgILlpVxONcjyG
	bvsv/l8KQ6lXUmfM3ey1Wwb4VfIonRZnwklS6Tu2nvt0hgHDWDJeLqMhUy3wgQvQRWjAiI2rWYGGL
	nFmHe5b1G5SfGD7ew2in8J4iE8qXKzDrLzNSuksEZYZASEwdbXqmjPOlwu2nGUy/+R4hLdrs9MpsX
	V7S2eghH+Y4RX8gk/unA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngPqT-00GWu9-6S; Mon, 18 Apr 2022 11:47:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngPqD-00GWmB-R2
 for linux-mediatek@lists.infradead.org; Mon, 18 Apr 2022 11:46:51 +0000
Received: by mail-ed1-x531.google.com with SMTP id t25so17168690edt.9
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Apr 2022 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+cw4FNIPaljad3e8DVkQCepUmXxjBo/m/1jzgFfcs8U=;
 b=EMcu0tCDeljFb7yHhoncmFDGX2SNBoNZN7shP4Vbct870LIS3zdaHeLX47ou4Q+5D9
 dZYybx1/z7lfr+84/yT46CL0XbfDr0nSxKz6+vCHyIkyZCrn6zfEgtJ+x98m1m8v0PTG
 2TgpWiJex5byMDJ6mi53I5qkeuPWAQnBT4PxO7Rohb8x3nlcVJL08dz+kXpL++Nl4RBv
 5fPp0twwX/XxBTU1wbXFwyCQGxfxf6PaqWgB2ChGMpLe2o42PTgXTrqS3Vvcip0zbOXm
 uGRIKClvBlJGV52N3TULTQfRzrTbSqgGgXPF5rg9GTw1NVnQ8BU2teLRbn2vOPdR6fsQ
 Z9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+cw4FNIPaljad3e8DVkQCepUmXxjBo/m/1jzgFfcs8U=;
 b=Xz9GaY1S9G+WAzmpKWz2s/N3mtCOeRaiQWgbjN4Y0UzIJ5/LKV81tEzCIzufQJ/ZlZ
 tFEAAntRCnHBW6G78KBLN3/2XXrhXGQOzy9+wZGXylyWg8eZsB27Hiz0F9Fx4CZT/s9Y
 dOlNYgmUsjuP3VLN2hTzi1H9BM8glmtymW5Aab2rTwWwmQaa0LHUl0wpfVx3+72gHwoq
 RVXT2xpkOvnbxH15x7BeKBaLfFnH2qZMy30AHipGtyF3ZH4y5PJoI3X0EADqfu4G6Tyi
 g2CNZbkZe9Wn8SXoiPFLXr+p9B+JVD7OcBh4j84QFEP7Apsy+hR9JMi3UYmE/j3ObKOo
 IRjA==
X-Gm-Message-State: AOAM530sPG9aSZA1txo0Lrj2mP2ygHB8BDUTj9pQCyU1U4BvbJMPJjYy
 kV5cAzRnBCj+NnTgXXjVmW7mSw==
X-Google-Smtp-Source: ABdhPJywPDma12a05kBaxZILSMPLyMoVhakudsXTChLuj+deflBnxYq4hwWmM8t0rSpj543MZo2mCQ==
X-Received: by 2002:a05:6402:2056:b0:41d:70c3:2904 with SMTP id
 bc22-20020a056402205600b0041d70c32904mr11725923edb.397.1650282406266; 
 Mon, 18 Apr 2022 04:46:46 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056402154200b0042323822e15sm4345412edx.74.2022.04.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 04:46:45 -0700 (PDT)
Message-ID: <df46a147-c4c7-c0bc-e195-d47344413b29@linaro.org>
Date: Mon, 18 Apr 2022 13:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8195: add UFS HCI node
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220415165939.1861470-1-fparent@baylibre.com>
 <20220415165939.1861470-2-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220415165939.1861470-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_044649_910311_6B7DCEE5 
X-CRM114-Status: GOOD (  12.59  )
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

On 15/04/2022 18:59, Fabien Parent wrote:
> Add the node for the UFS HCI controller for the MediaTek MT8195 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index b57e620c2c72..2255e19cc3b2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -619,6 +619,30 @@ mmc2: mmc@11250000 {
>  			status = "disabled";
>  		};
>  
> +		ufshci: ufshci@11270000 {

Generic node name, so just "ufs".


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
