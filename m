Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD523C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdj61HWUi/unJWhfYCXF7F+ls5p7CncvRKLnBR99P/w=; b=PwAqw/ckfxYMTfEDjVp5mXpHK1
	xTcHm6icKlhFIq4SDQK0oYRCl2r6iZwGSuHaf+9/g71z7iRhMg8PtHpgtRxljqZASTOj60gY9qRxe
	kTDMDt5+3TBDVUNEdaHRDdgpefoLFmQPO/Bk1XJ3Ele5Pp3mGT4Kcuj/Lsl40KcYVtdPFUsBC8dYS
	MbiOr4u6o8Rhuj1/KBtf7hY1utEJuW5mkAszZGMRdOyldz6B0Mw/WN2hVRKrk99rllzihAWjfdEkd
	kwVa+w47wRmEU37vYJxDyfYxTA2gBNml803k2WvmzYjjt9HY8PJZSyf1wPbhxOTUdUDt7PXDGWeEL
	bHfkcbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5i0-002oiy-2k;
	Fri, 15 Dec 2023 10:46:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hp-002oc3-1G;
	Fri, 15 Dec 2023 10:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702637165;
	bh=Sv5bStRniU7BlQ2lH9mBsZ8VDZEclT6+b2lYCvkM7yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tI07Sy1tbkkyJC92kNuBzpUFvGbbH845ZXpo/Qo15BSqjgRDo0ZDSqIJuLWLl4pcw
	 lWp75z2xZjLU+JWhEC7Xcvs8V6oAR3Gr3lb9zjGySN1VA1yYJN1pfC81eBRpZ8QXQK
	 Mm4bQWvHEP/epNMd/kAp3cY+kDM5BU0WiFKiinomSJqysURg5M+jSPWvx8cEu5wYE8
	 Av2Lkfl5K/KCa87lrF396h73z1xtmlzNwubZ2G3Vq7DxKhLdk+toFfLaQbkCj2TEg9
	 82QrCctaJBsmmTMZKsCSJnCTyMPTcZfhUr2xqsC+Por97/hK3msX6JnxsnTOWz0bWW
	 qFXmmp3dB6lHw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B198F3781FD5;
	Fri, 15 Dec 2023 10:46:04 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v2 2/7] dt-bindings: media: mtk-vcodec-encoder: add dma-ranges
Date: Fri, 15 Dec 2023 12:45:46 +0200
Message-Id: <20231215104551.233679-2-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215104551.233679-1-eugen.hristev@collabora.com>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_024609_558544_8FE518D2 
X-CRM114-Status: UNSURE (   9.39  )
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

As IOMMUs are supported, dma-ranges is not mentioned but
additionalProperties=false, thus we have an error when adding dma-ranges.
Add dma-ranges as a possible property because this may be present.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v2:
- none.
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index a2051b31fa29..403530de5624 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -38,6 +38,8 @@ properties:
     minItems: 1
     maxItems: 5
 
+  dma-ranges: true
+
   assigned-clocks: true
 
   assigned-clock-parents: true
-- 
2.34.1


