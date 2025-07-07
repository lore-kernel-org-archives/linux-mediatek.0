Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB04C8303C
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRe9GZzGgR0ivgIssr0fKgerDSmSULCi3EW9ELnuqSo=; b=z4K0fpPpcE7aZAFF8q1dXzdJHc
	0l6rHhtvjgnmgPDqznNe1H70jGwDdM9OIZK1z/6R09f6ebZDD0lEjqNXSocVQMFtFqXGK/LA7KKYG
	bC8qATME5oaveO45kORRCJPjEyd4Rvc3nQrszAP5vZAK/4Jby4b+KeLetJdgV6r1p89XF5A3Fx5wp
	WvG7qjfVFED4uyroAsGWA/WPvafKZJkp5A7bdhaOUH9rZva/divx7LXNXuLgiMCJKpi2hH8dFy71K
	JH/l5HNwpHIqLAb7eXnR+GlOdn3pXkc0ELFICiLvjtdSAG+SCYvZuukmuxjnG41IDjAGvNosB+ZQI
	bpUkMJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfTQ-00000001Z1r-0juQ;
	Mon, 07 Jul 2025 06:37:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfQ4-00000001YmM-0QQt;
	Mon, 07 Jul 2025 06:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 250915C5837;
	Mon,  7 Jul 2025 06:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E327C4CEE3;
	Mon,  7 Jul 2025 06:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751870018;
	bh=h24qSJ8Oi8rLBWzEyRk9kWuH5HysbbgpfVyMwQU3sDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNVts38qKFiTktRXWRXh6+TlqSdyDKDvCa2/ImWYK0/XxpNZsykfGB7JAQ20u1kRV
	 5EP+uNwiFYIFBVDX8fo6U5cWii2AKx0S9qBMhTmAc6QUsjnEv+vr4kYn4Bqi4ZkzlT
	 MH3efX8fVmTsr6/tqCPYnxOv8vyuW4zBZZPO1Th3LSd9pbceYxdgmkLIlrtPDjxBne
	 oxuosy7fbK1EragWHWFY2PNmm0zpGs88gg8mIRTabCuDkqvGRLnaW2Fi+NxCQ+m96W
	 jPrKdtxC7rgg7cl9C1pOQX/LcFJSgM1tsQNoEXmYw87DfUgxr0iNri7SeOk19+aGGi
	 raLJ94KvYDJDw==
Date: Mon, 7 Jul 2025 08:33:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v8 04/16] dt-bindings: net: mediatek,net: add sram
 property
Message-ID: <20250707-masked-ambrosial-pegasus-2ff8fc@krzk-bin>
References: <20250706132213.20412-1-linux@fw-web.de>
 <20250706132213.20412-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706132213.20412-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_233340_181211_F3E1BBB6 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jul 06, 2025 at 03:21:59PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Meditak Filogic SoCs (MT798x) have dedicated MMIO-SRAM for dma operations.

You need "sram: false" for other variants.

Best regards,
Krzysztof


