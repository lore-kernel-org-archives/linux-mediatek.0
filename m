Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A498EC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bM0YNT+U36eWDYdIyW/GiESRO4pu/ZY5wFHIj9jl/Fk=; b=zYFn/+K54XwUL4d3/HQi03ELhU
	FbEb8VTHRZgkJcKXOA0chdHxTLI3Es6QtQyN2e36RDHNF9QyhxEF6uT6rYIaLW/L3posfs+1D40NV
	fJIh94rM/LZT+v9xRqAblz8Tof0D5ySt5cDSDrBU6q/SdjeKP+RwvZvqeY+8kyMSzgOTnK0borSkj
	lKnM5fgDOIndEj6Mfd0rSdbehuhhtvG/bs3t9zpodczSk/F1x0UDK7OpVkUYOvBtZhYQ7B3sJaASv
	LJT4pQ15cbxJzSqMctIpGRxQYFuf9uE7ABg71whZUn5TE96LpUBq6EM1yHUQwKFeZMlewBXUZdYry
	6A5Jcc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7h4-007xGq-0p;
	Wed, 17 May 2023 03:19:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7h1-007xFV-08;
	Wed, 17 May 2023 03:19:12 +0000
X-UUID: 92665b20f46111ed912e1518a6540028-20230516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bM0YNT+U36eWDYdIyW/GiESRO4pu/ZY5wFHIj9jl/Fk=;
	b=hbz45D82wcIIboPtdDa8xigSp7oNXmrpSTyL3u3UEJvTIcGycJ4oL4NIS0gT684vPCgFWHGR9IMxiu3X/W1kyuHIpBsr837zwxf+raUwJa5HSeTupZ0LeOKWxPatiXeLoMiZhBRRbOE+ZzJcK8dRHNAUTvBzEfZ+r7USypM55Sk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:dc552252-4799-4253-969d-44e1f12b3dac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:1db2693b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 92665b20f46111ed912e1518a6540028-20230516
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiaoming.ding@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 247752331; Tue, 16 May 2023 20:19:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 11:18:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 11:18:59 +0800
From: Xiaoming Ding <xiaoming.ding@mediatek.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
	<sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <fei.xu@mediatek.com>, <srv_heupstream@mediatek.com>, Xiaoming Ding
	<xiaoming.ding@mediatek.com>
Subject: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
Date: Wed, 17 May 2023 11:18:56 +0800
Message-ID: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_201911_228853_F47BE0DB 
X-CRM114-Status: UNSURE (   9.46  )
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

FOLL_LONGTERM will avoid share memory alloc from CMA region,
which may be used in secure playback case.
if part of CMA region taken by share memory for long term usage,
CMA will failed to get whole buffer back.

Signed-off-by: Xiaoming Ding <xiaoming.ding@mediatek.com>
---
 drivers/tee/tee_shm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 673cf0359494..ddd3947e2229 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -223,6 +223,7 @@ register_shm_helper(struct tee_context *ctx, unsigned long addr,
 	size_t num_pages;
 	void *ret;
 	int rc;
+	u32 page_flag = FOLL_WRITE;
 
 	if (!tee_device_get(teedev))
 		return ERR_PTR(-EINVAL);
@@ -255,9 +256,11 @@ register_shm_helper(struct tee_context *ctx, unsigned long addr,
 		ret = ERR_PTR(-ENOMEM);
 		goto err_free_shm;
 	}
-
+#if IS_ENABLED(CONFIG_CMA)
+	page_flag |= FOLL_LONGTERM;
+#endif
 	if (flags & TEE_SHM_USER_MAPPED)
-		rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE,
+		rc = pin_user_pages_fast(start, num_pages, page_flag,
 					 shm->pages);
 	else
 		rc = shm_get_kernel_pages(start, num_pages, shm->pages);
-- 
2.18.0


