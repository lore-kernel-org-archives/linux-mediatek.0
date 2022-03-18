Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BB6C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BF34MAhJtsEV5Rs/J5lBGGHV9mz9War78na8IHf3IRI=; b=ft4bt18rwXEZcu
	AIqHGCZ70rJXw1olncxi6Bq6wmlbZCaLKGrcqDEA4tpWbb9VHYZJtZY0ulL/cdh/5x3pP5JwQFw7I
	AmeN+Yc56e70e9Atz9kKwo+4C9Vh0eyjF0mevd7PH+n14ybOqV1jZx4HyipdThZmTNKMQbQtFGRA+
	fKRB6FchEtnWrIweGREMGgioZEU0pyhGh2e7kuhR21NMvUedzF2/y80RKsgIA8QEnkpvmhEln+vwG
	fwLZruoOgsosceVXca5viY1kipvX/lKwn2/avgPzWQzEk9mb6lBedxcMelNBI9HrqbSe030zwMhvF
	yW1V6mv1XGpbknjYMa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVApH-001P7w-KS; Fri, 18 Mar 2022 11:31:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAot-001OwZ-S7; Fri, 18 Mar 2022 11:31:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A31DE1F45EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647603058;
 bh=8Q3rOPDXcy3uNIQL2Ds1Uyaer0s+nvv7ZJ0TUaccgYs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FS8DV4fs6ReTMDT843pIjrTELcrbprHy+UxYNc1O6uGP3HJJGSHLsBETvgSz9TVwf
 8DFkrgxX6XnGH4/jGVhlgeMvihST2+CYIO8nxnXxPCAVMXFy76U8Jh4dRb24HBkZWY
 HSJkh0E8iON5Pq4o99PNJ2MmahjFB8GEyWQh3mXfs9kfAX1ADQ01jxpe3Eiwn/V8C3
 Ro0y332WXTiiM+qa7D1BxQj5GnRt6SfnPGlzsK64Z9QNNdIS5WrWYAHSqW9sOOA9AK
 UOhEu9wBLm4U7RJm04WJuSVj1eifKG7X09zpVkH+EOSNWgLIdle51KQF0VChuvpN9z
 lxzpmLeECfDEQ==
Message-ID: <0772f5e2-3a0e-6156-627d-d037ab275634@collabora.com>
Date: Fri, 18 Mar 2022 12:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V5 3/3] spi: mediatek: support hclk
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220318025027.31281-1-leilk.liu@mediatek.com>
 <20220318025027.31281-4-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318025027.31281-4-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_043100_089872_DE27E45E 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/03/22 03:50, Leilk Liu ha scritto:
> this patch adds hclk support.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/spi/spi-mt65xx.c | 85 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 69 insertions(+), 16 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
