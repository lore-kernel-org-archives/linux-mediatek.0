Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611CDC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbyKRJpnM2kw4rvnO5XHBa25qnDBehHGi3smpk3k0rI=; b=akf8eyl35ohnzEuvWcBjCW0rae
	gUfVftWY76s9OOwUGY+PDbL3TjKTeLA0HD5ep+lNmZkpmIs4BnoTYpz9C3Ty65Cj8gWDjFI/zU+24
	E5+2bv1ecoXCqEy6Z1C71DgBx0sWMDlrFgWLgPlbexZMT7e0YgMvUSX0ANtzz2XnRr2iDC6ZmiJ3t
	DHerISXUH3xe6Fm24VV3rKGRzQRRkf02mBW1CblppibYM7McnO3d6um/XmDmLvm5J2hXdmntPuJXk
	2q3N6cuhcI+6y3uoBEXE3wQOsgYaSqO8vEv89ncPrMnAGVKhCKMmheUsW3ebhNBeOcsCStmKuIeBW
	NRkfgVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAL5-0000000HFx0-4AGw;
	Wed, 17 Apr 2024 18:48:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAL1-0000000HFtw-3rIK;
	Wed, 17 Apr 2024 18:48:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 644AB61681;
	Wed, 17 Apr 2024 18:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CD8C072AA;
	Wed, 17 Apr 2024 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379735;
	bh=G8GIybraBwjNANFsfBZMgV1ID9PPWhVL2d7h1yYhQ/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enOe844TybHefFLgLKohLJ8NrDDYN5akkxh9ac6bh3LAlfCl8o1A3zf/P7CQZ4iCl
	 Y+uAka/Zvkj6J2S1BCZbYE5BRnC8RkGuLGYaTc/ZtRfRTlOZbzTLFp0k3V02AQ7kTN
	 UgEZa7ineprrYbfbd877ByxyqDCMvyIoYw1R5cHeCufvSrD0Q6qcyvrYcMsBGJRFvC
	 n6Fsxj7qxGP3HL30LM8GbtXLKg1fh+e+RcXGdWGeNaTi6BfsLtf3fEUcNQfktXLTI6
	 8eKrrVscwbZRB3FER5avz6QhsW4Dg2dAXCn6TlApSVOydaG6xCpAXaJ2Pmo2lystO5
	 G7w5sAHxlww6Q==
Date: Wed, 17 Apr 2024 13:48:52 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 12/18] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
Message-ID: <171337963668.3079720.13585358179949689962.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-12-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023-display-support-v2-12-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114856_047481_CE2F6E72 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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


On Tue, 16 Apr 2024 17:53:13 +0200, Alexandre Mergnat wrote:
> Add a compatible string for MediaTek Genio 350 MT8365's display PWM
> block: this is the same as MT8183.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


