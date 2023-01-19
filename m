Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C9DC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0slJfIkfgwvD8lh/pis0V9NYOil7tR0HxrPnP9BoIwE=; b=lmfE5MuHqF1wY68iyD7mMF12fk
	HL4d3CsKbZQ0qbelJK1ItkYponlCfVWfMYpZV9uT+HPhIfOA2kqNshJaBByaxAbQQyQFGAt4bgkQs
	0CPv6hoSvxT/6iccb7BE0+ZR7x8IlqQfbBPetOsOvdmpBXdo2WVl5LHK8Ku6JHzNx39AmfKcRks23
	MlfhIymqmYYm0+UXgtmw0jUZytWQIsLQv4fA6KdsNW00PT1CR68zBBITL4idzqP8ByVsermmHiEDm
	RrVBFNo9gM8KHgwDiVlnBh4Hwe3Ti38UErwO8yojdZc+FMbb0O+tdIIgg2xXybyRIL9NHEQDQVQAt
	DnDWtrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXwG-0062Q2-LZ; Thu, 19 Jan 2023 16:38:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXw3-0062Kw-Ow; Thu, 19 Jan 2023 16:38:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1699918wmc.1;
        Thu, 19 Jan 2023 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0slJfIkfgwvD8lh/pis0V9NYOil7tR0HxrPnP9BoIwE=;
        b=k7UWOs+6M5ArKaJgegqKue7r+QBDKtPkGskRueABG8LL7u2ULgM2BJbuPa/hTDQvp2
         iP2/iX8F/AWIHyJTY9MZXzDjHkx10jtMjJh2HWQpsIeXTbtP9gW6QoLfTxwlpkKeD4cj
         NOSOUHtnEfOM+4SDmygniyFPREWdH5V1aex+fGv5SFNXAsOd3LOnW/7owmMsH+ejtDDM
         zevyOvlOExntk2Bnljh6oAI91zf8YZlrPiqYScFwqx0NVOwLvx6v9qJ9fpu7OId6yetO
         5RFDcR0jXXpuqACDUBFNc2oCGRb7Y4wfqEQtWafeHR0lIQ2CPab11bQGrGFZCfqz9G8X
         Qdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0slJfIkfgwvD8lh/pis0V9NYOil7tR0HxrPnP9BoIwE=;
        b=Jflw3UAzSZttbfIfaE9QxEqA6NpQJYLW7EJWH2GC9TikSWNPK3xkCBkSjy0BEVhNjw
         09buQItihxpOi6w0pf8O0XNyEltERvXc3RtSE4sutem9SD1sO/2ti9JG8hUXRLd9vjek
         IPoOBrZ194MS2hqZFLUdpji5AtkeDuKJN2OtgzKqvHqhHXkMGb9LmAOMYHuyjXydQc/+
         n6BnJQO9a2w8JdaPqlvM3kAOUCdxiGUb2lsumJb9i+CmYYbm/E2WdNWH8Uq0D8NASR3A
         5bXRsKAykj7WdvdJdltot490U7RmTWy0uclMDm7srmOpu18k1y9vJSw0WArzyLFzBOKo
         KyiA==
X-Gm-Message-State: AFqh2kpgJTcLx7P6SWBjZL3dRjUD5UXE1o4Z71S3lh+96Mtj8CanoRDb
	0Q95mD+GnqDVPTKR4AtO0btbDCFjB+E=
X-Google-Smtp-Source: AMrXdXu+TekjvaDZa8mjuAEjOJ3qFNlqOjS/CUEL7bKLsuC9Tp0fbOD/XAXq15Gb8Rvn8ZYgbmuB1A==
X-Received: by 2002:a05:600c:4a27:b0:3da:fae5:7e2f with SMTP id c39-20020a05600c4a2700b003dafae57e2fmr11095256wmp.3.1674146322150;
        Thu, 19 Jan 2023 08:38:42 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003d9e74dd9b2sm5051560wmp.9.2023.01.19.08.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:38:41 -0800 (PST)
Message-ID: <6289067c-1a4b-cc0d-9a9c-431f0cd639bf@gmail.com>
Date: Thu, 19 Jan 2023 17:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/9] arm64: dts: mediatek: mt8186: Add audio controller
 node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-7-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-7-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_083843_862911_32753776 
X-CRM114-Status: GOOD (  14.47  )
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



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> Add audio controller node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 62 ++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 2700c830316f..c52f9be1e750 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -998,6 +998,68 @@
>   			};
>   		};
>   
> +		afe: audio-controller@11210000 {
> +			compatible = "mediatek,mt8186-sound";
> +			reg = <0 0x11210000 0 0x2000>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_AUDIO>,
> +				 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_BCLK>,
> +				 <&topckgen CLK_TOP_AUDIO>,
> +				 <&topckgen CLK_TOP_AUD_INTBUS>,
> +				 <&topckgen CLK_TOP_MAINPLL_D2_D4>,
> +				 <&topckgen CLK_TOP_AUD_1>,
> +				 <&apmixedsys CLK_APMIXED_APLL1>,
> +				 <&topckgen CLK_TOP_AUD_2>,
> +				 <&apmixedsys CLK_APMIXED_APLL2>,
> +				 <&topckgen CLK_TOP_AUD_ENGEN1>,
> +				 <&topckgen CLK_TOP_APLL1_D8>,
> +				 <&topckgen CLK_TOP_AUD_ENGEN2>,
> +				 <&topckgen CLK_TOP_APLL2_D8>,
> +				 <&topckgen CLK_TOP_APLL_I2S0_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S1_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S2_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S4_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_TDMOUT_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV_TDMOUT_M>,
> +				 <&topckgen CLK_TOP_AUDIO_H>,
> +				 <&clk26m>;
> +			clock-names = "aud_infra_clk",
> +				      "mtkaif_26m_clk",
> +				      "top_mux_audio",
> +				      "top_mux_audio_int",
> +				      "top_mainpll_d2_d4",
> +				      "top_mux_aud_1",
> +				      "top_apll1_ck",
> +				      "top_mux_aud_2",
> +				      "top_apll2_ck",
> +				      "top_mux_aud_eng1",
> +				      "top_apll1_d8",
> +				      "top_mux_aud_eng2",
> +				      "top_apll2_d8",
> +				      "top_i2s0_m_sel",
> +				      "top_i2s1_m_sel",
> +				      "top_i2s2_m_sel",
> +				      "top_i2s4_m_sel",
> +				      "top_tdm_m_sel",
> +				      "top_apll12_div0",
> +				      "top_apll12_div1",
> +				      "top_apll12_div2",
> +				      "top_apll12_div4",
> +				      "top_apll12_div_tdm",
> +				      "top_mux_audio_h",
> +				      "top_clk26m_clk";
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,apmixedsys = <&apmixedsys>;
> +			mediatek,infracfg = <&infracfg_ao>;
> +			mediatek,topckgen = <&topckgen>;
> +			resets = <&watchdog MT8186_TOPRGU_AUDIO_SW_RST>;
> +			reset-names = "audiosys";
> +			status = "disabled";
> +		};
> +
>   		mmc0: mmc@11230000 {
>   			compatible = "mediatek,mt8186-mmc",
>   				     "mediatek,mt8183-mmc";

