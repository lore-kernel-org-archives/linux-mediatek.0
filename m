Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD87C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEcHnKRq4QPBPvsA6apkRDGYWH5f2zU/+UrIZfJJth0=; b=zqpnkQLHdxVGCxfrYKs/41ffGh
	4l1eftMQ4daODHxTUhROyptJv8f1R9KItrh/0KnofB7OGYwduuy4U5RR+5AqjFoZezLjd64EgIRgh
	hH+/Q7A4khKDq7sFihtCG6pRxCmEIsCITOOLRFRwe8hkzQlf4gLgJGOziNS86sglx+FXLbitJA92i
	GH2qbBHM7KqprTTlz4RMkRYt7EJHBMK2T6dGvoEdHGNbdNK5F/AayhT9aGH5wXnMDD/awTvpc5Y2n
	GOPoD5nIO1Y2AA6UzUXpQZyHqLT1v+kdW+3dykcVuwY+mx947JbSmgYPJ1enZ3oGSxybu4YAm2kgo
	Kdz9FfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXzf-000YvG-Lm; Mon, 14 Nov 2022 11:51:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXzD-000Yco-JX; Mon, 14 Nov 2022 11:50:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C52B66016A3;
	Mon, 14 Nov 2022 11:50:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668426644;
	bh=rSfdqTdE8g5pVk/aI7ZmXOStoeYghRLVH9p0R1kbpRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oe9YtSXjQQZ85Odb4k7Zlo2gY1T6Pw6uTs4XnOSaGwOtBwjrlL/shpUE+8AwAPDyu
	 BPT/+46VoUrSr7eQL6KX/zgvZEU5PuxB23s7JdhVAHS7StyypCG7x1pXa7WTjmiPhQ
	 +BgeRFiCq+M0R00ir4qJZMiiiv/d/M+7YPeeAApO5qGZglKpxqqRLoDCHyu7O3BjNO
	 zFEBTURCKFB+YlltZtZRry22VE5EupoBc/m+kY75QGTFNzpTlkXCVDKKPKFJY9oM27
	 eSL8ajonPwMRxDNz3LRlmonlq1rQnJ1rEHfV20GUujukIJZCKZfzvtLrjubpgOICyg
	 2+2xmua4gbetw==
Message-ID: <ee410f80-1697-6146-9755-981f2d45e88f@collabora.com>
Date: Mon, 14 Nov 2022 12:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 10/11] arm64: dts: mt7986: add Bananapi R3
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-11-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112091518.7846-11-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_035047_832632_C1FC1F1F 
X-CRM114-Status: GOOD (  15.18  )
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

Il 12/11/22 10:15, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for Bananapi R3 SBC.
> 
> - SD/eMMC support (switching first 4 bits of data-bus with sw6/D)
> - all rj45 ports and both SFP working (eth1/lan4)
> - all USB-Ports + SIM-Slot tested
> - i2c and all uarts tested
> - wifi tested (with eeprom calibration data)
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

..snip..

> +
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
> new file mode 100644
> index 000000000000..def16e36f1e6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
> @@ -0,0 +1,458 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Authors: Sam.Shih <sam.shih@mediatek.com>
> + *          Frank Wunderlich <frank-w@public-files.de>
> + *          Daniel Golle <daniel@makrotopia.org>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#include "mt7986a.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R3";
> +	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";

You have to add the machine compatible to devicetree/bindings/arm/mediatek.yaml
or you get dtb check issues.

Regards,
Angelo


