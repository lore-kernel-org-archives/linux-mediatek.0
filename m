Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FF1C3DA45
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYCC4vF/U+sJMehsG/vXMVOMdq8EZc5erFSf8kKAx+0=; b=L7Dh/ziU8ccYg4
	xX2GFgBxnuMwklGayegfLBmEqyFoQDZcZXuafkQuoR/aBeLQ8F48f48LBzrUAFIUsFiU1dKUbaVVV
	L4VqYBOfUML9IdaUbYnm1gL2oEFBtYrO0tivjBBy85u1hPa3lqLjLFU6Nf23PI8pWGrEyLkSnwJx3
	GiEsa/AEWW8n7ECilRsJF6meE2BSubN2PXzUsYIpApZ25EBmrKeR/l/40hLfXvRR2pLJ7rrB5DWd4
	Y2aC/vsmuJGcE5RBFqxlIMW3tldpGJi02YjTXUl5sBJ7QMfyLpB0s5g7XhZyL4HXyxAkgtM0faIsN
	fdUAxNj+nzORLqS4wdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUq8-0000000AFPF-1syN;
	Wed, 10 Jul 2024 10:46:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUpm-0000000AFJ1-1CG4;
	Wed, 10 Jul 2024 10:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720608358;
	bh=OT6YCCN0htNhieZjFLd6a0qp/JNFJI1m8IJPRRTsawA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oac1qC1tpy0MhlTjXLhqCoClYM4Gfwh164dGc8lvoNoEfoVWoLMHJE1CNxOogNBe5
	 cBj81asvYLMdrBhlfKP8xFrICNZjnCEX3KGjqZqD6grjIRSCNC0YcQhcvWjrLqyl1p
	 0iowSCdUXo07D16fndDYL9/5dtvEojPQvNy2T8Ly/o1LJ7wCCaBYxCT2J/EmDR+Li/
	 wPK+8G4EWdmdsjWqH+NbKQIt/UKV+U2KvzMS1iwX8U2L/99CqtwMFa1ebF8NmNXe1q
	 bSNu0lr7BXkvK8C6Vt0J9OfgYShVrFook4OciW1BZdflq2W+2wol84bck2AOcklO6O
	 CqR8kWSpcvrsA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D67F437810CD;
	Wed, 10 Jul 2024 10:45:57 +0000 (UTC)
Message-ID: <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
Date: Wed, 10 Jul 2024 12:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] add syscon requirement for mt7988
To: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
References: <20240709101328.102969-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_034602_518661_7411F24A 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/07/24 12:13, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Some nodes require the syscon fallback at least in u-boot when using
> OF_UPSTREAM.
> 
> This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
> "mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.
> 

I wonder what's the major blocker here to modify the u-boot driver to take
the upstream devicetree as-is, instead of using syscon_node_to_regmap?

Regards,
Angelo

> Frank Wunderlich (4):
>    dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988 syscon requirement
>    dt-bindings: clock: mediatek: add syscon requirement for mt7988
>      xfi-pll
>    dt-bindings: clock: mediatek: add syscon requirement for mt7988
>      ethwarp
>    arm64: dts: mediatek: mt7988: add syscon for watchdog, xfi-pll and
>      ethwarp
> 
>   .../devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml | 6 ++++--
>   .../devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml | 7 +++++--
>   .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml     | 5 ++++-
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi                  | 6 +++---
>   4 files changed, 16 insertions(+), 8 deletions(-)
> 



