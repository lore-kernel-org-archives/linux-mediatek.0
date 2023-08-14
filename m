Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1F2C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 07:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=twJrawqYNsLX5OYiSHLJ8K+fzkDnTpMm9uFy2cIxYJY=; b=LK4nh3J2pWXhvjx+kR/JsRhljF
	ohZ4w+8ebpA1SxMU3XBBhvlc0YU6BprH4xe7/5trKgA1zd6B03vzz9NEqV432TZx5jEvISMvVvMLX
	wB7ZPxoDzTIPwnglcwfagC0CHe+vviAhUP/oPtuT9oqhYmC7xku4Akxz+c41Ti+Y0UMUmolFcQ9X/
	hVrqsEiA8gY5o/GR1E9YhCMGC8NI8okMB2EjNMwMnxS0zT3Dc6+5Nijf7mpC6V2upDstbVVxy2yxy
	R7BM2+OTYN2hUmvOgWI8i5o4SGnzjM5n+u0nwe7hpedDcSQCVcKQ4qX1cFG12dRQPy1Ayenj9fbxd
	uUfTkH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS0K-00GMkj-0J;
	Mon, 14 Aug 2023 07:28:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS0H-00GMj1-1G;
	Mon, 14 Aug 2023 07:28:42 +0000
X-UUID: 2d6b2ee03a7411ee83ed1395ce914268-20230814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=twJrawqYNsLX5OYiSHLJ8K+fzkDnTpMm9uFy2cIxYJY=;
	b=BiShEad1gL0qwkpDsonxxY2Zf4RpZVU4J7VSX2BkXGeniX6hFtSjUBp007HBdK3fElzxAaR9Yiv+j/iBkRsLkzsseLHl5sOqkp4uL51KE05D2C5Uevp4kg7R7FsfrzPM0KOfZkSQuoQwZ1mtpKWi1vGpgHo+Rv7zFJDMZTEqnBA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:5f3ea300-1768-4c9d-b07b-c88992ba06ff,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:5f3ea300-1768-4c9d-b07b-c88992ba06ff,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:f5c24c1f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:230814152837NWQXQBYU,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_SNR
X-UUID: 2d6b2ee03a7411ee83ed1395ce914268-20230814
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1657856141; Mon, 14 Aug 2023 00:28:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Aug 2023 15:28:32 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Aug 2023 15:28:31 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>
Subject: [PATCH v4,0/3] Add compatible to increase MT8188 audio control
Date: Mon, 14 Aug 2023 15:28:39 +0800
Message-ID: <20230814072842.28597-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_002841_434320_A4FF75A6 
X-CRM114-Status: UNSURE (   7.15  )
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

Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
Mainly add the following two flag:

1.The audio packet arrangement function is to only arrange audio
packets into the Hblanking area. In order to align with the HW
default setting of g1200, this function needs to be turned off.

2.Due to the difference of HW, different dividers need to be set.

Base on the branch of linus/master v6.4.

Shuijing Li (3):
  dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
  drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
  drm/mediatek: dp: Add the audio divider to mtk_dp_data struct

 .../display/mediatek/mediatek,dp.yaml         |  2 ++
 drivers/gpu/drm/mediatek/mtk_dp.c             | 36 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 23 ++++++++----
 3 files changed, 54 insertions(+), 7 deletions(-)

-- 
2.40.1


