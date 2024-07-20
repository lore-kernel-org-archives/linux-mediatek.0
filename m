Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE60C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 07:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHC3o5V5lRo65fXxEL/oKhYnOszY3UdThDILHWsUQFg=; b=cNZgfUvxi8EDWSl0wjTTM96MIZ
	6gs1EDg1R+d87n32dZjVCvj3nV1srJ6TXmgv5wZBi/7smkybqJiZ9Fsusqxp21VyuNZ1jVSAVUYZj
	yQdFcAhx8do/TfJ4akkE4RgDxCH2R1dTBTBTXB6O9BDVffjpYxpVRgggfhE0sPeRIsH4CIW9uAOEZ
	VXhZVmsuuJrkebZ+emNwwTJDYRL9PN3NW5UnKRTlf/kVNUt598zH5abYx4/wwGRNhNqdxg/cKzp08
	O/aCUvGf4pA6ZPdKmcC3LNpgEfp9fJ05Tin7qIb824uEID9SPWvMVxsQ8PIpNY4su2b5zgAuEDKHd
	VCvd2f7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4KL-00000004bzn-3mX7;
	Sat, 20 Jul 2024 07:16:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4KI-00000004byD-4286;
	Sat, 20 Jul 2024 07:16:20 +0000
X-UUID: f21b5fee466711efa6c87f6b4542ff6b-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LHC3o5V5lRo65fXxEL/oKhYnOszY3UdThDILHWsUQFg=;
	b=FDkIGEpAdjUgSh6MzhFMeiVfLIwOuf1eTHTjNDikdi2GQ+ddlSRE7S3f5mXm2AR/26H27sgmUpC5E0XL8f/KCMkJbGwVJ69kf+QjFrSfT1SVEwZJzKkRwaMXcSpr98EAKBECH7cwKnyEQqZ53Zd6spBRMxP8phTfzABbWq7OcQI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:7f7174c0-42df-41a0-8be0-bf3ab716ef67,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:ba885a6,CLOUDID:a63b8545-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f21b5fee466711efa6c87f6b4542ff6b-20240720
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2044172715; Sat, 20 Jul 2024 00:16:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:08 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 01/28] v4l2: add restricted memory flags
Date: Sat, 20 Jul 2024 15:15:39 +0800
Message-ID: <20240720071606.27930-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_001619_044360_C1C79C22 
X-CRM114-Status: GOOD (  17.74  )
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

From: Jeffrey Kardatzke <jkardatzke@google.com>

Adds a V4L2 flag which indicates that a queue is using restricted
dmabufs and the corresponding capability flag.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[Yunfei: Change reviewer's comments]
---
 Documentation/userspace-api/media/v4l/buffer.rst       | 10 +++++++++-
 .../userspace-api/media/v4l/vidioc-reqbufs.rst         |  6 ++++++
 include/media/videobuf2-core.h                         |  8 +++++++-
 include/uapi/linux/videodev2.h                         |  2 ++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 52bbee81c080..901eb007aae8 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -696,7 +696,7 @@ enum v4l2_memory
 
 .. _memory-flags:
 
-Memory Consistency Flags
+Memory Flags
 ------------------------
 
 .. raw:: latex
@@ -728,6 +728,14 @@ Memory Consistency Flags
 	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
 	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
 	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
+    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
+
+      - ``V4L2_MEMORY_FLAG_RESTRICTED``
+      - 0x00000002
+      - The queued buffers are expected to be in restricted memory. If not, an
+	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
+	Typically restricted buffers are allocated using a restricted dma-heap. This flag
+	can only be specified if the :ref:`V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM` is set.
 
 .. raw:: latex
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index bbc22dd76032..8a264ae08db1 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -122,6 +122,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
 .. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
 .. _V4L2-BUF-CAP-SUPPORTS-REMOVE-BUFS:
+.. _V4L2-BUF-CAP-SUPPORTS-RESTRICTED_MEM:
 
 .. raw:: latex
 
@@ -166,6 +167,11 @@ aborting or finishing any DMA in progress, an implicit
         :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
         :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
         :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
+    * - ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM``
+      - 0x00000100
+      - This capability is set by the driver to indicate the queue supports
+        restricted memory. See
+        :ref:`V4L2_MEMORY_FLAG_RESTRICTED <V4L2-MEMORY-FLAG-RESTRICTED>`.
 
 .. raw:: latex
 
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 955237ac503d..afd497e93a37 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -517,6 +517,9 @@ struct vb2_buf_ops {
  *		->finish().
  * @non_coherent_mem: when set queue will attempt to allocate buffers using
  *		non-coherent memory.
+ * @allow_restricted_mem: when set user-space can pass the %V4L2_MEMORY_FLAG_RESTRICTED
+ *		flag to indicate the dma bufs are restricted.
+ * @restricted_mem: when set queue will verify that the dma bufs are restricted.
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver can set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. If the driver wants to handle locking
@@ -621,6 +624,8 @@ struct vb2_queue {
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
 	unsigned int			non_coherent_mem:1;
+	unsigned int			allow_restricted_mem:1;
+	unsigned int			restricted_mem:1;
 
 	struct mutex			*lock;
 	void				*owner;
@@ -792,7 +797,8 @@ void vb2_core_querybuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
  * @flags:	auxiliary queue/buffer management flags. Currently, the only
- *		used flag is %V4L2_MEMORY_FLAG_NON_COHERENT.
+ *		used flags are %V4L2_MEMORY_FLAG_NON_COHERENT and
+ *		%V4L2_MEMORY_FLAG_RESTRICTED.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..c4b1bc10af4c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1060,6 +1060,7 @@ struct v4l2_requestbuffers {
 };
 
 #define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
+#define V4L2_MEMORY_FLAG_RESTRICTED			(1 << 1)
 
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
 #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
@@ -1071,6 +1072,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
 #define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS		(1 << 8)
+#define V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM		(1 << 9)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.18.0


