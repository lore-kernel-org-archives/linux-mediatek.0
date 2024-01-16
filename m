Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6283C47DA7
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0LWDoSlmaFfaeo091Whob1ZXiQeDX84ndcj6V4CiHs=; b=ybHWFPYHEljiOK2W/t+TNJI9yE
	Z914MAcV4wd31r5HnJTYIXI0Fl5ZtJKdLOlAGtV0gDsE/ksYEfeLk09upcIEBm41xO1ffIrcJNdw9
	K9RV6f0PY9joeFDtDs8eqvu4uskWg7GVLU5VOWSgaK6ntOJSoD0wQWSxOHZQQmnzZ0+149M9x50TF
	61wrX1EK4HgI3wSwUo4Q2WOLXh7HFvIMZJ17gFzv747BDFjABTj7VXKX7LA0TilJg4yuiQMe7F9tK
	jfjFYNiIJS474ct0IG9jttmreOp5+kB7ka52ZQpEMYV/v2NfubajUsHyXZUdqqGbm5VhnQ5lKTrwp
	K0jLEdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpN6-00DBlM-1U;
	Tue, 16 Jan 2024 19:45:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpN1-00DBhc-07;
	Tue, 16 Jan 2024 19:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BC7861363;
	Tue, 16 Jan 2024 19:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8B5C433C7;
	Tue, 16 Jan 2024 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434280;
	bh=xbDbzMEtgVcUrOQCXkaSw4wRsKzePZtQjF/09aWkAeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibH4wbVDI62oJIDwqokJqAZ5zJJUQQ5aRhUZqW2GpGQSifIb2XZBcsMFFkDnghyBR
	 4xSanzU5LSeD4RZltpNHqevTk7TyG5G8LLyJT0cZz5Q4b3dvT2D/6xhoIM1ro5jFD8
	 0GeixOPAHk9et67Sm5NkNMHMH2dKrOhIh99b7OHUYM+vXuukmhOZCVAT5Yls3ky2d8
	 IYoXn4ybGIG24f6dS+zzeSMxAWVa4GRu65aGJ0wGU3DAlJSPXs/Mx+oG/KxBJx3STC
	 fF4J18st49642p2XkHQOtgHE86C5ZK7Fh+9B/E0FW5NeDARw7XPADL9p9ZdVPgFakQ
	 DUWypLAtjP55Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sujuan.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 049/108] wifi: mt76: mt7996: add PCI IDs for mt7992
Date: Tue, 16 Jan 2024 14:39:15 -0500
Message-ID: <20240116194225.250921-49-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194225.250921-1-sashal@kernel.org>
References: <20240116194225.250921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_114511_115950_D7D1E87F 
X-CRM114-Status: GOOD (  11.09  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

[ Upstream commit 3d3f117a259a65353bf2714a18e25731b3ca5770 ]

Add PCI device IDs to enable mt7992 chipsets support.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index c5301050ff8b..67c015896243 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -17,11 +17,13 @@ static u32 hif_idx;
 
 static const struct pci_device_id mt7996_pci_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7990) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7992) },
 	{ },
 };
 
 static const struct pci_device_id mt7996_hif_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7991) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x799a) },
 	{ },
 };
 
@@ -60,7 +62,9 @@ static void mt7996_put_hif2(struct mt7996_hif *hif)
 static struct mt7996_hif *mt7996_pci_init_hif2(struct pci_dev *pdev)
 {
 	hif_idx++;
-	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7991, NULL))
+
+	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7991, NULL) &&
+	    !pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x799a, NULL))
 		return NULL;
 
 	writel(hif_idx | MT_PCIE_RECOG_ID_SEM,
@@ -113,7 +117,7 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 
 	mt76_pci_disable_aspm(pdev);
 
-	if (id->device == 0x7991)
+	if (id->device == 0x7991 || id->device == 0x799a)
 		return mt7996_pci_hif2_probe(pdev);
 
 	dev = mt7996_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
-- 
2.43.0


