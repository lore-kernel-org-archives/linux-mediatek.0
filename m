Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0856C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zcBxf2JopgBE0/qefhNOXKZs3dhHmLYOk2K3RwkLF5k=; b=1SayvAWlRm2tkH1SpZ68wO3L7Y
	LMfV1GIUUkUfDQPKcdtgSBF6MA+7VjLtTRQRgVRcjanxZvMJtuH4nuZZ21OArO5ds0T1CuNIYePGW
	chXIBrOuNQ7woOdXaLjRgNF1SlPidCJKMQmE0ggOMc5QvW1H7RJdCpT7NnmBSBca6mwX9QZZCvmIj
	D1x9uFyYTdMqCAKKXuOWzYuXHkY524ZLSP+e2pJ/A+cpdem6huPPpf1FpDJ6BudeVswILR+oPZ//r
	LUDAeq79ZisvyV/VV8qMGL38PEBbxtdSANCJHNs08n7UNl1E17I/NLCEmxtQfclTjNnKJ9Y3T24sD
	nNHULd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jXH-00CiZk-0f;
	Wed, 24 May 2023 08:07:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jXE-00CiZ0-32;
	Wed, 24 May 2023 08:07:54 +0000
X-UUID: 0fb402f0fa0a11ed912e1518a6540028-20230524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zcBxf2JopgBE0/qefhNOXKZs3dhHmLYOk2K3RwkLF5k=;
	b=uerNzmrFlA4034mRp3mKfUr7D9bQ3UxtQmBe8+oFYEpiZ+qTWBINipS+da1GTlwHJyiQ27zcLSHjYqGbYL9T94krlb5o8eTsCMk7/VFCv6QUyZTb/SbFTR9+e76JocyI+JdhnQBwfnD7LzQ638xrba3dXSUqUg3kFNWSNOR7ewU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b812af1a-73a0-43a5-b2e9-60192f261b20,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.25,REQID:b812af1a-73a0-43a5-b2e9-60192f261b20,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:d5b0ae3,CLOUDID:20a9323c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:230524160746FIY47FUE,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0fb402f0fa0a11ed912e1518a6540028-20230524
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 838781349; Wed, 24 May 2023 01:07:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 May 2023 16:07:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 May 2023 16:07:40 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7,0/2] media: mediatek: vcodec: add hevc stateless decoder driver in MT8195
Date: Wed, 24 May 2023 16:07:37 +0800
Message-ID: <20230524080739.17264-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_010752_991354_25A4319A 
X-CRM114-Status: GOOD (  12.12  )
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

Add hevc stateless decoder driver to support hardware decode in MT8195, and the driver
need num_delta_pocs_of_ref_rps_idx value to parse slice header short_term_ref_pic_set().

patch 1 add num_delta_pocs_of_ref_rps_idx field.
patch 2 add hevc stateless decoder driver.
---
Changed from v6:
- fix AngeloGioacchino's suggestion.

Changed from v5:
- checkpatch/kernel-doc pass/build pass.
- fix warning: struct vdec_av1_slice_fb -> struct vdec_hevc_slice_fb.
- fix warning: remove unused comment for param "trans_start" and "trans_end"

Changed from v4:
- fix some comments according to Nathan's suggestion.

Changed from v3:
- add the dependency patch to this patch series for patch 1.

Changed from v2:
- fix one build warning.
- add the dependency patch link.

Changed from v1:
- fix build error when build 32bit system.
- hevc fluster test result: 132/147 (not support: 10bit => 11 and resolution => 4).
---
Benjamin Gaignard (1):
  media: uapi: HEVC: Add num_delta_pocs_of_ref_rps_idx field

Yunfei Dong (1):
  media: mediatek: vcodec: support stateless hevc decoder

 .../media/v4l/ext-ctrls-codec-stateless.rst   |    7 +
 .../media/platform/mediatek/vcodec/Makefile   |    1 +
 .../vcodec/mtk_vcodec_dec_stateless.c         |   59 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
 .../vcodec/vdec/vdec_hevc_req_multi_if.c      | 1097 +++++++++++++++++
 .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
 .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
 include/uapi/linux/v4l2-controls.h            |    6 +-
 8 files changed, 1174 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c

-- 
2.25.1


