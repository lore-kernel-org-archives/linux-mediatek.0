Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD1C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 11:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59jeQkyGe+eoYe6SVsVjPEcX8g8UIbB/Bbr7lyqzrTY=; b=N1xhBEXs6mE39v57W5zETPFqem
	y1JvtEzkDIxn7E7fbPRpvYzIGNCKKOBsuSXBS2Ylq52XrBWylHMb1gHvoahfBeDiXn2v4+XEC+9xs
	oT9TzaCfoOz4tRplpMf03BLYShXYhHo6XIRO0GjfPCbUAQgqrg8ibEa+Mb2Sa9Uxwq4+u/mCKtff1
	vCLNA3XUTBe4J4hj5G4CBY8MKi0Mb98bcz32dApAsDHv2UYkD+r7J58pYcywkzz/N4MndjkR9Zvyc
	RCiSt6M9zycApbfOv/uMIxuhvrDkFbwHI+BXmSagRrM7WL9qcbzIato6ZhxbxK7a9tFt7P/t9ZRHZ
	5zeNK5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3dv-006A9V-0y; Fri, 03 Mar 2023 11:32:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3dk-006A5c-Ck; Fri, 03 Mar 2023 11:31:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 46E576602FA9;
	Fri,  3 Mar 2023 11:31:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677843114;
	bh=Z3yUm93fbmBr4tmQhaa1EsNOBS414MHB6O4CE83OdqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lgy+LTz1zV43+EdSB+89iwuIlMZfftKkayi7VVbaOiTT4WcNFTVRVV19dL+w2F0pi
	 CbTrUC1iBiDivUWHT2qyTP/RJFccVJC7bmWUvoA9bjEvfzAEOHy8dSHOIy8iw7xisS
	 MYzrSbGiD/nfhJSgjxW1J2/rsa49WhH3f6u+6axUcVdGI9X669hR+jFqP1HrJlEWr6
	 WMiDYmNLGaT3SMmjWV3iG6CnnlkGIKCXbZEoMC/ie69JrfSyqiFywVPF9sshmRb9/F
	 Sy6vJeXO8e8Fqpez8XLcvsye5bNxXETAd+aAPyBNAghgvDy8GImC7wQ2S+n43UzxuW
	 ZsBFPCwXl0jZA==
Message-ID: <b121408c-bed3-7b58-affc-c7fde5d0ac40@collabora.com>
Date: Fri, 3 Mar 2023 12:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/7] arm64: dts: mediatek: mt8186: Add ADSP node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230303031728.24251-1-allen-kh.cheng@mediatek.com>
 <20230303031728.24251-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230303031728.24251-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_033156_617024_58C4A506 
X-CRM114-Status: GOOD (  13.58  )
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

Il 03/03/23 04:17, Allen-KH Cheng ha scritto:
> Add ADSP node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 0e42bdbd2cb6..337bcf3c1571 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -633,6 +633,22 @@
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
>   		};
>   
> +		adsp: adsp@10680000 {
> +			compatible = "mediatek,mt8186-dsp";
> +			reg = <0 0x10680000 0 0x2000>, <0 0x10800000 0 0x100000>,
> +			      <0 0x1068b000 0 0x100>, <0 0x1068f000 0 0x1000>;
> +			reg-names = "cfg", "sram", "sec", "bus";
> +			clocks = <&topckgen CLK_TOP_AUDIODSP>, <&topckgen CLK_TOP_ADSP_BUS>;

Was missing <&topckgen CLK_TOP_AUDIO_H> intentional here?

AFAIK, that's required for the ADSP.

Regards,
Angelo

