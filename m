Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30078C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z67WVGkCEyj+r0iqUyhHuKjuRZwputpYJvr4B1e9Rg4=; b=xzAYUsQLHG6ckLhvO56rK4IvD+
	bntn8jTENcPEq/Jp3kKMFdc8f4EfSzkZWAMzWz08zL1obwVAXEtNI5W3GL0Q13Tpnn4evbqwS/v6R
	7hgydhPdS5RYMpGkUsfteEgiQFjvQO8YaACLEBUw3dvBA4gqdRKQgxWE8VZALCTU0NJ8v3ZQIrC2h
	MVu6N6Qukj4vn1ymbQhi2Uv+K1PjmUSwjFrqUybBWn0qtU741UJdcSjb8L4wdFygnZeePUPffS9fM
	C0d8gkhN+ZwFde0XwjbDvUwn/+i7ngyImakenPNNQK11kBqOQFs9AaL7B1hAgvxgaDCoYnbh4T1Gh
	GqtlENsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAGA-0000000HEUN-2uZU;
	Wed, 17 Apr 2024 18:43:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAG6-0000000HERF-1S2J;
	Wed, 17 Apr 2024 18:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFBE760905;
	Wed, 17 Apr 2024 18:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B3FC072AA;
	Wed, 17 Apr 2024 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379429;
	bh=GoGburzh7FkizELo7yYYyqndy8Qgc/VgEIB9/YUTE2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8axs5jsyp6NQNvyM01T71kH7P0f0QJZ+LV7l/ImxNglfR042hbt8sGgOV2EVzD2y
	 HvkEo7+f/FI4a1BpPOkI4N//5cmxMWTBud2fgfYIOLLAiuHOGUCeoizCi9lDu8a2y0
	 X7k2e9zsheh/M5ChuNRQ1tG/Zy0okVw5zN21hVNr8bnJrbshUyRtI78R6b1XlST6+z
	 baVFDACFXcfvCj3zWIyWi32iNlwmkraiAgecgIkusovSOtGitaOZ6zttCvK8Jw7tO3
	 tyYAksQ3kqNNVVv7jyVGufKVlUDo06kWgkwaeBRXTDn+J9vD6836WVvsFydNhXfEN+
	 f7qGp3x2fhLSg==
Date: Wed, 17 Apr 2024 13:43:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	CK Hu <ck.hu@mediatek.com>, Will Deacon <will@kernel.org>,
	linux-clk@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, linux-pwm@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/18] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
Message-ID: <171337930720.3072538.14983399612920659729.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-4-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-4-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114350_452073_6B56DB16 
X-CRM114-Status: GOOD (  10.06  )
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


On Tue, 16 Apr 2024 17:53:05 +0200, Alexandre Mergnat wrote:
> Document the display Dither on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


