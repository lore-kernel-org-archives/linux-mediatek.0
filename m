Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8A3C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IdN0taBodJ2pogh5HusqeB93vjdXKqduQb/ABgEH9I=; b=z3GAdBw/ODzn9g
	Z45L097N0xVf0qiPxQvzW14J1VJAIOdMiXU149iy2Vc/4YELiJtahYZQpuMkS+BoFCBYVw2Zpx4D5
	DLZc3CwbOng/P2oWMr004RUr0mFehu5F2DmSFYMMbf5WtTaICa1Y4SztRUHma0NSEP5Fgk1LkU3aM
	8KpDPbm3LgUVRglnYk/x5aDkEjWwwo0ZKQGnsuH2foUJ0p/A+FOkn/7S75Zkql9s5DZUvvOPLvqt1
	oVsMAikqygIlHM92rdJXslDrDluA+HBi+hCU4FqjEvnWejnAjTaM7xc3ieVP1idn/bdwGeeoRQPMv
	0fC9ZK6XHe4o8OSIrhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhmE-007ka5-9p; Thu, 19 May 2022 15:09:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgwz-007Kh1-Qy; Thu, 19 May 2022 14:16:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C206B1F45D2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652969781;
 bh=XbAw2pqdCdBIkgqghfc0hWUSQub6dtMpVtqgjfj/UEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WhooF1ket7xkncwQFrVakvcjQz5Cnqvyn17ORhSJ1X1ouQpSeqoIEl54SKARlaAUQ
 XDB3L3hEfaQ3zJgJZS9sJOiWSg9TivMcVCyCyg2e290tkoiopeKV+xMfTfEIzWtclI
 IUKwk6LxPyBb5doe6T20ga9qzlBqN10pZROpBhOmzCLv+3Y8LiddH1y3myjkKcEZ8x
 0JBCuuHpH+8asdc3gg6CNCY5hNZQJ9DLqOYeXO1OlqBfh3TcneYMBeMaJSlbt2lCbr
 0VSeYgTwtYfQxJoO9ePC5wzLSMPUtTrUQ7NNMyqdKA5m73pRl3b/+4FGmbSCkVgSwz
 sU3cJTdzjkxZw==
Date: Thu, 19 May 2022 10:16:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 00/16] Introduce support for MediaTek MT8192 Google
 Chromebooks
Message-ID: <20220519141615.2ojp3pihvmwgg5zs@notapiano>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_071626_150061_4703ADCC 
X-CRM114-Status: GOOD (  19.96  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 12, 2022 at 04:55:46PM -0400, N=EDcolas F. R. A. Prado wrote:
> =

> This series introduces Devicetrees for the MT8192-based Asurada platform
> as well as Asurada Spherion and Asurada Hayato boards.
> =

> Support for the boards is added to the extent that is currently enabled
> in the mt8192.dtsi, as to not add any dependencies to this series.
> =

> This series was peer-reviewed internally before submission.

Hi,

it was noticed that there are some inconsistencies in the pinctrl-mt8192.c
driver and patches will be sent to fix them. Since this series would add the
first users for the mt8192 pinctrl, let's hold off this series for now, in =
order
to avoid any ABI breakage. After the pinctrl patches land, I'll do any upda=
tes
needed in the DT and send a new version for this series.

Thanks,
N=EDcolas

> =

> v2: https://lore.kernel.org/all/20220505194550.3094656-1-nfraprado@collab=
ora.com/
> v1: https://lore.kernel.org/all/20220316151327.564214-1-nfraprado@collabo=
ra.com/
> =

> Changes in v3:
> - Renamed regulator nodes to be generic
> - Fixed keyboard layout for Hayato
> =

> Changes in v2:
> - Added patches 1-2 for Mediatek board dt-bindings
> - Added patches 13-16 enabling hardware for Asurada that has since been
>   enabled on mt8192.dtsi
> =

> N=EDcolas F. R. A. Prado (16):
>   dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
>   dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
>   arm64: dts: mediatek: Introduce MT8192-based Asurada board family
>   arm64: dts: mediatek: asurada: Document GPIO names
>   arm64: dts: mediatek: asurada: Add system-wide power supplies
>   arm64: dts: mediatek: asurada: Enable and configure I2C and SPI busses
>   arm64: dts: mediatek: asurada: Add ChromeOS EC
>   arm64: dts: mediatek: asurada: Add keyboard mapping for the top row
>   arm64: dts: mediatek: asurada: Add Cr50 TPM
>   arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
>   arm64: dts: mediatek: asurada: Add I2C touchscreen
>   arm64: dts: mediatek: spherion: Add keyboard backlight
>   arm64: dts: mediatek: asurada: Enable XHCI
>   arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
>   arm64: dts: mediatek: asurada: Add MT6359 PMIC
>   arm64: dts: mediatek: asurada: Add SPMI regulators
> =

>  .../devicetree/bindings/arm/mediatek.yaml     |  13 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>  .../dts/mediatek/mt8192-asurada-hayato-r1.dts |  47 ++
>  .../mediatek/mt8192-asurada-spherion-r0.dts   |  62 ++
>  .../boot/dts/mediatek/mt8192-asurada.dtsi     | 748 ++++++++++++++++++
>  5 files changed, 872 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1=
.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-=
r0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> =

> -- =

> 2.36.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
