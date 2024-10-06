Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14804CFB424
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWeixF56/1wTERbZPO2CJfUIfp4HPtl/IFmEv2Tc/zA=; b=3uvDGlUIDKG7+d0Py0vVtgn1NA
	uJY6tXL3fTP2d1EpzciIi3abcxT1w2OlRgyANv0ZBaKocevwXMOrV1eotyRtVwwJTQt5FGNnd95op
	kU6Ft9mjEyBYK0laSQ2RSNJAWSpGahCWII8wtgd6VEbUxPW4JUioMWprm7Uk1gDHjamlTLHcbITs6
	dsCNZ6CBCItKSqBCrJ3Whkd2QY+k+7cStIOqAP2ecjALgxNSyATO7CbBjFmi8dZb+nnbNLwC/DxPj
	reHvDt3GlLa7I6PzQWhPfNyxFEN2zu9fqpO/C9MSskrIbw8wf7+kMy7ppWkM+LbQHnMGkR1rPA7gk
	k5LWWnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQiE-0000000038a-0lB2;
	Sun, 06 Oct 2024 12:50:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQgF-000000002xA-3hL0;
	Sun, 06 Oct 2024 12:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9CC94A40CAC;
	Sun,  6 Oct 2024 12:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCBEC4CEC5;
	Sun,  6 Oct 2024 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728218890;
	bh=EC+uOqpK9Zdf6/1C0U/deKBs4TGD19dRrEPioHxLh0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YK5NfoElqmkBgts0p0Byk1UTMJEpi9y5sEN/VSX2SszHkVyyoorXtZrOybWepWi8q
	 q+2LCO1UIgQjJ/SKnmqGNcNIna/R4eGskHIWcADQprP3GCVQfjWrBD3gmtq1aWyBEQ
	 oV9ItvEAIpc55+dzMTyDpZnTucGk0lbfyzXdWG9Lhce4gjyjIiN26LucMdYsP9Zg1s
	 mgYFx9I7KuXi/go1oy8ZSBobya2+Q6LSsGY8hnwUJavq0Ek6SRLYxV7z1UDc7FQK3Q
	 6t5WsTSGyU+3xrrJabNHps2ZVqIcJbGWl/DIa5LroL5hN1tfVuWpCah14HKt79A8Fb
	 KRAoaeD74GYOQ==
Date: Sun, 6 Oct 2024 14:48:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1] dt-bindings: spi: add compatibles for mt7988
Message-ID: <kmzl5zmqqudoq2jcdacfsbwq3axdvcml4m5kw5oqqo2hj6iiuq@xzeg6penuic3>
References: <20241006102740.17948-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241006102740.17948-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_054812_001991_E6DBCC54 
X-CRM114-Status: UNSURE (   7.12  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leilk Liu <leilk.liu@mediatek.com>, john@phrozen.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, eladwf@gmail.com, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, daniel@makrotopia.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 06, 2024 at 12:27:39PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> MT7988 has 2 different spi controllers. Add mediatek,ipm-spi-single
> and mediatek,ipm-spi-quad compatibles.

Why generic compatibles?

These are supposed to be SoC-specific.

Best regards,
Krzysztof


