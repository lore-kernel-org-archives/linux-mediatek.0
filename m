Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99818C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NarYFV9zitHC0a/dKQv6CpzSu0O4WzMUjZiRTiPvYRk=; b=qp/cnIKvYyt0JAYiDNrg6Px1kv
	N7K2ZMgLNvihm7iqnxAOKyqXQAhF32IqOsVGhd7klFzocd+T19G5ag95tMnn2fVwGDfg7r989et+S
	lqIW3yp0dkYojcOhnjVUUS82yvnS8ZF5KuvtIo3VD1Q9+hY4sAUyYUUcz79X4j79VRc4V7j9Zg7mj
	iC4aig9d75o0ive0VcDOdu0Owa4QquQ/QiMJ8Im+5g0SSpVfJVawGjX59Wbwea8+Dmuv8jYSEj5gc
	E/gfhJbI3sK+5pEE0f1lDDY3jGvgSGW3dLA+ZSlwyQyHpgqdiAhSY+/C0kRNr68hlMQPz8DNivDoD
	Rzek9w7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7CkY-00000001MhV-1crQ;
	Wed, 15 May 2024 11:24:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7CkH-00000001MVC-15jH;
	Wed, 15 May 2024 11:24:31 +0000
X-UUID: ade4195812ad11efa8f1cd58ee6c2400-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NarYFV9zitHC0a/dKQv6CpzSu0O4WzMUjZiRTiPvYRk=;
	b=YSSbYq5rADUMeehe1983rnEkN9+hymohAMwkvULLv2NGUbdSDdc75vCfEuQMRRxHu2fuDC1hRZCKmLZQN+9ebyiO4jn2WRy2L9yZEe2ak9zw/spDdkfgxTcWQ3MBbAhN8eIZyOE6tY/0RfanMiQBmVFTkRxkaAPKnF0yGycA/7o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:1f9901a4-4832-447a-aeaf-393975bd389d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:de2ae383-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ade4195812ad11efa8f1cd58ee6c2400-20240515
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 509700174; Wed, 15 May 2024 04:24:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 04:23:48 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:23:47 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Pavel
 Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
	<logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
	<jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
	<youlin.pei@mediatek.com>
Subject: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Date: Wed, 15 May 2024 19:23:01 +0800
Message-ID: <20240515112308.10171-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_042429_375911_025FA482 
X-CRM114-Status: GOOD (  14.56  )
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

Introduce a FLAG for the restricted memory which means the memory is
protected by TEE or hypervisor, then it's inaccessiable for kernel.

Currently we don't use sg_dma_unmark_restricted, thus this interface
has not been added.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 include/linux/scatterlist.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 77df3d7b18a6..a6ad9018eca0 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -282,6 +282,7 @@ static inline void sg_unmark_end(struct scatterlist *sg)
 
 #define SG_DMA_BUS_ADDRESS	(1 << 0)
 #define SG_DMA_SWIOTLB		(1 << 1)
+#define SG_DMA_RESTRICTED	(2 << 1)
 
 /**
  * sg_dma_is_bus_address - Return whether a given segment was marked
@@ -352,6 +353,31 @@ static inline void sg_dma_mark_swiotlb(struct scatterlist *sg)
 	sg->dma_flags |= SG_DMA_SWIOTLB;
 }
 
+/**
+ * sg_dma_mark_restricted - Mark the scatterlist for restricted buffer.
+ * @sg:		SG entry
+ *
+ * Description:
+ *   Marks a a scatterlist for the restricted buffer that may be inaccessiable
+ *   in kernel if it is protected.
+ */
+static inline void sg_dma_mark_restricted(struct scatterlist *sg)
+{
+	sg->dma_flags |= SG_DMA_RESTRICTED;
+}
+
+/**
+ * sg_dma_is_restricted - Return whether the scatterlist was marked as restricted
+ *                        buffer.
+ * @sg:		SG entry
+ *
+ * Description:
+ *   Returns true if the scatterlist was marked as restricted buffer.
+ */
+static inline bool sg_dma_is_restricted(struct scatterlist *sg)
+{
+	return sg->dma_flags & SG_DMA_RESTRICTED;
+}
 #else
 
 static inline bool sg_dma_is_bus_address(struct scatterlist *sg)
@@ -372,6 +398,14 @@ static inline void sg_dma_mark_swiotlb(struct scatterlist *sg)
 {
 }
 
+static inline bool sg_dma_is_restricted(struct scatterlist *sg)
+{
+	return false;
+}
+
+static inline void sg_dma_mark_restrited(struct scatterlist *sg)
+{
+}
 #endif	/* CONFIG_NEED_SG_DMA_FLAGS */
 
 /**
-- 
2.25.1


