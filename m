Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFD1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JDF1cYk8KJMq5QXN4+dt/d9d/CbelJeNNkDmpICGFvY=; b=VYKOff7WRb0/df
	U2Z4LkHwqJOIlrhjdcy1Uy0RaryxTXRqrHAE1mKHmTxK5TRXqIlT0XfDL92FpzvCCwDHUTThh+MsW
	a4A1ZXYhCDOpx7wWRl+HlTq8yCOXnHTUOC8S08+x83HeTtdaQTtDBRlgu6PP+P1QgrjsCu38q5RXY
	GE+J1+T1RqYdHiGzLntnRukUm7tUIWM+MXHddlUwNGE/Hp2N/0BE0TBvXVLa/pzi0JXnWJrgr9cGm
	BxcTyLaqAonu9zJQL9N+bQtRxHGStLgaNlNUVEVPBwTqCSK/QFWT/L1d83krlcxMLec66tDOYeJzQ
	CGMED/PfyococLT4UZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nByAB-0039W8-Pr; Mon, 24 Jan 2022 12:09:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBy9z-0039ST-Ac; Mon, 24 Jan 2022 12:09:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 90FB01F42E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643026162;
 bh=aOuYPLM5L/mmuMP/xuJRrEHY6ka8AQ/+E0HBxwte4rk=;
 h=From:To:Cc:Subject:Date:From;
 b=UOSTw1zFcyrq8krivX1eQH6s3kCIy1msupv2GSjycaN5568uej4szCz8kk1Sgi+o2
 +1+FDKEjUhFUOGHySgTcntP4O1W0NlSHNfGOxKzbe1zmvZjH0rqomv+hFcNQYbzFyI
 zSsTn+oYkWBGIwXm/bBDK1laxNHsJS/GvgqE57DPF6SzGS4ZFeRVrTy5T/if6vIHch
 elcKf3nJoGvhFwpKfGwFrqxXAji7nWvfFP4+Y287AK6iW6MC/ZSoElO/lzIqdV0RxT
 YvKlm5ONN+3u0C2HKZuxXAtOgSfhCuoYbTG0kNGgiX/EiV7tXMebMWQQCzhbO1MjPt
 h2/xEgF2c9jPw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: bjorn.andersson@linaro.org
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/3] remoteproc: mtk_scp: Use devm variant of rproc_alloc()
Date: Mon, 24 Jan 2022 13:09:13 +0100
Message-Id: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_040923_542010_3A15E925 
X-CRM114-Status: GOOD (  11.81  )
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

To simplify the probe function, switch from using rproc_alloc() to
devm_rproc_alloc(); while at it, also put everything on a single line,
as it acceptably fits in 82 columns.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 36e48cf58ed6..95a40e3f11e3 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -756,11 +756,7 @@ static int scp_probe(struct platform_device *pdev)
 	char *fw_name = "scp.img";
 	int ret, i;
 
-	rproc = rproc_alloc(dev,
-			    np->name,
-			    &scp_ops,
-			    fw_name,
-			    sizeof(*scp));
+	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
 	if (!rproc) {
 		dev_err(dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
@@ -776,8 +772,7 @@ static int scp_probe(struct platform_device *pdev)
 	scp->sram_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR((__force void *)scp->sram_base)) {
 		dev_err(dev, "Failed to parse and map sram memory\n");
-		ret = PTR_ERR((__force void *)scp->sram_base);
-		goto free_rproc;
+		return PTR_ERR((__force void *)scp->sram_base);
 	}
 	scp->sram_size = resource_size(res);
 	scp->sram_phys = res->start;
@@ -789,7 +784,7 @@ static int scp_probe(struct platform_device *pdev)
 		ret = PTR_ERR((__force void *)scp->l1tcm_base);
 		if (ret != -EINVAL) {
 			dev_err(dev, "Failed to map l1tcm memory\n");
-			goto free_rproc;
+			return ret;
 		}
 	} else {
 		scp->l1tcm_size = resource_size(res);
@@ -851,8 +846,6 @@ static int scp_probe(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_destroy(&scp->ipi_desc[i].lock);
 	mutex_destroy(&scp->send_lock);
-free_rproc:
-	rproc_free(rproc);
 
 	return ret;
 }
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
