Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A739DC74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 03:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GxBeCh6RM3G8NOC3XFvl2usolXzqoj9++sY2YNJMdro=; b=iqrf3JCSAqzf1btw1ZnCG52F6e
	qPpqe70z2jI9LZcwQq0et3PRH9QIWEJKhLpwmdXtLOPdgw/rDZ1nQfwqgtel8CR20nAo3GlghD/RF
	Z+AECbXUhwjplD2g0pA1PDLJLIna2U0E22xPPoPWNrmWt/VR+M+1tN3yCH7ZBcsOgv4pI3DV7nUJ0
	ostWMGjNjRj5tyxAN/4gfX1IUVCRjsqT/ASQ6raYoJKP/NGR2UgGdp7aCTNiVWo6Sco/DnXySpySL
	icRcmMXijJaZVxyngUZNRiu4XZ/MyimKi0FcTk7pg/cI3zL4CmOCL545H4p3jRolXFwwhzd1UliKj
	rzB0mCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phiwH-002Qdi-0m;
	Thu, 30 Mar 2023 03:27:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phiwC-002Qce-0x;
	Thu, 30 Mar 2023 03:26:57 +0000
X-UUID: b652d716ceaa11ed8687db9d93187ff1-20230329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GxBeCh6RM3G8NOC3XFvl2usolXzqoj9++sY2YNJMdro=;
	b=mHT0ciApD7Rfw01hxrw7vmvuqj/rJU0MCG/ABr4iz8vK+l4p88WVw4h7FlzXp+cR01sNV7LlAk6gXVozhuLDPDRpVR7GZSqXznKDpHB1rH3jTlsRKWbp1wBbgHhwhdGof1xMP78ljTJBOGd80fuwaC8rLzTKWa7r7qVFnsXP4sI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:94e5a4c9-08cf-43f1-bd34-c98225ebeb7f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:7a5a5af7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: b652d716ceaa11ed8687db9d93187ff1-20230329
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 578810717; Wed, 29 Mar 2023 20:26:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 30 Mar 2023 11:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 30 Mar 2023 11:26:15 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<singo.chang@mediatek.com>, <shawn.sung@mediatek.com>, Nancy.Lin
	<nancy.lin@mediatek.com>
Subject: [PATCH v3 0/2] drm/mediatek: Add ovl_adaptor get format function
Date: Thu, 30 Mar 2023 11:26:12 +0800
Message-ID: <20230330032614.18837-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_202656_334846_B1BF37B6 
X-CRM114-Status: UNSURE (   8.46  )
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

Add ovl_adaptor get_format and get_num_formats component function.
The two functions are needed for getting the supported format in
mtk_plane_init().

Changes in v3:
 - modify for reviewer's comment in v2.
   - add mdp-rdma get supported format api for ovl_adaptor driver.

Changes in v2:
 - remove change id

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

This series are based on the following patch:
[1] [v8,1/3] drm/mediatek: Refactor pixel format logic
  - 20230309210416.1167020-2-greenjustin@chromium.org

Nancy.Lin (2):
  drm/mediatek: Add mdp_rdma get format function
  drm/mediatek: Add ovl_adaptor get format function

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  5 ++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 14 +++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 ++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 24 +++++++++++++++++++
 4 files changed, 45 insertions(+)

-- 
2.18.0


