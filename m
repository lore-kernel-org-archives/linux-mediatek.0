Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A2CC072A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 10:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DhkJnR22Jop4i2vHDhl5q1CKNIHtvIzQcFATKsxapzk=; b=YMP5VHpd2zsTxBcAGbpqwL34Qy
	wUu8X03Jj7s0HoogMSSmL6ZYkCj0HUFqE1Eyyd7tFhnjt90kD6FaANT9w8ySJVMBNqOUXLGYeVIcF
	fbi26K626Vu8IkOltT2jX6CKhHj6/ahQULosR+CG99DNwURBCxmfPpp8VIcgUOJCZ/ljwWUhF9qz/
	ng/Jqp54K7RNlYB6PiEB2aXTbsen2e2Klco2eYsCv1PMYJQYwBMMPPsgBnhos0W/odG7kA7xe0WdS
	kUq8oBll5duLbRa6SAS0djf+/gbCNGBLGJjw7ZG8viNLRvXA1ASQGt3LYGLizHcFzGghWU02efcgJ
	VPUrYc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vhx-006BGr-1q;
	Fri, 17 Nov 2023 10:04:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vht-006BFS-0C;
	Fri, 17 Nov 2023 10:04:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH9Qdc8009283;
	Fri, 17 Nov 2023 10:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=DhkJnR22Jop4i2vHDhl5q1CKNIHtvIzQcFATKsxapzk=;
 b=XbbngjzR/GasnWiBpR6iA3hOUNgMPDZYP01zZ6vS0JkAVWksrAqw3xXIGCYnNks0QYZz
 usWp74Boqxfy+MrHgkhAYyE8a+0CJxq6aCMu0w8lFgn+h0gKmAdtoIZvgSqLzT23znia
 og2YDc6zZ7AZPaQL66Duwv3b54AGaTTrLTd6xiX3YNk/3GIq6dPPunP6+iQ79m+AoyKd
 +YGKOTLr01d3Fa1FZHAhTRWhvr7Qb7nkZQz1ldgd+jrk1Rooo3uXSml95x501W694pCO
 vBv9EcqexhzkWtdGQwoMrOs0BLAcgfny0GgMGCZjF2CO4oiKlX2NjumabqKBi9bXsMYa VQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue2na0g2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:03:57 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHA3uIm012999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:03:56 GMT
Received: from hu-jasksing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 17 Nov 2023 02:03:51 -0800
From: Jaskaran Singh <quic_jasksing@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
        <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
        <christian.koenig@amd.com>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <quic_vjitta@quicinc.com>
Subject: [PATCH v2] dma-buf: heaps: Introduce cma_heap_add() for non-default CMA heap
Date: Fri, 17 Nov 2023 15:33:37 +0530
Message-ID: <20231117100337.5215-1-quic_jasksing@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5Mjj9yaE5YbLk6qMKCFvI8mWREOm329-
X-Proofpoint-ORIG-GUID: 5Mjj9yaE5YbLk6qMKCFvI8mWREOm329-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_07,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=627 phishscore=0 suspectscore=0 clxscore=1011 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_020413_102685_581EF29F 
X-CRM114-Status: GOOD (  26.47  )
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

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Currently dma-buf heaps can handle only default CMA. This exposes
__add_cma_heap(), renamed to cma_heap_add(), as a public API to
initialize CMA heaps from a pointer to a CMA region.

At first, the driver calls of_reserved_mem_device_init() to set
memory-region property associated with reserved-memory defined as CMA
to the device. And when the driver calls this cma_heap_add() with the
struct cma attached to the device, the CMA will be added to dma-buf
heaps.

For example, prepare CMA node named "linux,cma@10000000" and
specify the node for memory-region property. After the above calls
in the driver, a device file "/dev/dma_heap/linux,cma@10000000"
associated with the CMA become available as dma-buf heaps.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
[quic_jasksing@quicinc.com: Use struct cma as the function argument]
Signed-off-by: Jaskaran Singh <quic_jasksing@quicinc.com>
---
Reviving this patch as per discussions on the MediaTek Secure Heap patch
series[1]. There is now a potential client of the cma_heap_add() API.

An unaddressed problem in this patch is the proper parsing of heap
names. Naming convention for fixed address heaps in the devicetree is of
the format "[heap name]@[fixed address]", for example
"audio-heap@88b00000". Exposing heaps this way to userspace could
prove erroneous as the usecases fulfilled by these heaps are the same
across individual SoCs. Userspace clients of these heaps might expect a
more consistent interface. Any feedback on this is appreciated.

Changes v1->v2:
- Change the function argument for dma_heap_add_cma() from struct
  device to struct cma as per the discussion on [1].
- In lieu of the above point, discard dma_heap_add_cma() and instead
  expose the existing __add_cma_heap() as cma_heap_add().
- Make minor modifications to the commit message based on the changes in
  this version. Retain most of the original commit message.

v1: https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/

[1] https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/T/#m5184a1e13767bb656a4a3d9bf5a1fd7450e42eb7

 drivers/dma-buf/heaps/cma_heap.c | 12 ++++++++++--
 include/linux/dma-heap.h         | 10 ++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..b3bef8206e8b 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -367,7 +367,14 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __add_cma_heap(struct cma *cma, void *data)
+/**
+ * cma_heap_add - adds a CMA heap to dmabuf heaps
+ * @cma:       pointer to the CMA pool to register the heap for
+ * @data:      unused
+ *
+ * Returns 0 on success. Else, returns errno.
+ */
+int cma_heap_add(struct cma *cma, void *data)
 {
 	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
@@ -391,6 +398,7 @@ static int __add_cma_heap(struct cma *cma, void *data)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cma_heap_add);
 
 static int add_default_cma_heap(void)
 {
@@ -398,7 +406,7 @@ static int add_default_cma_heap(void)
 	int ret = 0;
 
 	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+		ret = cma_heap_add(default_cma, NULL);
 
 	return ret;
 }
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..adcd462825a8 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -12,6 +12,7 @@
 #include <linux/cdev.h>
 #include <linux/types.h>
 
+struct cma;
 struct dma_heap;
 
 /**
@@ -65,4 +66,13 @@ const char *dma_heap_get_name(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+#ifdef CONFIG_DMABUF_HEAPS_CMA
+int cma_heap_add(struct cma *cma, void *data);
+#else
+static inline int cma_heap_add(struct cma *cma, void *data)
+{
+	return -EINVAL;
+}
+#endif /* CONFIG_DMABUF_HEAPS_CMA */
+
 #endif /* _DMA_HEAPS_H */
-- 
2.17.1


