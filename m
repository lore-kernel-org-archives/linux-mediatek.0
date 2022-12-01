Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A3DC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHeT3yXVPWvCSOIN+Onrtmhr0jCXTDI/WiWqFwTtrlo=; b=u4aaF5+yp6dsjuBxMfH/MUZKOl
	OlKOEzMpf+qk6vdgsmgrEqL5cqBByKG8cnYsCUHRgC7khTh+uOmluUnMWyAF5SOWT7Kh6c4wqOTYO
	yK01z7GCpGOjO2tQ8HMsEMNAJbWWjLQ0FWG1fjWrjLRyL+KnpTj5OlTxGIvnZUl3SQFVcABwQffTt
	hFLuuTtRPn3am5bOCMPQpLEXNEJv16eKZoqMWeYAL+HyTizfBdKTFLzxfiBIqH62kcS3tNE0Zd+Gc
	uSALsYez5QzIphBsZwW+i9nirVjLv4jKORcRyGVNlvs9iAajr+1m8i2TrFqe8T1C819K6kFFDgZCh
	WzHmjGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dvV-005UuS-I9; Thu, 01 Dec 2022 07:24:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dvT-005UtD-NE; Thu, 01 Dec 2022 07:24:09 +0000
X-UUID: 3e8af9e31679450ca19f6ecc4ea3dd4b-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OHeT3yXVPWvCSOIN+Onrtmhr0jCXTDI/WiWqFwTtrlo=;
	b=nuDwtQqeCMU4eovHEHes8iKr9wU5gpueebGOAy9ec/smuVFoVR8eqgmQDGbUW0kro6VIqiatv5i415NM4zMdvcrN2I2dzmzhn/NgDBowWFQHtspXYWkNK1uJRs5MPEIIaYkrloOkZgc4bOPMBMaJ9jmzSOBI6uajqkNOb024LuI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:161fa2f8-99ee-4f0f-94ff-6429e993eb6e,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:dcaaed0,CLOUDID:82705b30-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3e8af9e31679450ca19f6ecc4ea3dd4b-20221201
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1324085006; Thu, 01 Dec 2022 00:24:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Dec 2022 15:13:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 1 Dec 2022 15:13:26 +0800
From: Elvis.Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Elvis Wang
	<Elvis.Wang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/2] dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name
Date: Thu, 1 Dec 2022 15:13:16 +0800
Message-ID: <20221201071316.24583-3-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201071316.24583-1-Elvis.Wang@mediatek.com>
References: <20221201071316.24583-1-Elvis.Wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_232407_788754_6F83324F 
X-CRM114-Status: UNSURE (   7.64  )
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

From: Elvis Wang <Elvis.Wang@mediatek.com>

Add mt8188 compatible name.

Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index c579ac074ca7..d383b2ab3ce8 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8173-gce
       - mediatek,mt8183-gce
       - mediatek,mt8186-gce
+      - mediatek,mt8188-gce
       - mediatek,mt8192-gce
       - mediatek,mt8195-gce
 
-- 
2.25.1


