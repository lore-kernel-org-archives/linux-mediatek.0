Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F68C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 00:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTOmDCp9BxrRl32kYZh1Uos+hBpfxNb9zmT/vweBw1s=; b=SYqY7BdbRPIFp7mmVK5+kuId76
	/ijDqQONLvx5oLiI8i3UB85Ln86yvx5uuMHJ/u19HWI6wSc//pwmkXiSXtHOFJUcTzNznVAfiRHM6
	Tte6a2kLQeG/3sgbwBHW5ZC/C+wHip+/r1EYd5nPRHUMU8DupDjhsE9CT29LNEeeBvyd8/vsi2+h5
	6Q5WiZW7NrU/8mjO156zhhJSX/QQ30qV6SimxwYFLdSXvSu90Rtad2lPnvsHPYoCeh+eXMG7kHDIs
	Ks/EU7hcpQkkNnpzyKJzvK5lihQnS6xludDIkoGQ2/ElqZUCIXJ+DJiKCfG2YwxcDhQuMkn8QtWN4
	cBdZv5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgZKf-0000000761Z-0lP6;
	Wed, 21 Aug 2024 00:36:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgZJw-000000075tf-3kXB;
	Wed, 21 Aug 2024 00:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36F4C60DE5;
	Wed, 21 Aug 2024 00:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70D1C4AF0E;
	Wed, 21 Aug 2024 00:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724200527;
	bh=72l7jIlEa0320LNF1TSC+FnXUPhcQrDJuCQkr3p6/1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/jcTUmAgFm3sxsXOXZKpN7EhFM1gJ6bIkKyiXI4L6eY9DimnTKB+IBy0Xf6DOXjW
	 gtK/hLVsP+ZStPVNH9Cq8WJi280pelNE7QrG9BpHZsxTd90Iy2ZkzeV3jqyjxA2DQx
	 QNzA9xXGd9hAvYJILz3EkkXSz8F67/p4UuLWvdxtInMdhcjbujkkpYAwphVNJ0QKBU
	 cJKprBY1mnoM7ZjViIx7W7ScJO1238rI0nA7a/fBlHV29SwQvYDJb5mT9NHAkRC7Sx
	 Na3hG4QxzEZ2nepMQmXOoHn1kpG4MpRod9ASJncWGElEmmNKozPksxIktXvLZ8UQGe
	 BPfK8aeJehqzA==
Date: Tue, 20 Aug 2024 19:35:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	Todor Tomov <todor.too@gmail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-amlogic@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Shijie Qin <shijie.qin@nxp.com>,
	Emil Velikov <emil.velikov@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sunxi@lists.linux.dev, Zhou Peng <eagle.zhou@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Ming Qian <ming.qian@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] media: dt-bindings: trivial white-space and example
 cleanup
Message-ID: <172420052496.2349176.18144624759283335223.robh@kernel.org>
References: <20240820073658.19045-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820073658.19045-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_173529_086317_9122AB0C 
X-CRM114-Status: GOOD (  11.24  )
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


On Tue, 20 Aug 2024 09:36:58 +0200, Krzysztof Kozlowski wrote:
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -
>  .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
>  .../bindings/media/amphion,vpu.yaml           |  1 -
>  .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
>  .../media/mediatek,vcodec-decoder.yaml        |  1 -
>  .../media/mediatek,vcodec-encoder.yaml        |  1 -
>  .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
>  .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
>  .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
>  .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
>  .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
>  .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
>  .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
>  .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
>  .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
>  16 files changed, 42 insertions(+), 58 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


