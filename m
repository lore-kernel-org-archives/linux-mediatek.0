Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5281BC54EBC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 03:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AX+YH0kFrQnZ6S7xeXZmTR/bCpZwNmMzUSoBmbHjAZU=; b=ImitjhO7Q176TLxJ/d4gI1JYTW
	OBw58bT0hJlQBt7VbmexuV8mDHP9X/D7XBGvSMifzRngL2HiG6iCEuv5U5czDM8NCDRJ+lASm4+dl
	Togsxn7n8SHN/+qYrF5nhY9ExWqqWtCCkExSJZ9FYcPqbkNT++ZnUwSMJeZHo8hvuqfoRRGHO8mQz
	cE3o/ueiAOMvk81F27QOvSqD85BPrjRPnZVgvvc4V8rlwJQCFmSyimBAJGmT8fmEBu6CjEwlDZPsc
	pfA17kworO8EDfGTBw1CfrZEwYND/fedGaKElMoUU/+55aE5ieFEN6edl1KsXIuUH+ZC1wEdiDK3H
	fwRR3iBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFRY3-009NKa-9d; Wed, 11 Jan 2023 03:13:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFRXt-009NJY-QS; Wed, 11 Jan 2023 03:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AX+YH0kFrQnZ6S7xeXZmTR/bCpZwNmMzUSoBmbHjAZU=; b=q9yCvZwdNzlW1/8YWvcjsu3BDq
	Vf3voSzy9m35nvWQxnMyhdf80Kf6b3Pkkr7y9z4/LQPFTI8pcIPRNCMKPtnn9ZrmfUmcdZLVtN+H+
	a7Zvqk8B7i3waiB3N7O3NUlSBuoqhP5meeFEY0v4noz96L+A6bbXz0YXpnGFPiOqAPhN+1ZQw52as
	76HVxFBx+aFhq3E5xAoGLbMcuOKdtpShtCxyNK3Vixf41icjf7QVzRyw0Q+ElPCnM0C2ogttSeGuC
	dVTemW/kS5a8EoU6LNUXChB6iv4fCO1nF3yxMl7XWbxM3QAWhZGpVYu2J6osSixqBO/GVniou10e4
	7as273eg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFRXe-003Vth-1L;
	Wed, 11 Jan 2023 03:12:46 +0000
X-UUID: cc896f7a915d11edbbe3f76fe852e059-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AX+YH0kFrQnZ6S7xeXZmTR/bCpZwNmMzUSoBmbHjAZU=;
	b=Ia0Uu+4/us99SFnGwoz9ogCRWTtfydfsiD3V2T1x1JyOhTBrR94U5camKTWZKK8XHYtxLrU53i9klCHKi5Ys4ry1/cAOhjC/ts4Z/K50li6vu6QvWjIf/ko9kLlSpalJvaBmerRsn0H5JtA/LCriKt01b17M5gWF+UedzTZGr4w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:81260fa9-4d64-4565-a280-074b76905ffc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:00a04b54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: cc896f7a915d11edbbe3f76fe852e059-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 643315010; Tue, 10 Jan 2023 20:12:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 10:52:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 10:52:00 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, CK Hu
	<ck.hu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, Miles Chen <miles.chen@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] drm/mediatek: stop using 0 as NULL pointer
Date: Wed, 11 Jan 2023 10:44:41 +0800
Message-ID: <20230111024443.24559-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_031243_411075_EBC8A86E 
X-CRM114-Status: GOOD (  12.11  )
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

Use NULL for NULL pointer to fix the following sparse warning:
drivers/gpu/drm/mediatek/mtk_drm_gem.c:265:27: sparse: warning: Using plain integer as NULL pointer

Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Change since v1:
Add Fixes tag

---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 47e96b0289f9..06aadd5e7f5b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -262,6 +262,6 @@ void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
 		return;
 
 	vunmap(vaddr);
-	mtk_gem->kvaddr = 0;
+	mtk_gem->kvaddr = NULL;
 	kfree(mtk_gem->pages);
 }
-- 
2.18.0


