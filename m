Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F5FC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MQZZDFFxqTDdSnsRY8wqJD42CyjhcA/Zlppkdex9wbI=; b=Yd0qj5p8Y0/8fI7TFikRQsj1fv
	IHzoUmwmdVXa1MIf88mN0lytaWpZO/Jlh/+z6zF5naxGUWnBXiEVUsu5TMOsSMvKYU9RC78qVX74X
	Ipnj4rYtcpkB4yFnkbOAAm43O9Z6w3R7jBC7H1kg+6RWgNmrOxpEDLK+uhy8mHx1KRqbC/8z2/GV/
	WoE8X67m0sCtJ95oZpTHgNucG4iC+IJjct2rJRwISmS6eaAvmtyEsu31CT1GYjEAVlcNa/rsQ5mya
	OmbfpgIbIRXN5JggpI5iyjgoIGrUJFwE6cHjsY174zjfNNVRYh8me1GESMTsUwGsppsLuPBMEX9Ik
	kvYMXbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea3I-0000000HL3J-2xMq;
	Tue, 30 Jun 2026 15:07:08 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea3G-0000000HL2y-0mTT
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 15:07:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37e11438c66so1890252a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782832025; x=1783436825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQZZDFFxqTDdSnsRY8wqJD42CyjhcA/Zlppkdex9wbI=;
        b=bSO9QLESVdsZbf8/daSR1BSkNVz1v9CvXKV8YlP8E11E0aARpx9xQVWIRSckkbZqmK
         gYuuvvHveIaPP9EDnFh2t6b/Ln5HeYwEsyiIcOQfGwWCoqiY04/KyM/CNiT0vawsmTAd
         keP7Ds3R1rYuJvICnKbGqA+Yb6g2VAuWQMcIFnnmijUiEO3S700puXKIMdKep4dc9HCo
         AeG2a2MHtWMEhnmKZMUQqyxDHe09+ZrNFr2W+vl5CGgd4EM84kIcR+LwlhTQedrlVdxg
         4XA591hdfmHGm2LiBsA7dlGiGQsFFUemxD+uDJUBmxm78iQR23SSvgmWyyDPLfAdsBwb
         +yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832025; x=1783436825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQZZDFFxqTDdSnsRY8wqJD42CyjhcA/Zlppkdex9wbI=;
        b=rw6vuWuIe8dbJxmgwoJnniLinHkI76VpSXZrhHOQZhF4YDHV8EmlUylOMJoUeLdiSC
         K3M9bM8ZEpUi9q1T0wSGvlwslccnvcrqhrxA1qYXnMBrR8Bo4bRKz+oiAl8EbM2GNw4J
         VWHHXfvhaPg++7TFeWB5kdkheRDNRANyt+p3zG6sD8Jf98L0GwYE5yH4nt5MH6Y8NpV9
         Z3Vu37/MiMcMmnXiOLaxwwNc4c5q1aSHJ67KeX8XDMOsihEnbEcHOVII/iyGVLaAhmIn
         VDKXRpfQuuNkgseN0aYFGz5gYWKzozpfUzx+9o6pp+C2vNMC1q25I3MmD8h3zb3Isqtb
         9ahg==
X-Forwarded-Encrypted: i=1; AHgh+RrfFyy/nJNl7XifBVahFH01ba+hF0RQfBIYqNYCfK7Y/BJICIylUiHgZUbvCoKcpBWpk6o3gCHskxYhUGYEJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyzI60+t4OAisamsjVGzO0enpFouw7ymww7ZZW+ur2XmiUWtle
	bWDx4DVI1zoQt80wW2d3WiuYT97NdlPsJ7mEZYZ+/dEHuNxI5lvB3NmLAsBgP8wr
X-Gm-Gg: AfdE7clRBZ79pNGviFW4Ye9Eyv5WR5e/kSZoMWYdv2CcLOSyzZWQCrVxRwmvDIxIk4y
	cF0nVNVZOvaZ2qT+aIJniT3T2b3R58ORYVqI/fyT76vi5OjeTkXdFjF0afjwOjHazAMeut2pr/D
	wMgmr/moRLO0DoRz1L5SqlvmAve7PNCyCANvjYOL9VArJUFLpizA76EdaMf2gH+nrICa8/VBEeP
	kQ1l7scM8NN/lAx3LVSLJpAA+y0xNe1ouM/QvQv9loM3C4ICTPJcw2pmQIe4QU0aysFErYIj6Bw
	eGTuQ84SkutaIVJ78hFImILKDuY+NGvz83vH+zvvm/E9qtnZlHfXtd2isWmmFRNSnBMih1sudse
	fCKxt2dZ/q/r84hBszfpwDgWDhvAo3qao7b8iwWLATTwuAYLFUk5CzqG4A9W3O3a/6T0NNbrD0p
	8QbQ6bOJOgXoU3k9tNe2bixIIliuiHeuQuhtWouIDpR1+0A7uyICsqSw==
X-Received: by 2002:a17:90b:3909:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3808c0e0679mr706219a91.26.1782832025249;
        Tue, 30 Jun 2026 08:07:05 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095b684basm41811a91.1.2026.06.30.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:07:04 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH mt76 1/2] wifi: mt76: wed: fix kernel panic on non-DBDC MT7986
Date: Tue, 30 Jun 2026 23:06:48 +0800
Message-ID: <20260630150649.1629-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080706_673260_440B3FCF 
X-CRM114-Status: GOOD (  11.45  )
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

In mt76_wed_init_rx_buf, it's hardcoded to use MT_RXQ_MAIN.
But for non-DBDC MT7986 MT_RXQ_BAND1 is used for RX data queue which
leads to kernel panic when attaching WED.

Use the correct RX queue by checking WED version and band_idx.

v2 and band 1 -> MT_RXQ_BAND1
Others -> MT_RXQ_MAIN

Kernel panic:

Unable to handle kernel access to user memory outside uaccess routines at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
Internal error: Oops: 0000000096000005 [#1]  SMP
CPU: 1 UID: 0 PID: 925 Comm: kmodloader Tainted: G           O        6.18.26 #0 NONE
Tainted: [O]=OOT_MODULE
Hardware name: Acer Connect Vero W6m (DT)
pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : page_pool_alloc_frag_netmem+0x1c/0x1bc
lr : page_pool_alloc_frag+0xc/0x34
sp : ffffffc081dab660
x29: ffffffc081dab660 x28: ffffffc081dabc60 x27: ffffff80091af040
x26: 0000008000000000 x25: ffffff80091a8898 x24: ffffff80091a5440
x23: 0000000000001000 x22: 0000000140000000 x21: ffffff80091a2040
x20: ffffff8003f1d780 x19: 0000000000000000 x18: 0000000000000020
x17: ffffffbfbf0ac000 x16: ffffffc080ee0000 x15: ffffff80049d47ca
x14: 000000000000037b x13: 000000000000037b x12: 0000000000000001
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
x8 : ffffff8003f1d7c0 x7 : 0000000000000000 x6 : ffffff8003f1d780
x5 : 0000000000000680 x4 : 0000000000000000 x3 : 0000000000002824
x2 : 0000000000000000 x1 : ffffffc081dab71c x0 : 0000000000000000
Call trace:
 page_pool_alloc_frag_netmem+0x1c/0x1bc (P)
 page_pool_alloc_frag+0xc/0x34
 mt76_wed_init_rx_buf+0xf8/0x2ac [mt76]
 mtk_wed_start+0x79c/0x12ac
 mt7915_dma_start+0x274/0x63c [mt7915e]
 mt7915_dma_start+0x5b4/0x63c [mt7915e]
 mt7915_dma_init+0x49c/0x81c [mt7915e]
 mt7915_register_device+0x24c/0x530 [mt7915e]
 mt7915_mmio_probe+0x91c/0x1980 [mt7915e]
 platform_probe+0x58/0xa0
 really_probe+0xb8/0x2a8
 __driver_probe_device+0x74/0x118
 driver_probe_device+0x3c/0xe0
 __driver_attach+0x88/0x154
 bus_for_each_dev+0x60/0xb0
 driver_attach+0x20/0x28
 bus_add_driver+0xdc/0x200
 driver_register+0x64/0x118
 __platform_driver_register+0x20/0x30
 init_module+0x74/0x1000 [mt7915e]
 do_one_initcall+0x4c/0x1f8
 do_init_module+0x50/0x210
 load_module+0x15f8/0x1b10
 __do_sys_init_module+0x1a8/0x260
 __arm64_sys_init_module+0x18/0x20
 invoke_syscall.constprop.0+0x4c/0xd0
 do_el0_svc+0x3c/0xd0
 el0_svc+0x18/0x60
 el0t_64_sync_handler+0x98/0xdc
 el0t_64_sync+0x158/0x15c
Code: aa0003f3 a9025bf5 a90363f7 d2820017 (b9400000)

Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes since RFC
- Replace single band with non-DBDC
---
 drivers/net/wireless/mediatek/mt76/wed.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/wed.c b/drivers/net/wireless/mediatek/mt76/wed.c
index ed657d952de2..f210a0c57d81 100644
--- a/drivers/net/wireless/mediatek/mt76/wed.c
+++ b/drivers/net/wireless/mediatek/mt76/wed.c
@@ -33,10 +33,15 @@ u32 mt76_wed_init_rx_buf(struct mtk_wed_device *wed, int size)
 {
 	struct mtk_wed_bm_desc *desc = wed->rx_buf_ring.desc;
 	struct mt76_dev *dev = mt76_wed_to_dev(wed);
-	struct mt76_queue *q = &dev->q_rx[MT_RXQ_MAIN];
 	struct mt76_txwi_cache *t = NULL;
+	struct mt76_queue *q;
 	int i;
 
+	if (wed->version == 2 && dev->phy.band_idx)
+		q = &dev->q_rx[MT_RXQ_BAND1];
+	else
+		q = &dev->q_rx[MT_RXQ_MAIN];
+
 	for (i = 0; i < size; i++) {
 		dma_addr_t addr;
 		u32 offset;
-- 
2.47.3


