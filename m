Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C9CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd1Dq3uJKlFCrDae889n8fcid3u1wezxaIUUcFz2JSE=; b=h49VU+CyTGwBCR9+xY1qxXZdXh
	12Lv6+TrIWhe31TAVjYxg+2n89BaS4TAgLSZ8Tu7gUw3ZQ1NsuWIW1RPP/F2YOAbwOD9jgPNH4ChZ
	+Q0dM3rgpTuQGdzcG+nlLgao/75ze5vhevMOPk9xUA6shpNdMl7NRM/ryH9RoAi2KmzOxsPq/ckj0
	tiz/SvMvi5zRam3Lxj8UM7mcOm/1LqP7D8JnatHC9lO0VGPvv9FGkwjkjBh4zjjfIKxUPWGletYux
	haXCxO7hWxbHo0EAAjoGtikE5NK5mko1ipCvc3Q9UO9D+2SrNZ9WpIVM6755NF2iYqy0QfZfeUJPr
	8RBtsWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnw0-0000000HBkd-2c2k;
	Wed, 17 Jun 2026 10:55:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnvy-0000000HBjy-3NhX;
	Wed, 17 Jun 2026 10:55:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41831600AB;
	Wed, 17 Jun 2026 10:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2FE1F000E9;
	Wed, 17 Jun 2026 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781693750;
	bh=Jd1Dq3uJKlFCrDae889n8fcid3u1wezxaIUUcFz2JSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeYLfkHIPDWI4FZo6IxYeiVudZZXIFmd/L3ka6Iw1XGscOakItLDpUR9d4WquAELH
	 yXIokVSA9E8gwS4vak7agTzgTv1CTRFyfhW3r6c7qjgBBxvkUjVElU+46gb2rsSKuF
	 63Wsm856Bj+fvM6veBMG893etX9OyMM19QgYGwKV/LCPDn8Wji33PuR5FwiMD8eVMQ
	 CbH7NJ6aaV3D7v45rWk4QCsR3uKaWcVkQ18XKiaWJuhKD0VfjD2glz7AGORsqf1Wkz
	 5mxiYrDup5sjuD622kwu6xnt9IGPxhwDIkuinNJ4kKpwwI9vTx72w0pSaF/dlV5bR3
	 qQKHMVVveMBpw==
Date: Wed, 17 Jun 2026 12:55:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zakariya Hadrami <zkh1@proton.me>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 3/5] ARM: dts: mediatek: Add basic support for Amazon
 ford board
Message-ID: <20260617-fat-lively-rottweiler-ef0cf1@quoll>
References: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
 <20260617-mt8127-amazon-ford-basic-v1-3-d02ad15ac359@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v1-3-d02ad15ac359@proton.me>
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

On Wed, Jun 17, 2026 at 11:20:12AM +0900, Zakariya Hadrami wrote:
> This tablet uses a MediaTek MT8127 system-on-chip with 1GB of RAM.
> It can currently boot into initramfs with a working UART and
> Simple Framebuffer using already initialized panel by the bootloader.
> 
> Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
> ---
>  arch/arm/boot/dts/mediatek/Makefile               |  1 +
>  arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts | 46 +++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
> index 37c4cded0eae..a610bc75c7d9 100644
> --- a/arch/arm/boot/dts/mediatek/Makefile
> +++ b/arch/arm/boot/dts/mediatek/Makefile
> @@ -14,5 +14,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
>  	mt7623n-rfb-emmc.dtb \
>  	mt7623n-bananapi-bpi-r2.dtb \
>  	mt7629-rfb.dtb \
> +	mt8127-amazon-ford.dtb \
>  	mt8127-moose.dtb \
>  	mt8135-evbp1.dtb
> diff --git a/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
> new file mode 100644
> index 000000000000..21bdab0e43f8
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +#include "mt8127.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8127 Amazon Ford";
> +	compatible = "amazon,ford", "mediatek,mt8127";

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Best regards,
Krzysztof


