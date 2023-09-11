Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB569EEB57D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 02:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6zWqvDk0Fsnt2Ma8JXPtwJh9E2ddprvdWAqFylWOEw=; b=tfkkDm0774RlcAOO77MZIXFPcP
	zVuKZDlDgobebBhiEo/Inyz8ZRucG9Fle6rnM3wLl9sVXsIFYLOmf6ImIWXn2YuDzKGnBl4aa24+Y
	GFBdafnXt999AZcsT6Nd+HWEVHh7Ox5MUbisU9Sf0EgF91fHVSGosC1+95VaRgyN0b00D9b74Gc75
	g2DqLgQi+iEeNhpOrGw0lfw/QCqtCXVvxYzBNAte3RV25oSQEM0Cai3OX608Hk9FhtquC8a/f04hB
	cidYC2d8RxiMPtGRxDjM3KfMtEeE8GEc164xt3UENGuVLXXPo5ew4wfHF5rU6m06tU2oRSucLpdzz
	J/zHyu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWiE-00H61O-2Q;
	Mon, 11 Sep 2023 02:31:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWiA-00H5yw-2f;
	Mon, 11 Sep 2023 02:31:40 +0000
X-UUID: 537d39ce504b11ee9b7791016c24628a-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L6zWqvDk0Fsnt2Ma8JXPtwJh9E2ddprvdWAqFylWOEw=;
	b=AjYGBkFukPEVdu366IDlNJ+YGppirqQmq2L0ezfIBzD9zxclvq99bnjTXO3QfkJur+6I9FlUeRhO13P98lcV7Eftgbtq/2t8Hs+o3WzC1ekj5520Kt9i0x/L5iGRl9tV/pgh50jFFT/S0CdsosOmG7UuFve1HabJXEzsoOSJvGo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:87d1a18f-4c9d-4ef7-bd08-f3fa23d46db9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:6c5cadbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 537d39ce504b11ee9b7791016c24628a-20230910
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 629015960; Sun, 10 Sep 2023 19:31:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 10:31:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 10:31:30 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>
Subject: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Date: Mon, 11 Sep 2023 10:30:34 +0800
Message-ID: <20230911023038.30649-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911023038.30649-1-yong.wu@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.016500-8.000000
X-TMASE-MatchedRID: 0PAXRdLSM2zREKzvS64+ofSG/+sPtZVkuLwbhNl9B5WctWHPLT5FfVdL
	ugvPA8FSTiQecD9aKoRSWg4YBc2bATeE3zHLyrsykDpLRKO9xhTt/okBLaEo+IVoIKH/TMNvQDz
	RyendZRslFsCeg04xsFJVKV9HqTcMYhdzVnzdRn0ZXJLztZviXH0tCKdnhB589yM15V5aWpj6C0
	ePs7A07RD7Pzr2apMzGKTftmZH3RdZ52F24lhYnZBNWIuzQwwp8KmSMO90LShDwZzxAYa4ncNrT
	E0oNMe+
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.016500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4BF5F12A7380CC06BB42E9353EC5550318E6AC621E5F586C1684C714131CAF542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_193138_866956_E23B1250 
X-CRM114-Status: GOOD (  15.15  )
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

The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
here since this is not a platform driver, therefore initialise the TEE
context/session while we allocate the first secure buffer.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/mtk_secure_heap.c | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
index bbf1c8dce23e..e3da33a3d083 100644
--- a/drivers/dma-buf/heaps/mtk_secure_heap.c
+++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
@@ -10,6 +10,12 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#define TZ_TA_MEM_UUID		"4477588a-8476-11e2-ad15-e41f1390d676"
+
+#define MTK_TEE_PARAM_NUM		4
 
 /*
  * MediaTek secure (chunk) memory type
@@ -28,17 +34,72 @@ struct mtk_secure_heap_buffer {
 struct mtk_secure_heap {
 	const char		*name;
 	const enum kree_mem_type mem_type;
+	u32			 mem_session;
+	struct tee_context	*tee_ctx;
 };
 
+static int mtk_optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return ver->impl_id == TEE_IMPL_ID_OPTEE;
+}
+
+static int mtk_kree_secure_session_init(struct mtk_secure_heap *sec_heap)
+{
+	struct tee_param t_param[MTK_TEE_PARAM_NUM] = {0};
+	struct tee_ioctl_open_session_arg arg = {0};
+	uuid_t ta_mem_uuid;
+	int ret;
+
+	sec_heap->tee_ctx = tee_client_open_context(NULL, mtk_optee_ctx_match,
+						    NULL, NULL);
+	if (IS_ERR(sec_heap->tee_ctx)) {
+		pr_err("%s: open context failed, ret=%ld\n", sec_heap->name,
+		       PTR_ERR(sec_heap->tee_ctx));
+		return -ENODEV;
+	}
+
+	arg.num_params = MTK_TEE_PARAM_NUM;
+	arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	ret = uuid_parse(TZ_TA_MEM_UUID, &ta_mem_uuid);
+	if (ret)
+		goto close_context;
+	memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
+
+	ret = tee_client_open_session(sec_heap->tee_ctx, &arg, t_param);
+	if (ret < 0 || arg.ret) {
+		pr_err("%s: open session failed, ret=%d:%d\n",
+		       sec_heap->name, ret, arg.ret);
+		ret = -EINVAL;
+		goto close_context;
+	}
+	sec_heap->mem_session = arg.session;
+	return 0;
+
+close_context:
+	tee_client_close_context(sec_heap->tee_ctx);
+	return ret;
+}
+
 static struct dma_buf *
 mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
 		      unsigned long fd_flags, unsigned long heap_flags)
 {
+	struct mtk_secure_heap *sec_heap = dma_heap_get_drvdata(heap);
 	struct mtk_secure_heap_buffer *sec_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
 	int ret;
 
+	/*
+	 * TEE probe may be late. Initialise the secure session in the first
+	 * allocating secure buffer.
+	 */
+	if (!sec_heap->mem_session) {
+		ret = mtk_kree_secure_session_init(sec_heap);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
 	if (!sec_buf)
 		return ERR_PTR(-ENOMEM);
-- 
2.25.1


