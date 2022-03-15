Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D07C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UUIKuGlR/pRfkWYpFtC/Pw1oZMlMTO7JUzevuHuEoM=; b=sBB+e3Ld2HFMR/
	w+zcs7f4DFyHHdk0A+f28FHx6yiLlYJ4XvGGbqbQLNU3i4qR7W4UXUk94mewvMNiKoYsh5nYtT1Iz
	pepHZDi87IP4EyvDD1+q1bqv2ey9KwVnrWa5IJFfyQ/qqZH0UHft3akF4rSjJDmgwHctoOsK/F0bU
	LIBtuMGNuFAkex7tLKvihR+EqqBgU9mkEGCou0jEZG5Q78qiHuuPexkBMtfPj8vJMsBPpPAeuLNED
	b57R3liCkaOcWBZ4ILz24VY+uKckm+36XYDfFZciN/RuUZLYK6QBmq0hzlQui22dZEUGJ9vFpZP03
	1GdcYckSNFhLw2lKJZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8WP-009YTd-AS; Tue, 15 Mar 2022 14:51:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8WA-009YOO-Jw; Tue, 15 Mar 2022 14:51:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D2B311F43050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647355881;
 bh=n28oXfgiw2Sb0y58LuA7Dn1PCfsvC7PCYkSYkQ3Pfmg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nzL5e1Iphmg+/ZBEDGylNE+pSMHeI3jXwGQyvbpaR2OWt9pzZUoetEfa8BuEkYzaY
 dI/TdHxgmuU7hQowtlTm3yOvbXFo8SwNVM6GVE2EF9C1TsczgdmeW1xPOyfCJ1wv4i
 moxO0164tp5afwwdB0eKpS7iTSjAcUrrdw4UoJq7oqIupiodd5+2fP/cXaMtz9bBK9
 AIvk6uW4aHSkpBpE7mBixutENcSxct7V6gQNpuOj0EFFmkJUdIRhHkMtTmlwU4FlI/
 JjOM4pTgq6bRZJH6Pfv14xHU4799h17qrMLJKpd9ZParSy9NwmJpiyaGM2v5AvLcnt
 YvYaql8OOxIHw==
Message-ID: <2c6e0974-1418-82ae-506b-62cd1e5f6d3c@collabora.com>
Date: Tue, 15 Mar 2022 15:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 19/21] arm64: dts: mt8192: Add dsi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-20-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-20-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_075122_820257_D9C6CBC1 
X-CRM114-Status: GOOD (  13.79  )
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

Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> Add dsi ndoe for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 94f88e52776b..3d16cb0b3ea1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1327,6 +1327,20 @@
>   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
>   		};
>   
> +		dsi0: dsi@14010000 {
> +			compatible = "mediatek,mt8183-dsi";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,syscon-dsi = <&mmsys 0x140>;

mediatek,syscon-dsi does not exist upstream: here we have proper reset controller
support.

> +			clocks = <&mmsys CLK_MM_DSI0>,
> +				 <&mmsys CLK_MM_DSI_DSI0>,
> +				 <&mipi_tx0>;
> +			clock-names = "engine", "digital", "hs";
> +			phys = <&mipi_tx0>;
> +			phy-names = "dphy";

On MT8183, we do....
resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;

...so you need to simply replicate for MT8192. Please do.

> +			status = "disabled";
> +		};
> +
>   		ovl_2l2: ovl@14014000 {
>   			compatible = "mediatek,mt8192-disp-ovl-2l";
>   			reg = <0 0x14014000 0 0x1000>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
