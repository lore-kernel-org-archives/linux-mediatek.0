Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A88C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B02bzRGbPhS5MRaci1qJ7WstNeRx1qZ4Qr/Z7LI3oHQ=; b=rvOpzoNI9KqeWsQEXlEeKFeiMS
	657WSSoQZJLtZG+tQ14/bSITjzjzut8TK59+OB5b91wO5JxtZWmzRfE9/gZkOAPXibGx9abIFz6LY
	yrQyVZz77gwKpullsCTwUcUU6nvHolLZTOyos8PFoVwgwSMl4S6gksXRCcjq4rETDtq02WeRkC/Yw
	Mp03z61GYNWiiIo8sDpF9peuWmozVlW153VUAqpkYFi7uWJ3zvlJpWSHjC/d4VYIJoelvbo06mKJ3
	5DV9gzvMHmw2q3BQA79Xiy+HWdTQWI8aBnaImnlyPurR68Ywc42oiilDeUZfKACf20l4yUCpryMUa
	FGpM/drA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PGA-007FNO-KO; Fri, 01 Jul 2022 22:37:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PFz-007FL1-AU; Fri, 01 Jul 2022 22:37:01 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 070F266017F5;
	Fri,  1 Jul 2022 23:36:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656715017;
	bh=vZ3irZ1TSm2BYJfU1kDyXnE/zMCI6E+fE9pW9wuk8Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSR5xImLUn316LrjljZ1ZE2vpJUZM4TVRpGvnWzfv4NErflfdKirKLu8UPCVzqron
	 l4YGAOJWdXyKYK6D2OrVmU07Xj0/Wp+90Ey1FT9698Nd5TWi4qJsOKQTIY9ABVbCMN
	 73NxzIc/WJqP1kt5p7h2izMmWdnFOy5ZA4odTghE7lkPbjsABsydmEZO4ZmDIsu2P0
	 /SJkm9X2cTQ12UVvM/HQm4peSCLCUgGBID/YFa8egtT/YuL0NskPQ/6Jzx/Y01WWsm
	 w5IUGXT1fRjR8AILu/a22mSqxIsQb+bVOnQ2gE95eNxUzjd1ezd55oFIdvr5gGXm92
	 I3XECuFDuJE8g==
Date: Fri, 1 Jul 2022 18:36:48 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 05/11] arm64: dts: mediatek: cherry: Add support for
 internal eMMC storage
Message-ID: <20220701223648.ps76hfjdnfoj3bf2@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_153659_533119_7E271213 
X-CRM114-Status: GOOD (  16.72  )
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

On Thu, Jun 30, 2022 at 05:33:10PM +0200, AngeloGioacchino Del Regno wrote:
> Add mtk-sd controller and pin configuration to enable the internal
> eMMC storage: now it is possible to mount a rootfs located at the
> internal storage.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 091338f7d5ff..8c4b492f774f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -9,6 +9,7 @@
>  
>  / {
>  	aliases {
> +		mmc0 = &mmc0;

There was this discussion about adding aliases on dtsi's or not [1]. The
case in favor of adding them in the dtsi seemed stronger, but it wasn't
conclusive... Anyway, I guess it's fine.

[1] https://lore.kernel.org/all/CAD=FV=Wi9xTnWTPbakSnf9rKkiT+4AT=3db-uwhww1bdLKjv9g@mail.gmail.com/

>  		serial0 = &uart0;
>  	};
[..]
> +&pio {
> +	mmc0_pins_default: mmc0-default-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO125__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO124__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO123__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO119__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO118__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO117__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO116__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO121__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_6mA>;

These MTK_DRIVE_*mA macros map directly to the values, and the drive-strength
property is already standard and defined to take values in mA, so it's better to
use the value directly:

	drive-strength = <6>;

(Likewise below and in some other patches)

Otherwise,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

