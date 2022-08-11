Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF09C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHxsedj/YJooSCnMaRqh2mD4vHDlITnVxDHGUsvl8Z0=; b=i67cn+oNXrwSGEc+7mwpIOHZsw
	qww25AbcyEBJJL4dpM/UFn+v4uoTKuLpJG8awy9+emp2cfU3vfzVdBX5AX8ow01obJLNoeLeMU5kU
	dg3JYi4IcwCgiRWYt/j4Y8L0Cn6Q07Uh8iIS8G4Sc4phRtBFZi00eq//dIwhm84eD0wQ84W56tF9/
	+OmCnlBrW4MSeymJZtXDXfYlnXe+QopycQvzK3iurN2vDtn4aYv/ff5OZOAT8K25lQNuLpWo5pt0r
	X0nZmjqU4L5xh8ILGYRsRZ/JMuCymlYpvln/ujjpHjbaM559k2xfeNvutbedRRgKoWIO5fa37cNA5
	ZJIg4rKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMC0o-00GAPx-Nm; Thu, 11 Aug 2022 17:30:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMC0W-00GAEj-OZ; Thu, 11 Aug 2022 17:30:10 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E2F956601C04;
	Thu, 11 Aug 2022 18:30:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660239006;
	bh=lvFb3qNxbflRt6kaIIDY/QEgJF+f1L7YQ9FOa4oivHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cc4NnNdE6paaHjMAGFeShTe+BYkDfMv1a3Ujpqdy7c2Vgapkj+1+jvMPU8n7zcTVY
	 p92B/v5t7v0x+f6NgYQ8/nmUfcaEugp2uLd7mZfWaFuevFkfwc/QmIcomBgu25dJyR
	 OAKebNwFcGk/ihZslkA6k5O1/MlnznGLAjpY5qwTiOQELealARpz2pLWkj0sEDiWTN
	 XdTzsaCKExiWK7FmcL8G9/ksrvypsv7nWVHRpEI6jQEiWElFLBlp6BChqiFIicz8Cy
	 jfbNju5+9SuAz0St33VwrGwWE8HvDzk9pspdkUPM0MiTkEKuzxmaiKU433qPI+BVdT
	 eGnm2lpZeZsUw==
Date: Thu, 11 Aug 2022 13:30:00 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>, hsinyi@chromium.org
Subject: Re: [PATCH v14 1/1] arm64: dts: Add MediaTek MT8186 dts and
 evaluation board and Makefile
Message-ID: <20220811173000.kiplkbqzawlbreqf@notapiano>
References: <20220811125805.28577-1-allen-kh.cheng@mediatek.com>
 <20220811125805.28577-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220811125805.28577-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_103009_036011_50953C02 
X-CRM114-Status: GOOD (  20.22  )
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

On Thu, Aug 11, 2022 at 08:58:05PM +0800, Allen-KH Cheng wrote:
> Add basic chip support for MediaTek MT8186.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>  arch/arm64/boot/dts/mediatek/mt8186-evb.dts | 228 ++++++
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi    | 858 ++++++++++++++++++++
>  3 files changed, 1087 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
[..]
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
[..]
> +		xhci0: usb@11200000 {
> +			compatible = "mediatek,mt8186-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x1000>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>;
> +			clocks = <&topckgen CLK_TOP_USB_TOP>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +				 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x420 2>;
> +			wakeup-source;
> +			status = "disabled";
> +		};

You mention in the cover letter that the DSI node was removed from the patch
since it requires a power domain, and so will be added later when the MTK power
controller binding is sorted out. But the XHCI controller nodes also depend on
power domains:

	MT8186_POWER_DOMAIN_SSUSB
	MT8186_POWER_DOMAIN_SSUSB_P1

You're omitting the power domain for the xhci nodes here to avoid the dependency
on the power controller, which means you're relying on the bootloader to leave
them on for them to work.

I don't see any problem with adding the nodes without the reference to the
power domain for now, and just adding those later when the binding is sorted
out. The DT will be incomplete for a while, but that's usually the case anyway.

This is to say I think you should keep the DSI node in the patch without the
power-domain for now, like in the previous version. But let's see what others
think, in case omitting the power domain isn't acceptable, then you should
remove the XHCI nodes as well.

Matthias, any thoughts on this?

Thanks,
Nícolas

