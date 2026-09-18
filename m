Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E3C982D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mhe/jArEZiTm/L88sXSRArvdYinXqabgfSoJURVLiaw=; b=olm7pcNOKM1QCglJnhx6d+OOf9
	Zm6ifzMexjTHJ2u/vcnupgGETy1+1kx0c0chXAe4Wkvpbsk7NgeqI7aQT/pEufk5pP64c7w0D/si0
	GmrQs1xh9PAP73vfwlRfbJ97G50BiICDXIS5MsEIp0eUC9HY1+Mf1S3ggftHFcEaFfPieETqOUXHZ
	8VapnCVLN5DtzsgF9Tt/PdV4FbHSKMFsAdlT7ZF5DSWuLJkRyuS9vpmxdpdAM76PWidDRCaNVMsh0
	fquvMVQ22CpdvSeYTrWcPv7R29D4kSg6z4cm/3831IhuObLYDWa+P6T0MJATVmK4kzjPsKlNU1ptR
	j6bpX6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VEm-0000000DzeD-34gs;
	Fri, 18 Sep 2026 09:50:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VEl-0000000DzdQ-0flG;
	Fri, 18 Sep 2026 09:50:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEC5460A5E;
	Fri, 18 Sep 2026 09:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8987A1F000FF;
	Fri, 18 Sep 2026 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725024;
	bh=Mhe/jArEZiTm/L88sXSRArvdYinXqabgfSoJURVLiaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W/PkjKmakehCuNFmQPTGYUoW/AoczQbueulzxRMo1934P0fpkm4au7oh3k9I4EViE
	 thI3adZQpoqaO8d5dr0QCU9sRhPWfHO+ctemWJOyTK4pu7sbdlM6lIKiWODIlGTqnu
	 5S3Si2eoJWXCRezNHqecncDoY1e8LJ/Pv4CUKANmrf03xR1JxlVlMNlGWvrWcj54JH
	 CpvevOIprCD1LBmp58pdEmNWKVK05mMRpr96t+BuntCYCT8TvV3Mr7kBH27hyBDAEx
	 bN5a/s0yvzBRHM81VxIdqRpo1m5/vmvnCI7zGsyvRnGFpLSYQpAwsu8dBRjuk8cy+U
	 sxxjA62G7Tw9Q==
Date: Fri, 18 Sep 2026 11:50:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: iio: adc: mediatek,mt2701-auxadc: add mt6572
Message-ID: <20260918-boisterous-slim-dolphin-03d5ea@quoll>
References: <20260916-6572-dt-auxadc-v1-1-e8190d614c33@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916-6572-dt-auxadc-v1-1-e8190d614c33@protonmail.com>
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

On Wed, Sep 16, 2026 at 02:42:35PM +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 AUXADC, that is compatible with
> mt8173 IP.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


