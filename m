Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF5ECA9EC7
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgua/CX+JQkdrABv8NyLZhlGZcPcDb9C8iBEpL3MYK0=; b=Pnx5D2TUemdYTGEU2fX7DMZBMP
	cOVRcihf9VdbXvXO/uKnZokSLcZIYZGaEI3KRCsByQ5Nv8vc8yWIDUDOldhS2p6QtAgAcNzOfvfDC
	MM+evyYa4p2ocbu1VRt0KVCnUhcZXwPr9kUmN66wX9D2Pq4aDbFoM7Sr11a+vKsoKNxaCwA6zMu68
	xD0nw18HQVBou1d98kzW1hft9sEmG40Rb2Bkp2ImEYgJv7yV3Z2SGR7eXVFX9TNI5QuPWO1Mc+o4O
	Hskedv6/aalVV1znTaasZmWU9u0PmGl9F1Az3sJuBHa+3WFq80OCJ3L9KWXivb+ASI/O0W3tF4DhX
	hHejitBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFS7Z-00000007dMo-3aMf;
	Sat, 10 Oct 2026 08:07:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFS7V-00000007dFA-0ZDo;
	Sat, 10 Oct 2026 08:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pgua/CX+JQkdrABv8NyLZhlGZcPcDb9C8iBEpL3MYK0=; b=nom5Rljkq6vqz1UVJYtoicNiYK
	0juBkFDmby94anUHEpMnlSHttLfDrLJkL4hNwvQuJ2VecGP1zIAby5H/jIeObbD39LczFAHHEn/kx
	h1s8sEOBlrUvULBKk1DMRKF6tZlDgL+H+PxJ7wtcQga9XpyTEjdS5ZyAVnV4pd6YfO3wEBXrPM6cR
	nfB3vlEfY3OBqq4fGJAEv0dyYr+CuV/+lJeRSgjJpcvj9SZ0mTYg3bZtDCvUXgyoAFp0jcAYz5oxr
	aavqQqcCmlNnnwpm0VsqXm85k2YKkp0jw7bsaKsFyvOmuo4/S5LQUqw96+aOkIMbGvRjE9FSOKAc0
	L3ZwQgPg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFS7S-0000000BvVc-0ZMq;
	Sat, 10 Oct 2026 08:07:52 +0000
X-UUID: a4ac8220c48111f1acbe4559397dec65-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pgua/CX+JQkdrABv8NyLZhlGZcPcDb9C8iBEpL3MYK0=;
	b=Waaet0yZpEA0TuLNONrebxuqJdhMSt5LoBIB5ng3otBOjXu7F/kRouXYJl79+v9xpuOOVepAcAE5rhdKY9YvFsPNBIiwxbufo5htWsUrFZ10Gd5lOUC/LZXWJMbXMB0oDSjnIr1lV0XrhjC1a0A112J6TF0Nn5UqYMdIbQjA+Cs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:bf01eac0-7e07-420b-a085-354115af4c9b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:ab882e95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a4ac8220c48111f1acbe4559397dec65-20261010
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 725308473; Sat, 10 Oct 2026 01:07:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:07:29 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:07:28 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v18 07/13] media: mediatek: jpeg: fix resolution change event handling in decoder
Date: Sat, 10 Oct 2026 16:07:11 +0800
Message-ID: <d32a1c2510d7f1f1517fdfba482c65cfa7c18cd7.1791614327.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_090750_629726_4407AC79 
X-CRM114-Status: GOOD (  15.50  )
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

This patch refines the handling of resolution change events within
JPEG decoder worker. The `mtk_jpeg_set_queue_data` function is now
called to set up queue data before signaling a source change through
`mtk_jpeg_queue_src_chg_event`. By reorganizing these calls, the
patch ensures that necessary queue information is updated prior to
transitioning the context state to `MTK_JPEG_SOURCE_CHANGE`.
A condition is added to exit early if the context is already in the
`MTK_JPEG_SOURCE_CHANGE` state, preventing redundant operations and
improving processing efficiency.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index e152eba..edd9e2d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1738,11 +1738,15 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
-		mtk_jpeg_queue_src_chg_event(ctx);
+		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);
 		ctx->state = MTK_JPEG_SOURCE_CHANGE;
+		mtk_jpeg_queue_src_chg_event(ctx);
 		goto getbuf_fail;
 	}
 
+	if (ctx->state == MTK_JPEG_SOURCE_CHANGE)
+		goto getbuf_fail;
+
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
 	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
-- 
2.51.0.windows.2


