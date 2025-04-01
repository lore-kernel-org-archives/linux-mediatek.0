Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6596CC36008
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 06:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDR2B5puagAyALQuBVKlAP8434ptqrrDvtmt4+7IkqI=; b=mR1M5I58a3qL5pLQ07L1bmQPMl
	IqYY0SIgWkzsb8/7S6ZiXhr6c7BSrHRRcX95JMAoEFXq1rvl4wgWc4lU4OX853pZ22ytBKq9fN5xr
	rd+P6vjD8td/4Pa2zDHNg3Rxo8TxBm24hjHrd6bPTwPOIwLgKh3nG97WrG8i1jfTx+a9lfl8LgHMq
	jGlMEQ26mYbl+0qjDv5BTbxtJ/DbxoOai91nVsKHWaPMd/XLDflx5owmmtep9/4ZHG0b3Aapb4c7s
	aRc/d83lbB9oDa+dBGXe7sepi+FbRDl+eRhK/hkwjnaXX2TgdaKBg+TYNPq/Bu+/arteUrLiQFk/K
	42DFIP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUnx-0000000231C-1vpU;
	Tue, 01 Apr 2025 06:08:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUlo-000000022dX-3DGM;
	Tue, 01 Apr 2025 06:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66D825C56F0;
	Tue,  1 Apr 2025 06:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECC0C4CEE8;
	Tue,  1 Apr 2025 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743487602;
	bh=oLzH5RkSicuMVNftyvLlNjjRZ70ibDG36k7ChxEokbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlbyM+reilMLWDp1hOkToL15MKp3RlG7mm7J+8Y/Z5KNotQYHe6yrnielSmpmknQM
	 QxigIlTn9FKn0e46cZIiVtB5VNgMRPXZQzeWS7jYj12kEkGa8YMIHYVAS+WFbayUYR
	 PzRlVHCmrVUz3Cs564m7WAQpWm+PSaZkZvEcSACVrwMUbfQUe8usjUqC3+/rDj//bi
	 Cd8WixEmJqDtAHMbN69h0i6qQF2BKUuAAwD6YYo2b3bh706TzRgTUeWqxsVz+/gQEh
	 Ya8bsQZ2Efn6+a9jYQexhwrkDch+tKsHfjEHTkpS3fCW5sn043fa1XbizeaO30HRTW
	 PdjVz8I4fQ9pQ==
Date: Tue, 1 Apr 2025 08:06:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, yong.mao@mediatek.com, 
	Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com, 
	Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Message-ID: <20250401-glittering-bouncy-yak-7e63ee@krzk-bin>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_230644_862243_518FF3B7 
X-CRM114-Status: GOOD (  10.13  )
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

On Tue, Apr 01, 2025 at 01:48:10PM +0800, Cathy Xu wrote:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 220 ++++++++++++++++++
>  1 file changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


