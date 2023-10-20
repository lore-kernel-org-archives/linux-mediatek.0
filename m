Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE46FC001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YMMG/tb4IX1WSyS7ju2h9GeYKV/cO01qmXX681UsrrE=; b=11iYCs4Fw8H4y/F09ktTDQfX5p
	HUtz9nBwmqU/sJY+1QHssLzszX5vHyA8HRpgORh2J9cZpYh6IxJadCEzfZBjbDuQCdqIx/joDefY7
	gl4poCFbJK6yEpwJ+uw1HSDR+9iP1qaio5PG64SyN52Aon4zV4kbYpOnSrs8TEKRHFNob1WcxPlKs
	BvVSDoVAJG/p1qo0GWNHfWy98zX65lTKwmQs1urzopjtWr4vDEiI+qsmR0HLlzjqsjzq9LO2vOiqV
	E4e97yRAqfCFFYqwHv4n+graW4zVU0i0QU5m77KKqAVKi0ec5MAZ+Wwatax+i17j2ZiUKCY434KPX
	3phn6qNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtn0X-001rC3-0p;
	Fri, 20 Oct 2023 10:45:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtn0T-001r6J-1S
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83BBCCE2769;
	Fri, 20 Oct 2023 10:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682CBC433C8;
	Fri, 20 Oct 2023 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697798726;
	bh=QYS87VmaIdJZXTsmHkpT3eJIWnTu6R6ehZGHddHZ7wU=;
	h=From:To:Cc:Subject:Date:From;
	b=VGizGXMHT4W3/Co3ME+YVe+7x/7WBwX0D1xOQYvkWA0br54GW3a7VU7uxvHFTwfDp
	 f80FkmdT2gCfaODjryh2NJC6N8TZx2bvSusxkG9qba0vri5/J0NachhotBBuBh/AFE
	 rOnjk5DUcpjqmaRWWTaVpWBlHJZnN9UAivgpz77OzbpfafbIOweGSi9nV1rRixnvTY
	 JiYoD6R0cVA2C63lnAf0idhABLkQDmqg5iriN2HRRs0+CJ+rSEp+kassuBiW0hf9mk
	 VQhQhYJn1JzLwj8vRyO2ci9GOB+bXXiW9TD+rzoWXrlTeW7eBY+2e1t1cD13jsZ2Am
	 z592wJUPXtXkw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7915: fallback to non-wed mode if platform_get_resource fails in mt7915_mmio_wed_init()
Date: Fri, 20 Oct 2023 12:45:19 +0200
Message-ID: <6481c37a50fb68db56af88e07e31da71d04aff40.1697798663.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_034529_707958_512F88EE 
X-CRM114-Status: UNSURE (   8.63  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt76 assumes mt7915_mmio_wed_init can fail just after wed driver has
been attached running mtk_wed_device_attach().
Fall back to non-wed mode if platform_get_resource fails in
mt7915_mmio_wed_init routines.

Fixes: eebb70976be5 ("wifi: mt76: mt7915: enable wed for mt7986-wmac chipset")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index c404c90b58a6..aff4f21e843d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -636,7 +636,7 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 
 		res = platform_get_resource(plat_dev, IORESOURCE_MEM, 0);
 		if (!res)
-			return -ENOMEM;
+			return 0;
 
 		wed->wlan.platform_dev = plat_dev;
 		wed->wlan.bus_type = MTK_WED_BUS_AXI;
-- 
2.41.0


