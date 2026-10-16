Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A5DCCA490
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEa/2At4h8ZJit76fcYpbi2gFdx3R7gwg1DXrCjiWtw=; b=E9cFgVhSO0YkuR7bwZVgjWGlrD
	CChablxANet1bIUyYJExEdfyJANBV6FUVeLiO9oh5vEyECw5DAm0N5WhZDYROGQP+0xR9Mf4AbINJ
	4s4SJmWLnqE9KzeVXUom0oTKB8/fyhkNAcrkaIGHfkgBhdFJOVTas4ZLCEwRvNOTFXbxZc7Q2P19K
	+lPcONCGvsXvXaIDZZ6lazvPJBdlyUNZQ40YC7zvTCR8O49HU6s3ShI1vgreBgVqiL/4EpDjte4zX
	k7R3UMbxru5AjHlEMuEhuCEGy3+R0K4s2H1hDQxnQgCSxCJw1fPP6kIUn1VI37i1vEeN7jbnQCQT/
	619xbTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe01-00000002RUE-1YNt;
	Fri, 16 Oct 2026 09:13:13 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzv-00000002ROe-0ry7
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:08 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1631277a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2026 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141986; x=1792746786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEa/2At4h8ZJit76fcYpbi2gFdx3R7gwg1DXrCjiWtw=;
        b=TquWuaU60D5hjHViuaDCzdG3NfMPIFGfw2NbJe/F4dkA4eNEvLvcoX8PCqNaSoem/z
         OzOdMOfBNyb+uPHohO8Y7zgOoh4GGURvGOOQzkFm1JTR7VyODw6uRM3T7OY9XrNS3pUz
         APOTygRoV3ZkIcHVMiuxRZcJR177vMDIrAjHDZrHDnCiZqPNv2ayeafXvYYYHFUjlZ2m
         qS6JHpW5EMafukAO+uD8nA0ewDJy3xYyVDNRp/21BfMEkQDCHvCUPhslHK+3dmAiVB6Z
         GegGPysXREF5v1XUHPyeo2XvGjjvCll0QB5pMOkFwj8THPXmLNlA3cDVMkogVgjzM1qi
         un0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141986; x=1792746786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEa/2At4h8ZJit76fcYpbi2gFdx3R7gwg1DXrCjiWtw=;
        b=I/gz7kLSpNx5GA7JSjC4ArKNvGWE7SvG9VscxieB8m5RODxIEba2nX7Y+eC7LAUWy8
         pTulTwUO6d4ukynr7JjK9ajGIWcqQCDRKwTaN4oJm6SLWI6fIPJivA2sbUHA5tBNbw/Q
         6idp9cmbUDfrh3OBEq7wodM7bx8DjuWv/BYcexEmehjp8bQDPasiTXYF/B7rRz1VhYhq
         0MvuQPOxHFfYgpSsUWb1i143vFdddPZfK41pBowrHnJMejzJfq+zuxGSlv8NNcVL2c7E
         cmhcRklgiERoaCIHhJ8F8GNxc5hmKCFK4pfdD47Te74IpitzA/gicuTQQBipWd4C2Igs
         n5bA==
X-Forwarded-Encrypted: i=1; AKwUvBy0HMHBz6/shtGqVGrI8rc4XnP8w8dYPm1XxpKpNNKG+XK9AWYB7SI4A6CtwOLQsJjjwwj4mVfGfEUeugp4Zw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5vN8UwRJodw15kA65I89YO0HJCKU6qQR9NL8VgdcqT2MrfT0t
	3iFv3KXB5KFFQA8avIYADFhxdUKXZE9ZsDvKI74SSg06+oGnIoGmbAJw
X-Gm-Gg: AYBFou2+fXavkSIHVUAvceD5BjTSEeOTfCxrwXhDvFmeAneznYo28m45FrEPGblzje0
	bplDTzzFHWt7Vz7ff5i+XbiQD0BA+rlw+wfW48bdzEVVe8ujn31trEli5EbJU0WgZmEXcgcg8jB
	LLb78me9UMPN6X1BYe0xDe9VGx7VeSJTYrfZ35RYbMUHMzu6O6RN448+49AD8A8/qyjmGLG9G3P
	rnqj/cVZ6qaerVL4dz0PnESuRjKBN4p0FOkom3alICxihwbBcoSKfh2R61Fwcq/DL4ANTUKB1K/
	+Cd8slhWrL2CxpeC1tu5qi7e09z0X2cMD3cSkJcK4Tdm6OoBRt2QWv/FO3UuHjyhlw9UK2iDFc5
	x2Fxx8mZIHcHSewp6mGVy5rgvKCEut+VPeo/T86V7Fc4m4ktm77gOy1k7jlzXK6cANiUZUvwNeV
	8O3NQ8Umx9J5+HL4lIT+7sBDaDH9pBxr1Ce8oMa4J+zRnFCj67svyMK6wNoDUSh8Hr5jBA60G3N
	IGop3K6r3S9q9al/Va2T8B7iPzHya7w+JKc5UMZDn0+vTKXLAWCTvyIyCMh
X-Received: by 2002:a05:6a21:1bc2:b0:3dd:a197:7368 with SMTP id adf61e73a8af0-3e16c0b3393mr19115807637.65.1792141986248;
        Fri, 16 Oct 2026 02:13:06 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:05 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:35 +0800
Subject: [PATCH net v5 3/5] net: ethernet: mtk_wed: free up rings during
 detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-3-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=3046;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=U6JZO9nx3rPOiVZRdnCq19XQmBvRUGHPkux0rhIb7wY=;
 b=nho+TYyw4v1ERH9ayHCtI/6QwLa6MGM/Qf8gpXAuCuRUXlco0OF1n/jItA5a2GBAW2NuSlqtz
 6PqqC3ACTmFAmO1YrmJ7m8BXbsbZYKG9hA4G/3QUJ68hCZj+vVdi8Au
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_021307_265293_A35C63E0 
X-CRM114-Status: GOOD (  12.29  )
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

During __mtk_wed_detach, rx_ring and tx_wdma aren't freed up.

Fix this by add them to mtk_wed_free_rx_rings, also set
MTK_WED_RING_CONFIGURED flag in tx/rx ring and wdma tx/rx ring setup.
Only free rings that has the flag set.

This patch is pulled from mtk-openwrt-feeds to address Sashiko's review.

Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch
Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3f0be70c3f14..b8264435acbe 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -949,6 +949,16 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, struct mtk_wed_ring *ring)
 static void
 mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++)
+		if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->rx_ring[i]);
+
+	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
+		if ((dev->tx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
+
 	mtk_wed_free_rx_buffer(dev);
 	mtk_wed_free_ring(dev, &dev->rro.ring);
 }
@@ -959,9 +969,11 @@ mtk_wed_free_tx_rings(struct mtk_wed_device *dev)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(dev->tx_ring); i++)
-		mtk_wed_free_ring(dev, &dev->tx_ring[i]);
+		if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->tx_ring[i]);
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
-		mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
+		if ((dev->rx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
 }
 
 static void
@@ -1885,6 +1897,8 @@ mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 					 dev->hw->soc->wdma_desc_size, true))
 		return -ENOMEM;
 
+	wdma->flags |= MTK_WED_RING_CONFIGURED;
+
 	wdma_w32(dev, MTK_WDMA_RING_RX(idx) + MTK_WED_RING_OFS_BASE,
 		 wdma->desc_phys);
 	wdma_w32(dev, MTK_WDMA_RING_RX(idx) + MTK_WED_RING_OFS_COUNT,
@@ -1931,6 +1945,8 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 		}
 	}
 
+	wdma->flags |= MTK_WED_RING_CONFIGURED;
+
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_BASE,
 		 wdma->desc_phys);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_COUNT,
@@ -2504,6 +2520,7 @@ mtk_wed_tx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs,
 
 	ring->reg_base = MTK_WED_RING_TX(idx);
 	ring->wpdma = regs;
+	ring->flags |= MTK_WED_RING_CONFIGURED;
 
 	if (mtk_wed_is_v3_or_greater(dev->hw) && idx == 1) {
 		/* reset prefetch index */

-- 
2.47.3


