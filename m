Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7658BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqFAcn67xdIPvMTpb+pwW2NWP1yShjr0DAYpYyk9nNE=; b=ApfmQjoUGtSHu+LaF5B834cvtr
	NIafn/SoI1o9gNt5k+Od8O7LzLg65ikHaTsixQ7l9y90H0oqviU8UIJaTleqeNdta9cerrIDAyl4U
	r5z4djtrPgIMfiu/gw7CfuDlDh6HDeYqiAJ9XqiGzMOhRpgWHCLGgfdwfpCAfrjhKZZwHWtjeHkJq
	YtZ/ELdGDGvRfkKdJ0ZPcwDhYDRsgui7ovOn/rnVfN9WSQnyMZVj2+Vzl2//LZOxQ/IvnofZHQSyr
	JmQKnMTQlftH78vZF+41seHRKXH2+Bkp4mOQ6KibhaLPx9sCtjW2B9JxR4AeqqCiW6gh2Cax6SuoC
	RFmOcM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KuA-001QDM-1H;
	Tue, 07 Nov 2023 12:10:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Ku6-001QB0-2n;
	Tue, 07 Nov 2023 12:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C2996CE0F18;
	Tue,  7 Nov 2023 12:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065BFC433CD;
	Tue,  7 Nov 2023 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358994;
	bh=dmtJAUGRYxZHciadibakhst4NtRR0Kw1nvLI2n5q/VU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I9dnJHVM+MkrNaGu+yoEs67LDbRgiUq3aCaNvJ3QbcXss4BJEED8PpPqZxjQq5Ywu
	 rkhOVhWHfMnxy8uZXwRwZ943URMgLyB/GZ77e6gYOxMo9aXtwb8O5l/zCTUZTlUqbV
	 umcqmzPbVc5t8RA+oDYxRFruKi9AC113NYT85yPxJQJigCI6F6yrshwFFJGLaLMVCo
	 YVwASxngjM6zaDNkY0Dcq1ixOivPpGKE8jodgmp1li99LpL6bSd+l9fcVndwlGgzNO
	 IYOEiHTXLHItqd5hI0qMpvuZOv/lCV2WKeKTl88usORihNWeAdtP0oM5qDhHaERFg1
	 3bf/6ot30OvbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ingo Rohloff <lundril@gmx.de>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	deren.wu@mediatek.com,
	sean.wang@mediatek.com,
	quan.zhou@mediatek.com,
	Leon.Yen@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 13/30] wifi: mt76: mt7921e: Support MT7992 IP in Xiaomi Redmibook 15 Pro (2023)
Date: Tue,  7 Nov 2023 07:08:28 -0500
Message-ID: <20231107120922.3757126-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120922.3757126-1-sashal@kernel.org>
References: <20231107120922.3757126-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040959_081804_A7DB081F 
X-CRM114-Status: GOOD (  11.47  )
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

From: Ingo Rohloff <lundril@gmx.de>

[ Upstream commit fce9c967820a72f600abbf061d7077861685a14d ]

In the Xiaomi Redmibook 15 Pro (2023) laptop I have got, a wifi chip is
used, which according to its PCI Vendor ID is from "ITTIM Technology".

This chip works flawlessly with the mt7921e module.  The driver doesn't
bind to this PCI device, because the Vendor ID from "ITTIM Technology" is
not recognized.

This patch adds the PCI Vendor ID from "ITTIM Technology" to the list of
PCI Vendor IDs and lets the mt7921e driver bind to the mentioned wifi
chip.

Signed-off-by: Ingo Rohloff <lundril@gmx.de>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
 include/linux/pci_ids.h                         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 95610a117d2f0..ed5a220763ce6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -17,6 +17,8 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
 		.driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7922),
 		.driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ITTIM, 0x7922),
+		.driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0608),
 		.driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616),
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 8f9a459e16718..e0a11d34ec998 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -180,6 +180,8 @@
 #define PCI_DEVICE_ID_BERKOM_A4T		0xffa4
 #define PCI_DEVICE_ID_BERKOM_SCITEL_QUADRO	0xffa8
 
+#define PCI_VENDOR_ID_ITTIM		0x0b48
+
 #define PCI_VENDOR_ID_COMPAQ		0x0e11
 #define PCI_DEVICE_ID_COMPAQ_TOKENRING	0x0508
 #define PCI_DEVICE_ID_COMPAQ_TACHYON	0xa0fc
-- 
2.42.0


