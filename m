Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FD5C87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nn9Kvt/Bw9x118c3uzWvgiycbrcgwmM64/VycVhgQhI=; b=Yv1VM7zfRmI1YddS8zwgjte4cZ
	uzAzoDk46WOTEDmraSXfIK5Jkbm/2M3IqkA7QUVm87F6sBNj4W3N90hztRF0Yy9rek6BhSxwV7ucC
	+pjWlLKLolxirwsHYZDhXeilZP4rFFys3We59nMDJrxdwCIyKLLAJuMKaPdX2lV2qjeBcjZMg9WY0
	hrDBKH6rfdnI4ZQyax4EhdfI2wTeSqUSyjAQILO+AhIv5ygX2a8a0rb71IXEW8dyTvbTema+Pr/xu
	HlRjQmRRzJvajR5ZjY3u+cjDEz9Zhwtds+/vpSj/d6qSo+IZDlqYTaoP7fdySxo8bAaZVOIb4FE09
	GXuCv5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP2w-0000000Ae7n-3Ymj;
	Fri, 25 Jul 2025 20:29:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP2u-0000000Ae6i-2i93;
	Fri, 25 Jul 2025 20:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 455424348C;
	Fri, 25 Jul 2025 20:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F213AC4CEE7;
	Fri, 25 Jul 2025 20:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475376;
	bh=FpiQA0h1rzmVXkCXdxYXb5ICmJTBTxxEhCePZRRuCHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKwaEjYNVtXEiydTCcEXLSyh+1Hte1oAwHkS4BihjjRez/a8NVKcMBqFkGy3BEjuq
	 +X3eWAJWkqsX9CAX38Gq9toeBq6zU0OGfjuMPHzK604QZONe0tfL0x7mgWzcHqHdZu
	 vlOXoFxUcNZhtdWazggpl9Z/j9sQ4HWRJu4toM8I/xgTLt0i5/upQFIw/sO2Do7hgl
	 JegXzXTVwDd0NCMgkZqdfLubKFRC5Rot6gn4SVzsCSjZDN4fLGSWCN0dGldo3Qm8wh
	 nyH+PzpGN3FsB4DrzfCqJGE3Fa/7MeveQBlDdwA+V8tXz0sKj41d/P+hzWWrpzuUQ7
	 o3cXKDZLnLdUw==
Date: Fri, 25 Jul 2025 15:29:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 10/38] dt-bindings: regulator: mediatek,mt6332-regulator:
 Add missing compatible
Message-ID: <175347537496.1837320.18080816352465991088.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_132936_700616_97FC09DA 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: mripard@kernel.org, jassisinghbrar@gmail.com, daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, simona@ffwll.ch, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-phy@lists.infradead.org, airlied@gmail.com, kishon@kernel.org, andersson@kernel.org, herbert@gondor.apana.org.au, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de, arnd@arndb.de, sam.shih@mediatek.com, maarten.lankhorst@linux.intel.com, houlong.wei@mediatek.com, linux-gpio@vger.kernel.org, broonie@kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, fparent@baylibre.com, atenart@kernel.org, sean.wang@kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, ck.hu@mediatek.com, linux-crypto@vger.kernel.org, p.zabel@pengutronix.de, eugen.hristev@linaro.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:46 +0200, AngeloGioacchino Del Regno wrote:
> This binding had no compatible and for this reason would not be
> applied to anything: add the missing "mediatek,mt6332-regulator"
> compatible.
> 
> Fixes: e22943e32e1f regulator: ("Add bindings for MT6332 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6332-regulator.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


