Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3661BEED613
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 15:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ETpo3bM/y02d47yFACvUNxFalo1wSqTEJohjb/izng=; b=KXDZSsgTZWaCcG4VR7669gJyyT
	bRavbPmvCGq2p2YZNXU9uj7Y0sjz6dbucdLK2jqKbv7aKsx5LaBZgjup5XackXFNYpAMSsHSfqymb
	cSAxa6nKAu5UOmbELtJV8tT0yl3s8WEdiRnhdX9HSHFWJsYDI1nNd/9KK4dTlz3BeB7L+1uBhhKlK
	Brq7IsTpsJan3JRESsI6FdJFFV3/Zl+ie1OX4jqeyZYxlkHgi4SMXC0/DWNvYiWLcwt1WP4O8nyw2
	g024e8K6R80+2JEvBAy+/Ti8zjjfcPpT9TLUnmc8LobedjLouCmXvvH2f/uRd7ocyxz5VzdBBNKB1
	g/oLWGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solg7-0000000DXs9-2WMh;
	Thu, 12 Sep 2024 15:24:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solcx-0000000DXMT-1UmJ;
	Thu, 12 Sep 2024 15:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B6945C5B9D;
	Thu, 12 Sep 2024 15:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C636AC4CEC3;
	Thu, 12 Sep 2024 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726154458;
	bh=Pa+luGAf3a2+eoxTNfhzvSyF/opw87hXVNCHeiOEuaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOGbvgFhBiN3gmugusqjyoH4Qm263rbj3lHiO880GffhWgfKoMyX+6a0HZwaoQBAQ
	 RMvj94yx7P53bFpRHaI7bLN2Cm32LlPpTDnNvrO8//9xUj1YShtBglimmK926iRbaN
	 xROwRStggfYwQf/YZygPWvAIrJ6qR06pLzO0PrT2TbXDxulCkAsVbhOh/Is/rRn4X6
	 CXDmCO8DEbafTGm/NJ1owvRYVBqKxtBraGH0sKWIo5XXj6XEUhIqgWeli2Cf1OexOS
	 ii1ec5bYiK0h3fr0sCAS3DrNW/JSd8U+m3/9vXr+5DO+VZLolMeifiofxQNkRQO+L+
	 IU5OnZdwBJLAw==
Date: Thu, 12 Sep 2024 16:20:50 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, lars@metafoo.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, andy@kernel.org,
	nuno.sa@analog.com, bigunclemax@gmail.com, dlechner@baylibre.com,
	marius.cristea@microchip.com, marcelo.schmitt@analog.com,
	fr0st61te@gmail.com, mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, andy.shevchenko@gmail.com,
	kernel@collabora.com, jic23@kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: mfd: mediatek,mt6357: Describe
 Auxiliary ADC subdev
Message-ID: <20240912152050.GF24460@google.com>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
 <20240604123008.327424-3-angelogioacchino.delregno@collabora.com>
 <01020191e56f3f66-1afb592c-a676-4871-b75a-bc38d896ae03-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01020191e56f3f66-1afb592c-a676-4871-b75a-bc38d896ae03-000000@eu-west-1.amazonses.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_082059_481252_8EA7E0E2 
X-CRM114-Status: GOOD (  10.38  )
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

On Thu, 12 Sep 2024, AngeloGioacchino Del Regno wrote:

> Il 04/06/24 14:30, AngeloGioacchino Del Regno ha scritto:
> > Describe the PMIC-integrated Auxiliary Analog to Digital Converter
> > subdevice node.
> > Full description is available in the mediatek,mt6359-auxadc.yaml
> > binding relative to that hardware.
> > 
> 
> Hello,
> 
> I just realized (indeed too late) that while all of the other commits of this
> series are upstream, this patch was not picked, causing dts validation warnings.
> 
> Should I resend or can you just simply pick it?

It's lacking a DT review.

-- 
Lee Jones [李琼斯]

