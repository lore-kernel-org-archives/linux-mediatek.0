Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B07DC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJjSOPCPpzj54WpnhAM7wiI8KIJ0Qro2cqhH2R9x5uE=; b=AFybEoyJGEoEx90WMAZVkLBMsq
	DCXR6Ox5La7jisKfZgHrKhfk48yKEG4w7NaP0WeoOrToDaiSY1+QXBei5Aihmx+caVRxjafh47oot
	iAMabci4nNol+OwcjihhrFJ+EhRcPV4u1w7ZYy6JraLWKO1B4LZiVFMy3bFwEEmECeCw1B7qNXMsR
	QXtlWQ1Jo4Rmox4PVXwp/h1r2Ylnv2eD84PvvcTdbNBzKzO64YyT8YV23vRjh9++hLAVrXEIIr+5d
	3f+WctGyKd00Ka0Nqo2RYyJLjxGH0+FRMTMLRq5segrKwkXBjz7g4Q7ms4deKQuyE1f8kk8xtBHqK
	nSr/V1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXlH-0015Lt-H0; Fri, 23 Sep 2022 01:45:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXif-0014So-Rl; Fri, 23 Sep 2022 01:43:11 +0000
X-UUID: 2c8f85710051423f894447e7422b6735-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pJjSOPCPpzj54WpnhAM7wiI8KIJ0Qro2cqhH2R9x5uE=;
	b=Z+oTTKaT6gVTrsq4I0dHQyu0Ve4TbB45b05McH0m58vdSUnHIv40ZkrcBrqkSdkPcVyXVdvVBgCt8Orq+S7FGw8mf+nhyW5iadNK5caYaZdynj7RtHTVSTHNlTd7tzKsFKs6V3JFgDEvseLHKDmPbAmW79xu/NZkcTvCU/eGWFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bc6c2a00-be35-459d-a9ad-f580b92fbcd2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:bc6c2a00-be35-459d-a9ad-f580b92fbcd2,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:6899f0e3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:2209230942447890NEUH,BulkQuantity:2,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 2c8f85710051423f894447e7422b6735-20220922
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <liangxu.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2116399349; Thu, 22 Sep 2022 18:43:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 23 Sep 2022 09:42:31 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 09:42:30 +0800
From: <liangxu.xu@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, liangxu xu
	<liangxu.xu@mediatek.com>
Subject: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8188
Date: Fri, 23 Sep 2022 09:42:27 +0800
Message-ID: <20220923014227.6566-1-liangxu.xu@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_184309_950330_3E719F30 
X-CRM114-Status: UNSURE (   7.13  )
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

From: liangxu xu <liangxu.xu@mediatek.com>

Add dt-binding documentation of dpi for MediaTek MT8188 SoC.

Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5bb23e97cf33..d976380801e3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -23,6 +23,7 @@ properties:
       - mediatek,mt8173-dpi
       - mediatek,mt8183-dpi
       - mediatek,mt8186-dpi
+      - mediatek,mt8188-dp-intf
       - mediatek,mt8192-dpi
       - mediatek,mt8195-dp-intf
 
-- 
2.25.1


