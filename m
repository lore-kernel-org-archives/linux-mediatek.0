Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64454CCD193
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNvTbXavF/imzgjQRQuILUWlIen4I9AgeCPTWKNruvI=; b=XshqAkQegRFnU5+0Ll/lA3wg0e
	UmiL0x9Oeib84kyoR46epgIuv5JAGXpDS+ZN9Z+nz2cZ0fstaJKFqvf2WYwhl+R5iEHOx9y3ZWgh0
	wkf4rb83ZfEEyiNMipgZsncMw10A37/IYrX/Uu/6ZoBV7FtIjx3LH8/61txrS25UAJtXNexO+WC6R
	uO0fpMjZ/zD6HMq9W9ijeIUebACijdstxFIMj5C6VmjPz2jyiZdR1uiFK60RYCp+aHWUA1DBdXnMu
	WVJhxMuLmH3BUtgGiWW1IJgVtWTWfKjJZQmxmBBdbc6Oi8ZBN7TWRdqtmCNri1g3NLVIttve6Q/oQ
	A1wceLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Ll-00000007QZS-2Guc;
	Thu, 23 Oct 2025 19:51:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Lk-00000007QXd-0J2V;
	Thu, 23 Oct 2025 19:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BNvTbXavF/imzgjQRQuILUWlIen4I9AgeCPTWKNruvI=; b=GDc9IK2EZZ0ZH/GGiTIZJwwZQ8
	soZpYKoJTZV+dKX4FAKQjdXA289QuMoc5io+9enjrcd0OwgnhOZmmM/o9885QZaDDIhZtPiwC6gr+
	2yHBBCsE7e/Wj4LR7+jDCConR2qzBddROr3VY+dQHpdoZUdVTaA9rO7EWv81o56ckpS+JUJt3kQhl
	ze063CqXD3jUmup1wADUgEBKf/ZiokXVIxYGWYSqwfGlzGhEE+dPu/utKiwc0spm3/g3rMepKXG0N
	j9RseoG9Lxvkt8bDbAl5P7bG4JIQBZP1R7cbdO7OpzCf+RUutxIXPSLyY9K/NZ4POcKLXB74YGTS/
	YCyJDKlw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0U1-00000001gEe-3CgK;
	Thu, 23 Oct 2025 18:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249094; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MEzS8VLgEzMyMvPqUu9PyjbH5RrBVUegpVD/hMDrQftOCFy6i6euCKAizezW2E0buRclj6OZgbNzMV0HEo7tYrK/eOOfKi2TiT8kdnnb4sECDeZ3685n1/su2nmErREPJVOvxd5bV0llVm+ZNVEb2l1ezLtoJ03oMbsLJ2Jj/rk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249094; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BNvTbXavF/imzgjQRQuILUWlIen4I9AgeCPTWKNruvI=; 
	b=ffbVKGFt+K5bd0j9BvyKbSYyxirSkfl6fG6HYUwQ1q8G5uhWTGg7ax4gBZY/nVuEq99zxv9Ug/bu24VdXR4rU7t3A7DF2a+o47KQBtkLRCRO+5o/3EnDZkcamz7FuQBNYjSgm457vfCHDxs1PiuGihCBplCA5FWHbQNFv38dJjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249094;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BNvTbXavF/imzgjQRQuILUWlIen4I9AgeCPTWKNruvI=;
	b=CP6n39KUdlEASfgkB2F2WzIZGo83agHbXG7eY7Zw0ZbqnF8tLUnvsHZKa5wOts67
	YKDqiG4M2rLupr6MD+LtKopATXt5BnWLFNpqFSKRWAexFoWyyRZaBr/tGmxg+EOXRf5
	k0Y5Hc9gcz1wSd39l/mJUdbk7/ebxeDgPVzc+18g=
Received: by mx.zohomail.com with SMTPS id 1761249093930514.1345775154825;
	Thu, 23 Oct 2025 12:51:33 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:31 +0200
Subject: [PATCH v3 13/24] scsi: ufs: mediatek: Switch to newer PM ops
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-13-0f04b4a795ff@collabora.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195622_402962_0F69004D 
X-CRM114-Status: GOOD (  12.80  )
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

SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS are deprecated.

Switch to the non-deprecated variants, and pm_ptr, removing the
ifdeffery in the process. This allows the compiler visibility into those
functions.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index b8a2aa60534c..427e6bc3a476 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2296,7 +2296,6 @@ static void ufs_mtk_remove(struct platform_device *pdev)
 	ufshcd_pltfrm_remove(pdev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ufs_mtk_system_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
@@ -2343,9 +2342,7 @@ static int ufs_mtk_system_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int ufs_mtk_runtime_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
@@ -2389,13 +2386,10 @@ static int ufs_mtk_runtime_resume(struct device *dev)
 
 	return ufshcd_runtime_resume(dev);
 }
-#endif
 
 static const struct dev_pm_ops ufs_mtk_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend,
-				ufs_mtk_system_resume)
-	SET_RUNTIME_PM_OPS(ufs_mtk_runtime_suspend,
-			   ufs_mtk_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend, ufs_mtk_system_resume)
+	RUNTIME_PM_OPS(ufs_mtk_runtime_suspend, ufs_mtk_runtime_resume, NULL)
 	.prepare	 = ufshcd_suspend_prepare,
 	.complete	 = ufshcd_resume_complete,
 };
@@ -2405,7 +2399,7 @@ static struct platform_driver ufs_mtk_pltform = {
 	.remove = ufs_mtk_remove,
 	.driver = {
 		.name   = "ufshcd-mtk",
-		.pm     = &ufs_mtk_pm_ops,
+		.pm     = pm_ptr(&ufs_mtk_pm_ops),
 		.of_match_table = ufs_mtk_of_match,
 	},
 };

-- 
2.51.1.dirty


