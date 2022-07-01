Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F90C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/RzvlBSG92tb+CS92JfmdTh03JFHrwoQW/kj8CVPH0=; b=mXJfr/U6KCJ4J5xsSAKoJV6Vs7
	2xLyasBkDjvaAQlQiNG6E12eEK/7AvWfLjNDhYDSqFtca7cEakF7UbFnDdpphEOItrajVSJmY8HxR
	8s5qQBRzykzedWVMLwBuMcYI7kaIurnubSjLJ5BPAt45ZnfUXP8LRr9jf2nzHWbzJsRld7anQfBwy
	6fRdTneik7x+5+djdOPrpaGRzjjZ8Oxhu5G7Afz2Q2skDiBM9V0MSGyj9y9lyKGg0mI9+abeEieI5
	95Bq//USD+4t7hcIISAgvLij8373aaEI35PNGH9ldusv6oSWgN5cEotUxroTebhjfTreONa8D/ya0
	cHZYygWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Os7-007A4h-Rq; Fri, 01 Jul 2022 22:12:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Orw-007A0P-7F; Fri, 01 Jul 2022 22:12:09 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 644AE660177B;
	Fri,  1 Jul 2022 23:12:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656713526;
	bh=vO57gVtWH9VVPfhwKrj1w3mSb/OAbqwWY5Fzq8waJtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAm9TKTeIYFZ/1jL+pZskQdvoZt5+1rr5343uvEnaRAtQV+EL1LFP6YYQcfzrWG9d
	 VRY022M79HIK2A0ZUANLfskx0Ncqojd+6Adb+QtNfIf8tMNH1AemTQoZFZqBUk+RLJ
	 OH+M/knafQKaYdHgOXC3dftIiL/rqg/cZyAZI3W40RVx6ozGh4L2X1fhd82qPGC50S
	 RQkWhw/P7QlfXYjVQnCjNUqapiz777M+zWhpUxJD8TS6mONJD9TRkIB340QaXCt9sZ
	 O+sAE99EM0vQVYo6E8eYK+5Kmvx6VgLgDl7D/ijhbCCr+tP061/iCslhYfE8w7mM7o
	 XYpSBMJxfKdRQ==
Date: Fri, 1 Jul 2022 18:11:58 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: Introduce MT8195 Cherry
 platform's Tomato
Message-ID: <20220701221158.iuw5fehgkjrqw6zh@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_151208_436969_BE338920 
X-CRM114-Status: GOOD (  17.60  )
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

On Thu, Jun 30, 2022 at 05:33:07PM +0200, AngeloGioacchino Del Regno wrote:
> Introduce the MT8195 Cherry Chromebook platform, including three
> revisions of Cherry Tomato boards.
> 
> This basic configuration allows to boot Linux on all board revisions
> and get a serial console from a ramdisk.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  3 +++
>  .../dts/mediatek/mt8195-cherry-tomato-r1.dts  | 11 ++++++++
>  .../dts/mediatek/mt8195-cherry-tomato-r2.dts  | 11 ++++++++
>  .../dts/mediatek/mt8195-cherry-tomato-r3.dts  | 12 +++++++++
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 26 +++++++++++++++++++
>  5 files changed, 63 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
[..]
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> new file mode 100644
> index 000000000000..17e9e4d6f6ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + */
> +/dts-v1/;
> +#include "mt8195-cherry.dtsi"
> +
> +/ {
> +	model = "MediaTek Tomato (rev1) board";

Given that the compatible is "google," I believe we'll want to rename the model
to "Google Tomato", much like was commented on the Asurada series [1], but
better to have confirmation from someone from Google. Chen-Yu? :)

Otherwise,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

[1] https://lore.kernel.org/all/CAGXv+5Gv2pjPXynz6HCdgux+giPDC5qRk+KW1aFduVz82rM=+g@mail.gmail.com/

> +	compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
> +};
[..]
> -- 
> 2.35.1
> 

