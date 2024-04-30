Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF11C04FFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 01:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNMGsxn0OLBsFm3paxlvV9TGcZk1pwxKTvl76HU1AYY=; b=NTuUICTKmUIJPNjsVddp93qDmp
	ui8wAoCtkRiXMUiFWAnuwl4o/rQ4LFcWvHMf22FnBqnTiF4dJkvoC/pub3rFAEO+itrlieq5+Yadx
	+RDXLXbj4glwREC0l9OIr/lWsRQhlDPJ4CTFxTNuTtKnA21+mvMzJq0v62KExQGix1NiffnUeqB/v
	jDc1thrdU5fe0HtsywW6ny07Yr/vPYFkpPXRcUAnvgCwzclhjh72buqRFTh43xNxxvRkjwwTLLCoo
	vJ4nQXW2Nr80pIzk6QJXx4Y1e43AsVTtHu/3L+wZtbHNKkutC7bXBXmlt17n7LM9IXM6lhQfOoSR7
	yGZffomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1c6n-00000004eX0-2ljH;
	Tue, 30 Apr 2024 01:16:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1c6g-00000004eQV-2cyW;
	Tue, 30 Apr 2024 01:16:32 +0000
X-UUID: 421eb4e6068f11efa8f1cd58ee6c2400-20240429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xNMGsxn0OLBsFm3paxlvV9TGcZk1pwxKTvl76HU1AYY=;
	b=Jx0ZHp4TAuOrXCkovZ5QWp5/GEWAkKnR8Dq7vNv6Yjk1+4jb++vIgyOW32YbRiGTQ3DnmBFSec80tl2goa2jjZLVLlT0v51w4NIbvdTSEOCjQmqddGSGVLY05aQQvAjFjHuoPHOQjy6j7b179m1Y+/O2wTjm9toonFvdr/El7f0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:199fa899-5e1f-4d2f-97e2-f53fdf977955,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:a1d07ffb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 421eb4e6068f11efa8f1cd58ee6c2400-20240429
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 330448974; Mon, 29 Apr 2024 18:16:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Apr 2024 09:15:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Apr 2024 09:15:50 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>
Subject: [PATCH v4 4/4] remoteproc: mediatek: Add IMGSYS IPI command
Date: Tue, 30 Apr 2024 09:15:34 +0800
Message-ID: <20240430011534.9587-5-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240430011534.9587-1-olivia.wen@mediatek.com>
References: <20240430011534.9587-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_181630_759197_50373668 
X-CRM114-Status: UNSURE (   9.17  )
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

Add an IPI command definition for communication with IMGSYS through
SCP mailbox.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 include/linux/remoteproc/mtk_scp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 7c2b7cc9..344ff41 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -43,6 +43,7 @@ enum scp_ipi_id {
 	SCP_IPI_CROS_HOST_CMD,
 	SCP_IPI_VDEC_LAT,
 	SCP_IPI_VDEC_CORE,
+	SCP_IPI_IMGSYS_CMD,
 	SCP_IPI_NS_SERVICE = 0xFF,
 	SCP_IPI_MAX = 0x100,
 };
-- 
2.6.4


