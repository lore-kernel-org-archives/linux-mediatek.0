Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD73606A333
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gNrtm92L;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sbgmN8Di
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MjkoJnpst7G6VGEXYYTLIfIiWtWhE+3drC8cmCbx6v8=; b=gNrtm92L/LPRGGSAxkry0A4mY4
	PxpvIjdSUE42xIW29WH/Emh511IcVCICKi73W8VLIrwafY8zt63nAVUIgc8ylgVfq21zi7sQwakKL
	ZM4XPDk3EkJjV2CU+y/SD+AFNoC+KEd7Qkm0nEPRm9QuT597rJtO2+bc7CEmkA4R9NPLfv+qqTyRu
	UsBwYL2DqPN5FV6uvRDZ2cEVYkjC0/kpC0u0OlFZNveWm8vu0f4nPgcgYkcZNdk+HD5Hgv1mU2z3D
	ubC6KS+I0i6HaY4++8QttZHtxQF3AC6a5ElvQobQxK8I1JC6v8LzUrUixoY2OJns2UImAlfEGQiSQ
	qcnsBjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF2C-00000004z9A-1wIS;
	Tue, 17 Nov 2026 08:59:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF1k-00000004yk4-0Rk9;
	Tue, 17 Nov 2026 08:58:57 +0000
X-UUID: 1c7c780ee26511f1afed4741b24580c9-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MjkoJnpst7G6VGEXYYTLIfIiWtWhE+3drC8cmCbx6v8=;
	b=sbgmN8DiQMwTkuuad1GKYR4T3i+o0rsw/xthGs44N/0uSkU5MGcb5yHl7WXbZhkKgyQwtbTXNf+jON8Oencdu6k4xvKzSo9E/VDFcLC4OrwmK/G/jOCqbEvQKIv6P65I2F+nL4qE9/UWQL0MEM3yZoPdJOAoXs0PXnNh6h+3uHs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:71971f38-cef4-4a18-844e-f900fc64ef16,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:d051d468-3e14-418e-b6e1-a5867ce0027b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1c7c780ee26511f1afed4741b24580c9-20261117
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1930334862; Tue, 17 Nov 2026 01:58:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 16:58:49 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 16:58:48 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 09/10] dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
Date: Tue, 17 Nov 2026 16:58:32 +0800
Message-ID: <20261117085834.1464723-10-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
References: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_005856_191809_B5B67206 
X-CRM114-Status: GOOD (  10.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add MT8189 encoder compatible string to distinguish former ICs
MTK's. Compared with MT8196, the maximum resolution of MT8189
encoder is only 4K, and the fps is only 30, which cannot reach
the highest parameter of MT8196: level6.2, 8K@60fps.
Compared with MT8188, the level can only support 5.1, which is less
than 5.2 of MT8188. But the maximum bitrate is 100Mbps, which is twice
that of MT8188. And MT8189 could support NBM mode.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 820cd8da4..4cb5b8fbb 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -22,6 +22,7 @@ properties:
               - mediatek,mt8173-vcodec-enc
               - mediatek,mt8183-vcodec-enc
               - mediatek,mt8188-vcodec-enc
+              - mediatek,mt8189-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
               - mediatek,mt8196-vcodec-enc
@@ -105,6 +106,7 @@ allOf:
             enum:
               - mediatek,mt8183-vcodec-enc
               - mediatek,mt8188-vcodec-enc
+              - mediatek,mt8189-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
 
-- 
2.51.0.windows.2


