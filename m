Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjKG2aH0jCqvzQ8vDPVuEGJdAE8jqK62cBmldnUshoE=; b=RzQ6/BVT5NzsVC
	him/D5O3pM98kqrES0TgHgNI19OMulx2+Y3rjwlZYzjYhKIXnFgCh+pwcGnoonWfAG2bmCZjLe09j
	E75+DMBPciJ0x3YA82ZlQre53SJGwyK00T9dIG9+51ARnDlm+Vtobid+iv/99lajpN9d+0S1HKJRj
	4AMwotxKt48ase9l0trnRDFWOAbTRJMxVpw5pc6Nw4Dp+P9b4oMZCA77RtEoreI/ZkoNRVq8G1i1e
	EMEOSau/aTNlQfXFsfm1/ZspznpztwkMq+o+wbCyw35HKVo57zLpXd5UQwXWscyNomtA+xmIc08Zo
	zniTN0C4xYUEVXTZ26fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXNmV-00Gjzo-W7; Thu, 24 Mar 2022 13:45:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXNmK-00Gjwn-BG; Thu, 24 Mar 2022 13:45:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w4so6686253wrg.12;
 Thu, 24 Mar 2022 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U7jmus7Yb7ewckakdZbh+zrWRQeITS2RgbYv0Y67GWg=;
 b=gzHv0VLCXVWV0ZR+pCDVaifTnt2xvMAdsFsl8w95DSMoJ1T88SULhHElQ3awS6JOH1
 sAFiTPyF02A/wK2lu1bQb1bf4lnj1/zLSVUpQGtrMXE2E9dneE9FTM9qWreuF+J3Cq9q
 BzUWsRPeyzFoZYCpgumVyP8iZPXtIXqgb3Mh4BI2J8t2PfBZTRt9UfssZC8wsDofuitm
 LgkpIt4SKY9dQMQKmgw72tdk/Nj0sECr9/oPpt24kF81aKDglAJW+SM4dHY3QWZ/yuF1
 8r7aAD4B21oEKH6GP+w4RMXsb/qPzi8BMzBlBE087j7aeuNlNq1iWsd5gvEx5GO3V1sE
 02aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U7jmus7Yb7ewckakdZbh+zrWRQeITS2RgbYv0Y67GWg=;
 b=UMzecx7SR/e0UbRkpcZZB4iHm4I8TjLjyUtCh8mh0zvS7YEnqekr0V4D3yrPTV69gG
 k52n2AbbLQJUCGCVsgbehJG6qm0+/wlLRxxJFT5eWAsn6I2O9qBnXI4lDYldYSSP1Oj2
 oyra9U4a79uwLRH44iq8My/l/+Nmh53zgSxFWdZlIJMHulTqusM/3j0YjScabNE7cmtT
 ag8X+SnEvici3pXdNMtD7FzhTMahbeurnX5qhznSziloKKh7U8sFcrSI6jqEF1+1Up42
 cIOWKGi5XSEEZbbYx5nbN274dw6C+belzkULjCY/cAYYnKJHJ/qKuB5JH8TNwCqZsZku
 kqmA==
X-Gm-Message-State: AOAM530MomTQznf/6hSnbKhH79LV9SUMqycGKZlQVd2wE0JVwo0TYbbc
 GyNKC65NyroyDWsHzej+eVg6NbxgtRLRPw==
X-Google-Smtp-Source: ABdhPJwf4ibqJhrkQ5dOYOJhnioj0+pyney17DM0J3kvZXrLHu4gfZbmJD51e6lLA6BntW7PkBExfg==
X-Received: by 2002:adf:f943:0:b0:203:b456:c71d with SMTP id
 q3-20020adff943000000b00203b456c71dmr4678340wrr.568.1648129526345; 
 Thu, 24 Mar 2022 06:45:26 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b0038cc9d6ff5bsm2343196wms.4.2022.03.24.06.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 06:45:25 -0700 (PDT)
Message-ID: <cc81f13f-fc83-d45d-4936-bec8ee58ba93@gmail.com>
Date: Thu, 24 Mar 2022 14:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 06/22] arm64: dts: mt8192: Add xhci node
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
 <20220318144534.17996-7-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-7-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_064528_424917_6BC6F27A 
X-CRM114-Status: GOOD (  15.00  )
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
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 28b93b76fe17..6bc36a4076f4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mt8192-power.h>
>   
>   / {
> @@ -718,6 +719,29 @@
>   			status = "disabled";
>   		};
>   
> +		xhci: usb@11200000 {
> +			compatible = "mediatek,mt8192-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x1000>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts-extended = <&gic GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "host";
> +			phys = <&u2port0 PHY_TYPE_USB2>,
> +			       <&u3port0 PHY_TYPE_USB3>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_SEL>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&infracfg CLK_INFRA_SSUSB>,
> +				 <&infracfg CLK_INFRA_SSUSB_XHCI>,
> +				 <&apmixedsys CLK_APMIXED_USBPLL>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
> +			wakeup-source;
> +			mediatek,syscon-wakeup = <&pericfg 0x420 102>;
> +			status = "disabled";
> +		};
> +
>   		nor_flash: spi@11234000 {
>   			compatible = "mediatek,mt8192-nor";
>   			reg = <0 0x11234000 0 0xe0>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
