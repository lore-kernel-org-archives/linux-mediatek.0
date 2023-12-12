Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B393EC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 02:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jLDmhsPfiX/JLquACpmKBR/nE79QP3C6Hd9UyNn77cs=; b=pL6Psn3dDYIl6UQHtNzWVrEPRw
	ZhZez9kPQo4pZT+8/GvumvDOwf0QAI/nBHbrZzCeL9GKZUwJt1NjxbZaTTuAJ2zTpHovK5V+v/ff3
	AkiC6a/FwOJRqCECXaKTXhtZotz8fokE4Rt4NUGEchS08oPrZJE2ZyWdVVeL+Plnok87uUPQROSpc
	V3onj2giLz0ugOojSJalJuEQKNiTeIfvj4ey3s+/BMoveKN3pSepRqgRk4kwiT63O3aRQGCe+CzvE
	pfv9XgGGBwKfA63+SI/nN9qOf97fNpdSr0sPUV48OMRge9ckWgVbqAddJig9CnUQBxDhVSR5uD8BT
	ju1Vi8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsxC-00AaRx-1o;
	Tue, 12 Dec 2023 02:57:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsx7-00AaQx-2N;
	Tue, 12 Dec 2023 02:56:59 +0000
X-UUID: 1a51f88c989a11ee958cff29c719f35b-20231211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jLDmhsPfiX/JLquACpmKBR/nE79QP3C6Hd9UyNn77cs=;
	b=UVa+02L9afdXl7xiN7cNWbe4XkcE3VJLuYbGW+zLynSvXGgQn6t7qUHio9V8p9riJiwOHr03G5/GcsMfXXkveGmbua4+xAmTARQVU3x8HnC1wit81uStrek8EkRPGmTAETZYOipJV+ja3e+ds6/lUiZF/DiF+wpT1XOTImv5eDg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:e0928033-e973-4948-a6dc-6c09682c9764,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:997b10bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1a51f88c989a11ee958cff29c719f35b-20231211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1164155159; Mon, 11 Dec 2023 19:56:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 10:46:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 10:46:16 +0800
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
Subject: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Date: Tue, 12 Dec 2023 10:46:00 +0800
Message-ID: <20231212024607.3681-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_185657_809839_51489D0A 
X-CRM114-Status: GOOD (  15.68  )
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

This patchset is for secure video playback and enables other potential
uses in the future. The 'secure dma-heap' will be used to allocate dma_buf
objects that reference memory in the secure world that is inaccessible/
unmappable by the non-secure (i.e.kernel/userspace) world.  That memory
will be used by the secure world to store secure information (i.e.
decrypted media content). The dma_bufs allocated from the kernel will be
passed to V4L2 for video decoding (as input and output). They will also be
used by the drm system for rendering of the content.

This patchset adds two secure heaps and they will be used v4l2[1] and drm[2].
1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Path).
   The buffer is reserved for the secure world after bootup and it is used
   for vcodec's ES/working buffer;
2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
   dynamically reserved for the secure world and will be got when we start
   playing secure videos, Once the security video playing is complete, the
   CMA will be released. This heap is used for the vcodec's frame buffer.

[1] https://lore.kernel.org/linux-mediatek/20231206081538.17056-1-yunfei.dong@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/20231023044549.21412-1-jason-jh.lin@mediatek.com/

Change note:
v3: Base on v6.7-rc1.
    1) Separate the secure heap into a common file(secure_heap.c) and a mtk special file
       (secure_heap_mtk.c), and put all tee related code into our special file.
    2) About dt-binding,
       a) Add "mediatek," prefix since this is Mediatek TEE firmware definition.
       b) Mute dt-binding check waring.
    3) Remove the normal CMA heap which is a draft for qcom.

v2: https://lore.kernel.org/linux-mediatek/20231111111559.8218-1-yong.wu@mediatek.com/
    1) Move John's patches into the vcodec patchset since they use the new
       dma heap interface directly.
       https://lore.kernel.org/linux-mediatek/20231106120423.23364-1-yunfei.dong@mediatek.com/
    2) Reword the dt-binding description.
    3) Rename the heap name from mtk_svp to secure_mtk_cm.
       This means the current vcodec/DRM upstream code doesn't match this.
    4) Add a normal CMA heap. currently it should be a draft version.
    5) Regarding the UUID, I still use hard code, but put it in a private
    data which allow the others could set their own UUID. What's more, UUID
    is necessary for the session with TEE. If we don't have it, we can't
    communicate with the TEE, including the get_uuid interface, which tries
    to make uuid more generic, not working. If there is other way to make
    UUID more general, please free to tell me.
    
v1: https://lore.kernel.org/linux-mediatek/20230911023038.30649-1-yong.wu@mediatek.com/
    Base on v6.6-rc1.

Yong Wu (7):
  dt-bindings: reserved-memory: Add mediatek,dynamic-secure-region
  dma-buf: heaps: Initialize a secure heap
  dma-buf: heaps: secure_heap: Add private heap ops
  dma-buf: heaps: secure_heap: Add dma_ops
  dma-buf: heaps: secure_heap: Add MediaTek secure heap and heap_init
  dma-buf: heaps: secure_heap_mtk: Add tee memory service call
  dma_buf: heaps: secure_heap_mtk: Add a new CMA heap

 .../mediatek,dynamic-secure-region.yaml       |  43 +++
 drivers/dma-buf/heaps/Kconfig                 |  13 +
 drivers/dma-buf/heaps/Makefile                |   2 +
 drivers/dma-buf/heaps/secure_heap.c           | 234 +++++++++++++
 drivers/dma-buf/heaps/secure_heap.h           |  43 +++
 drivers/dma-buf/heaps/secure_heap_mtk.c       | 321 ++++++++++++++++++
 6 files changed, 656 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-secure-region.yaml
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c
 create mode 100644 drivers/dma-buf/heaps/secure_heap.h
 create mode 100644 drivers/dma-buf/heaps/secure_heap_mtk.c

-- 
2.18.0



