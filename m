Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF629C87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZEdWyFVn3E2IUiJxO++Ul+3279wIpHqP5nCnqiLigE=; b=ykJR4xUV1kroISqsIJqev3hCXG
	LE1/W0r0K+zUotjIuptCwPtB5vNHKe3n3+JdxUm5CnN1qwbA6iCpgOvtRclUXFVUAReOoJGqQGTRR
	0QLxP5VfCC53TBArMomV5ifftkcAcUz0qrzzp2NryHaXFL/PdJn2Goasd2dv6mkFcMStj92TevTr9
	n0BCqe/xEgL+AH7pDwt4DUnozaJNSCAp9kuDFIpyZryvKoV1vWtU38LcvDjkTrCSaJVgmT+wSKQ0H
	/5dSdTGtQKBbMwzJUo0b57cgMBaqgurDD2g3K8Al6eCPc2RRZLWXS5c8U1GXFHVYaJeSJ4fp4RkWg
	/B97KlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP2L-0000000AdvO-37ts;
	Fri, 25 Jul 2025 20:29:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP2K-0000000AduR-0HvJ;
	Fri, 25 Jul 2025 20:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72A155C6410;
	Fri, 25 Jul 2025 20:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE74C4CEE7;
	Fri, 25 Jul 2025 20:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475339;
	bh=2lR8zBkPfCL0XzsAZKYS6/0c97bv4h+0epH74tNqB9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nmhx7Z8/FBwNijNFPpZf4SqJoOStQ0XsxTd/CcwodEvheITYeVzDATI0vkqopVZpN
	 ahWJcPhWgy+F6oKOWucoyS8HKVtTZ65qkKO8rnMdpLbkTDaCq5kdB43VdABXLgIuDr
	 AM/H9YWG4msnlSmTFWa7aBLB+g4755Mt+4XTP+zmXW/Yj4MklkggEMOnWzWa+wULQ5
	 WGiC6obE6FEykCeFOOC0Vg2eGT4khYCcJCTXm7Kcot8eL3Y4GZ6LqEPpW7zeM7EEVS
	 8NizKGJ9SwGA6+f9JSlBLusqpEgsBUK4k1GQ/Wm6GpWdOOeE//dPy40IOSp7ZOPZfq
	 Lrk5Ir8nxLrrQ==
Date: Fri, 25 Jul 2025 15:28:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 06/38] dt-bindings: timer: mediatek: Add compatible for
 MT6795 GP Timer
Message-ID: <175347533780.1836400.4840892261408767765.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_132900_137017_C4697156 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: jassisinghbrar@gmail.com, daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, olivia.wen@mediatek.com, shane.chien@mediatek.com, kishon@kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, devicetree@vger.kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, sam.shih@mediatek.com, atenart@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, linux-gpio@vger.kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-kernel@vger.kernel.org, houlong.wei@mediatek.com, vkoul@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, linux-crypto@vger.kernel.org, tzimmermann@suse.de, eugen.hristev@linaro.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:42 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the General Purpose Timer (GPT) found on the
> MediaTek Helio X10 MT6795 SoC which is fully compatible with the
> one found in MT6577.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


