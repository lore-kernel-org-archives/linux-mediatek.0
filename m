Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D11FC4451B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 05:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNOj+nqn+Y5SfsvGLwG0FLLtMfQy7PUJ2s4IhoKO0Lw=; b=Ld09jfvlnJ+mETvB9OFNchwsnu
	RfrwBV7PnL3/OPW7IOQrjPx6QLF/8Xj5ixeCsdMyn/CoktbPnI2BmFFLCJpaBftNY9tm/lagiZ/VE
	TdjVbcgEVfwdCRMXDZEx4KVmcz0XfWhBJjfs+XqP6KhyGJFx3PGbw3ZYOewbeU/QeOoaKwmou9eiA
	wnFeYuoXt5zqtLWm6r0K/9G/czsufqEP1ikZUAfj8Mu2WCEwQHt2ET7/4AIGu2IR0VPCdfWJNZMmv
	4uJ4UsA3o/A94VtXXLltTAh3SExzipJsQM6j7o04RM4f1cDIXfD/ii/j105ruSINB+pKOEFgUnU05
	Qtc5Ljaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgpv-00000005tfz-358O;
	Mon, 20 Jul 2026 05:46:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgpv-00000005tfm-04Pu;
	Mon, 20 Jul 2026 05:46:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAC1841FC8;
	Mon, 20 Jul 2026 05:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AB31F000E9;
	Mon, 20 Jul 2026 05:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784526402;
	bh=vNOj+nqn+Y5SfsvGLwG0FLLtMfQy7PUJ2s4IhoKO0Lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJmqte4IXJggDcPEMNwYZvuzwRn34JvUCZ4Q1HAv9kWIfUlI7tCuRFRFE/c9TG72/
	 zAWZtV3Uwhq7GAMWU3DxXFgqYI/l4EyMLeHGnkF/7/LwOpdYnj62ASwLS1fW799+mv
	 RzIEikaRdTWQGjR4eOTa5OQfBzGcccGWyPtTjR80cIyVTlv7uchNfXmaQliobFvX9c
	 w0pLoA/hozK/X7FZHzU6KT2hElPi/WvbS698Bnw66nN7xyWC5yrUjdkLEm10XdlbD/
	 bNC9HxKgS5bQCb2vWCxBcOnmYYk+ACMqIGykUYutwswroN7YnFEdZ6Z0Kar6Y3xlQz
	 6vY6+AjjMhhjg==
Date: Mon, 20 Jul 2026 07:46:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260720-gregarious-satisfied-shrew-f71cba@quoll>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720012056.1026551-9-kyrie.wu@mediatek.com>
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
Cc: Fan Wu <fanwu01@zju.edu.cn>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Kees Cook <kees@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Haoxiang Li <haoxiang_li2024@163.com>, Rob Herring <robh@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2026 at 09:20:50AM +0800, Kyrie Wu wrote:
> Add the MT8196 compatible string to the MediaTek vcodec subdev
> decoder binding.
> 
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


