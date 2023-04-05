Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46116C76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tL0PTHX4DJqI3vZdQ1ldG1OnbOEK+IocycHnZXU9JR8=; b=GzQpbbArMzM2e/lPis0zl+z0dz
	+JmYnsd8h8fqRb/LawnYiE5hAzsNhnSNnRCDSDcWLGlc6Z1TAsiQMOIXpSKqPiQMIB+iBHFbDklDb
	bXZBoY11q0oxVg6T8hCY7SJSFMM0C++ewT9G0H3Y0wAW/fRafEuaxIxhrOA5EZCgQUJxh5qpq1I65
	NWBjiF4GFbm0AwE8H0yog/gXLqAmjYmPIFYEiA8pzi/iu3uGs3WzW7bGMgNzjsUCR4YoLMrEPFOax
	1xioCzwnfzr+9bs9RQwx2Q6xHEe7ZCZsuFUu/20y63V4nCGk+i5aplXK2Vsj4e6gG+RbiEbLmzKyX
	iLJA89iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4UD-004jFV-1R;
	Wed, 05 Apr 2023 14:51:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4U8-004jDY-1I;
	Wed, 05 Apr 2023 14:51:41 +0000
X-UUID: 5b037bf6d3c111edb7d8d11f642b8e78-20230405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tL0PTHX4DJqI3vZdQ1ldG1OnbOEK+IocycHnZXU9JR8=;
	b=Atlurp/28E2odzrd6oYiicTG1m4o73LJ10VPZQF14qUo1VoVKX5KrnE30r+8zFrBun58gyLZrTkJ0HhZYHDhcglk6OttygHMybkxadZ8nJeKY9el5dy10XJHpIaYUxXgNmhAIU7dN1sVMSN3ggH+vQjrB0iEc2cPwVl54Qw/J44=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:46e6c7da-50cb-4120-a8cb-d0a5bccee070,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:46e6c7da-50cb-4120-a8cb-d0a5bccee070,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:ace6d9f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230405225134T7RNCUUY,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 5b037bf6d3c111edb7d8d11f642b8e78-20230405
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1219360680; Wed, 05 Apr 2023 07:51:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 5 Apr 2023 22:51:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 5 Apr 2023 22:51:30 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Jonson Wang <jonson.wang@mediatek.com>, "Jason-JH
 . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/2] Add dynamic connector selection mechanism
Date: Wed, 5 Apr 2023 22:51:27 +0800
Message-ID: <20230405145129.18835-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_075140_440656_1268BF62 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

To support DSI and eDP as main display connector without modifying
mtk-drm driver, we add the dynamic connector selection mechanism.

Jason-JH.Lin (2):
  drm/mediatek: Add ability to support dynamic connector selection
  drm/mediatek: Add DSI support for mt8188 vdosys0

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 113 +++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  28 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 +++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   8 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c          |   9 ++
 9 files changed, 220 insertions(+), 11 deletions(-)

-- 
2.18.0


