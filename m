Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1587DC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 12:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hZXqDNfGnWCtiqC27m093+MHMh07cF7j843aJEOT8Q=; b=ELZhULUn+FO9qkAx8SXkmZYIDm
	mfNuZW4efiRg7xkxL3ZEIVWNXmtWWfCBP/XXL+uoUIpyeLSQGSPvriXa0FD2EPe9ffnRVECzO2rKd
	2r4N67zimRWuTywHQzXpDApfDS1QDxINraBa/+ozA1niec4eeKWBP+ksKpY0XsDpZoraTfpdLWzbv
	FbJ1iGgS005WbgbEiBEJn1ketv81frbHe79qusQV3oAqFCINDflyCVdGsYCUpqnaPiXTdX9wRt82M
	t/07mifZhjMuBRu9uosAGH6vsm3Ia9KVg0irWSYRUOeDcAFJrLI/EQgyNLAp6tqYwbn+yGmwPPXtQ
	AeZFwBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Krv-001PSx-14;
	Tue, 07 Nov 2023 12:07:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Krr-001PQc-3C;
	Tue, 07 Nov 2023 12:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7818CB8165B;
	Tue,  7 Nov 2023 12:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD27EC433CB;
	Tue,  7 Nov 2023 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358857;
	bh=s7IkpwFkvc63VeyiRhEpqYii0TAbOTbVdNVK41uQ8yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0FAgYfUWostZTAzlsE+DFZsR9+r+CFeDugaZId5BiNY9/sCjrP6esgmarSpKltyd
	 JJ0QQene7pH5PT/ReNI7HIcsWPI0HCilnPLUn+K0eQuccGger1/wOaRFaHXo0lVxzb
	 5qnEDasf2aNgi8q2YvhhMA/X4AwfoXNQuw+L07+Nh7selII/fWvvUV7EVII3A4NtIP
	 OP/C7yDMJAZwpkJJ9A0m1g6qNvdVFyVNiLmMkSJUUUAG8Jero6ZEO4tf3wzViUPna6
	 ouiZlopoY9jrzYbDVdXkbMZpnlWg/9t9SGKE7diXG4tiPGwTRvsML8EILAarQJajau
	 PfwsBtJ1fYRUQ==
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
Subject: [PATCH AUTOSEL 6.6 13/31] wifi: mt76: mt7921e: Support MT7992 IP in Xiaomi Redmibook 15 Pro (2023)
Date: Tue,  7 Nov 2023 07:06:00 -0500
Message-ID: <20231107120704.3756327-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040740_166963_017F72ED 
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
index 3dda84a937175..f04e7095e1810 100644
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
index 5fb3d4c393a9e..0328a4c01e0bf 100644
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


