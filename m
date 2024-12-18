Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1742E77187
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+xSJtYDe1/DKQpLbvu9d31e1vj5VjbDKxZfYNH54pI=; b=zu9z2nueLIXyaE
	9l0xFGKPM+/zxYb3XYKOk6vKEk/+UKJguTZ+M5xCY9Fbwge3UtEY2fN+V5Mbj75sk8p7j4O3ErUBQ
	MYLGxyJqxqiFUvqsqfj5wUo7y3effNaRGyLjVZOYZ35LMynqmmb9oRZh8CPT1ws7eWyDp+gpp5YBc
	nFUCnntSWU/QSzSRfCDaEcLsnXR9UzWcOSMV9KPP9EXXEVMYvTdIUPunwzzczewKvc/o3ovx1FKa8
	opOuzcLxoI3K1xSYQcGYNmCagW9jwPAP+1xriaq97NI9v24Y8hMJA+exUCP0PHMlyKICuC/ctXF9k
	q/2FPUZchx9Z7EK1n97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNulj-0000000Gnwm-2P6q;
	Wed, 18 Dec 2024 14:11:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNukc-0000000Gnmb-10xw;
	Wed, 18 Dec 2024 14:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734531006;
	bh=Hq8XhkGLRdrugfZkK+fMbG5+AQ2uVsKhamccg/HdDPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qLhSZOgv1NUWmpOq5jY9QS05o6TRhLsp0k5bG98DdwLqHjgGQmztQvvuirQ9NAeie
	 lGImKftK04TlWgWpiqtn8pSce/yTul/hoIMOP9BG2cKP1byuX9XeVh9rxaGT4jMWYF
	 0CEWBBTWDuOVUSNcJvkhWm6icsgvVZ5j0LiNgyDotmGKahfhrEgOqohGB6XUVE0zCO
	 cshu8H56QHLuw0KkDIXnXphI0HyjggHPf0YsVNJ6HC1AFvg9aJNEmtgY9WnCN+bcuM
	 ZGz50r9ugnfVIURZkkSZYt8migf4df3tHfmBMgZOZvHNoYvGFe+RYMQGfTUQezGHKJ
	 /8vv+tgzkcD1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43B4517E3770;
	Wed, 18 Dec 2024 15:10:06 +0100 (CET)
Message-ID: <1b10a0ef-b6fa-4758-b3fc-0a44d840bce9@collabora.com>
Date: Wed, 18 Dec 2024 15:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/22] continue mt7988 devicetree work
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20241217091238.16032-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_061010_436640_A4B6A25F 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/12/24 10:12, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series adds some missing labels and new nodes to mt7988 DTS.
> 
> based on pinctrl-series
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=918572
> 

The whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Good job!

Cheers,
Angelo

> changes:
> v3:
> - reorder
> - small fixes
> - add some new patches (t-phy, pcie, mmc overlays)
> - dropped pmic and proc-supply for now because we found a mismatch compared with schematic
> 
> v2:
> - reorder and squash label-commits to where they are used
> - add some more nodes
> - add changes to bananapi-r4 board
> - moving some nodes from SoC dtsi to board dts
> 
> Frank Wunderlich (22):
>    arm64: dts: mediatek: mt7988: Add reserved memory
>    arm64: dts: mediatek: mt7988: Add mmc support
>    arm64: dts: mediatek: mt7988: Add lvts node
>    arm64: dts: mediatek: mt7988: Add thermal-zone
>    arm64: dts: mediatek: mt7988: Add missing clock-div property for i2c
>    arm64: dts: mediatek: mt7988: Add mcu-sys node for cpu
>    arm64: dts: mediatek: mt7988: Add CPU OPP table for clock scaling
>    arm64: dts: mediatek: mt7988: Disable usb controllers by default
>    arm64: dts: mediatek: mt7988: Add t-phy for ssusb1
>    arm64: dts: mediatek: mt7988: Add pcie nodes
>    arm64: dts: mediatek: mt7988a-bpi-r4: Enable watchdog
>    arm64: dts: mediatek: mt7988a-bpi-r4: Add fixed regulators for 1v8 and
>      3v3
>    arm64: dts: mediatek: mt7988a-bpi-r4: Add dt overlays for sd + emmc
>    arm64: dts: mediatek: mt7988a-bpi-r4: Add thermal configuration
>    arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart
>    arm64: dts: mediatek: mt7988a-bpi-r4: Add default UART stdout
>    arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers
>    arm64: dts: mediatek: mt7988a-bpi-r4: Add PCA9545 I2C Mux
>    arm64: dts: mediatek: mt7988a-bpi-r4: Enable t-phy for ssusb1
>    arm64: dts: mediatek: mt7988a-bpi-r4: Enable ssusb1 on bpi-r4
>    arm64: dts: mediatek: mt7988a-bpi-r4: Enable pwm
>    arm64: dts: mediatek: mt7988a-bpi-r4: Enable pcie
> 
>   arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>   .../mt7988a-bananapi-bpi-r4-emmc.dtso         |  33 ++
>   .../mediatek/mt7988a-bananapi-bpi-r4-sd.dtso  |  31 ++
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 143 +++++++++
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 303 +++++++++++++++++-
>   5 files changed, 506 insertions(+), 7 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso
> 


