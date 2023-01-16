Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FD8C677F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WShhfjt/HHh0NshNOvMg+g+72tOEAis9r62sjM//RqY=; b=mYFAKsSSYTF0ypnONeKJaEqy07
	+uMUTbv96zDKdZmO3gsEBgJnm4IW6YEmjNhA2B5+MdFIPfkiyuOH8g599xPyNtY/LjGRkRjHE2qt2
	GPgMmRooooO+8EyI9pXXbdFDz+LeN86TZwfC8Mtd+faNjnR8W7HNyMdMttyHKrq0drtvf3lRpP55i
	v4DCEOj9mgQT10ritPS1nYDblFS+7yIqRaF70c++rZFqkIINhQXVk4j/aLgNGPZVx4Okorut1Ah09
	TLNdlYKBnoAGTQJQBv2fPiWl4UhZxQ6kx79AlD37deFQpmnVkVoaNWrAvLJgqMFLvA1i/x2eHeSEH
	3OgXCzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRKR-00B5Se-Dd; Mon, 16 Jan 2023 15:23:19 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRK8-00B5Lg-DO; Mon, 16 Jan 2023 15:23:02 +0000
Received: from localhost.localdomain (unknown [222.129.38.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id D5AC53F177;
	Mon, 16 Jan 2023 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1673882572;
	bh=WShhfjt/HHh0NshNOvMg+g+72tOEAis9r62sjM//RqY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ipYD4Y0OQQUCmjI0C9LbgmGfDgYwAkymK/5e/Hm2HEncGkBXrPt6rWG4g2D5mZJw9
	 Jgh33MGAUY9aRlbwCPMOzuLugGeO2D+8C3MtWLMv2RhFihPvI2moS5LaKJxYRfGeou
	 unqi8CB9nANne05yDdaF+DFbXVvI2a+poruvmdBKVNmVhi3I5oq7Sxk+cKkNGRNH35
	 nyl19EjLjhj5l8xQuiJlovuSohVQKYp/TQXmWquO4QakI2KX0eFlKVYxpFjSXCsGcJ
	 HgXeiX8euL1TqKoq7Cz/Xb/edl4DhoproU6nP75142a2fzH77iLu3OQE4RF0S7cl96
	 3vcYvYlnmWQQQ==
From: Aaron Ma <aaron.ma@canonical.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aaron.ma@canonical.com
Subject: [PATCH] wifi: mt76: mt7921: fix error code of return in mt7921_acpi_read
Date: Mon, 16 Jan 2023 23:22:35 +0800
Message-Id: <20230116152235.1433484-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_072300_730603_6C2D55DB 
X-CRM114-Status: GOOD (  11.30  )
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

Kernel NULL pointer dereference when ACPI SAR table isn't implemented well.
Fix the error code of return to mark the ACPI SAR table as invalid.

[    5.077128] mt7921e 0000:06:00.0: sar cnt = 0
[    5.077381] BUG: kernel NULL pointer dereference, address:
0000000000000004
[    5.077630] #PF: supervisor read access in kernel mode
[    5.077883] #PF: error_code(0x0000) - not-present page
[    5.078138] PGD 0 P4D 0
[    5.078398] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    5.079202] RIP: 0010:mt7921_init_acpi_sar+0x106/0x220
[mt7921_common]
...
[    5.080786] Call Trace:
[    5.080786]  <TASK>
[    5.080786]  mt7921_register_device+0x37d/0x490 [mt7921_common]
[    5.080786]  mt7921_pci_probe.part.0+0x2ee/0x310 [mt7921e]
[    5.080786]  mt7921_pci_probe+0x52/0x70 [mt7921e]
[    5.080786]  local_pci_probe+0x47/0x90
[    5.080786]  pci_call_probe+0x55/0x190
[    5.080786]  pci_device_probe+0x84/0x120

Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c
index 47e034a9b003..ed9241d4aa64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c
@@ -33,14 +33,17 @@ mt7921_acpi_read(struct mt7921_dev *dev, u8 *method, u8 **tbl, u32 *len)
 	    sar_root->package.elements[0].type != ACPI_TYPE_INTEGER) {
 		dev_err(mdev->dev, "sar cnt = %d\n",
 			sar_root->package.count);
+		ret = -EINVAL;
 		goto free;
 	}
 
 	if (!*tbl) {
 		*tbl = devm_kzalloc(mdev->dev, sar_root->package.count,
 				    GFP_KERNEL);
-		if (!*tbl)
+		if (!*tbl) {
+			ret = -ENOMEM;
 			goto free;
+		}
 	}
 	if (len)
 		*len = sar_root->package.count;
@@ -52,9 +55,9 @@ mt7921_acpi_read(struct mt7921_dev *dev, u8 *method, u8 **tbl, u32 *len)
 			break;
 		*(*tbl + i) = (u8)sar_unit->integer.value;
 	}
-free:
 	ret = (i == sar_root->package.count) ? 0 : -EINVAL;
 
+free:
 	kfree(sar_root);
 
 	return ret;
-- 
2.34.1


