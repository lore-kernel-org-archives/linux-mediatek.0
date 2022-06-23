Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5259C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 13:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WNf30pWmomVijQS487Jkw5NSj+2vHNyDaCao+8QVliQ=; b=g7ky7vH3XKyfHAc0E9yOFpyhh7
	/P02mHDN2iKq/MD1i6kD5gQxTLpo6T07r1ecm0G0kV4R8TbI85la+bXW7SM5WAGj45tTVepSgMp5m
	+oAFF3VxbBYNtn8jRVuAnr+RRwwezcznkxRh4MRkQoqv6qPJRA2sXZOAdAiPrnZrpcr3KFPXua3KC
	h7GNGAII+kLnb5qHbOsIDkCpz5ltV0AMq/QrzqzotqdBBynmLe+/k9rd+GvQwa7axuMvAiXEZeewi
	U+O3w/s7R3+HBcDjxTM6whv83WM/dHsutYg4NTwIfjp3D5FBOoT4y46PGlXRTda75vJuaxWZVAzui
	5SpD3AYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4NJa-00FR4w-PN; Thu, 23 Jun 2022 13:56:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4NJP-00FR1Q-3m; Thu, 23 Jun 2022 13:56:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E0E366016F0;
	Thu, 23 Jun 2022 14:55:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655992553;
	bh=5sW6BimoFPL/i1s52PKt0YiCTWn44ik1RGWDhHeRQB8=;
	h=From:To:Cc:Subject:Date:From;
	b=GTpfEeIXrd13paiafv+YQrIByKTXvEY8Kobd/ORfWfGqYDriEyp7pXCDWz50aDhgZ
	 TibaaQhb+61Y8I3n8ArhBomHaS19myHn6oBFMKy1fo+9c+Q3G6vvJSv/Z7h2w7mZQw
	 +a8LmC6RiJYmFasz2ExpGsgYF5SbQb28iMa3LU77J6IvkIOR9Hxo8J3GDYQENC1OOQ
	 SgHfMYpI6EecpMdjC5tK3HqZJwvmHBcj9LAN5NBVsNpeMsi8pgt//y07L6uVeHQNii
	 M2E/bZO3odjkn1upiIo9ASYmLtzjxSLm6FGMApfqmtepna0AL962LvJdzAZoUgjXjI
	 I8lc8ThwNgOiA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: minghsiu.tsai@mediatek.com
Cc: houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	hans.verkuil@cisco.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	acourbot@chromium.org,
	irui.wang@mediatek.com,
	yunfei.dong@mediatek.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment
Date: Thu, 23 Jun 2022 15:55:46 +0200
Message-Id: <20220623135546.121344-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_065559_309365_22F09165 
X-CRM114-Status: UNSURE (   8.48  )
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

The mdp_ipi_comm structure defines a command that is either
PROCESS (start processing) or DEINIT (destroy instance); we
are using this one to send PROCESS or DEINIT commands from Linux
to an MDP instance through a VPU write but, while the first wants
us to stay 4-bytes aligned, the VPU instead requires an 8-bytes
data alignment.

Keeping in mind that these commands are executed immediately
after sending them (hence not chained with others before the
VPU/MDP "actually" start executing), it is fine to simply add
a padding of 4 bytes to this structure: this keeps the same
performance as before, as we're still stack-allocating it,
while avoiding hackery inside of mtk-vpu to ensure alignment
bringing a definitely bigger performance impact.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
Reviewed-by: Irui Wang <irui.wang@mediatek.com>
---

Changes in v2: Rebased on next-20220623

 drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
index 2cb8cecb3077..b810c96695c8 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
@@ -40,12 +40,14 @@ struct mdp_ipi_init {
  * @ipi_id        : IPI_MDP
  * @ap_inst       : AP mtk_mdp_vpu address
  * @vpu_inst_addr : VPU MDP instance address
+ * @padding       : Alignment padding
  */
 struct mdp_ipi_comm {
 	uint32_t msg_id;
 	uint32_t ipi_id;
 	uint64_t ap_inst;
 	uint32_t vpu_inst_addr;
+	uint32_t padding;
 };
 
 /**
-- 
2.35.1


