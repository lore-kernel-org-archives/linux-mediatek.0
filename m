Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5541CC3F68F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:02:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B5FF21D7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfkEiGXJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="thxalq8c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B5FF21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdQzi/Fobqb7MTQbFRn9MzPp4EZBXdNBq46Fh2+kkkg=; b=lfkEiGXJswak3p
	0hFs6PlRH0IcltepZqd2nvLdRkH+bH6GWv3UPdOLZkaoZ6tjaCU647nDLolReP35ag/CHR3Duuo5Y
	VmmoqRaml4zv5Na6oAb6lXPmzmPYU/0xr9dVsyAlgq2dHlqSY/KGJ3uMT0Lb6kxt+S6fi48DfGWSn
	phPSLFPdBzsPYYNv+fEZUP4u4Z1qkVO9iyrbG8vBeGxwZfZlGL70Rig7g142WrBJMWoxU8+0T+1f3
	3TbE+hO6F+pBH60F7kD9LwPF3o5w+JfliOf5+bVBIXdXKhemSgfx6ziJNKc1nz8bVVW18tkvG1/WO
	62VZf1YuriQtuxY4AXBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imrgq-0003G4-PU; Thu, 02 Jan 2020 04:02:28 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imrgn-0003DW-25; Thu, 02 Jan 2020 04:02:26 +0000
X-UUID: 239c995ba83b4584b08b2af692087192-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WZibcIXENQqD/QYNVuPSeY7uijgfthNFPSvOXqGUZGw=; 
 b=thxalq8cVqxdQ7Vn8YK4vBOtU1BI5cBJ9T4JSx5w5X1e4BwushP/ewud+gy9rR9/wMGI/oCw1u9P1LR0CsDBhfwlaDTaU+xOcU1v4rWDGbra08lgbHbJENsvYUHCarUvqHOANmrAFmZUGqKdRKAPXfE+pNsyKQfd52lQMmz3rmg=;
X-UUID: 239c995ba83b4584b08b2af692087192-20200101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1760743678; Wed, 01 Jan 2020 20:02:18 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 20:02:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 12:01:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 12:01:35 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6,
 03/14] drm/mediatek: make sout select function format same with
 select input
Date: Thu, 2 Jan 2020 12:00:13 +0800
Message-ID: <1577937624-14313-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_200225_107839_6665F800 
X-CRM114-Status: GOOD (  11.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

there will be more sout case in the future,
make the sout function format same mtk_ddp_sel_in

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 91c9b19..f99f89a1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -389,17 +389,23 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
 	return value;
 }
 
-static void mtk_ddp_sout_sel(struct regmap *config_regs,
-			     enum mtk_ddp_comp_id cur,
-			     enum mtk_ddp_comp_id next)
+static unsigned int mtk_ddp_sout_sel(enum mtk_ddp_comp_id cur,
+				     enum mtk_ddp_comp_id next,
+				     unsigned int *addr)
 {
+	unsigned int value;
+
 	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
-				BLS_TO_DSI_RDMA1_TO_DPI1);
+		*addr = DISP_REG_CONFIG_OUT_SEL;
+		value = BLS_TO_DSI_RDMA1_TO_DPI1;
 	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
-				BLS_TO_DPI_RDMA1_TO_DSI);
+		*addr = DISP_REG_CONFIG_OUT_SEL;
+		value = BLS_TO_DPI_RDMA1_TO_DSI;
+	} else {
+		value = 0;
 	}
+
+	return value;
 }
 
 void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
@@ -412,7 +418,9 @@ void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
 	if (value)
 		regmap_update_bits(config_regs, addr, value, value);
 
-	mtk_ddp_sout_sel(config_regs, cur, next);
+	value = mtk_ddp_sout_sel(cur, next, &addr);
+	if (value)
+		regmap_update_bits(config_regs, addr, value, value);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
 	if (value)
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
