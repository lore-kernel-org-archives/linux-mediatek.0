Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C74AD3B7EA
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 17:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PgfWpyXRTYw7pqOmQBjZJ0wQoN6AGdnNEKUvt/DRi4=; b=mtzYXq7ozR8xYs64zPHjHeZB03
	d00gumnmCRAE92gWGUUL3YRw+EZpLJ77nUNHfUG7JbOvOr6MIzkpzri9KIA5rf3TC+fQTdpCuDJ7l
	KZoXawBmOT+fJlCSwTlWE2C+rHtOKXl2asTk5jTo18ZzYnpoC+GR3uqk0pVwRMSEl5GpfSxBiA7Os
	+wC2zhLS7+ksJwhGnhLjUoi+kr3n47wbT0gJNIIu5KhMvZyHAaqi++4ta4f93Zrqy6347juqnDguP
	u+3cTzp6qBUFcOribKGe+f6WnluweipNLMgt6A4sTtJTBLkXKCZUsmOrz9WfKzTHtP2V2AgD5Uxb6
	dvHzXjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSexb-0000000DNhN-25p3;
	Mon, 08 Dec 2025 17:23:43 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSexY-0000000DNgP-1klK
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 17:23:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso2677021b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Dec 2025 09:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765214619; x=1765819419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0PgfWpyXRTYw7pqOmQBjZJ0wQoN6AGdnNEKUvt/DRi4=;
        b=czsKyNxbDQYmEAaPffYco84ZKTkLMMXZlyQypAFkApmaLl7HIzj9KQLSuxIG3Iw8QO
         HRWvXZeeR06i/RqDpZb3/RZrXSHmP86R75T7AZ9kypqxGZQiGq5YqlaSIrzeVsg2J2uZ
         d0DGjISGu1SkcYMKzushDPFimz6nln/9wdA6Xly+0u4N4ZBIUtscyLiiDW2k3Q+yb+uB
         747F4/PCEeB2NCEyEJGOV1UlEtdcmu+eds38KScsLg+POvxiePPZW497KhKvi3zOt70r
         RI9/0o8zzkqNh2aiqYG8OhTmKSaUeT553qiR/JEFIBEmg5LCVGBWwXEhbeBhKdb0Uro5
         ZmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765214619; x=1765819419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PgfWpyXRTYw7pqOmQBjZJ0wQoN6AGdnNEKUvt/DRi4=;
        b=QOMUbxv4/epX++Gc9o5RAuBgvI6vseh5vps9buzJrZGmR4VEd2v2nrl6qmlqPwDrCW
         MLcp+/113v8hYHWMuqGYltvQv5+EnG/E7tj66EJwPqVCBkDcg4F/TAcVFEFmqO/BCgEE
         6N33/x9m+33lTwqhEJZFHuPFHuB5AdvHqSzU4IMwlj2dPRm6kUzgErdZPiCreXe3fqHn
         GVcheXlF73Jb+hIrH/M8r+oMgOQvbYAtXSlQdR+C8wZctvHgaHzDMN5hSn5N5RItJE2O
         YhaxmaNdevnUxDx96LYsMVSCl6zjF2aMRvMBkJ9j3owKnjpUydTEsTqNpryL/IB56umE
         2mBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2BFL3QZ7NErIo0bEN0w+yXv5fcnlT8LG1OUmynGSOpnY3kCkRTqDDYH65xYyrVPZFwO2Aj3lZNr8Mj3PJbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtBw/HDt+bBAZHLe2DVKPF3dCrwpD1oecsjTLT81PcsACIoPnb
	kEXDPw55K3NDGsAt5a8j3Y1D8ap/Gwsucz6OhRDMSE74QgyU0OJvGdU6
X-Gm-Gg: ASbGncv+3cpnAD+AJU2PROcDlnp/QENMKeJMHlKSPOazmCiCQo46msXEK8lKN0Rkk1h
	BRv9LTW/IPELon4v3p1IBtOY8iKJU52A8i3Vy2xCKOK3SFxDnI3KOrWsNQd8RlpXi6q8o/UmIA2
	5VxOzGvpf+7bUavifCDzuO+CES2BtNLtSFgpyerz9rBQuRPvFIII9grRyUD2cJpmnw3sGbb2prw
	pZFgwRT7gNjlbc1POdIPviptn7Co2IugqcjiLda73MigbF0ceKOfSq3p5MRMNX0oDmV+BPjyvWV
	7b9554p7QnTUWosqRsjDGmfd/zdAASmyidzf0V0eN0Ajq12RUueu/30rJPHssLNK7AOVlDaV9KQ
	MrT2H+v5/9gMmz96Z+U6Gu+U3Ddv0uW3h/miIkDsvNu0dceOLd8kjVEFpqjD0P23oGaE2uAvE3A
	F3OOtIjgJb3YSF
X-Google-Smtp-Source: AGHT+IH3U7wAIn1n8s7LBxALn5cXyfQ0bJrUjXZQ0dex2XlkC4L563Ju/0lyvT1vRLhXem3jcORmOQ==
X-Received: by 2002:a05:6a00:181b:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7f03be92eaamr104219b3a.16.1765214619055;
        Mon, 08 Dec 2025 09:23:39 -0800 (PST)
Received: from archlinux ([36.255.84.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a0533f08sm13766369b3a.23.2025.12.08.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 09:23:38 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] wifi: mt76: mt7921: Replace deprecated PCI function
Date: Mon,  8 Dec 2025 22:53:31 +0530
Message-ID: <20251208172331.89705-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_092340_464894_FE9AD31F 
X-CRM114-Status: UNSURE (   9.79  )
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
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index ec9686183251..65c7fe671137 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -276,6 +276,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	struct mt76_bus_ops *bus_ops;
 	struct mt792x_dev *dev;
 	struct mt76_dev *mdev;
+	void __iomem *regs;
 	u16 cmd, chipid;
 	u8 features;
 	int ret;
@@ -284,10 +285,6 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-	if (ret)
-		return ret;
-
 	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
 	if (!(cmd & PCI_COMMAND_MEMORY)) {
 		cmd |= PCI_COMMAND_MEMORY;
@@ -321,11 +318,15 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, mdev);
 
+	regs =  pcim_iomap_region(pdev, 0, pci_name(pdev));
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7921_pcie_ops;
 	dev->irq_map = &irq_map;
-	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
+	mt76_mmio_init(&dev->mt76, regs);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
 	dev->phy.dev = dev;
-- 
2.52.0


