Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB2ECFC501
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsHvYaAZCE/KsR/TJKV5os4W8RXz4Mu6xQpI0ScFuYU=; b=1dyORnAGcviutsbsV2HfDz5MWC
	g68BB+TLpK38MtlZuYX8zYILpPWvDrdIqqXBXsXoB3ArkQkO7nHGPx9GlaIYG3Ei5QuZnI99hIfNA
	EMtnR+XWnVyqMnVnBLg5FHfECCQApCciU4sCo2UwVBuzDWM1sdAx6sIoo2TwDBFvfqMom3ityYVjF
	croi3sKjgjKHm7hwX3AGq/XSW62sJJ/5BzXwf1orNwnW8WwiNAOeefFOmtThmez7FBKe41fNQXIGu
	g4FhvuysFt4HO1TxEC73mx3Au4+2Ma8oFo44b+yIirOFAi6QVy1TOCnXyU7ftFsdFCjtIoVYvK8cz
	MTHLwwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0G7f-00000004CeE-3xI1;
	Mon, 14 Oct 2024 08:08:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Fyu-00000004B0Y-0gV6;
	Mon, 14 Oct 2024 07:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892746;
	bh=W+cHl7IlQoiGhHQv9LKkyFt5GXD/dU8V71qLOXnRP/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J1CbHuoa5+YDRoE0wlR5ZqbuEVKI6pMJOiObf3nRtXrcnFHIeJtFsAjayselWHdXU
	 EoMxmYpXs3JcGk8s60E5PdahN9TRnl8mdDzqXwmBMmxJTIlReV6i3Y1r6I72RHi4oJ
	 Lg45Tp+7FUc4Evr81rkWSnjxWxeWuoxzzLjrUe5hZb3cIb4mIlYtClB1GMlQnkpP23
	 MSVfiD/yCIhuZM9D8E+EMc/fs0AUMVIqphcVvdOaRpemD/pV0KRNn8tcmY3pJl/q62
	 7kSqXCR/h5SXM4yQJv9/0IDLHjVYm/GojExllNa9yjWXKMB+AMsLU1atDPENJb8gnj
	 DIRiUovB1n1MQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3E7C17E10C2;
	Mon, 14 Oct 2024 09:59:05 +0200 (CEST)
Message-ID: <66ad5cd6-cac2-400a-95c2-f72d68b2a706@collabora.com>
Date: Mon, 14 Oct 2024 09:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6735 pin controller
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-7-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-7-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_005908_419388_46B4D33D 
X-CRM114-Status: GOOD (  15.95  )
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

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT bindings for the MT6735 pin controller, which consist of macros
> to be used as values for the pinmux property. Each macro corresponds
> to a unique possible pin-function combination.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   MAINTAINERS                                   |    6 +
>   .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++++++++++++++
>   2 files changed, 1154 insertions(+)
>   create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e336dab6fdd1a..f95ae886f9fd8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18311,6 +18311,12 @@ F:	drivers/pinctrl/mediatek/pinctrl-rt2880.c
>   F:	drivers/pinctrl/mediatek/pinctrl-rt305x.c
>   F:	drivers/pinctrl/mediatek/pinctrl-rt3883.c
>   
> +PIN CONTROLLER - MEDIATEK MT6735
> +M:	Yassine Oudjana <y.oudjana@protonmail.com>
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> +
>   PIN CONTROLLER - MICROCHIP AT91
>   M:	Ludovic Desroches <ludovic.desroches@microchip.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> diff --git a/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h b/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> new file mode 100644
> index 0000000000000..1134caf9022c5
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

They're all called "pinfunc", even the newest mt8188 one, so please:

mediatek,mt6735-pinfunc.h

just for consistency and nothing else

> @@ -0,0 +1,1148 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H__
> +#define __DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H__

#ifndef _DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H
#define _DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H

#endif /* _DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H */

Cheers,
Angelo

