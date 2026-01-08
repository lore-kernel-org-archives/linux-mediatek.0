Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4E7D185C8
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMwNSkM5XSH2k8a3Oq36FB58kMKzIsImX1FaHSGQhBs=; b=oKLIIf+1FP0ymeNbaRW9aVkzQ+
	HpMX6kvK7e3B3ZsgvX+wgKaEkHN4B7jIBUryo0kpfUM6SH3GuYZm8cmEdQaTj7s4Lk/mk1CSVXstA
	TE9oFx2R8Os/sgKSOao5GVwn66BeiISxmi9ae3lr3X3AK5C4KT4VJHLpkE8gFpPqkt+ePBeaMjYKm
	a+XsOLYL4bDMUIkVMma0U7HhNopsxpmv2jRCk0FUKGCNtXLVuqsp9HF94lv7L43BO6ZT55iIwAhET
	ZHApMjYGCBTTkEyWB6dXm/QU9Uj6LYyj3iQN+bXAarkrGhv84rAeiQOdwqb3G0p6uACMzb7YG04Xg
	USMOkjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncK-0000000GhqD-0wSu;
	Thu, 08 Jan 2026 10:51:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnc5-0000000GhR6-2bux;
	Thu, 08 Jan 2026 10:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767869481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HiV3nOJbOSyePZPF2aan+Y3WdRmtWJncRFz4/hdjovhOJTMNj4TQ2fq3JEwWOsIC+hwMFOxVrGxrr4X2g4+KW6GPodKwB08aLJc7Na+1Ozy9xknWW4LzLKZDnUzx+0zV/TslU27MOrHLABEB+L7ZTgmq7WqC3kmK3nnizFJ0oHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767869481; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QMwNSkM5XSH2k8a3Oq36FB58kMKzIsImX1FaHSGQhBs=; 
	b=NFIrzRxeyER08dnFudF9BU7FizaRiU7FM3s7Bhy20CTlzrZzTLyNDZX1Cc3JWzVAg8JJqB3djxgSKjDmCjqbmRImcudiVqyiM/reu2RrZPlCLPvfxACUuU4Tc2VsZSJGo3eMR6PV79LuaZZjRHWR5OV2MaaPAFH3OVsn9iXMneg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767869481;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QMwNSkM5XSH2k8a3Oq36FB58kMKzIsImX1FaHSGQhBs=;
	b=ZKIYKlwGrGW1in365Z3vvayzCyHcVDGzLouN1wz2Az0Tw8nTsifo1lqnrwZ3nrKO
	BaOQfi08PmqwZSbpf4HoVuFTuPinUII2vqrLAAcvvsE8lPWMPT1tDhK6nJkYuh85cC/
	GB69iijIu5r9bnAZiS65xCHCDO5Z9lQlNJmGmHWk=
Received: by mx.zohomail.com with SMTPS id 1767869479482350.55806833022723;
	Thu, 8 Jan 2026 02:51:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 08 Jan 2026 11:49:33 +0100
Subject: [PATCH v5 14/24] scsi: ufs: mediatek: Switch to newer PM ops
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mt8196-ufs-v5-14-49215157ec41@collabora.com>
References: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
In-Reply-To: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
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
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025133_791909_2FC8C2B4 
X-CRM114-Status: GOOD (  12.72  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 3250c27cb91f..230e11533eac 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2325,7 +2325,6 @@ static void ufs_mtk_remove(struct platform_device *pdev)
 	ufshcd_pltfrm_remove(pdev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ufs_mtk_system_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
@@ -2372,9 +2371,7 @@ static int ufs_mtk_system_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int ufs_mtk_runtime_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
@@ -2418,13 +2415,10 @@ static int ufs_mtk_runtime_resume(struct device *dev)
 
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
@@ -2434,7 +2428,7 @@ static struct platform_driver ufs_mtk_pltform = {
 	.remove = ufs_mtk_remove,
 	.driver = {
 		.name   = "ufshcd-mtk",
-		.pm     = &ufs_mtk_pm_ops,
+		.pm     = pm_ptr(&ufs_mtk_pm_ops),
 		.of_match_table = ufs_mtk_of_match,
 	},
 };

-- 
2.52.0


