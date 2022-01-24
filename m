Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ECDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 12:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bX7AKG+RAvsZqMmn+w2jnNugne1HVz7icTucNtaYLx0=; b=FDM1pq/3/Vri4L
	trzI0LoGi8+ZBwr+1BM6U2Bnxb4C1AOhHf6/QGBO/FvnESTxIS+73im++Jk9Bn3C/POsZzAOrAvMu
	7vqRiYiN92x+EOm4L2IFcaTULHj9YvdDzrLB1uFO+KRb21Q3xIqd20g8i+JBhIx7FiX5kXCiXxWTI
	vAocjtIUH0XEvgOun2r4R/wROfCZ8yl5p0hWynQ+3uWB9o9yb9emXT1rJZWwLxInt3q3S8LSONSoF
	4p/SzGwn0QgUPD/EF8Qpt66SL5exBRUpPXUw8hJxPu/LW5ayTX0WPQX19oyECWFhZjwJP6n6ul3c7
	wxEaI+Mk2+q9FDHttWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nByAP-0039aO-QV; Mon, 24 Jan 2022 12:09:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nByA1-0039Sx-US; Mon, 24 Jan 2022 12:09:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4B1071F42E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643026164;
 bh=Bg+voHqmmOa1mdX+12mwmf2wNJLVsjZM+19lKzpTkcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c+2N6lH9qF/w/anJtg8Giee1yOCXlKi1VxuhWnXU3qdvAImKTJAiNaU9QCRfRr6Ep
 SxMmG5QzEiME07L+9dLsHaxas1cGROkj86ISJHDZlyGvi/AD/SRUErKbT9JYepCI4C
 8DoIabibPjV3LEJD/shtoULNFUXJbhb4m9/m7GWd5HW3dR+2Yl61OZPHFY4lyo2R3/
 nPQ0RD0yAbaKbRGktPh0VmgMLeb4ereE4gN0z2Sww+/8VPeG4JdtewGu32vEbHK1QG
 R9+pbI5qv4a473QtPgw13ovrRZBDPhoGllsQPuVQRMJnRGmXnb15Ni+oXcs7tbUkEn
 i9lFYfjDo8XsA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: bjorn.andersson@linaro.org
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] remoteproc: mtk_scp: Reorder scp_probe() sequence
Date: Mon, 24 Jan 2022 13:09:14 +0100
Message-Id: <20220124120915.41292-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
References: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_040926_161567_D490B378 
X-CRM114-Status: GOOD (  13.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cleanup the scp_probe() function by reordering some calls in this
function, useful to reduce the usage of goto(s), and preparing
for one more usage of dev_err_probe().

In particular, we can get the clocks before mapping the memory region,
and move the mutexes initialization right before registering the ipi
handler (which is the first mutex user in this driver).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 95a40e3f11e3..e40706b0e015 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -791,24 +791,23 @@ static int scp_probe(struct platform_device *pdev)
 		scp->l1tcm_phys = res->start;
 	}
 
-	mutex_init(&scp->send_lock);
-	for (i = 0; i < SCP_IPI_MAX; i++)
-		mutex_init(&scp->ipi_desc[i].lock);
-
 	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
 	if (IS_ERR((__force void *)scp->reg_base)) {
 		dev_err(dev, "Failed to parse and map cfg memory\n");
-		ret = PTR_ERR((__force void *)scp->reg_base);
-		goto destroy_mutex;
+		return PTR_ERR((__force void *)scp->reg_base);
 	}
 
-	ret = scp_map_memory_region(scp);
+	ret = scp->data->scp_clk_get(scp);
 	if (ret)
-		goto destroy_mutex;
+		return ret;
 
-	ret = scp->data->scp_clk_get(scp);
+	ret = scp_map_memory_region(scp);
 	if (ret)
-		goto release_dev_mem;
+		return ret;
+
+	mutex_init(&scp->send_lock);
+	for (i = 0; i < SCP_IPI_MAX; i++)
+		mutex_init(&scp->ipi_desc[i].lock);
 
 	/* register SCP initialization IPI */
 	ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
@@ -842,7 +841,6 @@ static int scp_probe(struct platform_device *pdev)
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 release_dev_mem:
 	scp_unmap_memory_region(scp);
-destroy_mutex:
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_destroy(&scp->ipi_desc[i].lock);
 	mutex_destroy(&scp->send_lock);
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
