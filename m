Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221CAC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UEj0AXAxlyKrDR2T9dRAsXWpemXdwncxY2h++Qk+qQw=; b=NsELP69ojAR20jUA8uZZO6EGUf
	Lb3Q9XD2KdZKL18ZbMKmKUI6x4Dt/PcSN+6dtkVZWBZ8/4j8dfrwT//uUkPV2BQrqolsCxXYNPjyh
	vvg6IzbZvmjTZkjPSbBhkVDS38pfT2ip7K8hgHewD6wJ2ZNNiMp/ptiaYVu+KCzr7fL/eb+aFtacz
	6JdsOALHALmr70kW1q72kP4RH6PjTiCzhCfAdKKDf4h3rx29hwSOvVC5G+HIY6U0U9g7hSy1F0+Ye
	ISQRh7vTo6qdPAWJk4+b3qWzhihAvSJsCUqDSc9N8OLrsSMbFKmWN3avZguu04GBLny1W5raiDUHJ
	y03uYECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0PW-005aft-2T;
	Wed, 19 Jul 2023 06:11:42 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0PQ-005ac4-2G
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UEj0AXAxlyKrDR2T9dRAsXWpemXdwncxY2h++Qk+qQw=; b=RtEkF/oPmknbPZeDnC7B9l05Et
	+1YXjFznDcVfZcq9GKMZ6Hn3JGPu01uk9oa1kgUj0GlAdMBLbTaduA7JWNXl4/cmoyiO7S0hR4mWH
	KgXfx0m6MsU2I0VTAczHEE9HZJ2m83JutjbnUY1rRo/+mzYuDlpL5sYUpXjDFwBxqaD8eneIVmv2X
	hxXAsmq3aXpNF/OZCH5EGzvF3Rm5NIqW5sXelLWptlI2lrbddOGlr7NKlUhcQG6qhTYObiEe6V/NZ
	D6IR7yqzJBqthI9hoC4bDMuEC/5wPwN6rLUS5FeNZqMigGEY+eZZEpBIqLlZvRf0J6FN3sMvNJGBc
	7E7gVcPQ==;
Received: from smtp-29.smtpout.orange.fr ([80.12.242.29] helo=smtp.smtpout.orange.fr)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLUed-009Jj3-36
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jul 2023 20:17:14 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id LUX2q5vfabkI3LUX3qnKyX; Mon, 17 Jul 2023 22:09:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1689624566;
	bh=UEj0AXAxlyKrDR2T9dRAsXWpemXdwncxY2h++Qk+qQw=;
	h=From:To:Cc:Subject:Date;
	b=d5cNBpyckTzPUqzqnhq0Y8pnMXCGVib/3GQbOzMQQsYxZ3ZYKt+G4E2/m0JKWFX+e
	 qqDGQBU3SKWwxg6+fc7iAiwf/ujP3ncKaZh5EqZ0NlrQbWfy0k6ZMAHR2alnc/RV0O
	 BRWLayHoFfKe22+BCe+9ZH74Rp3Yb4VGTr//1QNai0xaOnpWocQub4BxIKf/4/XYQQ
	 aC6q05JzSPNLdSdhUaYi7DjgHHxT1Idu1MjlUL6CW1hWdXd95uygiX+S50KeqRHdcM
	 t5KbEAcOD6WglubNCuVqoWfi+MZ7NLw0gvaibiq0kYwspynZkdd5yCqTNi6bIdnZRC
	 sbthVNZOAmuLA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Jul 2023 22:09:26 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Fix an error handling path in vdec_msg_queue_init()
Date: Mon, 17 Jul 2023 22:09:19 +0200
Message-Id: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_211712_357088_94EC77C4 
X-CRM114-Status: UNSURE (   8.62  )
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

All errors go to the error handling path, except this one. Be consistent
and also branch to it.

Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index 04e6dc6cfa1d..c6cc2785e0e8 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -338,14 +338,16 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 			err = mtk_vcodec_mem_alloc(ctx, &lat_buf->rd_mv_addr);
 			if (err) {
 				mtk_v4l2_err("failed to allocate rd_mv_addr buf[%d]", i);
-				return -ENOMEM;
+				err = -ENOMEM;
+				goto mem_alloc_err;
 			}
 
 			lat_buf->tile_addr.size = VDEC_LAT_TILE_SZ;
 			err = mtk_vcodec_mem_alloc(ctx, &lat_buf->tile_addr);
 			if (err) {
 				mtk_v4l2_err("failed to allocate tile_addr buf[%d]", i);
-				return -ENOMEM;
+				err = -ENOMEM;
+				goto mem_alloc_err;
 			}
 		}
 
-- 
2.34.1


