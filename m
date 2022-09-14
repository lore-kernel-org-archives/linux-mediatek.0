Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2572BECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcmqom943GqQLR2Mcn9RsFnk+zpdc3az4Q/AqfrZ1PQ=; b=YLIgsjHmxnecDSRdddzDEbZZnD
	H+WHosYRSLb6Ci4cdcY2zzHuOrJ8dcXKwxN0IzAyHjBHdXFQGNT0IrMCRsMBUd8gN8VL+AlIVpeh9
	SeGN1TgoIDsj4Zs8zcxwaDdDNUlNCgHOjkih6M5c49KLjvnfsKpEYQjgGYPCQtl64JNOPUVVgHb9E
	tdVqMaqZk/dMLBreaxF0ZPzqNSJOTsBo9E1nhsgvHEUNE6s9f5wTp5OY/erlLiMw9Eon8xhywC7Mu
	1WHkp65CUk3KSxP1Mlovqmi+9bt+egoxVBo14sHvvyTbVLdILw2KS1tr2O021QKOgUgrHl4ZuzJ8a
	HZ4OTXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYQ8z-00FXxv-DI; Wed, 14 Sep 2022 11:01:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYQ8o-00FXtU-G2; Wed, 14 Sep 2022 11:01:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E489660201C;
	Wed, 14 Sep 2022 12:01:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663153272;
	bh=+oritojqCO8DEgbEjdeplXhbt1Fs4LI2IwrWyEO+7yo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmA7McZJrKu/LJ1dL5OZKk3zC2UGvVxiuV+jzi2JSfUdEIQQ6pcDDUlNIWWaLnXvm
	 BvhBEC6EtZa8DZ7k7LZjCk1vmKQ7h/haNidlrY996NxwHS4IqLXMiUF59sKqvn+MJ6
	 iLnoXKDaOLA+DpU6apMGtFSVbsgFYZeE8MjhLwNKZlR1U0fBiPjTflYKsO8e8kNsTu
	 +TiKRLHx6ICjxgB6/RGhioE+yW8ZhKJIgi+ynNK5W8+ul+AmY7ZovnJJ1oPJVkcrju
	 ELxIKCiThJJRpVn373S0BJvUyQ082WV5T65l22yInFtlFIJhPJSi4roS6Vrhv0Hr+R
	 cykx0cm7qrMIA==
Message-ID: <3a91e743-2b8f-51b6-9ac1-adc3e7ec8cc4@collabora.com>
Date: Wed, 14 Sep 2022 13:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt6795: Add CPUX system timer node
Content-Language: en-US
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220729093536.27623-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220729093536.27623-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_040114_704392_C77A0B00 
X-CRM114-Status: GOOD (  14.54  )
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

Il 29/07/22 11:35, AngeloGioacchino Del Regno ha scritto:
> Add a node for mt6795-systimer: this is necessary to start the
> System Timer(s) for all cores, finally making CNTVCT_EL0 usable.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hello Matthias,

gentle ping for this one - this has no floating dependencies and it's
verified to work as expected.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index d4842b4a4eb7..46f0e54be766 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -230,6 +230,14 @@ sysirq: intpol-controller@10200620 {
>   			reg = <0 0x10200620 0 0x20>;
>   		};
>   
> +		systimer: timer@10200670 {
> +			compatible = "mediatek,mt6795-systimer";
> +			reg = <0 0x10200670 0 0x10>;
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&system_clk>;
> +			clock-names = "clk13m";
> +		};
> +
>   		gic: interrupt-controller@10221000 {
>   			compatible = "arm,gic-400";
>   			#interrupt-cells = <3>;



