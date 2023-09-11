Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC632EEB57D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gElX76EooqTMgZPTL7giI+XlGA/O4bjKB0y+ZAuWYS0=; b=AWdEEWO31mKMEGKvnr2azg7wTb
	1Au68PSHxx7fwg1W5/A3NBsecRipgXYTGlDGgsqq0epmZirfwUM0FpK5pRT2eRZrgfY9rhRhhMU/P
	Md0UYzNcRnfYGGMwXFFWk9jd/SBvPrNQ7SptF7l/MFY097sovP9dp5raOfD43SAPpv5BVYhPKQuaI
	kS0PLXeaEbVOOzS8vA9fTxvMWJsFhm+Tx6+lRpfR1JPmfVE2z5RmugAdz84H5fs7o++C/C+h7MU/2
	yTB4PRYHx5Aj2kRzw8czVFchTG+IeL2XEyFoLohLBjYrUGdPVv9w2KiS7RfGikBz0GbKFP96j9ugN
	9alqXGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfecN-000Ki2-2G;
	Mon, 11 Sep 2023 10:58:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfecK-000KdT-1a;
	Mon, 11 Sep 2023 10:58:10 +0000
X-UUID: 0feb5c94509211ee9b7791016c24628a-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gElX76EooqTMgZPTL7giI+XlGA/O4bjKB0y+ZAuWYS0=;
	b=BXIiaclQk3XdnrOCTIDkqRCukwJJwzNQeyejf2b++Go+DT2OI/gzVItXmwdugcqKZH/GjfbQw/b5ZLC/aYEPGqAMQ4w2FIuRLfhWnPdd/ndtlm0HS+fypj4zv2X6loQmN36Uccn1oX+pC2rgmDitAIhPJ9b7nVDHzYmmBhcM5FE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:0524eeea-f2e9-4984-95a0-9aed0f75e49a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:ebf1e3c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0feb5c94509211ee9b7791016c24628a-20230911
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 112620020; Mon, 11 Sep 2023 03:57:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 18:57:20 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 18:57:20 +0800
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
Subject: [PATCH v3,0/3] Add mt8188 compatiable for DSI cmd packet control
Date: Mon, 11 Sep 2023 18:57:33 +0800
Message-ID: <20230911105736.11752-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.997700-8.000000
X-TMASE-MatchedRID: yvDAzrttxFXHCChNBbZThTvfsoCuAcP+h+w9Wz/xXDqIDxaki6CTmJgZ
	2+o9ceX07wgYhNgOzKL/Z0qDAfk1Q6Gsq9dfniq5A9lly13c/gGeEP0DdJrulp2iHEDAUb20o8W
	MkQWv6iUoTQl7wNH8Pg1fA1QHegDv3QfwsVk0UbtuRXh7bFKB7r+k1NFlulNIlZGidBa7H0aVZ3
	zXfISSyJKTX6EwXfWI66XHIc5w+gc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.997700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9F65558BB8E37DB6576E9BCA47856FDB2071D16DFB4AB4D407FEB7A2A12D17432000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035808_528561_6F809861 
X-CRM114-Status: UNSURE (   7.04  )
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

Add dt-binding documentation of DSI for MediaTek MT8188 SoC.
Because of the difference between SOC and DSI cmd packet control, for
MT8188, it is necessary to increase the DSI_CMDQ_SIZE control when
sending long packets to initialize the panel. Of course, this will not
affect the sending of short packets.

Base on the branch of linus/master v6.5.

Shuijing Li (3):
  dt-bindings: display: mediatek: dsi: Add compatible for MediaTek
    MT8188
  drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code
  drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c

 .../bindings/display/mediatek/mediatek,dsi.yaml     |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c              |  2 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c                  | 13 +++++++++++++
 3 files changed, 16 insertions(+)

-- 
2.40.1


