Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470D6ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcyd+1GY/b3HwE+3H+LE5Y/SZ1QVkRniYaPks4Bopik=; b=rTHg6XRozmhXMvodMNkp5soEif
	2JHiwW5Cyr6HtUHDHZTYQvvMwzZ/OknZ0K5itePpdEY+dDotCwy5HsaTSUwcQ0ePh+VYp2HSs53EY
	Sj099jYVUtYqW1JeR2nvFqpUPkYC6gfyP8gwjxwi8pFXBbJx9YrucZc5D/T1NJu7Ao4CDo/vDo0J5
	Xui7tXLZaim8qTPKdv9JKot96Zy6lG29tU2g2DKpF0TmqKuDp6641KH/bxO9tv7uF3KKLc8wpPwvX
	3OnSZkbvRglHz11OxgzFuomCAUWtH+U2LUqolNoKZBSEJsy6VVc9fWRPm2V7RrC1ZkDGXYhQgwi01
	tIiZD0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfTV-00000002ItE-3WBr;
	Mon, 09 Sep 2024 14:34:41 +0000
Received: from a7-39.smtp-out.eu-west-1.amazonses.com ([54.240.7.39])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfTT-00000002Is7-0YHQ
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 14:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725892475;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jXdZd1nxFVpn9kF95ZTOmNkylHuRPykng36i8DK7+Z8=;
	b=JkkGe4fwOjSMlldzBxkXecc8UDlfDJP5j8GlDNl4lCKkV2yZE0JTFVf7Eaao6mXZ
	3zi5l5QXjA/oSCPGRJKKQNsx8C6wNGR5UoBK6daAMRFqakZBIxrp0SE84Sgn+xn4ndj
	pB1KMLY6F31pgALbc5hx8fs2feUadEPFsq7xFk1vv9cy2dL4PqhCL3BZ3xsEbEbKbwK
	nFwDRRKv1PYfCxWmkWGjaHUn6U38wZRWQNVLC+5StumVSCjK2OR387It3uFYoOhtGp4
	Aqk3zfEDyg1h1kjbKGqkyg6IfCQqkSHlDmdZTorf2OO6303/+aivlQ+yHHMGvz22U1v
	1OFmmMXaNQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725892475;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=jXdZd1nxFVpn9kF95ZTOmNkylHuRPykng36i8DK7+Z8=;
	b=KXQG/KNeV5n/CTYFm+n1hNTTFPhukwIytvBx3kvJfenFH9bDHzysCn2GKrlCvvXT
	OUYOnjvbuUzeUv3ZBTiPqikszKneJiH3kKoHLK4M+H8GBbjiPiI3NEwAPOtIbI/CN3M
	dkgbr5fW9wxrcNCubmj5ZaQ3BXLYCp1WtgprHjSs=
Message-ID: <01020191d7353903-ef7f28db-4285-473b-af03-38d1cc663042-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 14:34:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: mediatek: Add MT8186 Ponyta
 Chromebooks
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
	hsinyi@chromium.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, hsinyi@google.com, 
	knoxchiou@google.com, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, robh@kernel.org
References: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
 <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240909023148.1677936-3-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240909023148.1677936-3-cengjianeng@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_073439_395620_9128D9E7 
X-CRM114-Status: GOOD (  17.69  )
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

Il 09/09/24 04:31, Jianeng Ceng ha scritto:
> MT8186 ponyta, known as huaqin custom label, is a
> MT8186 based laptop. It is based on the "corsola" design.
> It includes LTE, touchpad combinations.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
> Changes in v5:
> - PATCH 2/2: Remove sku2147483647.
> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-3-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage since v3:
> - No change.
> 
> Changes in v2:
> - PATCH 2/2: Modify the dtb name without rev2.
> - Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>   .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 23 ++++++++++
>   .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
>   .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
>   4 files changed, 96 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 8fd7b2bb7a15..50b5cf04d3ae 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -58,6 +58,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
> new file mode 100644
> index 000000000000..f6448e91436a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-ponyta.dtsi"
> +
> +/ {
> +	model = "Google Ponyta sku0/unprovisioned board";

Is this a prototype that will never go into the wild?!
Those machines will anyway be unavailable in the following months, so it looks
like it's really useless to add them.

If that's not just a prototype, then nevermind, we can add it.

> +	compatible = "google,ponyta-sku0", "google,ponyta", "mediatek,mt8186";
> +};
> +
> +&i2c2 {
> +	touchpad@2c {

This is already inherited from mt8186-corsola-steelix.dtsi, so you simply need
to disable the other trackpad.

	trackpad@15 {
		status = "disabled";
	};

> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&pp3300_s3>;
> +		wakeup-source;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
> new file mode 100644
> index 000000000000..203ee109bbf7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-ponyta.dtsi"
> +
> +/ {
> +	model = "Google Ponyta sku1 board";
> +	compatible = "google,ponyta-sku1", "google,ponyta", "mediatek,mt8186";
> +};
> +
> +&i2c2 {
> +	touchpad@15 {

Same comment as the other one.... but here it will be

	trackpad@2c {
		status = "disabled";
	};


Regards,
Angelo

> +		compatible = "elan,ekth3000";
> +		reg = <0x15>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&pp3300_s3>;
> +		wakeup-source;
> +	};
> +};
> +
> +&usb_c1 {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> new file mode 100644
> index 000000000000..59594022331e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-steelix.dtsi"
> +
> +&keyboard_controller {
> +	function-row-physmap = <
> +		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
> +		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
> +		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
> +		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
> +		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
> +		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
> +		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
> +		MATRIX_KEY(0x00, 0x04, 0)	/* T8 */
> +		MATRIX_KEY(0x00, 0x01, 0)	/* T9 */
> +		MATRIX_KEY(0x02, 0x09, 0)	/* T10 */
> +		MATRIX_KEY(0x01, 0x09, 0)	/* T11 */
> +		MATRIX_KEY(0x01, 0x05, 0)	/* T12 */
> +	>;
> +
> +	linux,keymap = <
> +		CROS_STD_MAIN_KEYMAP
> +		MATRIX_KEY(0x00, 0x02, KEY_BACK)
> +		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
> +		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
> +		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
> +		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
> +		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> +		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> +		MATRIX_KEY(0x00, 0x04, KEY_PLAYPAUSE)
> +		MATRIX_KEY(0x00, 0x01, KEY_MICMUTE)
> +		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> +		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> +		MATRIX_KEY(0x01, 0x05, KEY_VOLUMEUP)
> +	>;
> +};
> +
> +&mt6366codec {
> +	mediatek,dmic-mode = <1>; /* one-wire */
> +};



