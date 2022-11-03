Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BBDC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 03:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N51fkS4M4Fj0+621De0CJlc7z4Kpvdo03m8ggJ4l7E=; b=wzjgK1GcQXdkTAVV2ff8RFQHpM
	VWcFxPQUBYgAkXNWLoj1tj8j70AYAR1ua7ETgd8//22x4bOQk2DUfD5Fiyttm3u9gs1ka+dFyxM6P
	6ELyCTRTcfhkyZgukmF5N9f6pQkUmdJcxZl5LitXPQBJ6vvbrMK1SKhjToHuzeNu4nPAqwPZWypAo
	D/m3ZmEEqynK8P6E0YjH7GH9mwfqb95fsx58oUL7TrXAaMvrfhknOjjdeR7Qo5q3kGX/MxLB74kHw
	yLtFyvLlLDC4N671C9o7WVcRGa0/D85bE6z/O0O8i6Eb17dO784HeZtfNAoWQcafwCC4FIO4T1iBD
	n94j0LtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQrx-00Fl9j-KZ; Thu, 03 Nov 2022 03:26:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQrZ-00Fkv9-GC; Thu, 03 Nov 2022 03:25:55 +0000
X-UUID: 4f70839d859548d5a23ff32fabc8a882-20221102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0N51fkS4M4Fj0+621De0CJlc7z4Kpvdo03m8ggJ4l7E=;
	b=Dc419T3j8QLz3MzlEPZz+JWcukR/o41IRe2L2SmBKF1lHrBSK+lE0ZEPbk9lZKX4hHiQF6LfVqIC04Ig2IvlVjSQwJFV+HFSdfrH1mAoej72VTepD4WISVtMXxW+YRnbDttv6Y6T+GqDPNlrAYib663cjstNWLpYIlUXjJXNS8s=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5e635ead-4d03-413b-8985-5fdf970c4e1e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.12,REQID:5e635ead-4d03-413b-8985-5fdf970c4e1e,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:62cd327,CLOUDID:157e46eb-84ac-4628-a416-bc50d5503da6,B
	ulkID:221103112536R3TLLD22,BulkQuantity:1,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 4f70839d859548d5a23ff32fabc8a882-20221102
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 377806057; Wed, 02 Nov 2022 20:25:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 3 Nov 2022 11:25:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 3 Nov 2022 11:25:14 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	<nfraprado@collabora.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v27 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible for MT8195
Date: Thu, 3 Nov 2022 11:25:02 +0800
Message-ID: <20221103032512.9144-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221103032512.9144-1-nancy.lin@mediatek.com>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_202553_562023_CEFA2801 
X-CRM114-Status: GOOD (  10.37  )
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

Add vdosys1 mmsys compatible for MT8195 platform.

For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
2 different power domains, different clock drivers and different
mediatek-drm drivers.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Change-Id: I8065205ce44baa417f58176adaae9e1eefa6eadb
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 0711f1834fbd..67b6e1cbe418 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -48,7 +48,9 @@ properties:
           - const: syscon
 
       - items:
-          - const: mediatek,mt8195-vdosys0
+          - enum:
+            - mediatek,mt8195-vdosys0
+            - mediatek,mt8195-vdosys1
           - const: mediatek,mt8195-mmsys
           - const: syscon
 
-- 
2.18.0


