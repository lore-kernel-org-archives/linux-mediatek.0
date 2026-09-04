Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2904C79F80
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pTVdZI2iHHd6Jp0rd34jTe+xNDB46yEqEKS0KoFWgMw=; b=Ln7lyabW0UNUulpuN+BSm0fJhS
	RH6lxhqtGmQqs98gMWMhjpGJ4jOZASPH4ym0ZEpiGA1uBS5q+NfexqII6XDXiSDQOiv1B3vD90Y9C
	6YmVxU3n4scQluQxR+5VpIabtaKOyD0obwqlMIypdc9sCA1uBsDteErC6UnmLguAgY1dfWGwKl+UH
	2wbD4+cI8DuS+BjeUgb+5762yF13bjOPh9P1uBruSsWFh4koNAvELOaf57GCPYD079ZL6Hc6VGZwV
	4rAuuD7+ebaCC9/jRO5YqVJk9KuqiTuhzKi8TulCxwg0klCBdByj3a1g2Pf+vsIzP+Yqp+xArp85R
	ZwoChj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wd9-00000002hLW-2mjV;
	Fri, 04 Sep 2026 16:19:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wd5-00000002hDa-3ZH3
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 16:19:05 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 30F9A88311;
	Fri, 04 Sep 2026 18:18:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyTBsbdPNoGd; Fri,  4 Sep 2026 18:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1788538738; bh=ohmGjWMsL6vjjMGZNVQu0SWcvRVkChE4rzh6U1/QCRY=;
	h=From:To:Cc:Subject:Date;
	b=EQ6zgXuwTQ82wOiZyQ6E8i6DqlzRPu//W/nf4fuT4brwPHkAwylddVIMOLB3IKeel
	 vTHBwNrx1ZTZQ0VgDlVsvivyoi651tUxon2upp04NTfzdUa1/BBeSkhE/QUiCHzolV
	 Et9Mapzd8nbCEetQ3IO3zoWKvvWATAJaB04Uo0BJ2BYl7S5U8lFMqj4rEvq+gKj5zL
	 WIC6bF55tcaQ29gdERCoYVhdvUgF/aNAqdUUZUPfnP4BPVhxeLclLvqO3kJ7ocib0v
	 tC8itd+PuePdghA0DYAKXXGNMkWFrkgdLSYrziPdZkNIAAcnRbIzphRmAdiIUaoREw
	 x1zIQFkK68pqw==
From: Marco Scardovi <scardracs@disroot.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] wifi: mt76: mt792x: fix NULL pointer dereference in mt792x_init_acpi_sar_power
Date: Fri,  4 Sep 2026 18:18:26 +0200
Message-ID: <20260904161826.5638-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091904_319545_D0F158BF 
X-CRM114-Status: UNSURE (   8.64  )
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

In mt792x_init_acpi_sar_power(), capa is obtained from
phy->mt76->hw->wiphy->sar_capa. On systems where ACPI SAR tables exist
(such as ASUS ROG laptops) but wiphy->sar_capa has not yet been
initialized (for instance, when a regulatory notifier triggers
mt7921_set_tx_sar_pwr() before the asynchronous dev->init_work
completes mt76_register_device()), capa is NULL.

Attempting to read capa->num_freq_ranges leads to a NULL pointer
dereference at offset 0x04:

  BUG: kernel NULL pointer dereference, address: 0000000000000004
  RIP: 0010:mt792x_init_acpi_sar_power+0x40/0x1ef [mt792x_lib]
  Call Trace:
   <TASK>
   mt792x_init_acpi_sar_power+0x40/0x1ef [mt792x_lib]
   mt7921_set_tx_sar_pwr+0x3b/0x70 [mt7921_common]
   mt7921_regd_notifier_work+0x1b/0x30 [mt7921_common]
   ...

Add a check for !capa and !phy->mt76->frp before dereferencing,
matching the existing defensive pattern in mt76/mac80211.c.

Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 946dd7956e4a..fbc2f9706dd4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -326,6 +326,9 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
 	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
 		return 0;
 
+	if (!capa || !phy->mt76->frp)
+		return 0;
+
 	/* When ACPI SAR enabled in HW, we should apply rules for .frp
 	 * 1. w/o .sar_specs : set ACPI SAR power as the defatul value
 	 * 2. w/  .sar_specs : set power with min(.sar_specs, ACPI_SAR)
-- 
2.55.0

