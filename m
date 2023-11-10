Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8F8C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DumJfnif7pj+qs8pnviKbqDAnI3DOqJt7pucJfNvdz4=; b=NMmvn+924tC+II+hv9Z5qiY9et
	R5h6A7aEwzXsFMdP8aXtwItvV7U1XOmTOAhKOZkMLFbKG4z93azwssnuMHHH03rNU+eTXPTHqdIo+
	s0GHx0bzvc/wRHmo36yFTeqtcbi6AB4u7Q28K0hIjF6uBiJfUiRZ+6Tvg6Z7Y6/Hv13NwM7ry2hlJ
	lu9owt9glgDQI37zkXVuox8BrXnKSOJoyRVfBM5xksYUr7gnUzqTpg4+Kf4WWsWr1z8Hn9DyOuL+t
	8CdtvsK+FMzlgFYdk5qZi0FPbWOC/UIprlD1LxpCfNGW+L5gOsj65LG7D7fYaS9kyYDXvBHYBe1ss
	yYLirG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Q7d-008X9x-05;
	Fri, 10 Nov 2023 11:56:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Q7Y-008X6F-31;
	Fri, 10 Nov 2023 11:56:22 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D695C66073D6;
	Fri, 10 Nov 2023 11:56:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699617379;
	bh=UsQJMA84in9eZ7+pQRAtSLereQcK1RKiGbtcXNhScsA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=FJTlm3kNTqQ3pO2+5YHTzqCb8s8ldGouiZu4T63SdwavS+QLS5SsHFJdB/yNlGf1S
	 nxMHvl+igevcE4fY4CiG3H0YzxgWGaEwkiNbT/ohG1r3ldjNLUN+0eqPP2rGNaAUCb
	 28U+cGmi4aOb5X9uVBTxOBAf2vZus6lLr/tWDP4BKR4qXz1ffRfc+9hidXPEDhTlXi
	 xrCGkQn2SluEzmMm/fzHTZebOcVG4V5MHcJuPt14CpYS6VGZpi85qMB2AHL9oPnICp
	 LqlU3keZjXBu0IQyHL1t52E1uK5ixbh7tAcf1hMjyPcZJCtCTkVKgJh3mG6ePfzGYg
	 7tAiNfCVnmRSg==
Message-ID: <2678cb48-1d2b-47bc-9272-06d9aa140c58@collabora.com>
Date: Fri, 10 Nov 2023 12:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_035621_107389_A247973A 
X-CRM114-Status: GOOD (  14.77  )
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

Il 10/11/23 01:30, Daniel Golle ha scritto:
> Add binding description for mediatek,mt7988-wdt.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   .../bindings/watchdog/mediatek,mtk-wdt.yaml          |  1 +
>   include/dt-bindings/reset/mediatek,mt7988-resets.h   | 12 ++++++++++++
>   2 files changed, 13 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mediatek,mt7988-resets.h
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index cc502838bc398..8d2520241e37f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>             - mediatek,mt6735-wdt
>             - mediatek,mt6795-wdt
>             - mediatek,mt7986-wdt
> +          - mediatek,mt7988-wdt
>             - mediatek,mt8183-wdt
>             - mediatek,mt8186-wdt
>             - mediatek,mt8188-wdt
> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> new file mode 100644
> index 0000000000000..fa7c937505e08
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/* TOPRGU resets */

The first reset is zero, the second reset is one.

Where's the zero'th reset? :-)

Regards,
Angelo

> +#define MT7988_TOPRGU_SGMII0_GRST		1
> +#define MT7988_TOPRGU_SGMII1_GRST		2
> +#define MT7988_TOPRGU_XFI0_GRST			12
> +#define MT7988_TOPRGU_XFI1_GRST			13
> +#define MT7988_TOPRGU_XFI_PEXTP0_GRST		14
> +#define MT7988_TOPRGU_XFI_PEXTP1_GRST		15
> +#define MT7988_TOPRGU_XFI_PLL_GRST		16
> +
> +#define MT7988_TOPRGU_SW_RST_NUM		24



