Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD21FC54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddqYUChVCWVYq1Iy43zQymIAj2h/oUbeJaD3Fbheqxs=; b=qn2kU2X50Zzr6YAe7NuCrAS1XW
	E3CNro8jHsJfkiKz1CRTFDvvr3HK8MeOaY5mcJ0Tet/pbDInGglkXAAlSK6HadLS1GyY4fcgfH+SL
	icpjMTu4uIRUT9CPdQcdW6RumNg+24UBnbsuHoaDSNpoM5bKlGwtCpEXsGTIjl+eHlCaq1BQT0Mp8
	KGCyf3Gs71oOV7GoI4PxC+haKEht9YeFLp5CQsZHfrJmZxIKpFbE3in2CJS5mgk5BgcNMev5rrkJw
	Mt9qy3TTKRSIilD7EsjUoMvjj+7D/haufp82quhssonYxSjmwA3c+TviyewsW35keKBwwdm47wtu+
	yFim99vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4N-00000002N4x-1WmB;
	Thu, 21 Mar 2024 08:46:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4H-00000002N1h-3UjL;
	Thu, 21 Mar 2024 08:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711010792;
	bh=NqcCQoYTi7w39yHeqdyYgH/AKTtHB2Xu9qukGQne7yA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1fp7acZmBXCpRsY5BNXvVpvO/H+tZY7F6WB7B0Qay39vTKhh+BKJF42sh6kdvM8aE
	 F913/i597FGqp+xvQvdVzofeVzjSbaAD4PP9kokEPNlGsWgYNX6oz0117rxvXMVZEY
	 LV/bUVKfAavpu+/JbLjWUM8ftpCGKYDXvxwddipwPA+r+NUvabFVgiHlQowucYj9Rh
	 lEbMZ+A53zFJW7skNmG5nFKMqVwvW5oeCyeftgV5lL8BkedpG1B8dl1dl1JEhboy/z
	 m1HY1blLw+mw7PhAuz25pFgj9j0NnjP4Exx8VrBAMDHTNkeG/OYNjxhQ0bMyw/WqrS
	 Co0oCbYYS2axw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A31E137820EF;
	Thu, 21 Mar 2024 08:46:31 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tzungbi@kernel.org,
	tinghan.shen@mediatek.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH 1/2] remoteproc: mediatek: Make sure IPI buffer fits in L2TCM
Date: Thu, 21 Mar 2024 09:46:13 +0100
Message-ID: <20240321084614.45253-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_014634_033394_32237C17 
X-CRM114-Status: GOOD (  15.66  )
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

The IPI buffer location is read from the firmware that we load to the
System Companion Processor, and it's not granted that both the SRAM
(L2TCM) size that is defined in the devicetree node is large enough
for that, and while this is especially true for multi-core SCP, it's
still useful to check on single-core variants as well.

Failing to perform this check may make this driver perform R/W
oeprations out of the L2TCM boundary, resulting (at best) in a
kernel panic.

To fix that, check that the IPI buffer fits, otherwise return a
failure and refuse to boot the relevant SCP core (or the SCP at
all, if this is single core).

Fixes: 3efa0ea743b7 ("remoteproc/mediatek: read IPI buffer offset from FW")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index a35409eda0cf..67518291a8ad 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -132,7 +132,7 @@ static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
 static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
 {
 	int ret;
-	size_t offset;
+	size_t buf_sz, offset;
 
 	/* read the ipi buf addr from FW itself first */
 	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
@@ -144,6 +144,14 @@ static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
 	}
 	dev_info(scp->dev, "IPI buf addr %#010zx\n", offset);
 
+	/* Make sure IPI buffer fits in the L2TCM range assigned to this core */
+	buf_sz = sizeof(*scp->recv_buf) + sizeof(*scp->send_buf);
+
+	if (scp->sram_size < buf_sz + offset) {
+		dev_err(scp->dev, "IPI buffer does not fit in SRAM.\n");
+		return -EOVERFLOW;
+	}
+
 	scp->recv_buf = (struct mtk_share_obj __iomem *)
 			(scp->sram_base + offset);
 	scp->send_buf = (struct mtk_share_obj __iomem *)
-- 
2.44.0


