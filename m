Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78356C54E65
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 May 2025 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPUaMSMEx0OFqwycv8XXQw9CFu0jRQY3FjVb+3D5Lz4=; b=d5aoTLjgp+rpwYMsxefaNHwtiw
	vFMp3VJ2J2BmwvVDAcKJTOVBruGnIMK226rWFls2m+xwgfk0H6e0oyA10KnN1wPLrJpfB17bR2qDy
	FbVPf5E1upY3n+rED4ypWAHUJPRT/64rajVFVW8jzaj4Dvl3wcj8leD8AJXmewxSjojO8WZHl3G0a
	kv4A4cqY+9xaTWO35+CykOKR5Iyz2TAGQCEMteDIKkP8MlxBGEzMj2n46U3rFIJ0nfeirsi7UV8Er
	B46+/wP7MsF9yyk4WzqAVZNPM2s9YJWugFsK7k7AqmLpPW+d4+jcNu4YEUkIpyzNTkUCF6wrC7vn2
	24CNvT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI80Y-00000001ScU-2pBH;
	Thu, 22 May 2025 15:38:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7TO-00000001N82-2Tni;
	Thu, 22 May 2025 15:04:43 +0000
X-UUID: 1499b3c0371e11f08d385d50fb11b32d-20250522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cPUaMSMEx0OFqwycv8XXQw9CFu0jRQY3FjVb+3D5Lz4=;
	b=pzTiSvHcy0JuSVP6HzOY9uDzo48dLfjz6+n3mlk+nH4A0o8TXltZa3yLQg4SztGzn48z0yzN0I3uGLpuGwA9hK/WegRrpKrgijNtP//SMDTlnebqxNE6TxfkaiKHlB9TkTkecL3os6/vdEd6+AJjf1RvD+T+erkeg8ZiGjb4c6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2fbc003a-81f2-48ab-a5c0-802c492313be,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:899bdd57-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1499b3c0371e11f08d385d50fb11b32d-20250522
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 123935798; Thu, 22 May 2025 08:04:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 22 May 2025 23:04:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 22 May 2025 23:04:34 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Subject: [PATCH 0/2] Add MT8196 VMM driver support
Date: Thu, 22 May 2025 23:03:32 +0800
Message-ID: <20250522150426.3418225-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_080442_639003_81B27EBC 
X-CRM114-Status: GOOD (  10.52  )
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

From: Nancy Lin <nancy.lin@mediatek.com>

Add a driver for the MediaTek MT8196 VMM (Vcore for MultiMedia)
controller.

Nancy Lin (2):
  dt-bindings: regulator: mediatek: Add MT8196 vmm controller
  soc: mediatek: Add MT8196 VMM driver support

 .../mediatek,mt8196-vmm-regulator.yaml        |  70 +++
 drivers/soc/mediatek/Kconfig                  |  12 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-vmm-drv.c            | 471 ++++++++++++++++++
 4 files changed, 554 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
 create mode 100644 drivers/soc/mediatek/mtk-vmm-drv.c

-- 
2.45.2


