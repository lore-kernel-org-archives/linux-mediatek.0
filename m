Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C25C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjExtZEUXlFqKijOc5SpKpQtx0RxFs51bp1LOxqiYes=; b=wPHH+jvNT8vcT54urJCRqEUStt
	TboNlZRmGn6v4urBsGRvAgamY4mDfrRLku2fnooZtKEhYMe0XGwuNjA1QT1DKF+4fCI677JgB3UUr
	N9xGlH750dMPFxPLVCT7mbyHlCX2Xm6MWQGYWpuQ9roKzOgbSVbYM/14zamwMq5mPmQ04luIqkVTR
	ku+rLgvwjm04qhiqhdGnEUVJbbZhNcQexvBUWMFerBpbpJvlx+OVTng7Oa5ZSATBmWEYWdb82VKl7
	d2BMwkGFGkqeFglG4TEuztlf/Q1zb6fC22QeZvjzPEiSq73k7mo6wIHgtMnO7ragve6+GvNWJLq1y
	TotRZCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peg0S-00DGNF-2h;
	Tue, 21 Mar 2023 17:42:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peg0P-00DGMN-32
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 17:42:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id eg48so62752373edb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 10:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679420560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjExtZEUXlFqKijOc5SpKpQtx0RxFs51bp1LOxqiYes=;
        b=JyjTJ8hbuscJ+rzpwN7y6zy/FUzj9dHDNlJJAY9R+aS4bZZ8KWamb9FEZjRiduKVb6
         DYekmnsuD33DIchQZCskfR0DCXF//3b/FnPqfZkJDYkpjojjfBfbOd2OGTgO+r0Z6Wyn
         BRb/o4CY67bzBTrfGSmsDH1oMFfRplIzvB4YM91xA7KVXjBl9JVi82HSzKoyH0iYnlDB
         u1WYdZZlmc5ed41KtX185yfOFo5oBxxtBJ5wI2Sur6QK48T2IQEC4UtN+ytHlVIsDvTs
         oaJb4zh6E2seR6YAqt2Vlm/VDJf2ekW7gJgaklksF6rmLkxOFkY4EMk0bmasreT+5fCZ
         0OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679420560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjExtZEUXlFqKijOc5SpKpQtx0RxFs51bp1LOxqiYes=;
        b=lUbxlnF/zymPViAdmtJziyUTzt4J4B0JAsgD4EFfFD1HYrJHVDrSEnxS+O7YHcQLnm
         IuzyIYUTqYxEAUpi242FLja69vmhbE1WJLF5D2XNw/KixvL2QF4BoLZ2YcrGdw0mQYV/
         KgLYf6w+O5qExlQcSqykO+zEv6xDjyyTp7/wBhAQIatOQZAEyH30Qw9oNORfTkZAFl6Y
         c/GFFC96Wkzf8noKAsysGmJo18AkzzZIgzFF0iHodFQIWF+Sv9zMFe5RBC2yzzDg2ihg
         aPN6reUeZm6pGhoCWhpBj+129113tAa/FKr1U/SiLDQO2z6rL3YWnpWJiD3vE8wSwUxr
         vX7Q==
X-Gm-Message-State: AO0yUKVVckPWNZzY6KtlBQMOsXNGL+/xMFfvwjbUKqRtH3Sz5Q9eJxmr
	8nrsclNRMF6jtJAuXpqL8EwTig==
X-Google-Smtp-Source: AK7set8+Ch+5qH+X4ADs0Q7/+1S2ttktlYpI6nfvJHImN6MHidV02PrrUIE5GGsUcbnLXaUK4O8IAw==
X-Received: by 2002:a17:906:4f82:b0:931:8ad4:a586 with SMTP id o2-20020a1709064f8200b009318ad4a586mr3964990eju.30.1679420560276;
        Tue, 21 Mar 2023 10:42:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906670b00b0093a0e5977e2sm1044562ejp.225.2023.03.21.10.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 10:42:39 -0700 (PDT)
Message-ID: <67b73929-ac8b-0e41-1940-89dcd1090da0@linaro.org>
Date: Tue, 21 Mar 2023 18:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1] arm64: dts: mt8195: add display node for vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
References: <20230321131251.3351-1-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321131251.3351-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_104241_984678_F148FCF5 
X-CRM114-Status: GOOD (  17.76  )
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

On 21/03/2023 14:12, Nancy.Lin wrote:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
> 1. The dts patch is separated from the following patch:
>  - [v21,25/25] arm64: dts: mt8195: add display node for vdosys1
>    20220512053128.31415-26-nancy.lin@mediatek.com
> 
> 2. This patch is based on the following series:
>  - Add MediaTek SoC DRM (vdosys1) support for mt8195
>    20230321121859.2355-1-nancy.lin@mediatek.com
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
>  1 file changed, 223 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 8fc527570791..c6b625350583 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -24,6 +24,22 @@
>  	aliases {
>  		gce0 = &gce0;
>  		gce1 = &gce1;
> +		ethdr0 = &ethdr0;
> +		mutex0 = &mutex;
> +		mutex1 = &mutex1;
> +		merge1 = &merge1;
> +		merge2 = &merge2;
> +		merge3 = &merge3;
> +		merge4 = &merge4;
> +		merge5 = &merge5;
> +		vdo1-rdma0 = &vdo1_rdma0;
> +		vdo1-rdma1 = &vdo1_rdma1;
> +		vdo1-rdma2 = &vdo1_rdma2;
> +		vdo1-rdma3 = &vdo1_rdma3;
> +		vdo1-rdma4 = &vdo1_rdma4;
> +		vdo1-rdma5 = &vdo1_rdma5;
> +		vdo1-rdma6 = &vdo1_rdma6;
> +		vdo1-rdma7 = &vdo1_rdma7;
>  	};
>  
>  	cpus {
> @@ -2575,7 +2591,10 @@
>  		vdosys1: syscon@1c100000 {
>  			compatible = "mediatek,mt8195-vdosys1", "syscon";
>  			reg = <0 0x1c100000 0 0x1000>;
> +			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x0000 0x1000>;
>  			#clock-cells = <1>;
> +			#reset-cells = <1>;
>  		};
>  
>  		smi_common_vdo: smi@1c01b000 {
> @@ -2604,6 +2623,17 @@
>  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
>  		};
>  
> +		mutex1: mutex0@1c101000 {

So is it mutex1 or mutex0? Or maybe hwlock?

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



Best regards,
Krzysztof


