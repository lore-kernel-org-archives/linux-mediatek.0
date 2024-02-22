Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5D6C54788
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eIuDrb97tVunrO7xcRol8+vKXsVHalaYdUrzl+TA84=; b=K1jWJsrDaElqFEKkqmeBEJ8d0n
	8U5rx1wytw8cwTR/IoUieWCj2Iy/m+W94B8/vhEYKY9zkOdZrX/Oa68eZ2CIPwKA94iHe3THYPqNX
	dG/Tj1k8zpr3DlYL6cRzgE5mk9Fz2+8a9AHgoGIn1LZ9ql4tB3C0P6desEwYoeXmnkCdIY7om4879
	dwt/82/61AdJ/5HrWtzTOOBPxqKZe2oKytNyqhxQ36Y6HR841l4M5m0TDjjS4DR1bVihz5uF/xyQy
	EgVQhWdZW/lVGmxZOtkMws4OsN2rLMY1qBK3AuCGpCM02XCd9GGVzjmlR0/PZOq6RhAqPNnpm1/V0
	nL6LkX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBCa-00000005RU5-468h;
	Thu, 22 Feb 2024 15:41:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBCX-00000005RQq-3yri;
	Thu, 22 Feb 2024 15:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6574618EA;
	Thu, 22 Feb 2024 15:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB80C43390;
	Thu, 22 Feb 2024 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616492;
	bh=xCIGBwYX6XIyecIkEgq00nSGxn+xtBAV0Xn4DI4lFRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJHhs7lbcCFk6UhjYW0wfrz8wcaLvrooR3gSmQxaayS7Sh4/AjqZeRw3hBjMXCEvL
	 1VzZxJIhdEXWO2U3HCUkWX4Eqq3Ao6MkESVptlhbSp1xaao6k6jbMQqq7x7q3YQAk/
	 T3JMH2d47sIiA/cjr4RcPUiw8u7MWM19rC/DqOet+LpAmb0443YJsoYOzpdSJl28aX
	 GmUV8fLYij3E8YVd76XEa0xITi/eND1F23dNO7hol5Cfy598RficTVlU5nx+Bf8/R7
	 MeVQqHDOZENPkIAr8Lh9DraCSOP6JtZPf6iKlel0mtsAyzMECXuV2UES7u4KcpqEDZ
	 p1EfRNUwaDA/g==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 01/12] soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
Date: Thu, 22 Feb 2024 15:41:09 +0000
Message-Id: <20240222154120.16959-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074134_122152_47CEA8BD 
X-CRM114-Status: GOOD (  10.77  )
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

For cmdq jump command, offset 0 means relative jump and offset 1
means absolute jump. cmdq_pkt_jump() is absolute jump, so fix the
typo of CMDQ_JUMP_RELATIVE in cmdq_pkt_jump().

Fixes: 946f1792d3d7 ("soc: mediatek: cmdq: add jump function")
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..0b2e5690dacf 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -14,7 +14,8 @@
 #define CMDQ_POLL_ENABLE_MASK	BIT(0)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
 #define CMDQ_REG_TYPE		1
-#define CMDQ_JUMP_RELATIVE	1
+#define CMDQ_JUMP_RELATIVE	0
+#define CMDQ_JUMP_ABSOLUTE	1
 
 struct cmdq_instruction {
 	union {
@@ -397,7 +398,7 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
 	struct cmdq_instruction inst = {};
 
 	inst.op = CMDQ_CODE_JUMP;
-	inst.offset = CMDQ_JUMP_RELATIVE;
+	inst.offset = CMDQ_JUMP_ABSOLUTE;
 	inst.value = addr >>
 		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
 	return cmdq_pkt_append_command(pkt, inst);
-- 
2.34.1


