Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99533C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xz+zaVDddQKg/2Zx23YIFHiDga483MEk2r2gt/4ireg=; b=S7gEBEH5uK6OfH
	eaLZNO3z9/LMuZiUjxpsOHWiYjGO/L6pn2I3e23fuTP8FMrY+tPpIES56KpEmv01uRKM1b1q8f0/B
	kh7/ySDHB8cwWNBcBPLjheko3XDvMEMm4n8nXHSvTLsPWTODHpCMwIvS6ubLKb6s1RYPUGvkLL3vw
	TO5Xr41sKZUthx81cJFB34YASHe0jy/H6TuVKKK8C+BVx+4P+mwd6wsnIdW+zXZrwjXLYKdHXvehU
	kJVLHjUXG7kJkTwSmCdHF4VwRngKU7essXcQfy553hQaIjdwKTB102UYQ5BKJ+FvRPx5WdeC7uGiy
	h1ElKvvl+7aVDo4d3xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXRXJ-00HQ3E-1F; Thu, 24 Mar 2022 17:46:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXRVW-00HPHC-MT; Thu, 24 Mar 2022 17:44:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r13so7658594wrr.9;
 Thu, 24 Mar 2022 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hv1mGUW4D/y2FwqNconOhnQri8Bx6adahhUWQd8+hzc=;
 b=g0D7WtFBMHL6Dgb1tSv/VZG7vDbSYCH8VhlF61I3FtDCtbqaMZAwlSacniH/Mpsk52
 uIUpBFATXF2xGPfI6g45x2TXY2nUTX73JXMf6TKcu8anfdtz+QPOdouAV+EUZeJorlsl
 tkDnAMjjF+OKETkwbNnRdhhU7K1GqeLGUplG+ea6FYBDneE4iTCOxfEIkLcnF1sujiTm
 iseW8zF4PCzs/A1Yd00ACIQapXRBY/tTVKBSTzXCRKuntqX+NqFqSWLvi4ExuqfDoeSE
 NADzgEPbWLdzGR+KKt3MBR+c8Ytp7Cdp8UhpvKCUdrwk6MqEDV3hltIXtcfytjhk5HIF
 cUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hv1mGUW4D/y2FwqNconOhnQri8Bx6adahhUWQd8+hzc=;
 b=5piHMkwYDlDvrNGi/S4iWlOPwCoSkasj4pZWOuEIXJcl601yj9NINKGti1KGH1lzL1
 wBFnN7VbtsOT33gxXKxGQn4dAmksopFIn9uT35JCvOrGwlcnpvsVu0HdsuITx+G+GmlZ
 aDlq+f3Fnie0A2FfztKNNsCX6YEPhKTL3boojPOBIkgSYTvDYl5lsOXx27b+X0yT14H2
 6qI+UjaJ5c5BCHxajwghcYtDzYswfR0reXIRfIbtgcZHQPfQRR/+nSr1NXTVKiW8jW3Z
 XaHk/idEmB0nRw+Mw3ZoW/Dw7fXNYx3eh7eka34lczU9jCopEnYsIt4BDO4rr/ViXCqo
 3h7g==
X-Gm-Message-State: AOAM532tCVEgQWlrgTG0J7QFPFZbx0BUXlH/frvMZHxfWOqjokfzIfI4
 9AUk6Fzy2G/4c5gVp7FbCJ0=
X-Google-Smtp-Source: ABdhPJwU7em0ST1ATwrLOA2idhEsIR537fGjzUF+q2BRyr9q+TpcaOGB+9l683JQlU3r3PLtcjfvkg==
X-Received: by 2002:a5d:5846:0:b0:204:1a79:f1ab with SMTP id
 i6-20020a5d5846000000b002041a79f1abmr5416544wrf.520.1648143860073; 
 Thu, 24 Mar 2022 10:44:20 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4e08000000b002054b5437f2sm3002788wrt.115.2022.03.24.10.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 10:44:19 -0700 (PDT)
Message-ID: <6d7c622a-8685-c020-399e-3559a34b9ad8@gmail.com>
Date: Thu, 24 Mar 2022 18:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 09/22] arm64: dts: mt8192: Add PCIe node
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
 <20220318144534.17996-10-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-10-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_104422_786493_E9E4CD6E 
X-CRM114-Status: GOOD (  16.34  )
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
> Add PCIe node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 38 ++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 82de1af3f6aa..3a7f93d8eeaa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -884,6 +884,44 @@
>   			};
>   		};
>   
> +		pcie: pcie@11230000 {
> +			compatible = "mediatek,mt8192-pcie";
> +			device_type = "pci";
> +			reg = <0 0x11230000 0 0x2000>;
> +			reg-names = "pcie-mac";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			clocks = <&infracfg CLK_INFRA_PCIE_TL_26M>,
> +				 <&infracfg CLK_INFRA_PCIE_TL_96M>,
> +				 <&infracfg CLK_INFRA_PCIE_TL_32K>,
> +				 <&infracfg CLK_INFRA_PCIE_PERI_26M>,
> +				 <&infracfg CLK_INFRA_PCIE_TOP_H_133M>,
> +				 <&infracfg CLK_INFRA_PCIE_PL_P_250M>;
> +			clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
> +				      "obff_ck0", "axi_ck0", "pipe_ck0";

Also not mandated by the bindings nor the driver clock-names don't match the 
binding. How comes? Shall we update the bindings to have more sound names?

Regards,
Matthias

> +			assigned-clocks = <&topckgen CLK_TOP_TL_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D6_D4>;
> +			resets = <&infracfg_rst 2>,
> +				 <&infracfg_rst 3>;
> +			reset-names = "phy", "mac";
> +			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> +			bus-range = <0x00 0xff>;
> +			ranges = <0x82000000 0 0x12000000 0x0 0x12000000 0 0x0800000>,
> +				 <0x81000000 0 0x12800000 0x0 0x12800000 0 0x0800000>;
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +					<0 0 0 2 &pcie_intc0 1>,
> +					<0 0 0 3 &pcie_intc0 2>,
> +					<0 0 0 4 &pcie_intc0 3>;
> +
> +			pcie_intc0: interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
>   		nor_flash: spi@11234000 {
>   			compatible = "mediatek,mt8192-nor";
>   			reg = <0 0x11234000 0 0xe0>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
