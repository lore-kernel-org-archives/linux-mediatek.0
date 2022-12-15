Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E41FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 16:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HCx6CGCuy4Qz3wo45lGMr3XUj3Uhq/5kaZmwiZoF8dw=; b=tKqjYEPCA1zjoHncfiE0Dwa+lI
	G0VcRWRvkd6A089NEF5fEtJhKfQYQtPp3gkdxR26y0JRMLNzwvrNV68eTpDILcbW2m/laB5CtjNmz
	NI17f7mwV4Kh269oCxrt6Katb0rdzMCRXAEhaettPbWkTajJCIsrGZdZVOQ1JvFwBoa+2/TpCECFw
	FTTIpLW4KZSwM1w2vVquEXHgcbd+eBPCficImsJD9i6+CiQgQC9y2UD3kKMm4EMDKCi59LNtNYMLn
	kS2knzOAlR4BaWCAHlGq1EM9FD/G+/quZCm2zlZQF6cPYE4RbnfVKhrV9jzQKe97CHqrSdjqyun4E
	NtSVBuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5r9F-00AK2C-AJ; Thu, 15 Dec 2022 16:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5r93-00AJzM-3s; Thu, 15 Dec 2022 16:31:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A92EF61E3B;
	Thu, 15 Dec 2022 16:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2E4C433EF;
	Thu, 15 Dec 2022 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671121900;
	bh=gAwB+Fty7Ew2vwNk/+gFvPZ/aMvqgMJxojNhd2obFPk=;
	h=From:To:Cc:Subject:Date:From;
	b=Ad6Tic/c9OuhNFSGaN0ipRjCWQ5gEmHBwzSrL5oizW40pHFZJ5Pw1qPk54qYonN8x
	 SH42GkPJG0KrUHsxQBEiv7HDCMMhVa3h5Rtsm4bbXsbZX6xWIHS9LKY8hnP9/VkKVQ
	 ZBvMuO9GFoHroiClO3AbfNzys7Z5tNBD+AuT5MrHRUvoFGr8YdYql4ezaN4cKOqWzn
	 AKiKUq3oC66S9P9FoA/CuQezAg6lcRiUEhjYMsoT01KcnuPyf7W+s8q6ENPYShhfhu
	 p5QXvIeF/EMH0NusScO0b3xG843jmY1Zu0fdxcjm8k8lIzPJowtxdZVLPTXSAjzrFI
	 2zC9pClpXmtqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7996: select CONFIG_RELAY
Date: Thu, 15 Dec 2022 17:31:10 +0100
Message-Id: <20221215163133.4152299-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_083141_224583_DE214DAE 
X-CRM114-Status: GOOD (  10.90  )
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

From: Arnd Bergmann <arnd@arndb.de>

Without CONFIG_RELAY, the driver fails to link:

ERROR: modpost: "relay_flush" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
ERROR: modpost: "relay_switch_subbuf" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
ERROR: modpost: "relay_open" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
ERROR: modpost: "relay_reset" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
ERROR: modpost: "relay_file_operations" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!

The same change was done in mt7915 for the corresponding copy of the code.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
See-also: 988845c9361a ("mt76: mt7915: add support for passing chip/firmware debug data to user space")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
index 5c5fc569e6d5..79fb47a73c91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
@@ -2,6 +2,7 @@
 config MT7996E
 	tristate "MediaTek MT7996 (PCIe) support"
 	select MT76_CONNAC_LIB
+	select RELAY
 	depends on MAC80211
 	depends on PCI
 	help
-- 
2.35.1


