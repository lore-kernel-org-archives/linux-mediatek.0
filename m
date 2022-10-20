Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4138FC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3zlsAUCv4kmhrXjs27KvW9MZ2+0anxZQcIBT3YcU5c=; b=vhe4O0/YU2ScQ4Z67kyJRuZbcs
	wzn6lZomgTFt4yI3IxSjvVVFgFyPd5pH5Hw0PMuEAKeI2ZZDbI7fxnWr1L4wZTTvkHIk+1LHHgjeM
	6FAGBxGAeZvpwWdAP28NriK3I9CQV+HkEyCVWuI1l+ICR712MArTMPKsTBztRqXsTEkICiE5P1Xmv
	ixYXk3+gcnUhR2DTvflvQl0QCoSn/c7tDYY/OTgHQm3jf5/0dbE1ZQXW8DaMZQ9zmcXdCr3hWa50z
	t2BoE261FcA+xOCyqZo1AquoP9loZ5HG5NQo41dGhbQmdfDKCdUt38XuCugSq9HQii1mrr4TJucNw
	oEDoZO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQcs-00C4ct-Bo; Thu, 20 Oct 2022 08:10:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQch-00C4WK-Bc; Thu, 20 Oct 2022 08:09:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 826A166023A0;
	Thu, 20 Oct 2022 09:09:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666253385;
	bh=UiiNQ2JiXdeVnmENk3ISE8BLEL6+wyAdDcJy+rlcvFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dlWOH/BgcuFtG2NoTSkj2ozcSRqMC6EXyppaBDywsbEulv94OVNDucnxDhJq7/wnn
	 uyBN0SdLkKMSPfdVbohaY4bLk9L9P4QH/G9lQ5Bp1OJj4ftlA17o59Bhkoqe0Egymy
	 hdZdwNCQU/UJnRhEmJaozlBO0pW4hW5HK2xBSWA1ABn3N5CUq/VruEz+HSm8DwbN7D
	 3U6MoWR+p7eCxoEfyrsAv/0faI4/ZP46Ei+ZXuGIXh/x5Ys5EXyn/feOeyUG+tfaUR
	 AeZedg6xaxKhK+AavXn4I1LSvydgTEKs4FgxDrpFo/vPFWAQVMSlOD19FQ5EAEk0f5
	 09vu4Q1rPwr/w==
Message-ID: <0fb91a39-e356-4785-3ab1-11cbc3e78877@collabora.com>
Date: Thu, 20 Oct 2022 10:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3] arm64: dts: mt8195: Add Ethernet controller
To: Biao Huang <biao.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com
References: <20221020024155.24520-1-biao.huang@mediatek.com>
 <20221020024155.24520-2-biao.huang@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221020024155.24520-2-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_010951_657565_EE3EB8C7 
X-CRM114-Status: GOOD (  13.35  )
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

Il 20/10/22 04:41, Biao Huang ha scritto:
> Add Ethernet controller node for mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88 ++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 88 ++++++++++++++++++++
>   2 files changed, 176 insertions(+)
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..7efaf92c5ff3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1042,6 +1042,94 @@ spis1: spi@1101e000 {
>   			status = "disabled";
>   		};
>   
> +		eth: ethernet@11021000 {
> +			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";

..snip..

> +			#address-cells = <0>;
> +			#size-cells = <0>;

I'm truly sorry for a partial bad suggestion, you don't need to specify address nor
size cells = <0>; in the ethernet node, or you get a warning:

arch/arm64/boot/dts/mediatek/mt8195.dtsi:1174.26-1260.5: Warning 
(avoid_unnecessary_addr_size): /soc/ethernet@11021000: unnecessary 
#address-cells/#size-cells without "ranges" or child "reg" property

So please remove these two.

After which...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



