Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DADC4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 05:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yw30OqTt5AJHEMjDxcvTzl5oo4axO9cwqzp5IcfvIJk=; b=BA1h7b7OZJFeCtITmqRaRwfJmt
	0eQRlyUpHY33b0Fs53jZiCDiQq/e35r/Nd+dS/2LwJYhMFgqyjoj9VEb5KddYpA48ymHdXHVJsRvU
	pkFgpjKSOMMxmJNZf5GEEIEJx3csMiNe8eyt1L+LsjjixVvauD44D7/xZ+LFyE2msX7CLWIlZJHKx
	lyjzYVFjrxT76PxAmFpgTcjdvmqZjTC6hXxgBZg/LueI5xsolsJyW8zBnh9anpG1jpBVF/C6tvy2Q
	lJINUznTjTsIirW8dTO6oJukeHvnr2eQVvRNFItbEfhOL2Qxg1qmZ1r4Wn2Eu+fsRqG0vrdPGrASx
	xU4kMsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWrtz-0000000270X-0ojz;
	Mon, 05 Feb 2024 05:52:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWrtu-000000026v6-2EEt;
	Mon, 05 Feb 2024 05:52:15 +0000
X-UUID: aea67424c3ea11ee9a263b4415211400-20240204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yw30OqTt5AJHEMjDxcvTzl5oo4axO9cwqzp5IcfvIJk=;
	b=a21RSwvOU8gnqph+tTxW52QNND2T9phXD5hNO+lNa2XqbYwmEB3/43gAzqmDbh2Gq5VC0ew3jEtwpES50FyXQWm13uQwhs9VUYRt1pCAkE+8h3zqQ/NxxGknKn3eyOOfMtMJFaZZHdps+5hNRBHY15HAMNSWapYH0PtCtmePx1Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:8766ce3f-fb7c-492a-8c41-9eed9c475a9f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:d6b51f80-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aea67424c3ea11ee9a263b4415211400-20240204
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <mac.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1806673218; Sun, 04 Feb 2024 22:52:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Feb 2024 13:51:26 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Feb 2024 13:51:25 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <mac.shen@mediatek.com>, <shuijing.li@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] Add HDCP feature for DisplayPort
Date: Mon, 5 Feb 2024 13:50:35 +0800
Message-ID: <20240205055055.25340-1-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_215214_591080_D8491D77 
X-CRM114-Status: UNSURE (   7.71  )
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

Add tee client application, HDCP 1.x and 2.x authentication for DisplayPort
to support the HDCP feature.

mac.shen (3):
  Subject: [PATCH] drm/mediatek/dp: Add tee client application for HDCP
    feature
  Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x feature for DisplayPort
  Subject: [PATCH] drm/mediatek/dp: Add HDCP1.x feature for DisplayPort

 drivers/gpu/drm/mediatek/Makefile        |    7 +-
 drivers/gpu/drm/mediatek/mtk_dp.c        |  324 +++++--
 drivers/gpu/drm/mediatek/mtk_dp.h        |   99 +++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c |  589 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h |   46 +
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c  | 1021 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h  |   52 ++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h    |    7 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c       |    3 +
 drivers/gpu/drm/mediatek/tci.h           |  156 ++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c   |  598 +++++++++++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h   |  414 +++++++++
 12 files changed, 3230 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
 create mode 100644 drivers/gpu/drm/mediatek/tci.h
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h

-- 
2.43.0


