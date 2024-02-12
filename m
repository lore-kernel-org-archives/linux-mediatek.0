Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392F6C4829E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVcetiUz4w5XWUr5jkU+GM18jhmhRpplq7OyDXUkogg=; b=n4TaCIUbGmHSUS8w7SJbPXFO/i
	Ih5przwTsnPJHe3QCaOpKcIzkfeSpAvwk8G4eAYjPwGa7Mysypd+2MdbkyDfqanimhk2XldxgpDVO
	ih1N4+J7T7kgWm/YKA5h8959dxjSmbwFwnCvHNe2Q1kMPL7YcAwSJoluGGHWu0D6zgJIE42sHTSUt
	j6eonOvGIX0q+8aH1ThEhDFAx/zDqFTcO0PBTYwLWVOOHh4hI1pZP28/unLr5oXsI1/dEveUF+Kl/
	ygcdqG+5Afm2f+3E/eoRDyn9DwVZMaNNTPZvo06j+vF0EF5a8A3HXRuzXGlzM6plZ3wSpN6BOTQ3Y
	lIYzrurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZeFS-000000075Lo-01Vr;
	Mon, 12 Feb 2024 21:53:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZeFO-000000075KZ-07Mj;
	Mon, 12 Feb 2024 21:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707774830;
	bh=9WDRxW8U9j71xvOzyf2SRO3yDQYGi6yYhi5U65+yc2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NS2eE5srw/03SEixUV2Ed+/2VApYR5V5NKHpMVHvuydp3FVUqqSlRqHCutaXXsr+f
	 3+uWaTw0455gweqYl8dk6ngI1nsNKPpUsx9BQQzp8b2bUZ4MyLnDzb1ShOyf0M2crZ
	 cyqoBfPQ6C3sVvUVj0yXwsQT7k6aX4Pc84g7AjkSSgq7RrqLV6zN6eesRTwvfmgBuO
	 lINMLNDdTSeY5d9tcsPIe7EXvxFUkC+HD/aWWF1p4byj8kBkIydEOnAT/5gLOXdsLo
	 e2KbtkCpvxvR7P1gp2ABRRmEIbfRD1j3fZthrYF7JSIiPpnmyqVkUFolM/LW6O007V
	 zfbZ4lU0s1j8w==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0DF6437813D5;
	Mon, 12 Feb 2024 21:53:47 +0000 (UTC)
Date: Mon, 12 Feb 2024 16:53:45 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Add missing clocks to
 ssusb power domains
Message-ID: <985e1a4f-c538-4a9d-be58-2c688aa7350c@notapiano>
References: <20240212-mt8186-ssusb-domain-clk-fix-v1-1-26cb98746aa3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212-mt8186-ssusb-domain-clk-fix-v1-1-26cb98746aa3@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_135354_228808_4537EB0A 
X-CRM114-Status: GOOD (  23.97  )
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

On Mon, Feb 12, 2024 at 04:32:44PM -0500, Nícolas F. R. A. Prado wrote:
> The ssusb power domains currently don't list any clocks, despite
> depending on some, and thus rely on the bootloader leaving the required
> clocks on in order to work.
> 
> When booting with the upstream arm64 defconfig, the power domain
> controller will defer probe until modules have loaded since it has an
> indirect dependency on CONFIG_MTK_CMDQ, which is configured as a module.
> However at the point where modules are loaded, unused clocks are also
> disabled, causing the ssusb domains to fail to be enabled and
> consequently the controller to fail probe:
> 
> mtk-power-controller 10006000.syscon:power-controller: /soc/syscon@10006000/power-controller/power-domain@4: failed to power on domain: -110
> mtk-power-controller: probe of 10006000.syscon:power-controller failed with error -110
> 
> Add the missing clocks to the ssusb power domains so the power
> controller can boot without relying on bootloader state.
> 
> Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index adaf5e57fac5..02f33ec3cbd3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -931,11 +931,19 @@ power-domain@MT8186_POWER_DOMAIN_CSIRX_TOP {
>  
>  				power-domain@MT8186_POWER_DOMAIN_SSUSB {
>  					reg = <MT8186_POWER_DOMAIN_SSUSB>;
> +					clocks = <&topckgen CLK_TOP_USB_TOP>,
> +						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
> +					clock-names = "sys_ck", "ref_ck", "xhci_ck";
>  					#power-domain-cells = <0>;
>  				};
>  
>  				power-domain@MT8186_POWER_DOMAIN_SSUSB_P1 {
>  					reg = <MT8186_POWER_DOMAIN_SSUSB_P1>;
> +					clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
> +						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
> +						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
> +					clock-names = "sys_ck", "ref_ck", "xhci_ck";

I forgot to mention this here, but the XHCI clock wasn't needed to get the power
domains to work per se, but leaving it out caused issues when probing the mtu3
devices:
<3>[   15.431506] mtu3 11201000.usb: clks of sts1 are not stable!
<3>[   15.443965] mtu3 11201000.usb: device enable failed -110
<3>[   15.454306] mtu3 11201000.usb: mtu3 hw init failed:-110
<3>[   15.463865] mtu3 11201000.usb: failed to initialize gadget
<4>[   15.477890] mtu3: probe of 11201000.usb failed with error -110

<3>[   15.514603] mtu3 11281000.usb: clks of sts1 are not stable!
<3>[   15.525239] mtu3 11281000.usb: device enable failed -110
<3>[   15.614174] mtu3 11281000.usb: mtu3 hw init failed:-110
<3>[   15.619647] mtu3 11281000.usb: failed to initialize gadget
<4>[   15.630623] mtu3: probe of 11281000.usb failed with error -110

Not sure if this issue should be handled separately (maybe the mtu3 device
should enable the XHCI clock?), but I opted to include the clock here to get
boot working for this device at once.

Thanks,
Nícolas

