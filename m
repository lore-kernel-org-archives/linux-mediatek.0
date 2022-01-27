Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39615C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAomjotpLGbSSUNYj0TWdnxMXweHZZFT1CVPfc0J/JU=; b=Z+SI+uWynO4E7+KTfcCEDf09LW
	K5p7fJ9mZLJkXdvOrqe6FyDDsMCS6N+hJlByNFy8MVKZK4wxQW/vpiTt+Oi6I/BGY+VCelFz0P0VB
	Z8rH4pC53GNY4miJGLX78Tr9UIrAWHttu8d+nNz+6z9gCHB1DHwp82FmMvhaB0Lf83LYF3liaxmE8
	AEQfRp0WAsDATkVwWp3FcYKgKjGSe4ukk7T45PezZZowThX1GevYKRbxYSLdQK4+FHcSdd5X39Klf
	OMqM3S5kjb5jxmDYlnDehBUyuPf1L27I2Y7GK0qwH5U2Z5aNE6PA8vmEj4b3IWp2+mjosDuk7zMPF
	zVjItjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD1xc-00F8v7-G1; Thu, 27 Jan 2022 10:25:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD1xQ-00F8sO-BC; Thu, 27 Jan 2022 10:24:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1788A1F44FF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643279084;
 bh=gjQ9eUgUEeaQAmTYpCOWfZW2UjC1PUR8v4+9IjLVhOI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FkRivsz71o7K1peXx1QazJy6vo2p/1GUA8JJi6DoHiZ7Ppp9OfV5i+GCR0bJ82l5X
 5rRB2ecrJbLsbGZtvWF7jL5sK4W4rhtfZmuqJxbbWW0JfgoeFceq3YvHXwPCR6SDCL
 ezUwB/ESZkqlCk/+4ela5+KvRtewn4n9pZnJgD6d1HomD8qRoNTw2F5ja2vAdwLu0H
 dG3exMi67BDESxpmeZ55SlC/dbnig6A/tmijR6hOCU9Od/N0chNkO/+Vd6AvxjW8q+
 uHhchAwz4ia1Q7+bjc/vDS3CMxX4oxvgEgcp0ugKNugcUp2yTSqyqKabHZ6CnPMd94
 GeZPnvDx0Dm3g==
Subject: Re: [PATCH] arm64: dts: mt8195: add gce node
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, maciej.szmigiero@oracle.com,
 David Matlack <dmatlack@google.com>, Jing Zhang <jingzhangos@google.com>,
 Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com,
 Seiya Wang <seiya.wang@mediatek.com>, moudy.ho@mediatek.com,
 roy-cw.yeh@mediatek.com, nancy.lin@mediatek.com, singo.chang@mediatek.com,
 Macpaul.Lin@mediatek.com
References: <20220126090109.32143-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <15d12a78-b8e2-f2f6-9bb0-9e501f245b94@collabora.com>
Date: Thu, 27 Jan 2022 11:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220126090109.32143-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_022448_641134_956F40AC 
X-CRM114-Status: GOOD (  17.53  )
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

Il 26/01/22 10:01, jason-jh.lin ha scritto:
> Add gce node and gce alias on mt8195 dts file.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is based on [1]
> 
> [1] arm64: dts: Add mediatek SoC mt8195 and evaluation board
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20220112114724.1953-4-tinghan.shen@mediatek.com/
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index a363e82f6988..d778ca598d18 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -6,6 +6,7 @@
>   
>   /dts-v1/;
>   #include <dt-bindings/clock/mt8195-clk.h>
> +#include <dt-bindings/gce/mt8195-gce.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/phy/phy.h>
> @@ -18,6 +19,11 @@
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	aliases {
> +		gce0 = &gce0;
> +		gce1 = &gce1;
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -367,6 +373,22 @@
>   			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
>   		};
>   
> +		gce0: mdp_mailbox@10320000 {

Just "mailbox" is fine.
		gce0: mailbox@10320000 {

> +			compatible = "mediatek,mt8195-gce";
> +			reg = <0 0x10320000 0 0x4000>;
> +			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#mbox-cells = <2>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
> +		};
> +
> +		gce1: disp_mailbox@10330000 {

Same here, please.

After that,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +			compatible = "mediatek,mt8195-gce";
> +			reg = <0 0x10330000 0 0x4000>;
> +			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#mbox-cells = <2>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
> +		};
> +
>   		scp_adsp: clock-controller@10720000 {
>   			compatible = "mediatek,mt8195-scp_adsp";
>   			reg = <0 0x10720000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
