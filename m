Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EF5C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9ZGJ7Jp9oQ22M78uPvC1nEDZDYsnt+58xOGIQtTnt4=; b=T3PYrYtShQ5jTQaTdX2jM0BtLY
	eHHxx1/TTLHR93P1AqPNXJ2BEyqlLNJs0UeZtcV7qjYXqfJqV7WpCQmByPCnwCb0BPnhkAVwjX4Sp
	FCBhAwbSEAciMQUPRxRNU5AOgaMADxT1AhNQrfWkYh5LrVKfCJn7rznVjReW0flBMaQJjBPSneaOY
	gBqTrANRk1gIOFNlk8KDzKV6DYJkSawe8ktP5I3s46ZKGCi6Dy7RNCNb4qOu7A/C2LHi/6gQOaDwn
	q6H/ZAaPEM535I6OdvJceq8frVq6ARXAAtvKbuo83QJueSlbDvc00QP0V5xg1aT9aXm5mlfyYk/dd
	gbT5sPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD3zZ-009O7f-Jo; Wed, 04 Jan 2023 13:39:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2LB-008uZB-VY; Wed, 04 Jan 2023 11:53:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E60EA6602D0D;
	Wed,  4 Jan 2023 11:53:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672833231;
	bh=vP3IAcg06zI74g3paG4cXxNW+LMkpVI/HPlq08rPNm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SlFYipZI9wBvadHJlDs3O0ADsIrxmlpLkBnGKw5RNDS8To3+QNFhXvVLwrWABIR4E
	 MNxpDL2tnCDB8QDv6uKbanD2jxChPdL+MBFLJ7kk8I1Z1GofdwrXR0GrZrMQ2Pxva/
	 kIfBvnVSFETVHM9NBpM70al6Dfs3TBtFeLIMVNU4mbAw+KpYyTmaI/xa5s5MYDF18f
	 yJnd7HxEmEzY81mx8f9xapa1hin+HhoKnBeqw5rj41F8Jl+WyfrtSHcDWe/8NpmDRz
	 aQQyQySLuaHcdbvEmANhyie7SKkl7NEM9qcIL33jiPcS0gSCHJcexyeQNc6He4164N
	 O4jlIWuoFMm1w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] remoteproc/mtk_scp: Use readl_poll_timeout_atomic() for polling
Date: Wed,  4 Jan 2023 12:53:40 +0100
Message-Id: <20230104115341.320951-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
References: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_035354_281140_D443AEEC 
X-CRM114-Status: GOOD (  12.29  )
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

Convert the usage of an open-coded custom tight poll while loop
with the provided readl_poll_timeout_atomic() macro.

This cleanup brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp_ipi.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 4c0d121c2f54..af47504bdb61 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -6,13 +6,17 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/time64.h>
 #include <linux/remoteproc/mtk_scp.h>
 
 #include "mtk_common.h"
 
+#define SCP_TIMEOUT_US		(2000 * USEC_PER_MSEC)
+
 /**
  * scp_ipi_register() - register an ipi function
  *
@@ -157,6 +161,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
 	unsigned long timeout;
+	u32 val;
 	int ret;
 
 	if (WARN_ON(id <= SCP_IPI_INIT) || WARN_ON(id >= SCP_IPI_MAX) ||
@@ -173,14 +178,12 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 	mutex_lock(&scp->send_lock);
 
 	 /* Wait until SCP receives the last command */
-	timeout = jiffies + msecs_to_jiffies(2000);
-	do {
-		if (time_after(jiffies, timeout)) {
-			dev_err(scp->dev, "%s: IPI timeout!\n", __func__);
-			ret = -ETIMEDOUT;
-			goto unlock_mutex;
-		}
-	} while (readl(scp->reg_base + scp->data->host_to_scp_reg));
+	ret = readl_poll_timeout_atomic(scp->reg_base + scp->data->host_to_scp_reg,
+					val, !val, 0, SCP_TIMEOUT_US);
+	if (ret) {
+		dev_err(scp->dev, "%s: IPI timeout!\n", __func__);
+		goto unlock_mutex;
+	}
 
 	scp_memcpy_aligned(send_obj->share_buf, buf, len);
 
-- 
2.39.0


