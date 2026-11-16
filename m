Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5360A260C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 01:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQBdX/m2;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Z2yYJ5xi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y55TdASnBoGfrDCMy+34oiKBw+p2hSLsA4K7WEYUknE=; b=nQBdX/m25nVu82FrGKV0AO5h4d
	tDwa0ZKbpf76NbHUJT8qGTTpIj+fSs3SLlXL5p2wlYRo5WbK3pthJWnsqr+/1QzauVg1cVHQdh25e
	nPj11KFf648NfxS54UNOwogFys3HQb11DU2PgUinsD/5jXOqxNXMjhI0AcpuNuBwPdmnmPI8x8quO
	LrruXPwGnJcH7Zc2yiJ2AvkASZXDPF3rjv2WKDhEnTLReqshmfHVTYqKk9QsRG63mTmr+kVthgqnF
	FMVVc68Xc2K/xWmiMo+CvDhgd0ExwxEuTAuZFDY35UgwnMfw3UNHA/iL4LAYMoEBwZFNy5SLjyQ8P
	LBLdlrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlbz-00000000s3H-3fCN;
	Mon, 16 Nov 2026 01:34:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlbu-00000000rz3-17MP;
	Mon, 16 Nov 2026 01:34:21 +0000
X-UUID: d25f94f2e15d11f1acbe4559397dec65-20261115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y55TdASnBoGfrDCMy+34oiKBw+p2hSLsA4K7WEYUknE=;
	b=Z2yYJ5xiOOnIzziEmgvqMmemohbecnCE5mUdJqPmmaQipukV6vvsG6lfEDjFps6TUd56PW8O1bLjr5KJ+RS9XwnzCKVxXPf0JsIZoPQHoaPTZRP9sZYpTGtf3KZptjFwdZzLT+r6kU8cpRplT7jQ54fQK3P9JQPk72RXYezE394=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:d263ace6-adfe-4e40-ad34-c3e7a29212ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:cf569d19-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|52|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d25f94f2e15d11f1acbe4559397dec65-20261115
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 606904522; Sun, 15 Nov 2026 18:34:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:07 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:05 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v19 00/13] media: mediatek: jpeg: add MT8196 JPEG support
Date: Mon, 16 Nov 2026 09:33:25 +0800
Message-ID: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_173418_312632_5FD74A5F 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Kyrie Wu (吴晗) <kyrie.wu@mediatek.com>

This series have the follow changing:
Firstly fix some bugs, including resolution change handleing, stop
streaming sw flow, fix buffer layout and clock setting to support multi-hw
jpeg working and others.
Secondly add mt8196 jpegdec and jpegenc compatible to support MT8196
kernel driver.
Lastly, Add smmu setting to support smmu and iommu at the same time.

Historical testing reported for v18 (not rerun for this revision):
This series has been tested with MT8196 tast test.
Encoding and decoding worked for this chip.

Patches 1 fix jpeg hw count setting to support different chips.
Patches 2 fix jpeg buffer payload setting to handle buffer
size bug while resolution changed.
Patches 3 fix jpeg dst buffer layout.
Patches 4 fix multi-core stop streaming flow
Patches 5 fix multi-core clk suspend/resume setting
Patches 6 fix buffer state update timing
Patches 7 fix decoding resolution change operation
Patches 8 fix remove buffer operation
Patch 9 adds the shared MT8196 JPEG SMMU configuration syscon binding.
Patches 10-11 add complete decoder and encoder bindings for MT8196.
Patch 12 adds the driver compatible strings for MT8196.
Patch 13 adds jpeg smmu sid setting.
---
Changes compared with v18:
--Rebased on mainline 23c62304dde29abe92013d85910d03a77dada35d.
--Initialize hw_rdy before populating children to preserve probe counts.
--Drain ready queues before waiting for in-flight buffers at STREAMOFF.
--Reject component suspend with -EBUSY while hardware is active; restore
  M2M scheduling on failure and use pm_ptr() for component PM operations.
--Publish decoder completion metadata before arming the timeout.
--Keep queue-format updates under CAPTURE STREAMOFF locking and check
  SOURCE_CHANGE state before comparing resolutions.
--Unlink prepared buffers before arming timeout or starting hardware.
--Introduce the shared SMMU schema before complete MT8196 decoder and
  encoder bindings, including their required smmu-config phandles.
--Clarify MT8196 SMMU stream IDs in encoder iommus descriptions and use
  the soc binding prefix for the shared SMMU schema patch.
--Complete SMMU initialization before allocating a child index and
  publishing child pointers, preserving parent state on probe failure.
--Update changed descriptions and remove the agreed Reviewed-by tags
  on patches requiring renewed review.

Changes compared with v17:
--Keep suspend/resume callbacks and clock ownership on multi-hw component
  devices. Leave single-hw callbacks on the master, and wait for the active
  job before disabling component clocks.
--Add a standalone DT binding patch for mediatek,smmu-config and the
  dedicated MT8196 JPEG SMMU configuration syscon at 0x38d0000.

Changes compared with v16:
--Rebased on top of the latest media tree

Changes compared with v15:
--Set max_hw_count from the DT child count and update hw_rdy from child hardware probes in patch 1.
--Fix patch 2 commit message wording per review.
--Rework patch 6 commit message per review.
--Remove redundant devm_clk_bulk_get() calls in patch 5 per review comments.
--Use %pe to print smmu_regmap error pointer in patch 12 to fix media-ci/static warnings.

Changes compared with v14:
--Rebased on top of the latest media tree

Changes compared with v13:
--Rebased on top of the latest media tree

Changes compared with v12:
--Rebased on top of the latest media tree
--fix kernel rebot build warnings in patch 5

Changes compared with v11:
--Rebased on top of the latest media tree
--Some modifications for patch v11's review comments.
--add reviewer to commit messages

Changes compared with v10:
--Rebased on top of the latest media tree
--add reviewer to commit messages

Changes compared with v9:
--Rebased on top of the latest media tree

Changes compared with v8:
--Rebased on top of the latest media tree

Changes compared with v7:
--Rebased on top of the latest media tree

Changes compared with v6:
--Rebased on top of the latest media tree

Changes compared with v5:
--reorder the patches set.
--fix commit message of patch 1-8.

Changes compared with v4:
--fix kernel robot build errors for patch 4.
--add reviewer for patch 1 and patch 2.

Changes compared with v3:
--change patch subject of jpeg encoder and decoder compatible.

Changes compared with v2:
--refactor smmu sid setting function interface
--Some modifications for patch v2's review comments.

Changes compared with v1:
--refine jpeg dt-bindings for MT8196
--optimize software code to manage jpeg HW count
--refactor smmu sid setting function interface
--Some modifications for patch v1's review comments.

Kyrie Wu (13):
  media: mediatek: jpeg: fix jpeg cores' amounts setting
  media: mediatek: jpeg: fix jpeg buffer payload size setting
  media: mediatek: jpeg: fix buffer structure size and layout
  media: mediatek: jpeg: Fix buffer completion on multi-core streaming
    stop
  media: mediatek: jpeg: Fix multi-core clk suspend and resume setting
  media: mediatek: jpeg: fix buffer state update timing
  media: mediatek: jpeg: fix resolution change event handling in decoder
  media: mediatek: jpeg: fix remove buffer removal timing for multi-core
  dt-bindings: soc: mediatek: Add MT8196 JPEG SMMU
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
  media: mediatek: jpeg: add jpeg compatible
  media: mediatek: jpeg: add jpeg smmu sid setting

 .../media/mediatek,mt8195-jpegdec.yaml        |  24 ++-
 .../media/mediatek,mt8195-jpegenc.yaml        |  39 ++++-
 .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   |  41 +++++
 MAINTAINERS                                   |   2 +
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 161 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  19 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  96 ++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  94 +++++++++-
 8 files changed, 410 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.51.0.windows.2


