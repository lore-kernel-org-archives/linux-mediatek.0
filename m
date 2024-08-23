Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50217C5321D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bghG0Z8WKTUpCr2IR0n/BuI53Cd5ntTMy8ZyoEuZYcs=; b=lKoc5s5opWQ7n8auhQ3RFcesbp
	NTKsWSNZlor0TFdyBMZF0XjeCHNd8BdEbC3rj85UnArSy/a9yC4j7HOSwYI0vaKomrxd7PMn9obTi
	cPekkOs2mSfcHyryQBL2fQkyX3RkSvgkGvEvOegjW3jEy4CEUcSWl1C52a2GGI0q1uyLFHue8YyJJ
	RIto0OC/JT1tWEdtCrqjAQuUUe4O+q5HFLR+m+ZJqrjLxvk5KRTYyK9loL22H3W4R0H5NT+ElQSPq
	PxctyFfpq5TfbEKqMeWURgTo1H9BJa1zx44jylF21N7OBPvWWajJGiEnDa1f0/5JE6P4c2dglkdZI
	/kRxcivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbsw-00000000ij1-4BKe;
	Fri, 23 Aug 2024 21:31:55 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbsr-00000000iea-1pU2;
	Fri, 23 Aug 2024 21:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724448703; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DDQQRYhhiCJGa3UUoM7LJWgJ8tuzXpfaQnsXeBG8Uo733fPrsYIqg5Qp0MDIqENVlDpR/oKD4W4J6A+FrYLKNYo/fneHg9ic6NanxqEI85YG1nf5r9lxz8DMDgkffDaAZMNm2QDnVxuCy9ZERpcGfuPjLClOrlg1qtjFLDig/VA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448703; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bghG0Z8WKTUpCr2IR0n/BuI53Cd5ntTMy8ZyoEuZYcs=; 
	b=kE9VEII0s0o3G0t3sERmqizCAR6ToobopklZb/SZ/rJHBqrXzcaSpmox0BPUiIuFCRHeLFG+EOrLbWSyzZQW6AN9mZP+TfuV2Sh7cVopBrqwxicsRFlTQgTjQ05x2xsyj3ee6zOQjqODTP/5nt+J+SoyVm3OT2l2bVmzqnikL0k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448703;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bghG0Z8WKTUpCr2IR0n/BuI53Cd5ntTMy8ZyoEuZYcs=;
	b=Ga1rBetlEZVoSEzxsmjSO/OCtfcBeNwUjffIADkql65TyuOw9pAMusOzD7i+ySLj
	wGAw/FevS8+1dIJW99ffXbDJE6VzDyr14hEl66caZcyJ83/U43DlHwg0kLVNxsn8tS7
	Tng6Xpd/++YodL0tA0rgN1QC5D2a16SI5SPzPlC0=
Received: by mx.zohomail.com with SMTPS id 1724448702562223.08283998342017;
	Fri, 23 Aug 2024 14:31:42 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 23 Aug 2024 17:31:24 -0400
Subject: [PATCH 4/4] media: platform: mtk-mdp3: Remove mask parameter from
 MM_REG_POLL macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-mdp3-comp-cleanups-v1-4-1f8c1395ecd3@collabora.com>
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_143149_593448_5DB756C8 
X-CRM114-Status: GOOD (  10.91  )
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

Just like was done with MM_REG_WRITE, remove the mask from the
MM_REG_POLL macro, leaving MM_REG_POLL_MASK to be used when a mask is
required, and update the call sites accordingly. In this case, all calls
require a mask, so MM_REG_POLL remains unused, but at least this makes
the MM_REG_POLL macros consistent with the MM_REG_WRITE ones.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |  8 ++++----
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 13 +++++--------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index beb29ad0b048..683c066ed975 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -78,7 +78,7 @@ static int init_rdma(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	/* Reset RDMA */
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_RESET, BIT(0), BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, BIT(8), BIT(8));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, BIT(8), BIT(8));
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_RESET, 0x0, BIT(0));
 	return 0;
 }
@@ -634,14 +634,14 @@ static int init_wrot(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	/* Reset WROT */
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_SOFT_RST, BIT(0), BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, BIT(0), BIT(0));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, BIT(0), BIT(0));
 
 	/* Reset setting */
 	if (CFG_CHECK(MT8195, p_id))
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0);
 
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_SOFT_RST, 0x0, BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x0, BIT(0));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x0, BIT(0));
 	return 0;
 }
 
@@ -871,7 +871,7 @@ static int init_wdma(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	/* Reset WDMA */
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_RST, BIT(0), BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, WDMA_FLOW_CTRL_DBG, BIT(0), BIT(0));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, WDMA_FLOW_CTRL_DBG, BIT(0), BIT(0));
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_RST, 0x0, BIT(0));
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 902006d7c4ba..681906c16419 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -53,16 +53,13 @@ do {								\
 do {								\
 	typeof(_mask) (_m) = (_mask);				\
 	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (_m));			\
+		(base) + (ofst), (val),				\
+		(((_m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
+			(0xffffffff) : (_m));			\
 } while (0)
 
-#define MM_REG_POLL(cmd, id, base, ofst, val, mask)		\
-do {								\
-	typeof(mask) (m) = (mask);				\
-	MM_REG_POLL_MASK((cmd), id, base, ofst, val,		\
-		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (m));			\
-} while (0)
+#define MM_REG_POLL(cmd, id, base, ofst, val)			\
+	cmdq_pkt_poll(&((cmd)->pkt), id, (base) + (ofst), (val))
 
 enum mtk_mdp_comp_id {
 	MDP_COMP_NONE = -1,	/* Invalid engine */

-- 
2.46.0


