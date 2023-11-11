Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E92C4167D
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 11:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D2tKsXiy0X+1JGV/GrDN1OLzUO3UG44bCa8GSOX5Eqc=; b=3PpzAlsbOg71kcUNr2BvNEZ9nj
	TztNZkARCC5Mf5AZnBSgOfnqz1z5uZs1xztqlxmVnDSX6Q7CpRlgc9bDFqIC2JI2sL6LH65VR+mVr
	y04JL+9rL2Z6aQWQwgTN2T9KpxPg1N+1z1mfkhSaUQJeg7yId4hKjmzHFtqdbTRpcZSmCQoRt4Jnz
	wJwLJLtYrQ7bDL65/Hk0xphErL7Uu+jJqM7+D+z8J9DN9cJ383ntIKDiliPqZhr0SOW9tkM+ti9+u
	7FtJ3GrKBwjhFhYnTFanwWulRQn6N5Pdfoc0NUudlfVIMMwfw6RM/9d0Hoo7NFTHOBFKqzSCAgW1d
	pzr2aVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lyY-00AOTN-2j;
	Sat, 11 Nov 2023 11:16:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lyV-00AOSq-1i;
	Sat, 11 Nov 2023 11:16:29 +0000
X-UUID: bc33756a808311ee86758d4a7c00f3a0-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=D2tKsXiy0X+1JGV/GrDN1OLzUO3UG44bCa8GSOX5Eqc=;
	b=ZYVp65ZKL9ii//GMRU+3Tykq1kLMIacfXQ0nUO8RIrVzwDumVK/jnHAwyzRTIdCO350B7ZJCaScXLko1RgwVuKdL7aXewsLAdakY6gi0mB5K8pFqto0ZLA+RG7n66nS53yWTRj497ffjtTU2Ioy5z5VmrA+CbxLniS4hGITzO90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:784e6b03-15f5-418f-819c-9881d2d25380,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:c9164695-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: bc33756a808311ee86758d4a7c00f3a0-20231111
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1676931106; Sat, 11 Nov 2023 04:16:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:16:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:16:14 +0800
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
Subject: [PATCH v2 0/8] dma-buf: heaps: Add secure heap
Date: Sat, 11 Nov 2023 19:15:51 +0800
Message-ID: <20231111111559.8218-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_031627_578348_EB962800 
X-CRM114-Status: GOOD (  15.57  )
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

This patchset adds three secure heaps:
1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Path).
   The buffer is reserved for the secure world after bootup and it is used
   for vcodec's ES/working buffer;
2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
   dynamically reserved for the secure world and will be got when we start
   playing secure videos, Once the security video playing is complete, the
   CMA will be released. This heap is used for the vcodec's frame buffer. 
3) secure_cma: Use the kerne CMA ops as the allocation ops. 
   currently it is a draft version for Vijay and Jaskaran.

For the first two MediaTek heaps will be used v4l2[1] and drm[2], thus we
cannot put it in v4l2 or drm, and create a common heap for them. Meanwhile
We have a limited number of hardware entries to protect memory, we cannot
protect memory arbitrarily, thus the secure memory management is actually
inside OPTEE. The kernel just tells the TEE what size I want and the TEE
will return a "secure handle".

[1] https://lore.kernel.org/linux-mediatek/20231106120423.23364-1-yunfei.dong@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/20231023044549.21412-1-jason-jh.lin@mediatek.com/

Change note:
v2: 1) Move John's patches into the vcodec patchset since they use the new
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

Yong Wu (8):
  dma-buf: heaps: Initialize a secure heap
  dma-buf: heaps: secure_heap: Add private heap ops
  dma-buf: heaps: secure_heap: Initialize tee session
  dma-buf: heaps: secure_heap: Add tee memory service call
  dma-buf: heaps: secure_heap: Add dma_ops
  dt-bindings: reserved-memory: Add secure CMA reserved memory range
  dma_buf: heaps: secure_heap: Add a new MediaTek CMA heap
  dma-buf: heaps: secure_heap: Add normal CMA heap

 .../reserved-memory/secure_cma_region.yaml    |  44 ++
 drivers/dma-buf/heaps/Kconfig                 |   7 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/secure_heap.c           | 602 ++++++++++++++++++
 4 files changed, 654 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c

-- 
2.25.1


