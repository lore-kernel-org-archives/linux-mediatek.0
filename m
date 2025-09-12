Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D1DCA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 06:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfpyDwkyt1Ga4wvV1t49nL1tRaP2aL2nT3I00MI/4M8=; b=kWbTrmH/n457oiRRO/r4wcXv25
	EFJgnQoAh7U6faGAJRwMn7n5wjbup9cpk2unROGnMi7vgbs9heXUalUq8RPimm1bCCo5o8H+/OhA0
	XQ+9w5AWowyw9qZqzSMHYNsDp99BiGU+4SHM7qLrzZk5+W2g6XyZhipAacnp1Aehb1nPS0+qhl+Uz
	FJ3dhf5/99Fh6n1uD1QPy5b+oOfrNoBahCO1WfIUI24P2OBz6YCPUX1WPLjQF//XkIg8IVQmcHmtX
	j+rq/t4R68zMkU9x9GpR4uGsre1vn7l/B8uNLEvJR2PvnGBydDs7QIkwtaLmjp8Lvda20ZFiG80O0
	ObL1pMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwwm-00000007JK9-0bmq;
	Fri, 12 Sep 2025 06:07:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwwj-00000007JII-2VQQ;
	Fri, 12 Sep 2025 06:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33471407F5;
	Fri, 12 Sep 2025 06:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A93C4CEF4;
	Fri, 12 Sep 2025 06:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757657265;
	bh=Orb+VsfkJaRzsj41NR7vEo3YY27Pbey1RakvGK1RuKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jROHFO4OhNFjQA0LwB4XzJQ1Bald5dpNoHBInnMm4SwxCfSU/DOyUefTNvHSwsi7b
	 p5mlc7/j808w2wwrozVhRth2bXxKv/bUg7GFFDKqiFeQl1qI37ZezJKqBvSBVEc39g
	 FK7NmcUk6O7jMlm9okELv7RVWi6xNjI6nGP+JzEuSH1+HFLYnmhwHntwYzLDuJqtRQ
	 CMKzglUBwGwWTzMHuor4H7BMfN8gsx/hhYIMcFqyqyT1tYiWwKIZd+ZZXYDKdRQvnB
	 PpJOjZUXx3ep7XTHxtXpBJZqPi7f9E1veLLM2f7vG6o4k+O/J0kyASYvGMOxW3kXz8
	 3hZtAOwZjqXLQ==
Date: Fri, 12 Sep 2025 08:07:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, heiko@sntech.de, 
	houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, 
	kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, maarten.lankhorst@linux.intel.com, 
	marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: media: Convert MediaTek mt8173-vpu
 bindings to DT schema
Message-ID: <20250912-unselfish-quiet-hound-46689b@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-3-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_230745_653441_185CF130 
X-CRM114-Status: UNSURE (   8.83  )
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

On Thu, Sep 11, 2025 at 12:09:51PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 Video
> Processor Unit to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-vpu.yaml   | 74 +++++++++++++++++++
>  .../bindings/media/mediatek-vpu.txt           | 31 --------
>  2 files changed, 74 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


