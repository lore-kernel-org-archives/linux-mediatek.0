Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCF3C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sybnXNhD5+oCArfJxuphx2AU8zUd+pBN0TGU3ZyVgPU=; b=IYF8niqeF2ossgEI0W69lfMtmG
	stidM7p3AA2gZVPBUh/Y6RR8MtRMfvwYiiqdT9R9+79m9Zx7yeTgEbmLbgO2rYfwvifg/prx/AMYY
	afOLMdS8jZb1nv31XZFFry4UxqjV3WvW+7UWYgLNCBj49qWgqV8fO1w5yRUDzcnmDJQBHgAoP/uE0
	8qA1IUW4M1xrreZ8zVsofEsxrw81aYsH/cICfflXf8eb+LMqmcPvyto/ellO9WckpOfAPvy/HWJYc
	0ufh2h6ky+lBStULHdi+CgYaaE2g+qEkkLHaV2xHQg+N+TYNDCi8BH3z9suWxOvBlslnU8a5JhhNx
	h1HaeS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDT4-009HBB-2Q;
	Tue, 24 Oct 2023 09:12:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDT2-009HAd-0A;
	Tue, 24 Oct 2023 09:12:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 271BE66072F6;
	Tue, 24 Oct 2023 10:12:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698138769;
	bh=XfXPQ0oVnRctPph3CPb1I9j9606bGUTiH9V9O3ZMIGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZAayU1HWjcx40JeBjgKxWYWr2uAdaRzRDwg9CptGRQK3F8N4pyyUl2MsZhjqgUsQD
	 fhbujYDWpmUiB7lf2ZUIY/Xu5puKX9BnVL5bj/iwpU7ejqKeJGJ6QbSFys85w9jz0Q
	 kbioJO+PH7U7OYD0xsCDzUgpA/uWV4NE9CPdTF02KEEc5cONRV686zrqpC1gL8lZYE
	 zlOo8aeMWJR46gNbtozQval7ZcQpcrrmQFPKf9lg7yH565yJyyiSrBSPtDfYCyKSMu
	 aJN/1EZcPEim62/9Ew16sOnkydctMMXSRwMOtR6x2wlHI2uFOxKc+AJSNUkdG2TM2f
	 6FrBSYu0Pe33g==
Message-ID: <cf25a3cc-6411-45f5-bc7a-6b69cf28c860@collabora.com>
Date: Tue, 24 Oct 2023 11:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/18] drm/mediatek: dpi: add support for dpi clock
Content-Language: en-US
To: amergnat@baylibre.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_021252_238739_64C843E7 
X-CRM114-Status: GOOD (  13.37  )
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

Il 23/10/23 16:40, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MT8365 requires an additional clock for DPI. Add support for that
> additional clock.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

I'm not convinced that this is right... at all.

 From a fast check of the MT8365 DPI clocks, I can see that the DPI0 clock declares
parent VPLL_DPIX (a fixed clock), but nothing ever has VPLL_DPIX_EN (which is the
GATE clock, enabling output of DPIx VPLL?).

But then, there's even more: no clock ever references the CLK_TOP_DPI0_SEL nor the
CLK_TOP_DPI1_SEL gate, which is a PLL parent selector... in other platforms, that
is muxing through the TVDPLL, but on MT8365 that is LVDSPLL?!

I have many questions now:
* Two PLLs are apparently brought up, but which one is the right one?!
   * Is the LVDS PLL really used for DisplayPort? (dpi0_sel)
   * Is the VPLL_DPIx PLL used for DisplayPort instead? (dpi0_dpi0)
* Why is the LVDSTX_PXL clock using the same PLL as DPI0?!
   * Why is the VPLL_DPIx gate never enabled?
* Are you sure that CLK_MM_DPI0_DPI0's parent shouldn't be dpi0_sel instead?
* Where is DPI1 in this SoC? Why is there a dpi1_sel clock, but no MM clock
   for the DPI1 controller? Is there any DPI1 controller, even?!
   * Why is there a DPI1 MUX, if there's no DPI1 controller?!

Answering all those questions will lead you to the right change, which I believe
to be in the clock drivers, not here in mtk_dpi.c.

Cheers!
Angelo


