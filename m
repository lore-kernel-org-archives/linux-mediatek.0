Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF31C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnOpy59+ajmPcmpoOb8uCDIH85TSXgJy6vgnFBqX7Rc=; b=uBNEY7PntIwpsZaSJSwaeL81vc
	52JtgSZZd6Lo3/CGTO9w51UHG4X7021eS4kr0mVWOSYHX4YL8eIz9Xfj3ga5PqeHqqI7h+72WXY9l
	GWkaGV8tO38lfvGpLzEHmm5/QHkNZ1ehQcsM9Fk/wxUnYhKHyN86vVfdD5dx+186yXeU/za7vCT5k
	FYagERNiYW7Qau/6w6mQ63qO2bW6CZwKhkvlWtEpShSr1s8EVmH/MaIjKkCIz2NIxnte1Y0yYyhfL
	MnDFc1LISPbfwHpqPiYCI16iRux4ofY+axHhxzuvAH7SoIkQhh8TOj7GtUzJ2NuvI8O7hzyVrgmlc
	cIV1OosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWNg-00Bu8U-MX; Fri, 29 Jul 2022 20:14:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWNU-00Bttc-T4; Fri, 29 Jul 2022 20:14:34 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01AE26601B8B;
	Fri, 29 Jul 2022 21:14:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659125668;
	bh=G4GT0Els2R2O6vlylb/sPAqakzAO0cQG7B/tH51PEEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRKbidvNZSHnE0RihwLLsClpimZvmfrieKisTV9H8nPXadNlgHePR5iSRGqrzWmqz
	 GvKCBSP5Y9j9eQK+RtEAmhLv/YMPgCDicqCvMRHVTOyUBdwxngGfCf4p4lU64aIEB/
	 AkbgRn6Lfhz8lS4AayccSN1+IR/X2Rvsm7fzTK9+RNB1GOji/h1VZpYC3wT3gKXaJt
	 krsxsnm00Yq47GNmtoDFQ3xKPkkx/IBbSTklQo6QFFPDViqUVTWjEzF78wkZjTDIfG
	 R2UBLuZ774WBQedpkWci3XWz4/9wBLjimTpQQZt6lx2MwpTWYI5Y0a3kG79dlDXRar
	 PGPvmvpDBMKHQ==
Date: Fri, 29 Jul 2022 16:14:21 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8 5/6] arm64: dts: mt8195: Add efuse node to mt8195
Message-ID: <20220729201421.fxybo57g46ftghgd@notapiano>
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-6-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726135506.485108-6-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_131433_177638_E9432532 
X-CRM114-Status: GOOD (  13.49  )
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

On Tue, Jul 26, 2022 at 03:55:05PM +0200, Balsam CHIHI wrote:
> This adds the efuse node. This will be required by the thermal driver
> to get the calibration data.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 0ff34edcf8c8..4fbf24b5d202 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1236,6 +1236,22 @@ nor_flash: spi@1132c000 {
>  			status = "disabled";
>  		};
>  
> +		efuse: efuse@11c10000 {
> +			compatible = "mediatek,efuse";
> +			reg = <0 0x11c10000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			lvts_efuse_data1: lvts1-calib@1bc {
> +				reg = <0x1bc 0x14>;
> +			};
> +			lvts_efuse_data2: lvts2-calib@1d0 {
> +				reg = <0x1d0 0x38>;
> +			};
> +			svs_calibration: calib@580 {
> +				reg = <0x580 0x64>;
> +			};
> +		};
> +

This commit doesn't apply, there's already an efuse node on mt8195.dtsi. Please
rebase.

Thanks,
Nícolas

