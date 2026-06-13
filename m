Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4664CD98D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C17B2edKMqV+XF0ZSaOhZ1zqxpv8me/cpGMvVnK7YlE=; b=4o+BtIsO/9YZO7Z+lzJ+aw+8OR
	to+E1M3WY3rEaFSMuiiQKyi/71/ZElWXI3t3yvTq0UNE7l6156NsYaRYagnRsLU/3stRQNohMZzNk
	SiPl2bZNgjlsphgrFh8F4rJqGduv2/r3epdAiavrMoY6UFW67XT6lMaOkoLNrbEpDKzr24FsnaF8M
	PV46s4/SA0OTGnSWOFiT2GkMa58X4EHlUYa/0lV3iDHl9YhjhprfhMAXsi+IcVmumtuCy1KecYBG9
	SVCwLyf8M+pCu+5sciwaIqVsjkoL4nLiEcqMsEQT66sK+hNyOnFHzjj59s5v295RmZqW8eNDnX+8p
	G/ql5sbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSD7-0000000CRoQ-0ga5;
	Sat, 13 Jun 2026 17:31:57 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSD5-0000000CRo3-1bf7
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 17:31:56 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-307631dbfedso4402123eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781371913; x=1781976713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C17B2edKMqV+XF0ZSaOhZ1zqxpv8me/cpGMvVnK7YlE=;
        b=LwHdwj0hRj6hRfW3V7fuijskMXTVB82TPgdU0ujGOoQYeI1tBBxYOOwLw79tNcxiAs
         vFpv74QSSIzleuFVS50RLuHR5yOLqYYx7rSgzJPWieh7xmMVqL6bVJxlGUq8plg7jXaL
         PADTMMSJ/RLfv8axff5o5n0/2LOVLcGJuDeMwtY7xr222yhfY3H6JMs1XXq1QZonI7XN
         dMkpohKAQoU3WpBhk5QxgYf3HlFuY3o487EWNNHVgUfpq/ZObPsWnNvstJ/iZE0tSEY9
         iviytnxdLAEimXS5YA0OzxPvcJxlwtXWZBG2+icH1/qUeftLoYiBwFZ1CIHylw9Qh+r5
         KweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371913; x=1781976713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C17B2edKMqV+XF0ZSaOhZ1zqxpv8me/cpGMvVnK7YlE=;
        b=J8wDeAdSmNJ0fGuTf13ocvEvpJEemTCSOdJqvQftNvzfeKhczSMRQqiUwb8LlrqLVw
         vRqH6MpCYvRZ6xHAnsZCQA05peEGL9mWr0KGdtp8Xff9JCTdGRvF/tBpst/qAHz8bMnL
         lOy6GFyMY5CE7scsMGc6Z6la0lhVUsVbhRy/ONUMnv0ebvWH1gNoj3md/HxCWyIuJVRu
         9xn0jO53ZUOIUvMFOnRE6R1Rb/x4pRzD7uyGiEqgUJBL8aqx4OHrp3qRG2VeJDs6WO/s
         Bn4wR1wOj+Q9rWllkM4/bZ8mwJAWV8vYFDkuxL4C6Pc9mj5Kz2QiLljl12jJyYpnfDwL
         tNfg==
X-Forwarded-Encrypted: i=1; AFNElJ9u+XY5GTYd3wUro6+2UOf5nK+vlHkeQ8cPlh1cGdhaZwucUYL2pjTmIKVhImR7dKE1I94g3trTKyXwB2Xlew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjWszUQS/C6WvjtRPZVT7pwvV/UbD/pHmrV7ByT+DkYhmm6YT2
	hKqTfmdsaxwBAeBaBJBR0NuUxeo52l/THlUH37qI23qtFxa+UQujLJB0
X-Gm-Gg: Acq92OGkRqL8uI20o7b7WabFfz4VegsVjTx+UsOmzqHtDphR7MXJudWyGmFTARb7idY
	lmR05ZvVJMqA8PkBCp9DsSL/kVQ8ZoCFd5zQv+Ev79Ip6NqoTwxJWICWxyozjAdWHSVOsZMd56k
	srCmH7QcT8RIrEOlIYmssytmZI+Sj1/4aaIxofxtwF6zUTdrBORgACy41sa7t6rHw2WCj1qp82O
	7HjJAeUaOP42EBUUy1XxiSypSdGNsFG+R/L8IvGsTOnoFo7BhRYpmA49CGsbokBBDlAw0QS7o4V
	PSmqzoK9Z0rKVWXv6+LudsBJnr6wFGfDB6rs2LAwBBNQybyPpfTAV6M8APWpuYOhifKk6WSZYSy
	NfPUwcEpwuoK0M5k+pT0xfSMt9nY9qHZpOYqmtSbUyEA5O7lq2DEinpqJzq4UfRH3bQMGae1nTa
	cCsswbYGzN7XtEfl+d9cU8jcEWkMVAI2il4nHYE2LMLcD2xMiBFIizfottT0OMhSdz
X-Received: by 2002:a05:7300:8185:b0:307:26a3:75d8 with SMTP id 5a478bee46e88-3081ff40831mr4575359eec.1.1781371913456;
        Sat, 13 Jun 2026 10:31:53 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4fe55sm8260862eec.25.2026.06.13.10.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:31:52 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [RFC,mt76] wifi: mt76: wed: fix kernel panic on single band MT7986
Date: Sun, 14 Jun 2026 01:31:09 +0800
Message-ID: <20260613173109.849-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_103155_430060_ED0BB38C 
X-CRM114-Status: GOOD (  12.19  )
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
But for single band MT7986 MT_RXQ_BAND1 is used for RX data queue which
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
Hi maintainers,

I am trying to fix WED on a MT7986 + MT7916 board.
With this patch applied, WED loads without kernel panic.
Client can connect but there's no traffic.

Maybe there's somewhere else that need to be configured for single band MT7986?

I can provide the rxinfo, txinfo dump from WED if requested.
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


