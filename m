Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3443C001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXRuUPlwLSWl1/AfaSXUQNqTLe4Turcup7ih+QsPyMQ=; b=0/UFmJGbFMM1YeI9k4QuPWwEYa
	Z49XNriCo6a/aJq8or5+ameEKGGgy8rV7BeFfIqI/Ae90jWNb0e0fKsW6KKWr5nzip+f2HdrJOcg+
	8ihyI6PLNENN4um9lxLT3hU2tF0CX8fB823fzePy6T5CdLhX1yXw2MpqLFUNFghiCtvRX5j3eswUk
	X3bvIUlCDUeVctPcFAYuadKSlbEQ9GiiBdIhChD3rbmCas/Rigs810bnzpt/Q0TG4PQR1eRUAi5AP
	h0sS9CACa7xmUESlk5ZHI+LnfSgwHSKokpNDe1zgyCa//0AYWEBwmjtLF7EdsiWVdOe5bw3h4p+MX
	w44WYK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAFg-0000000HECS-2IMb;
	Wed, 17 Apr 2024 18:43:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAFc-0000000HE9n-1ri0;
	Wed, 17 Apr 2024 18:43:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FFE961655;
	Wed, 17 Apr 2024 18:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8CAC072AA;
	Wed, 17 Apr 2024 18:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379399;
	bh=BrDXZHypVyb/MCOt1pJ3+elBTZD7Vim7YCL5kPx7fs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8/NxFmkBzWm5APksMAcm8tYKwsLxDs125DaMHv/oVlIdccPmnUOv09IG7QjpSj4V
	 /7ZX2Q/6oxwM6Dw4COABbrfUMcsdjepBiu4ak1tbrPobJdCYUdvGY88zxOZIZDcJd8
	 jMCFKwTsLs02QVFKSrrApLO/X3IoxFHdhr9N+CEaUF6jUfu5bM9JhbnQr9l/y308Cf
	 4xa6GowlumK45jro3+seYpBVRhdeA5/9xqb0kVOGQ1LMgIcC4IYA5zocdJfNU91om2
	 lV6wzpJAvSpy9uwbEFczgBllP8q8eqSLpLmU9+pKGCq/xhee2/UcCQk6OCTwyYBlAw
	 o2SbgzLB9hh/Q==
Date: Wed, 17 Apr 2024 13:43:17 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-pwm@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Vetter <daniel@ffwll.ch>, Jitao Shi <jitao.shi@mediatek.com>,
	Maxime Ripard <mripard@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mediatek@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
Message-ID: <171337927792.3071773.4101646503948439735.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-2-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-2-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114320_679413_7FF01E85 
X-CRM114-Status: GOOD (  10.61  )
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


On Tue, 16 Apr 2024 17:53:03 +0200, Alexandre Mergnat wrote:
> Document the display Color Correction on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


