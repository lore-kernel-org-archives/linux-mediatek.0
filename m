Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 11:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYCn2uZCqHWaiFFz+LAq7OBMzvb9ZA3jd0nDhlkPirk=; b=2+nnBEDSiqv3ud
	Oi5WQkDo7Sdsi/ItIRz5golxzRSG+SsUIEzuXNCSZObjHYdOBEarZJZBE/OVB6M1U6ZzaKWkIKSoL
	FxDQniPQWWBkiEZzHzpcBOXQBLirit2hKWLejY+jrMMrYCB+ntf1ksVMzLtc345X9rcXWDy9K2fk2
	rZK4HEQKjDpE+feFWFg71x3nbdsFFmhNVNBmstHzH6sYBe05R5zb59Kd3FTcQPNmL09EXfSUGYcaA
	Cf2wsKBuEN5xPOqEs2bDSQk/VU63TY0ungy/GowIBJ9cjT8z85IDGKN0qXZv4olDipZf/PkUYF8+Q
	U5+tJP5oPIols7dK9l7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXhh7-001rLY-Oh; Fri, 25 Mar 2022 11:01:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXhgw-001rJV-6l; Fri, 25 Mar 2022 11:01:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id w21so5797338wra.2;
 Fri, 25 Mar 2022 04:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bOEKS9NzaNyigA185P4is7UM4t5gP2JIN17BW0RY5+s=;
 b=n8rS3kO8VR+Ix6NtEe5TdIXE91acMYCD3GXOqhjgWrR8mXLaWXqmXBAe1bb+H1Sf0S
 ISnTEpWb6e+0GQRr+j5o6Q3Hy0YggpZCUG/b8pY1DV8ltR6iGU0Q1nT5dbZ8pdqBNUgd
 MzUdatrPkqoi7qeUj637BqqU3zlghVeaaZF2UkBMjFpZiFOg2Y9Jd7BBgwMRoXHPyPZY
 rHEHC8gkgbsNo1LaRSqVa4BEHx2S5jx0yqJwkwILxCgHHQxKGfjVvAMxvj8TCBYM5fUj
 0wYNeAjqBITMUFoICpbHI4e0+WqH4E+j29+f+OJ4decUT88Du2y6rGrGnFP+PXt7UK44
 PNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bOEKS9NzaNyigA185P4is7UM4t5gP2JIN17BW0RY5+s=;
 b=Lz774G4mBfHNQXnZ6PKX3pWKC6QZG6WENjGpVwF5/5HAIb2kHPQboLL670NfcNc+O/
 rjS7W4+HMhCKtsW94hL6hFoCscB6TL8OMCe1Gs/dkIQFEYqyIPoPj/WuewUm7u07M4XO
 IXfvY9CHemSh6yVn3zWLRh0ESPoyBVs46wrqba/YUjypnoWNj4/jwDtGzW0CBoDfXeBb
 8kDtZ9n4wJ1LVM5zZYaUw10cwqlwemVj22K/mQ8pS96ki3bgRLujOXmzwdA3a1m3vkOa
 PdanQqGBmhGsn/TF1wbiqGPKFgZGEnnasVgafJ6yplp3pLtc7hr/t6DudjYD4A4DI1PV
 9nBg==
X-Gm-Message-State: AOAM530DlLUWMZ48o6FK/Y0ktntzUSIm5zP3Pc3LCTA+DVaeyNDVQNb0
 TJ782EJErGkK//dQSL6/s+w=
X-Google-Smtp-Source: ABdhPJzTS0dVAANN0EU58IyzAWEKrax/ymEZPW+QqQX8M5RfJXL9GrTasCi1E0w+5zu0fIfozf9gLQ==
X-Received: by 2002:a5d:64cc:0:b0:205:a724:9d1a with SMTP id
 f12-20020a5d64cc000000b00205a7249d1amr1999689wri.177.1648206072586; 
 Fri, 25 Mar 2022 04:01:12 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm4914906wri.4.2022.03.25.04.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 04:01:11 -0700 (PDT)
Message-ID: <6117f51e-d43a-40da-f5a0-7b59c09ac29e@gmail.com>
Date: Fri, 25 Mar 2022 12:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 15/22] arm64: dts: mt8192: Add H264 venc device node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-16-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-16-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_040114_287547_75AE2E11 
X-CRM114-Status: GOOD (  13.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Adds H264 venc node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Applied thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 4addf6ddd86d..63893779b193 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1336,6 +1336,29 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
>   		};
>   
> +		vcodec_enc: vcodec@17020000 {
> +			compatible = "mediatek,mt8192-vcodec-enc";
> +			reg = <0 0x17020000 0 0x2000>;
> +			iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
> +				 <&iommu0 M4U_PORT_L7_VENC_REC>,
> +				 <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
> +				 <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
> +				 <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;
> +			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,scp = <&scp>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
> +			clocks = <&vencsys CLK_VENC_SET1_VENC>;
> +			clock-names = "venc-set1";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +		};
> +
>   		camsys: clock-controller@1a000000 {
>   			compatible = "mediatek,mt8192-camsys";
>   			reg = <0 0x1a000000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
