Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E5DC87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MECO2g3jlODHlJYIBiMPq0H0IuvS+Xa2ll1podUQcEc=; b=Sngn0fj5srWhE8Wp6VFAo+8MEV
	TMbUsyhWzU6VogBMHYR5ORLI8eivjZoSv0q8pRlwZHXxt2sZBsmpwIZBeHNCH3YgV7w0cDW6o6vsT
	+tYVdESpZhmdkPyD+Sgzhw0XA1CbvzROlTC6AyAY9cM5nlzxKGnkkgA/bnEDiPiz/fQdooESHH3RA
	yP9LF+IvR09cJDhTHd0TXqZbE7up0lZx3ODsUSqj2WPpzyIQPfhqjb3401iNHYgSSO3JQpsUnCi9J
	yyBAdYzj1QOjjr+YQ12KIQyFhMuQLDZ1IlIzLSds1FjJECpb4chCntLo5k9f/QToXIE5SSxy2FMRU
	aVFkQJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP3e-0000000AeIm-0jib;
	Fri, 25 Jul 2025 20:30:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP3c-0000000AeHz-00rr;
	Fri, 25 Jul 2025 20:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A63B04192B;
	Fri, 25 Jul 2025 20:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63321C4CEE7;
	Fri, 25 Jul 2025 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475419;
	bh=3rcW5T4b32wrtkaTZSV6Q1gWpx5l5voD3MquK0Q4cBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZ5PA19btE/yRueT0j7fKcKmN3DrMeOir0e1gsbj8yaS3uyi7D1F4UIlMCA/slpDZ
	 ihTd7CKXcZf+1sZVkBN8RJGE7md62p2I+6yNu66rojh30veUJOQKBcBuPGOPf5RQhA
	 elqqrdDAq8PsPQ5JSKaJd8sOWHhdEXt8LbrdddRC9fmK7Kt2S+ziBl/smsPhXYiSjr
	 7sSN8zjT5m4DiFA48LfhRzhV20060InQ0rid92ItlB17orD6FLLlJ+SYC6Jv6Jza9r
	 PxhNzX3yRaJYJ+TbUMIrod+90q2XCWbaLBsd+9A+s9gOjdKa5AH7eesTheQU4l+cjb
	 Qigm1vllcFhsg==
Date: Fri, 25 Jul 2025 15:30:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 11/38] dt-bindings: regulator: mediatek,mt6331: Fix
 various regulator names
Message-ID: <175347541826.1838218.10273283619500191646.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_133020_059055_4BB9FE5B 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: mripard@kernel.org, jassisinghbrar@gmail.com, tinghan.shen@mediatek.com, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, olivia.wen@mediatek.com, shane.chien@mediatek.com, kishon@kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org, herbert@gondor.apana.org.au, daniel.lezcano@linaro.org, jiaxin.yu@mediatek.com, sam.shih@mediatek.com, chunfeng.yun@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de, arnd@arndb.de, andy.teng@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com, houlong.wei@mediatek.com, linux-gpio@vger.kernel.org, broonie@kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, fparent@baylibre.com, atenart@kernel.org, sean.wang@kernel.org, maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org, vkoul@kernel.org, ck.hu@mediatek.com, linux-crypto@vger.kernel.org, p.zabel@pengutronix.de, eugen.hristev@linaro.org, krzk+dt@kernel.org, jieyy.yang@mediatek.com, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:47 +0200, AngeloGioacchino Del Regno wrote:
> This binding was never applied to anything because it misses the
> compatible, hence any mistake in it got unnoticed.
> 
> Before adding the compatible to let it apply, fix the names and
> the node names of various regulators.
> 
> Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6331-regulator.yaml         | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


