Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A7AC47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 06:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMqBb8ywjQ0rZOsEH87m6D0Csn8bNMMs2dmXkp7WJNQ=; b=Sr8RI5ujp8czvDf0OymJGYtgHj
	YSR5Z++ny17Kn/o5gPU8RzcWSgUAxr1aWwHyLoAaSrQ3rlJ0vKJNGgSg2/8nKP4OE3/3VH6Na61RG
	yKPa2Ni9Ff+ZdOXefQfPWfHUuMMLa4JpFHzUoq+cmCdjIg1Iuelazd49TQsmZmcawbvbA70Ad/jr3
	kGMUjoxVOBoLop5Qc/2qD0dxjHcYAN+0haFFk7t3/13I3FHRwmBFub11gK2W7j7YOjZlLkVpgoKal
	8cYL01ug5xYYBTJvKlhehsjAEmG+q/IaftC23OHiAVsu/yeU6Lly+9MVen0+fY1jMumikH8OH9JdB
	udHk1xJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULC2-0000000BUCn-07Oy;
	Mon, 29 Jan 2024 06:32:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULAu-0000000BTMR-2djb;
	Mon, 29 Jan 2024 06:31:24 +0000
X-UUID: ff53e224be6f11ee9a263b4415211400-20240128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DMqBb8ywjQ0rZOsEH87m6D0Csn8bNMMs2dmXkp7WJNQ=;
	b=UbtULTIZp53p53V3pjJslR3EdXlNFBsRNAkSydbRSSDyVdBepWDAbqGJD6+dnQFHRPx3eBxHpK1Rth+reLEsWir56VE+aCPqxA1e2yMF4K6at9BeZ8IfxLd1nUW2gaZ7DfdyVKFUJVKdR5tneD1Iqx2WmhqkUcGwz26X0kMpYrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:98e9c6dc-eaea-4815-b85b-599b737b9516,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6e16cf4,CLOUDID:88aa5c83-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ff53e224be6f11ee9a263b4415211400-20240128
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1630760091; Sun, 28 Jan 2024 23:31:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:46 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,09/22] media: mediatek: vcodec: allocate tee share memory
Date: Mon, 29 Jan 2024 14:30:12 +0800
Message-ID: <20240129063025.29251-10-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129063025.29251-1-yunfei.dong@mediatek.com>
References: <20240129063025.29251-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.400800-8.000000
X-TMASE-MatchedRID: TTrQ0Rwak8xA5/DRRISQHAPZZctd3P4BK2i9pofGVSuYBF1C0J2QPotf
	Mtu9FfbrPcGjGTU7TndXUz+XcOBhEYYCBZzro74fDB+ErBr0bAO2McZY43zJ423D6f6IpbLIyo3
	1HV/erwydBDUJwKypkLvrVFvaS3pv9A9EfhuU0xx1e7Xbb6Im2pRy1HDTPOXaW+jwVKpqvlI9yB
	u1TZGrQeLzNWBegCW2wgn7iDBesS15zdAzex5xZqre0w1snPFv0u8FMYg9F/E8Ov8beXpQc96Iy
	B3d7It8jwYmA8M2eveUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.400800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CAF33697948F636DC0B3C42444CBC459E7B69D5846104ADA4473D333C2EE6E0F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_223120_832056_BCDC01CC 
X-CRM114-Status: GOOD (  17.36  )
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

Allocate two share memory for each lat and core hardware used to share
information with optee-os. Msg buffer used to send ipi command and get ack
command with optee-os, data buffer used to store vsi information which
used for hardware decode.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 80 ++++++++++++++++++-
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     | 32 ++++++++
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
index 38d9c1c1785a..611fb0e56480 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
@@ -47,13 +47,69 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_private_init);
 
+static void mtk_vcodec_dec_optee_deinit_memref(struct mtk_vdec_optee_ca_info *ca_info,
+					       enum mtk_vdec_optee_data_index data_index)
+{
+	tee_shm_free(ca_info->shm_memref[data_index].msg_shm);
+}
+
+static int mtk_vcodec_dec_optee_init_memref(struct tee_context *tee_vdec_ctx,
+					    struct mtk_vdec_optee_ca_info *ca_info,
+					    enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_shm_memref *shm_memref;
+	int alloc_size = 0, err = 0;
+	u64 shm_param_type = 0;
+	bool copy_buffer;
+
+	switch (data_index) {
+	case OPTEE_MSG_INDEX:
+		shm_param_type = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+		alloc_size = MTK_VDEC_OPTEE_MSG_SIZE;
+		copy_buffer = true;
+		break;
+	case OPTEE_DATA_INDEX:
+		shm_param_type = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+		alloc_size = MTK_VDEC_OPTEE_HW_SIZE;
+		copy_buffer = false;
+		break;
+	default:
+		pr_err(MTK_DBG_VCODEC_STR "tee invalid data_index: %d.\n", data_index);
+		return -EINVAL;
+	}
+
+	shm_memref = &ca_info->shm_memref[data_index];
+
+	/* Allocate dynamic shared memory with decoder TA */
+	shm_memref->msg_shm_size = alloc_size;
+	shm_memref->param_type = shm_param_type;
+	shm_memref->copy_to_ta = copy_buffer;
+	shm_memref->msg_shm = tee_shm_alloc_kernel_buf(tee_vdec_ctx, shm_memref->msg_shm_size);
+	if (IS_ERR(shm_memref->msg_shm)) {
+		pr_err(MTK_DBG_VCODEC_STR "tee alloc buf fail: data_index:%d.\n", data_index);
+		return -ENOMEM;
+	}
+
+	shm_memref->msg_shm_ca_buf = tee_shm_get_va(shm_memref->msg_shm, 0);
+	if (IS_ERR(shm_memref->msg_shm_ca_buf)) {
+		pr_err(MTK_DBG_VCODEC_STR "tee get shm va fail: data_index:%d.\n", data_index);
+		err = PTR_ERR(shm_memref->msg_shm_ca_buf);
+		goto err_get_msg_va;
+	}
+
+	return err;
+err_get_msg_va:
+	tee_shm_free(shm_memref->msg_shm);
+	return err;
+}
+
 static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *optee_private,
 					     enum mtk_vdec_hw_id hardware_index)
 {
 	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
 	struct tee_ioctl_open_session_arg session_arg;
 	struct mtk_vdec_optee_ca_info *ca_info;
-	int err = 0, session_func;
+	int err, i, j, session_func;
 
 	/* Open lat and core session with vdec TA. */
 	switch (hardware_index) {
@@ -87,6 +143,24 @@ static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *opte
 	dev_dbg(dev, MTK_DBG_VCODEC_STR "open vdec tee session hw_id:%d session_id=%x.\n",
 		hardware_index, ca_info->vdec_session_id);
 
+	/* Allocate dynamic shared memory with decoder TA */
+	for (i = 0; i < OPTEE_MAX_INDEX; i++) {
+		err = mtk_vcodec_dec_optee_init_memref(optee_private->tee_vdec_ctx, ca_info, i);
+		if (err) {
+			dev_err(dev, MTK_DBG_VCODEC_STR "init vdec memref failed: %d.\n", i);
+			goto err_init_memref;
+		}
+	}
+
+	return err;
+err_init_memref:
+	if (i != 0) {
+		for (j = 0; j < i; j++)
+			mtk_vcodec_dec_optee_deinit_memref(ca_info, j);
+	}
+
+	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
+
 	return err;
 }
 
@@ -94,12 +168,16 @@ static void mtk_vcodec_dec_optee_deinit_hw_info(struct mtk_vdec_optee_private *o
 						enum mtk_vdec_hw_id hw_id)
 {
 	struct mtk_vdec_optee_ca_info *ca_info;
+	int i;
 
 	if (hw_id == MTK_VDEC_LAT0)
 		ca_info = &optee_private->lat_ca;
 	else
 		ca_info = &optee_private->core_ca;
 
+	for (i = 0; i < OPTEE_MAX_INDEX; i++)
+		mtk_vcodec_dec_optee_deinit_memref(ca_info, i);
+
 	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
index 8b1dca49331e..24aa63af9887 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -18,16 +18,48 @@
 
 #define MTK_OPTEE_MAX_TEE_PARAMS 4
 
+#define MTK_VDEC_OPTEE_MSG_SIZE     128
+#define MTK_VDEC_OPTEE_HW_SIZE      (8 * SZ_1K)
+
+/**
+ * struct mtk_vdec_optee_shm_memref - share memory reference params
+ * @msg_shm:        message shared with TA in TEE.
+ * @msg_shm_ca_buf: ca buffer.
+ *
+ * @msg_shm_size:   share message size.
+ * @param_type:     each tee param types.
+ * @copy_to_ta:     need to copy data from ca to share memory.
+ */
+struct mtk_vdec_optee_shm_memref {
+	struct tee_shm *msg_shm;
+	u8 *msg_shm_ca_buf;
+
+	u32 msg_shm_size;
+	u64 param_type;
+	bool copy_to_ta;
+};
+
 /**
  * struct mtk_vdec_optee_ca_info - ca related param
  * @vdec_session_id:   optee TA session identifier.
  * @hw_id:             hardware index.
  * @vdec_session_func: trusted application function id used specific to the TA.
+ * @shm_memref:        share memory reference params.
  */
 struct mtk_vdec_optee_ca_info {
 	u32 vdec_session_id;
 	enum mtk_vdec_hw_id hw_id;
 	u32 vdec_session_func;
+	struct mtk_vdec_optee_shm_memref shm_memref[MTK_OPTEE_MAX_TEE_PARAMS];
+};
+
+/*
+ * enum mtk_vdec_optee_data_index - used to indentify each share memory information
+ */
+enum mtk_vdec_optee_data_index {
+	OPTEE_MSG_INDEX = 0,
+	OPTEE_DATA_INDEX,
+	OPTEE_MAX_INDEX,
 };
 
 /**
-- 
2.18.0


