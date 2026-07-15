Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89BCC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MQZZDFFxqTDdSnsRY8wqJD42CyjhcA/Zlppkdex9wbI=; b=lYnUzTqvytpd2k/odeTvDyGpqD
	by6Q3Upci51yUntCT6Wg13aRH1GQZfJqyreiFEg1vPBr9MUAPeGAUWkfo4oJZlOWaa8tUmQhYDCv8
	APx7NryhDwtyygOs9Sqou9Sw6xMZDIpaz0DkhYmtkFTwsShReGDOQDaGpN3WauIsoPjvPnDAPnjKi
	yaTmikog4D/sbCpuXSsCH29E/VDTYal853Hev5lgYZOF0sVLenXDXyBocFuLqQgTVa78tg8OhfWPx
	TPiG5Mv/nl0dJeqqgvFHRfQJQWqFfcnLChb+jHEj8U4h0IvMpi+XEhnLjz72rRolPaafH1FXuAJdp
	2zoiDd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1QI-0000000FIKP-2BPY;
	Wed, 15 Jul 2026 15:21:22 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1QG-0000000FIJS-1b23
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 15:21:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8484f229529so1648706b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784128879; x=1784733679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQZZDFFxqTDdSnsRY8wqJD42CyjhcA/Zlppkdex9wbI=;
        b=tIUEXU3Ejab6ltuGst1Kh7B+QOsdHqN34D+nbHsZmwcbRsZ0GPofx/HHZacmEh7suK
         BbMfJPPXIKVmrpmHmKC1bNdYkhpNqiRajZ7zGqc3p6P0/EXKeK9VrNGJ1f40ltaQAWwN
         OIcSfdE0OeeMQFpewgs2slMLvcrLOC7Q5XX5kM3qOel5l4+Fb+Jh6tEybGBhiG2O+DVS
         4SomMAFGcXyQKjDaDgznpqxpuOmNz8a1vkhPDy5MjTTwLD4zsRjPfjMTIVyyczc2Gmr1
         +i7f/w5SaOVJiVmxnpH3YHvfAKUJRwFDPJybohVISZuA4RynvC8iu7489zXmAlhm7KXH
         OdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128879; x=1784733679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQZZDFFxqTDdSnsRY8wqJD42CyjhcA/Zlppkdex9wbI=;
        b=YL2CD4HcU/5Dq6qZ7GCi0Mx1V5GG8Z+VWeLeGiK5U1bHZZ7pQaQ9POLCBCGhmPXHCS
         6VgM1BydO6fjOgP200BtbCgFSERW4Z64CzfuLdpd971XPJizL52FK4vMoAy8CoQO6Y8Z
         n9TGRtnEYQfe+Bg0Sb3ZzzbwKaptbU3DcKtaTc5yqq2StHyTrcQLAJCnQlWCbBf3ftvP
         sWxzW5iuH1tvVvRGLo22+zKK8wZ9wBwPbG0mXgZpcztXB1ZTMHSOQCNVv0X3x5qrfj/f
         6I5X0GDhKcV0qqokE3KNx0midmzbRyTVBYLzbxH8AxBBO93kl8tGSzuEGlCbNPO+jZQp
         EbBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrK95NWaU85FDGxEzdEQktwJuNPIyUuKgEvhrX6rLzBhJ7vf1f0iQqwu6YEMVoNHYhnmCakTAcJHazXabSOjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqusZDQPueC0jsbraoxxk1yb5EkG/eqn1CcuOa8VsEXojccVS4
	ZxRpXBE2jGCgY4iiIReUIiWDfP69sJrYoMJCNrtd6KM+/QSKyLejGLhS
X-Gm-Gg: AfdE7ckJo0vfIgAAUmlBC2Aasw2sTaHs9895C7KajMKk65WFlCU4BIN62aTtPIoEnMC
	TRQ2DvhxMw8z9PQ5jThihS6XIz4Px4KV1J7Y/wvNQoId5wxs0ewj0Up9D3tjb7WPg2zJUO9Ahp5
	luoU+umCE8Xrrljt9Mc2U8FGdHkWoJzbsbGoqvYJSYTy4jMpLKxdv6PAGK222F/bGp+QrgIOOyk
	2e3NT/keq7ITjYhZzaal84Ns8OAVIoS/jc8eiUzoJVXaiwbJ2U/ZHN3YVUQyQeNBX7AOpmvvM0A
	HqN/pih03NulxudkwKGGzi35xLO0n/72WLmdBw/Ox7LlwuNkSQ2Xqyxj6hIKJ3ySVNUFF42t9WI
	8ymmVBXDAt/fhzfPqJRToOE+Oe2OGu/9XF0od3Gg3b+Q6Ml3/9QB/XKYkcM1j4Nl5+gRFcO4vsp
	gTrToFjyou96ZJdZX6mokIhEqF23hqLAgDaXzE8a44JqN4WXlzDSEqSQ==
X-Received: by 2002:a05:6a00:b4a:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-848896c3a47mr15383950b3a.7.1784128878556;
        Wed, 15 Jul 2026 08:21:18 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5c699440sm2268842b3a.34.2026.07.15.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:21:17 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH mt76 v2 1/2] wifi: mt76: wed: fix kernel panic on non-DBDC MT7986
Date: Wed, 15 Jul 2026 23:21:12 +0800
Message-ID: <20260715152113.553-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_082120_433188_E2798237 
X-CRM114-Status: GOOD (  11.59  )
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


