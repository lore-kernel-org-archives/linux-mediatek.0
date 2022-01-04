Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141F6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bUTJ++zhzXzIy3V8KSYXcG7Frvv2q69Z8PGbNeEHE0=; b=Anh052EspAez2S7ON98b5a3h6d
	/Z7t/T3ksaI9GanJEvQlo2n/muVa3S7JEcro5pQz7+FBxGCKZygN9z8g2dVfqvbGwC+UVVHlkC0Xc
	Dy/liP2/NR3URX1m1GfWt3lgCba/lWqMnBadzzZ9qMHpmcmby6bJg2vrvh07AvrtQIkt2TgBuUKUP
	LmmDOHcOFXZJ1qMnFQwTomK5bX5E6Iw8nPIIyyQfd18ZmGWimtw69C2lk72rlGGy1KCAsM/SJxHCV
	GC+OaT4kauiMmX6OhMJBTjDu+xGF+fNsVzMUwiZS49oQXYnVTuKtISAlpl2xkZoGCwdkaJWQcCwk1
	5LLCKdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mBM-00C617-TL; Tue, 04 Jan 2022 15:57:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m8t-00C4BL-Px; Tue, 04 Jan 2022 15:54:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 701451F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311670;
 bh=BKNFCtDzHiW7aW81Sd1qNrBnwDcorML47S0xIXNAwkw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FqOOjUJTIvT83idev9h546g9Zx2hOlE6/KiwsyMy+fKf8Obo9TeAOn1B6XhWAZG9W
 JyB4tUzMGJxMTKAkHX5+GXGqSxjxnzuDfhFhJpiOsuo85HcqEWlU1UVPzVeY4CrueC
 5reAsMtgmVAzyNEwvzG0AMhZ2aQZUpjABi650dqvXzuI9Yro8kt1DmngwJFfeH8eXM
 gY44On5kwm1LQ0yYJuo6XRi7y52qGm/7LOtQiTyjH+L53d5DlWa9gDdZF9ll9vKbfY
 JR+sUBkmsPqZa8Y4dSDq3coUjLM7uNRR14b4aC8rB/RT7lND7FQLH4qhpeA9SJubU6
 /lzO94Iw4SGjQ==
Subject: Re: [PATCH v3 06/33] iommu/mediatek: Add 12G~16G support for multi
 domains
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-7-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0b4a4b95-813a-ef79-395d-da6ea80147d8@collabora.com>
Date: Tue, 4 Jan 2022 16:54:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-7-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075432_076046_F29A7A43 
X-CRM114-Status: GOOD (  12.88  )
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

Il 23/09/21 13:58, Yong Wu ha scritto:
> In mt8192, we preassign 0-4G; 4G-8G; 8G-12G for different multimedia
> engines. This depends on the "dma-ranges=" in the iommu consumer's dtsi
> node.
> 
> Adds 12G-16G region here. and reword the previous comment. we don't limit
> which master locate in which region.
> 
> CCU still is 8G-12G. Don't change it here.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
