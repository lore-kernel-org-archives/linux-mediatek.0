Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A100C46467
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah6dyrT41r5BxS/Hb5ZCXo1J7cLNhawslXRMpW4jJyk=; b=4bmLfJvY8UM9hCgc22ly2nrFVy
	BUcOx+sXJovcQUjx/g2ad4cYYPwenkElWBf1n/IcyonOLSnac0OGWbT93G2k0yX7YGrQo+BGRK1ag
	DBUbGV3ZTeHdYdJtN2WiiTfZ4e4k4DKSR48IN8MMuU6ugssYc6FSqsuuqtzRxk9RmTxXu8cetmCf8
	ISBZAP8QmHFrl+mr+8t8AxSgO53Brv5K5+M56FCrzwcL5wMU3Vi2UPSOujsZt3/Xi9xLCB8oz8Jvs
	CPiOM0WgFb7/yW5pW+/fzH7Zk8HFCIb8BAtfeIKKhDeJEPGDQ0ZprKAOrI3ubOJEbReIBOLOz4rYm
	Y1Y3Xa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD3zb-009O9B-Ac; Wed, 04 Jan 2023 13:39:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2LB-008uZI-VY; Wed, 04 Jan 2023 11:53:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8DC066602D0F;
	Wed,  4 Jan 2023 11:53:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672833232;
	bh=2wlL/l4UVdjL1Sgoaf9FkMG8l//bAlIIYXjMNm/jsVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nG9YtxlCpjBCeQOKrMwEtYzNapyLY6ccOPHmL66vj0KAIBNw72cQvDIaARvyeFDaL
	 yYNo7gzc8J8hgzJX9qwqb/3CHf28jwOdr4e36SnO5d6gmSoiiSpDozdp6wlj+B90oM
	 mj37MP7AlorWVTwZLmQzYwRz/sfuAobepb9Sw8TPRTk8Ed6aLcPnDeoJphwmYQhhlU
	 cnbVpVFvFM76Hu/cy03ym3Bbh2qJjEIRtkrayygYRVtG2OJqEwzoYDLpslteYrzU9u
	 DJTQrLYpAO2s7LxbJ7AZowZj7cPJW6e96VS4e3/Mcox5bxnTkUzkHI61kBhWrceozk
	 Pr3ijnFVb6kYQ==
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
Subject: [PATCH 2/2] remoteproc/mtk_scp: Remove timeout variable from scp_ipi_send()
Date: Wed,  4 Jan 2023 12:53:41 +0100
Message-Id: <20230104115341.320951-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
References: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_035354_322218_15D3CB1C 
X-CRM114-Status: GOOD (  10.52  )
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

That variable was used twice, but now it's just used once to store
msecs_to_jiffies(wait), fed to wait_event_timeout(): we might as
well remove it for the sake of cleaning up.

This brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp_ipi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index af47504bdb61..fc55df649b40 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -160,7 +160,6 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
-	unsigned long timeout;
 	u32 val;
 	int ret;
 
@@ -197,10 +196,9 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 
 	if (wait) {
 		/* wait for SCP's ACK */
-		timeout = msecs_to_jiffies(wait);
 		ret = wait_event_timeout(scp->ack_wq,
 					 scp->ipi_id_ack[id],
-					 timeout);
+					 msecs_to_jiffies(wait));
 		scp->ipi_id_ack[id] = false;
 		if (WARN(!ret, "scp ipi %d ack time out !", id))
 			ret = -EIO;
-- 
2.39.0


