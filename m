Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE02C00A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khLeNmeFr4dEE7zUUulOnX9v44u9sQtomfWBa91taAk=; b=kG+FGkyrNVWlvevmEWuAWfrgWP
	QJv/3Xq6zXbPZB+8we/e/fdcmg7vee2AaygMEmyu62IcIFW4CabBT4E4JTtcG0zebcyQ/GctIC/Qi
	qGOJSDuK8t2FZzz1a9MjuHelE6hQONNdWsvWXpDDJI+Lt1Q5WNfoLtkWnWyi3j6K+MVs0K6xvvP6i
	t+LCqTL5WY7UI2OicIqa+9kkxZaHc+rf1+0ZLcSyTaqj9pWQkIUixuYIhEkUeDq2lnnMng957WH2N
	5k/otgnseoAOc1aCGPARYOiOnSBoiRQfzQ0VdT6PqG7D4FcKZ6n5scy0QjxJ5Uz69LF5MVvDmoby3
	3jkUV8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCuq-0000000GJhV-2ise;
	Fri, 12 Apr 2024 09:09:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCuD-0000000GJEt-2U1M;
	Fri, 12 Apr 2024 09:09:16 +0000
X-UUID: 4f6e5f34f8ac11ee96d5dfc950b7243d-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=khLeNmeFr4dEE7zUUulOnX9v44u9sQtomfWBa91taAk=;
	b=Ujsn0eY83HUTvWXWgwbuHFV12eTFG59Vyjqy9eJTo0cWmxIKF2X5VlrZIcWfppOOV66lzyzFsQumJb4AdG2K9WcgcnmMfe5yc8fRkWxsBSqq+2lCCyth1/5Uo80QvsfrQ5txnNbVCvxZv/EGhG2Hs46k1TVQ4jkgA5HjxLFnELQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:5a00acef-7743-44d4-850a-dfef55cffa04,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:49408091-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4f6e5f34f8ac11ee96d5dfc950b7243d-20240412
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 152905788; Fri, 12 Apr 2024 02:09:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:08:59 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,04/23] v4l: add documentation for restricted memory flag
Date: Fri, 12 Apr 2024 17:08:32 +0800
Message-ID: <20240412090851.24999-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.051000-8.000000
X-TMASE-MatchedRID: QL+jDTIbnJ8LImHVm5AelymjEOrcO6AyTJDl9FKHbrkGxREerP+37XVX
	4shSYpPIU5vypzAbVDHVv08+TJnoOz5RuU5LdcresgYw1+LBrk1D3kXYiJVSRHXDIkXAltiwo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqt0665cBZqmv9WTaozwvRatithsKIE2Il2f+7rfOJbz4f7GK
	jDoopvq10xL6zkd6Digk9AEdlxs5azFz6j2+UpZYwAN2uiT6+64sOrsb4iT/K/bbEolHIgZUOc7
	GjOamnWv5a9cmIodEs3UeAnV+tV65RMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.051000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1A9376DACE1A482320D81B544C05D506A5E08BCEB3D040B61916C77BEE04C8112000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_020910_178457_4A0A26F5 
X-CRM114-Status: GOOD (  11.76  )
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

Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 52bbee81c080..807e43bfed2b 100644
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
+	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.
 
 .. raw:: latex
 
-- 
2.18.0


