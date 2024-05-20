Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABD2C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RcYzOjaPKipzsvmoHwQYkRlQukVTxEJKs+45mK8t5qo=; b=03Y4f7Zyuw0tp+PskMpvJaZD4e
	P9j2hB1uiix3RRFzoDcZnGcKi9tvyNmq0x9doUmZFvaK+lSyturbdTUKXGXcLLz2IaHW3WAHJR3p2
	3hy49OwFMqVdxVbCQ6qL9UyHm+iyjTv0z5vvt23Fv+zXPIRSWtlpaELlV+cRTF1XidQyn+Era9IoW
	10tK82MQK9RbQuPBjOLeZ75Wp6yJcPoZQIH3+Op6mQOorvGVN4qTqwuumMzss9SFFeacBBIBrrsyY
	QihDbnJ9g08/oqQvsuHVtNErgqbiG4XaFvB3dbMXxpXY3/X1aZeXgq6ASg3qTAk/LtvXjxzGvxXpa
	1rFG4AWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91Az-0000000EHEi-3CmL;
	Mon, 20 May 2024 11:27:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91Av-0000000EHE1-3o4M;
	Mon, 20 May 2024 11:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716204447;
	bh=TugNqe9PlBp1NJ5MSXmFZQM1MVvwZOYkkhks49lJzMo=;
	h=From:To:Cc:Subject:Date:From;
	b=nr8DTS66gLZaW4X+w+Uv/tuKcFUStU+GvdhLQPuJsWF6N2J/AeLKzJlaCrbdHeHPV
	 wF5qZXK6qH+0otnO0KZePovIQZ5wUUgttPqRj2H6m8VwcZ1YM8LS4q9WOzzEynsqP2
	 UGGc5ix3SAGst/HSwDWh42aF/JikrXPbYVYLP4h08H4mZC56+mjjvjg2kIOvRI2d86
	 MgcnZoUoZqoaQZOTFxaGXyP8IGMFjEl/KMqob1R81lGCyqGv6cDieiANg5HB1rL4ti
	 /jFfJJ8P5zLGngFoaKGvNEVS/TjoPC0OpL5vzOzwnezaKC7cr81KjZevPwqUQXUDb5
	 F/raaUKoD42vg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D88DD3780BFE;
	Mon, 20 May 2024 11:27:26 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] remoteproc: mediatek: Zero out only remaining bytes of IPI buffer
Date: Mon, 20 May 2024 13:27:24 +0200
Message-ID: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_042730_259478_46F25793 
X-CRM114-Status: UNSURE (   9.27  )
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

In scp_ipi_handler(), instead of zeroing out the entire shared
buffer, which may be as large as 600 bytes, overwrite it with the
received data, then zero out only the remaining bytes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e5214d43181e..dc70cf7db44d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -117,8 +117,8 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 		return;
 	}
 
-	memset(scp->share_buf, 0, scp_sizes->ipi_share_buffer_size);
 	memcpy_fromio(scp->share_buf, &rcv_obj->share_buf, len);
+	memset(&scp->share_buf[len], 0, scp_sizes->ipi_share_buffer_size - len);
 	handler(scp->share_buf, len, ipi_desc[id].priv);
 	scp_ipi_unlock(scp, id);
 
-- 
2.45.1


