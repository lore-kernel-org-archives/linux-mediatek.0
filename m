Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0659C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTkJwhlG295J7Fq7DBG9f0P0y9BIpK10DHJxLIVe19g=; b=EBq1yq0OQvaVeuCgHvv/i4ZFCr
	nMw/3l7g5BZmYufZboFsgZB9tvSqqOx07Lv9rXb0TrWsedtIwkYQwxi26UCc1XkKzEHbkhLUBSKaK
	iGaVvkkgDsROhSPQyTZCXtDpJae178Iy2ixzsUJbr0vfIksw8yOWkWi4f7sgeooNlGcxqxnXdIvw/
	MeXbGUMI/XRQTpdkdt45O8gI4YXcv/ay4ibxKhbCo08vHu4tKwxnyOiBYL8gMegwS/3QRUGoWQu1Z
	G7C3Q0gC32RnK04P0qVj1NYqOiOW5+VQvhdWbalbJ9Wan6bBcbao8+Ci2eYXbKooiHxh2xXrlSgs7
	CP5qrVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1m0G-00APFH-2S;
	Sat, 11 Nov 2023 11:18:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1m0B-00APCS-1W;
	Sat, 11 Nov 2023 11:18:14 +0000
X-UUID: fbdbb970808311ee9b7791016c24628a-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PTkJwhlG295J7Fq7DBG9f0P0y9BIpK10DHJxLIVe19g=;
	b=g0D6tp7hVsbc7lPPx2KqtJoCZpLVTtmSCZk1Pmvnw7riV943Zn8C5G9rv4nIT2Dl28iH4vQhTMxZ+W3Jck88BlyMmYMPqKrE92Dwb+aPBxeGP0OnTBN3oT3v7IRS1+RM2T+VwBTVHkaIfX20fUObAzyfiwuoX/IcNhplQfjKmSc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:aebed297-7a88-48d0-893e-c074a0606fb2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:5e838872-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fbdbb970808311ee9b7791016c24628a-20231111
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1260603641; Sat, 11 Nov 2023 04:18:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:18:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:18:00 +0800
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
	<kuohong.wang@mediatek.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
	<ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH v2 8/8] dma-buf: heaps: secure_heap: Add normal CMA heap
Date: Sat, 11 Nov 2023 19:15:59 +0800
Message-ID: <20231111111559.8218-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.713600-8.000000
X-TMASE-MatchedRID: XAa2d/45j8QtJMbDWD8p3pEbNXwHGDRxqQ9UezeTkTjb6Y+fnTZULzAg
	xTloju5/Xt8ERZJyv5z+zbn+OlN0IkPbYPqd/GaJwCZxkTHxccnWSrKtwxqWpaj5v7I4/SgYU7g
	EPucszGeVMlcqqHWd7WAecQuhpQq2v94QsDvR6NwbmaDSnOqZfofsPVs/8Vw6RY/QCO8+EY40ZG
	lGdzy556HPibXQz0iw3BTxUdcaKkIfE8yM4pjsDwtuKBGekqUpIG4YlbCDECsYpN+2ZkfdFw5Eg
	x2RURWzOX6Gf/YkVyO2bMkQ2ubJ+3p46hvecdNTC8XKjsVbJjU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.713600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C57F37D27EAEC8D1A7ABBC4D4778A4F2275F843CCD29DDAD8C5D302DE4BE19C92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_031811_524397_B6A6FDB4 
X-CRM114-Status: GOOD (  19.71  )
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

Add a normal CMA heap which use the standard cma allocate.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
Hi Vijay and Jaskaran,

For this heap,
1) It uses sec_heap_buf_ops currently. I guess we cann't use the
cma_heap_buf_ops. since if it is secure buffer, some operations such
as mmap should not be allowed.
2) I didn't add how to protect/secure the buffer.

Please feel free to change to meet your requirements.
Thanks.
---
 drivers/dma-buf/heaps/secure_heap.c | 38 ++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index f8b84fd16288..8989ad5d03e9 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -43,6 +43,8 @@ enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. */
 };
 
 enum secure_memory_type {
+	/* CMA for the secure memory, Use the normal cma ops to alloc/free. */
+	SECURE_MEMORY_TYPE_CMA		= 0,
 	/*
 	 * MediaTek static chunk memory carved out for TrustZone. The memory
 	 * management is inside the TEE.
@@ -65,6 +67,7 @@ struct secure_buffer {
 	 * a value got from TEE.
 	 */
 	u32				sec_handle;
+	struct page			*cma_page;
 };
 
 #define TEE_MEM_COMMAND_ID_BASE_MTK	0x10000
@@ -287,6 +290,33 @@ const struct secure_heap_prv_data mtk_sec_mem_data = {
 	.unsecure_the_memory	= secure_heap_tee_unsecure_memory,
 };
 
+static int cma_secure_memory_allocate(struct secure_heap *sec_heap,
+				      struct secure_buffer *sec_buf)
+{
+	if (!sec_heap->cma)
+		return -EINVAL;
+
+	sec_buf->cma_page = cma_alloc(sec_heap->cma, sec_buf->size >> PAGE_SHIFT,
+				      get_order(PAGE_SIZE), false);
+	if (!sec_buf->cma_page)
+		return -ENOMEM;
+
+	memset(page_address(sec_buf->cma_page), 0, sec_buf->size);
+	return 0;
+}
+
+static void cma_secure_memory_free(struct secure_heap *sec_heap,
+				   struct secure_buffer *sec_buf)
+{
+	cma_release(sec_heap->cma, sec_buf->cma_page, sec_buf->size >> PAGE_SHIFT);
+}
+
+const struct secure_heap_prv_data cma_sec_mem_data = {
+	.memory_alloc	= cma_secure_memory_allocate,
+	.memory_free	= cma_secure_memory_free,
+	/* TODO : secure the buffer. */
+};
+
 static int secure_heap_secure_memory_allocate(struct secure_heap *sec_heap,
 					      struct secure_buffer *sec_buf)
 {
@@ -496,6 +526,11 @@ static const struct dma_heap_ops sec_heap_ops = {
 };
 
 static struct secure_heap secure_heaps[] = {
+	{
+		.name		= "secure_cma",
+		.mem_type	= SECURE_MEMORY_TYPE_CMA,
+		.data		= &cma_sec_mem_data,
+	},
 	{
 		.name		= "secure_mtk_cm",
 		.mem_type	= SECURE_MEMORY_TYPE_MTK_CM_TZ,
@@ -522,7 +557,8 @@ static int __init secure_cma_init(struct reserved_mem *rmem)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
-		if (sec_heap->mem_type != SECURE_MEMORY_TYPE_MTK_CM_CMA)
+		if (sec_heap->mem_type != SECURE_MEMORY_TYPE_MTK_CM_CMA &&
+		    sec_heap->mem_type != SECURE_MEMORY_TYPE_CMA)
 			continue;
 
 		sec_heap->cma = sec_cma;
-- 
2.25.1


