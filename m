Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D6CCCD194
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaeOXy3GseEWDTM4ceAIxH3L7a/+lu90s8ky36YmT7g=; b=l2LvF7nTypcNcBjmnwwdf9cFJo
	pzANB80BcAKApMYYJCOyG7cA/af9v33QUs3lQ6xap+IAMEZ/DRG5JUGWr0mOGORe09HDc60eqIDSa
	myOkbVsy4U8noNC9VXhy8w1oxjGc5ZDzelUMOrAuw+YBkxQVaSdnRuSqiDLctHccLqvUOd+AWmtiB
	5RErycElewFMDr/erPGgPqZimx0SoW6wMrFULZIHw5HZyexHs39UVJRkN51TLaMkh2NSrH2pRMJJj
	ptMAiQGZf5do+/dIl3tyU03lw/QgPpNLP0DiCHeXLsTzbUbtRBD9CvDT+jZP0WIIv3JXHSUUWeyGA
	DkNoZ85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqreH-00000007znM-362r;
	Wed, 18 Sep 2024 10:11:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrZz-00000007z8Y-2oZd;
	Wed, 18 Sep 2024 10:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726653993;
	bh=t5UwOBnTnD4LxneriXQ1Hkl0RZpJr4Pl9fU7M3V5eV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pyw1njRU3yIxpRTA0+Jfu1O7bNPLtAZUkMkoCQBEl4Yxk4dCLdBqcpd8UuKIadVMZ
	 OcDYO+tWL4TYx3sbF7e8lHFngrQeyOeOo8/JpOW02/a/x0AtKhS1rS/TeR7JhK+VsF
	 x2JB+VGc6FZHbi4Ca/FshfWLvaLU79RglUk79eIvwUb9DCgxz3HaOh/twydbky2dtm
	 GiRrqSM2CCgArwAEQgGzSjmzrlEUzqvysyid1AfK7BYl25cdqmDQXTKmPdeWn84ZOw
	 B9ng63M2osERNK+xF7J+crsglWhl9VeNMdDl/ICfJXEY/uOVZKPpu+dtda8lv924Jw
	 75ECfkYYy+lxQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 324A517E10B5;
	Wed, 18 Sep 2024 12:06:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/3] soc: mediatek: mtk-cmdq: Mark very unlikely branches as such
Date: Wed, 18 Sep 2024 12:06:19 +0200
Message-ID: <20240918100620.103536-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_030635_887277_1574913A 
X-CRM114-Status: GOOD (  11.66  )
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

Calling cmdq packet builders with an unsupported event number,
or without left/right operands (in the case of logic commands)
means that the caller (another driver) wants to perform an
unsupported operation, so this means that the caller must be
fixed instead.

Anyway, such checks are here for safety and, unless any driver
bug or any kind of misconfiguration is present, will always be
false so add a very unlikely hint for those.

Knowing that CPUs' branch predictors (and compilers, anyway) are
indeed smart about these cases, this is done mainly for human
readability purposes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 620c371fd1fc..4ffd1a35df87 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -336,7 +336,7 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
 	struct cmdq_instruction inst = { {0} };
 	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
 
-	if (event >= CMDQ_MAX_EVENT)
+	if (unlikely(event >= CMDQ_MAX_EVENT))
 		return -EINVAL;
 
 	inst.op = CMDQ_CODE_WFE;
@@ -351,7 +351,7 @@ int cmdq_pkt_acquire_event(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = {};
 
-	if (event >= CMDQ_MAX_EVENT)
+	if (unlikely(event >= CMDQ_MAX_EVENT))
 		return -EINVAL;
 
 	inst.op = CMDQ_CODE_WFE;
@@ -366,7 +366,7 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = { {0} };
 
-	if (event >= CMDQ_MAX_EVENT)
+	if (unlikely(event >= CMDQ_MAX_EVENT))
 		return -EINVAL;
 
 	inst.op = CMDQ_CODE_WFE;
@@ -381,7 +381,7 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = {};
 
-	if (event >= CMDQ_MAX_EVENT)
+	if (unlikely(event >= CMDQ_MAX_EVENT))
 		return -EINVAL;
 
 	inst.op = CMDQ_CODE_WFE;
@@ -476,7 +476,7 @@ int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 result_reg_idx,
 {
 	struct cmdq_instruction inst = { {0} };
 
-	if (!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX)
+	if (unlikely(!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX))
 		return -EINVAL;
 
 	inst.op = CMDQ_CODE_LOGIC;
-- 
2.46.0


