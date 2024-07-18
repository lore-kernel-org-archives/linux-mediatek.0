Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FFEC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hX+sJ6Cuoseq0VT/Py12bGxNxdMjC7tpz7Ro5/OmIgE=; b=vxgnpANrOCPexM4bMA5meUYWU7
	Z3GjunjT0esAe4saxfTK+8CqTelrEKfuuVzQvuWSt9WYzRUcJnXjm2mKA6dxvAGPvU04+jiD2S0dw
	XQKmwS97UR6W3wYaFzZp5RpdiyCAVtHkN2dQl2W1v/NEPdWcHnaWS2iRAwGWeuGdxhZuCIhzWOykR
	swwJh/jqD1sHqS9cggiCiiXSyQXwc+SLD4qtLge9R8ll2D+GHuY61iXVVCR71WGn4cjbQ38MDghck
	LqtzaWCykvKlW/QaKIDYSKwOldVVr/BgHZ9QQn3LcLsEFmCj/YHa4LudX/Ka0CLds1sYgiVxrWDKx
	lOb2PuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURx3-0000000HFaE-09xx;
	Thu, 18 Jul 2024 14:17:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURwf-0000000HFSh-2Nc7;
	Thu, 18 Jul 2024 14:17:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3BB8ECE1A1F;
	Thu, 18 Jul 2024 14:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4793C116B1;
	Thu, 18 Jul 2024 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721312236;
	bh=qmkoa0q0oGuCyfhSBDWWBuYmpol2ziAXepxaf+jmjtY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TvKxonYnaj4ZIwx7EAavZYsO0RWwzPMZoBtSAeX5qC7eI5QFPeGeCcbski0sIJvBR
	 Lw5U4H0aciwwsSKfR7CUaq6CYB5S2MRfMnwTP3u53xEHVxlS7M0xzuGigv6777rcGk
	 5YKdMT+HSZTcMZuPGqPfgv6sD2wYyeYd5FPgGgClmahhUGYMjXBzQgbxHfNfpoYbRQ
	 hX3HTtwG15rFArWo9BGTfzxyDSes9zo7/jjdPqgu6315kw49E02quD37vUAQMp8PyH
	 ab9cxpRpZmC9RUHsDdmfKRl089oOz3+7MDX6y5jxluOXlkgS2SuVh5b9PYzIhsjMR6
	 O/VXm94YvMQfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925FDC3DA49;
	Thu, 18 Jul 2024 14:17:16 +0000 (UTC)
From: "Jason-JH.Lin via B4 Relay" <devnull+jason-jh.lin.mediatek.com@kernel.org>
Date: Thu, 18 Jul 2024 22:17:04 +0800
Subject: [PATCH v3] mailbox: mtk-cmdq: Move devm_mbox_controller_register()
 after devm_pm_runtime_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-mtk-cmdq-fixup-v3-1-e3cbb75bb950@mediatek.com>
X-B4-Tracking: v=1; b=H4sIAN8jmWYC/23O3w6CIBgF8FdxXIfjj6B21Xu0LhAx0QADYzXnu
 4d20da6POfb+e1bQFBeqwCO2QK8ijpoZ1OghwzIXtirgrpNGRBEClTiCpp5hNK0d9jp52OCBaJ
 lzRlSNW9AGk1epcMOni8p9zrMzr92P+Kt/VAcU8wQJzwnjFQIYjiI4Cwc+vym7cmoVotZjbl0B
 mxOJN/tnzciSULHm4ZKxIjg6EdY1/UNa5RY+esAAAA=
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721312235; l=3031;
 i=jason-jh.lin@mediatek.com; s=20240718; h=from:subject:message-id;
 bh=OFADgvXE3QyzUSfck3fA9qrQhD5Lvasr7wyTfx6OG4A=;
 b=6FSYmXDRSQheDTXmSlRWEShpwc9Bzr17pepSJ9sUgZUmdH6S4CdDDAapAQq9YQeCzDzg91/vl
 qcs9jRp7ZPRDbuscIGzljw/fUMu+iB9GNXBvlBZCS3ZsYEPYuO6ndc8
X-Developer-Key: i=jason-jh.lin@mediatek.com; a=ed25519;
 pk=7Hn+BnFBlPrluT5ks5tKVWb3f7O/bMBs6qEemVJwqOo=
X-Endpoint-Received: by B4 Relay for jason-jh.lin@mediatek.com/20240718
 with auth_id=187
X-Original-From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_071722_008694_AFE21A0F 
X-CRM114-Status: GOOD (  13.13  )
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
Reply-To: jason-jh.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

When mtk-cmdq unbinds, a WARN_ON message with condition
pm_runtime_get_sync() < 0 occurs.

According to the call tracei below:
  cmdq_mbox_shutdown
  mbox_free_channel
  mbox_controller_unregister
  __devm_mbox_controller_unregister
  ...

The root cause can be deduced to be calling pm_runtime_get_sync() after
calling pm_runtime_disable() as observed below:
1. CMDQ driver uses devm_mbox_controller_register() in cmdq_probe()
   to bind the cmdq device to the mbox_controller, so
   devm_mbox_controller_unregister() will automatically unregister
   the device bound to the mailbox controller when the device-managed
   resource is removed. That means devm_mbox_controller_unregister()
   and cmdq_mbox_shoutdown() will be called after cmdq_remove().
2. CMDQ driver also uses devm_pm_runtime_enable() in cmdq_probe() after
   devm_mbox_controller_register(), so that devm_pm_runtime_disable()
   will be called after cmdq_remove(), but before
   devm_mbox_controller_unregister().

To fix this problem, cmdq_probe() needs to move
devm_mbox_controller_register() after devm_pm_runtime_enable() to make
devm_pm_runtime_disable() be called after
devm_mbox_controller_unregister().

Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
Changes in v3:
- Remove redundant message in b4 cover letter.
- Remove the change of cmdq_remove() in v1
- Link to v2: https://lore.kernel.org/r/20240718-mtk-cmdq-fixup-v2-1-f6bb3c052a60@mediatek.com

Changes in v2:
- Change to move the calling sequence of devm_mbox_controller_register()
  and devm_pm_runtime_enable().
- Link to v1: https://lore.kernel.org/r/20240613150626.25280-1-jason-jh.lin@mediatek.com
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index f1dfce9e27f5..4bff73532085 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -689,12 +689,6 @@ static int cmdq_probe(struct platform_device *pdev)
 		cmdq->mbox.chans[i].con_priv = (void *)&cmdq->thread[i];
 	}
 
-	err = devm_mbox_controller_register(dev, &cmdq->mbox);
-	if (err < 0) {
-		dev_err(dev, "failed to register mailbox: %d\n", err);
-		return err;
-	}
-
 	platform_set_drvdata(pdev, cmdq);
 
 	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
@@ -722,6 +716,12 @@ static int cmdq_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(dev, CMDQ_MBOX_AUTOSUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
 
+	err = devm_mbox_controller_register(dev, &cmdq->mbox);
+	if (err < 0) {
+		dev_err(dev, "failed to register mailbox: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 

---
base-commit: 797012914d2d031430268fe512af0ccd7d8e46ef
change-id: 20240718-mtk-cmdq-fixup-40379650e96b

Best regards,
-- 
Jason-JH.Lin <jason-jh.lin@mediatek.com>



