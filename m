Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E347CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pXP4cxEHLyE7XxRo4PsonDuXCdibzvY8RtS3Yi4bK4=; b=Uq+Bmk+7P9zCDDsxhjqwhwkZP7
	yjOZ4vgB1Wed84076gFhyoCLEp+RH80VYBzY5j2PNaxxaRyC31V3QqaaXI4hWYAEFB3MsNYhnkDrg
	7CFE0BhhXpsdf/MOdo2lGqowi/rK7hRKdWHPJ021RlbBkXTKk2DNjn1JGOlECdsKs3hoQp9JHEChi
	JwrV9ER72Py2c9ZqmtcpqCMOYdjrY24Fee086W0XLZYjAwone4T2rgwOK013hbZs6OSpB2MbRW7eb
	2oZY1TrVaGc4UNLaFVBsT+r9zy17P6scxtSLEV9V0DpmcXK6Bx/ZzTeiqN2M/4Gj8Cm16q2Ggfvwv
	uizBYeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnwd-0000000HBta-3QKi;
	Wed, 17 Jun 2026 10:56:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnwc-0000000HBss-3gpq;
	Wed, 17 Jun 2026 10:56:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AB6F40A9D;
	Wed, 17 Jun 2026 10:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1631F000E9;
	Wed, 17 Jun 2026 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781693790;
	bh=1pXP4cxEHLyE7XxRo4PsonDuXCdibzvY8RtS3Yi4bK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cz2iFM520u61ioRCwPffl+mmm0Pv0J5Z/gzXCkwB5Fu40Kj3BxSkWqNms5y6yzvxJ
	 dyHkrRmkxxBbfWHvYbRilncRrZtJptVyokJFf+qqBNafLdvBgkcmKUG7ekqe+fIjT4
	 /0JuIVJNAl31NLbbnCopZ/swBoNWpA5Z6YiYa2sr0Nei/DnvaJ29FzVVdP5RXcLfHf
	 abk1u+/mIKs98PTMTh3budMXVnCGEhkdwoqWa4FjC2SdB+EBCG3IVeiYK00sR48zVH
	 xSwjzqam+A0qqSEOF9w3Wi/x4jNk4g5IJrGy7/niXe8NSV0YHmtcC5BN6HVV0AhAeD
	 8fWVvKM2mLG3g==
Date: Wed, 17 Jun 2026 12:56:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zakariya Hadrami <zkh1@proton.me>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <20260617-fascinating-hasty-dragon-e92b4b@quoll>
References: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
 <20260617-mt8127-amazon-ford-basic-v1-5-d02ad15ac359@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v1-5-d02ad15ac359@proton.me>
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

On Wed, Jun 17, 2026 at 11:20:14AM +0900, Zakariya Hadrami wrote:
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


