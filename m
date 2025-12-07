Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD770D1CDC6
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Dec 2025 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8/EEIG21HgNJz0UJ1AA5wtG6iy/331f17scAhitLn5o=; b=yYz3n9emuOQU3kt6kPO09gEonb
	Fz8mjGMl2JDO8Rdtpa6NUYy4ISsnCAN3sVNiJESNf1FZtRIaWkFeufwEgv058B73RfOu2tMwX9f7k
	v1HsiSX2FWr4SPHG1LvxCk6TxWHwlDghZrZ1z6jnYr4Ew72AWRTQitorTAhr1tW7iWypugsz+7/3X
	x1pumDxUOFmDYHQnNy1sUfqjQ1rj+iYU8+Kw5XuSBzpfRfPaMyAEpfwk/kD9qF777dlZ3m6Hf0ROm
	cd7Mk6aoqqX1mY5cu1TlqDlG4p7NvEetld/VhtCiKCzK4lBEcimw9cDLWJVmVfvjrH4s004MePFlR
	AzXmBQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSDym-0000000BvXB-35aS;
	Sun, 07 Dec 2025 12:35:08 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSDyh-0000000BvW7-2sZT
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Dec 2025 12:35:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so3847447a91.3
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Dec 2025 04:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765110902; x=1765715702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/EEIG21HgNJz0UJ1AA5wtG6iy/331f17scAhitLn5o=;
        b=XbqrzHRkGGCdrGKb5SKKdgxmn5bw2hGfaNfQImAjEH1JQ28/QmSpi3r+SnXF/DFJdi
         dapfySrrIAVCLZmga5j+O9l8i1ooEgGLiJTbJm+5S85IhoFW/9BZjfw/6qSsjujRlMyA
         TorzZlsOT5ktkON4P6H/UTD5rZ5LC0DQuNOcATO3pocovJ1J39fjCnsShaDqKizkwWr5
         5GkW1L0uoxq3E61CeLU0r9r52F9ByMZzY3ANqWMoomPt0H1WOvBPtZANlAeZX2oqtGV1
         qM2h8uU+WJUITQcVKkxZDpeJVuENtBKLnjkIhWp4dKeGDA8sirENJAGUqzoCOoets2Q6
         Fy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765110902; x=1765715702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/EEIG21HgNJz0UJ1AA5wtG6iy/331f17scAhitLn5o=;
        b=a+/hykY0t9MyzKiHbTq1vQeY9LC4413U+DLcObRy08IGk1PotHnLJDH1Fr+4lo1PX6
         sf8CTgO6dGA6RbNw78ayqNpFVb+UtlTKUmusRyXYX19RC2MbyR/MbnCYS3nBq9kjR36S
         0JWXsXCWA0934ClC+O+elw0HzRNVBIv/YVZel+J80W+GFnoiY+rfD+jnYaHSN7kctpSo
         ro/xk78uDM/Z1TCFKhVM57E6liEnJ6H46e7huovpjSZo/9ce8sjSBcJ8zCJSFigm6B2/
         3MnjCUmOHwCKUwdUE4VeUrpI7LsTaw0J2PVO44EsEbGIVEr/YIOyJ3sXVA8OaJKVspde
         l2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAbirRMhwp5CjSkGWMWkQbFJ2s/Zhm/NoZrxAIRyAWZlfYrGFCzU6UMgApH6rHkYBL6bxT0m1UE4TF0+eZBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFVFuCnP/28yE1tDHF86S4bz0DBWnRSViUkRYZTFuwocvG63Ju
	rW0EgT4Fi98kIAUipp9e8ZPRDGDNjEU69LkI2nYCYz0E1dV4PPt5/doB
X-Gm-Gg: ASbGncuF6PSd28feCJFjkdMCscrQtJQow1m1RbrzXRFyZOFJT+yh7wXj8C7tPGrHCO6
	Qrc0ULBQJKBkHufvhHTCEb8vlaoisF1yKDSqoF8QYtWZi09SosxOKvmmeih+P6X59w3nOg4+fD/
	Rr4KmHshrTeEnCd4ovGGRcsadN5zbku8Zg4KUGIdUBXDbCcs9GI9o95evTod42/Z25MFtdX5zh1
	i61MVNHUOdwCQds1XgTFSlk2bK1wIkJdvTQdAOfuPRIuuAIt+LRc9OzF06IMGsYGCAJgAb+KEzM
	Ye0nLaYDu4YtLLkHnnLeeDSrvQYDYCQ2roVkfw1JcKnqdvCbR73MGL3YW9AF1YMGPBS8CXNZQAD
	UpHF8ZaI9A+iKcQTxTR7K8W7a3D07wyFUtCQIrrP2ZJI5IGoo9ZgAsP9D56E8ZOq2z9me2hHQB9
	aK25Q+fASaXW2oabs0
X-Google-Smtp-Source: AGHT+IFzu5EseF38E19GJggjBQNJ0c5DSWKeJaFT7L7ltbpOuzF8rj9ayEDgLA8p8R58T9CgSYJ4NA==
X-Received: by 2002:a17:90b:3d92:b0:349:8184:af8b with SMTP id 98e67ed59e1d1-349a24b0974mr4020138a91.7.1765110901873;
        Sun, 07 Dec 2025 04:35:01 -0800 (PST)
Received: from archlinux ([205.254.184.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494ea7dabcsm9090852a91.16.2025.12.07.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 04:35:01 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.or,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.co
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drivers: net: wireless: Replace deprecated PCI function
Date: Sun,  7 Dec 2025 18:04:47 +0530
Message-ID: <20251207123447.93233-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_043503_816012_F3F99713 
X-CRM114-Status: UNSURE (   8.38  )
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

pcim_iomap_table() and pcim_iomap_regions() have been
deprecated.
Replace them with pcim_iomap_region().

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index ec9686183251..5a82c3bf471f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -284,10 +284,6 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-	if (ret)
-		return ret;
-
 	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
 	if (!(cmd & PCI_COMMAND_MEMORY)) {
 		cmd |= PCI_COMMAND_MEMORY;
@@ -325,7 +321,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	dev->fw_features = features;
 	dev->hif_ops = &mt7921_pcie_ops;
 	dev->irq_map = &irq_map;
-	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
+	mt76_mmio_init(&dev->mt76, pcim_iomap_region(pdev, 0, pci_name(pdev)));
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
 	dev->phy.dev = dev;
-- 
2.52.0


