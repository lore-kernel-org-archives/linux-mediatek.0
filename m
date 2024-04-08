Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DB2CD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TEMDozC6Ki2lBDJ5ghbWs8zLTRgjLfZD4IzGZksn5F4=; b=JZIKm8maWu/wTDefdZG4bWCQuZ
	HAarhpMYPZ2wwDet4ObnctBlXyzNF2Z9h2XZxlM1BI0THRwEfofrOSaaE6fGP9nPj4X8irKvWe21l
	Z+eZAZbC45bLPLyA/4NvDEVWlNewh0zML0d95/f/Z1KhmREp5j0AWv+i4quzSO5VTdWCW492Um+cb
	9HGEUtBTfcetoR0xf4jwYRqYHbqyDpGL2SuI8FZlxrmahgtkK2buplVyO6qWoXDd81JYnN20zC3hP
	qlVMfUFh6e06Csy2/+JU6hFuVLcqZnDfcYyFilVJIodPlHEjIQZ7dZJykxb46QZnv81ZTNZixNUIY
	L4N3Nk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk3c-0000000Epa4-11Rx;
	Mon, 08 Apr 2024 08:08:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk3V-0000000EpWw-3Cbr;
	Mon, 08 Apr 2024 08:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C714CE0E3C;
	Mon,  8 Apr 2024 08:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59450C433F1;
	Mon,  8 Apr 2024 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712563714;
	bh=Uov0ir20j4odI6p1u5vs5WTkiCa18dZ4q6slRFfyyN4=;
	h=From:To:Cc:Subject:Date:From;
	b=cz6kskoCau8Xii27F8rmNEguEqAR4XvL9X1pTR3Lhks/B8DJfWFrhL2GIAsBOu3d9
	 wOxiTxLur5Ark1m6GlHDEjdIWmITefAYaKEmYyLmJwMriqN7Y0wZ2RWMTn9q7az/VX
	 5MZhX6OiT/nXSznfvox1EnKe/hSFZo7SpNvFz3a6zI/Yj3M8xPS0mfU94+3l/yHjFH
	 7jPr8t4p4gpnSAYU5Ecce0O3rClD31iOStkZHlvdqvTFsEMngV7Qpc0KkcYu2FIhoj
	 aq/fI1hY60R9x7235AJMfM0a4RPaGzbuu3LyMi8DnL/R6pQ8sk/oYzZu97iVT3Y1ad
	 o9b8x/4SUHHkg==
From: Michael Walle <mwalle@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
Date: Mon,  8 Apr 2024 10:08:15 +0200
Message-Id: <20240408080816.4134370-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_010842_098203_27CCF9F0 
X-CRM114-Status: UNSURE (   8.98  )
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

Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
computer.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v4:
 - rebase to latest next

v3:
 - drop description and add to mt8395 existing entry

v2:
 - convert enum to const as there is only one specific board
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index d986b160fed1..72be45853fe0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -359,6 +359,7 @@ properties:
           - const: mediatek,mt8188
       - items:
           - enum:
+              - kontron,3-5-sbc-i1200
               - mediatek,mt8395-evk
               - radxa,nio-12l
           - const: mediatek,mt8395
-- 
2.39.2


