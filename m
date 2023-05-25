Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2EBC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 02:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zOBf7epstLxMnK/zLdFYIIeJOPfmRcocUYEv4ffyRWU=; b=Zn90WusXogiF+eax/GUVbxkLAb
	AKOFCeS3X06WUGf01F2ijCU4h1L/mIyy+D3OhV4C7qS9/bsJlEcklPWYaUHzmR/eBOefCXCo3zk9H
	3NEEJAAF8U41iYZOZ4uzmFTrjJcb4moXHIuNqLQeubhYGLi+r/CwoQW/EKQgSlx0zX7Q/am+TjLlD
	peO+0D+QE9ucc8Z+CpALhKXbQpoSOUQuYlR7LMkl9M+xO66d/4PhhY73mx05miS0nN9gMbfahUPhH
	C2y9kjragyRfmqNOKsOen0xjMeQp0yQsN+p+EcJp1BPRyMc3sqkBoIpddxq9HrBxfmMsbotm0Boey
	JG6qZ1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q20cb-00FFXF-2A;
	Thu, 25 May 2023 02:22:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q20cX-00FFWW-2w;
	Thu, 25 May 2023 02:22:31 +0000
X-UUID: fc1509e4faa211ed912e1518a6540028-20230524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zOBf7epstLxMnK/zLdFYIIeJOPfmRcocUYEv4ffyRWU=;
	b=i+CyGllNMOUS8ZxFeueW3uIP+E3ZrU7GmkIxQucPlzLSvgbrjHdSncGN1f88ZB+Dp1TKHaUZy1GBFCgz50T02hCtzC+jZb4jZZsEpsNQuMIqlp1iAmUXu37+1ned0jz6ALBjw8SayRZOdrNcCJP7gL3fQSdI0OctSdVakHz4NsY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:4973d941-4c14-4597-9ef9-6f8b60bed02a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:928bec6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: fc1509e4faa211ed912e1518a6540028-20230524
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1152667460; Wed, 24 May 2023 19:22:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 May 2023 10:12:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 10:12:19 +0800
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
Subject: [PATCH v5,0/8] media: mediatek: vcodec: Add debugfs file for decode and encode
Date: Thu, 25 May 2023 10:12:11 +0800
Message-ID: <20230525021219.23638-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_192229_978572_FE581B29 
X-CRM114-Status: GOOD (  11.44  )
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

Need to change kernel driver to open decode and encode debug log at current period,
it's very unreasonable. Adding debugfs common interface to support decode and encode,
using echo command to control debug log level and getting useful information for each
instance.

patch 1 add dbgfs common interface.
patch 2~5 support decode.
patch 6~7 support encode
patch 8 add help function
---
changed with v4:
- rebase to the top of media stage header.

changed with v3:
- add help function for patch 8
- remove append '\0' and enlarge buffer size for patch 4

changed with v2:
- using pr_debug and dev_dbg instead of pr_info for patch 2.
- fix word fail: informatiaoin -> information for patch 3.
- used to print each instance format information for patch 5.

changed with v1:
- add new patch 4 and 5.
- using cmd 'cat vdec' to show debug information instead of pr_info directly.
---
Yunfei Dong (8):
  media: mediatek: vcodec: Add debugfs interface to get debug
    information
  media: mediatek: vcodec: Add debug params to control different log
    level
  media: mediatek: vcodec: Add a debugfs file to get different useful
    information
  media: mediatek: vcodec: Get each context resolution information
  media: mediatek: vcodec: Get each instance format type
  media: mediatek: vcodec: Change dbgfs interface to support encode
  media: mediatek: vcodec: Add encode to support dbgfs
  media: mediatek: vcodec: Add dbgfs help function

 .../media/platform/mediatek/vcodec/Makefile   |   6 +
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 216 ++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.h        |  72 ++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   4 +
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |   2 +
 .../mediatek/vcodec/mtk_vcodec_util.c         |   8 +
 .../mediatek/vcodec/mtk_vcodec_util.h         |  26 ++-
 8 files changed, 335 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h

-- 
2.25.1


