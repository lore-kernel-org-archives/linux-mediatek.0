Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6050BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2374C60D07
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2374C60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBQmIU5YQgsFFpjlEWJZYZQuRAdDYRpWRopSvvh50h4=; b=paekxV5Qw0cdVsaQ6KcWR210ib
	RVqsBinpQL/LbrxpywDHSyNNcpAC8L83Mn1XboVpPga9i/JFPKj91e7Vw73cIwPhfc8axAPV6l4IZ
	057g8XtgIjbTHGL8YL9U+k0ZXhhQcgoRuvyjCzAPbVm6T7lD6FWc97WIH+NO8RgrzgNOITio29cn4
	HFfXdZAQt3mpzMI6E5tKZmq1CmsIB61Ni7TPJHr+qfuoXU4KJKiIiGEuQ6KIYp/TMJO3ukFeADh0x
	WlH7rwQw18ryqN6QUWcXK03WYqsbtxToTz7tlFvLNCW4pJyTt+/a083JX7YPL3AQXwx87cZrE40Nn
	Vk5cwRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOE3-0028RQ-2A; Tue, 26 Oct 2021 15:18:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfODo-0028K7-9M; Tue, 26 Oct 2021 15:18:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 944641F43A1C
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC 12/13] arm64: dts: mt8192: Add apu tinysys
To: Flora Fu <flora.fu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-13-flora.fu@mediatek.com>
Message-ID: <314442f7-0c89-8696-05c9-871bfddf1821@collabora.com>
Date: Tue, 26 Oct 2021 17:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-13-flora.fu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_081840_491854_AEEC5183 
X-CRM114-Status: GOOD (  19.29  )
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

Il 23/10/21 13:14, Flora Fu ha scritto:
> Add node for APU tinysys.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36 ++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index c505c6926839..8108084a3f6f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -925,6 +925,42 @@
>   			#iommu-cells = <1>;
>   		};
>   
> +		apusys_rv@19001000 {
> +			compatible = "mediatek,mt8192-apusys-rv";
> +			reg = <0 0x19000000 0 0x1000>,
> +			      <0 0x19001000 0 0x1000>,
> +			      <0 0x19002000 0 0x10>;
> +			reg-names = "apu_mbox",
> +				    "md32_sysctrl",
> +				    "apu_wdt";
> +			mediatek,apusys-power = <&apusys_power>;

As said on the IOMMU commit, I think that apusys-power can be passed as a
power domain here as well... also keeping in mind that the apuspm power
domain is being used in both the IOMMU and in apusys-power already, so you
could even pass only the apusys-power pd here, because apuspm would be
already being turned on by the former...

...unless there's any possibility to have some functionality with apuspm up
but apusys-power down? From how it looks right now, that's not a thing.

> +			power-domains = <&apuspm 0>;
> +			iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
> +			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "apu_wdt",
> +					  "mbox0_irq";
> +			apu_ctrl {
> +				compatible = "mediatek,apu-ctrl-rpmsg";
> +				mtk,rpmsg-name = "apu-ctrl-rpmsg";

This is supposed to be "mediatek,rpmsg-name" instead... or it won't work.

> +			};
> +
> +			apu_pwr_tx {
> +				compatible = "mediatek,apupwr-tx-rpmsg";
> +				mtk,rpmsg-name = "apupwr-tx-rpmsg";
> +			};
> +
> +			apu_pwr_rx {
> +				compatible = "mediatek,apupwr-rx-rpmsg";
> +				mtk,rpmsg-name = "apupwr-rx-rpmsg";
> +			};
> +
> +			apu_mdw_rpmsg {
> +				compatible = "mediatek,apu-mdw-rpmsg";
> +				mtk,rpmsg-name = "apu-mdw-rpmsg";
> +			};
> +		};
> +
>   		apu_conn: apu_conn@19020000 {
>   			compatible = "mediatek,mt8192-apu-conn", "syscon";
>   			reg = <0 0x19020000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
