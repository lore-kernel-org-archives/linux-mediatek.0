Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DCEC4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=In9W5EgdkU7a4QBxzIaCDmagtpQjNfrjtKnBMS0D15U=; b=FCjqFg2KKoJwW1
	eyzle0Fd+7/p4Uc/2wSbVigNiZEUh5S0StPAhrUyMenmLZOL3QnrsZBQ2uo6/heddZYJPZ4Bdp6BP
	z96Av9bRfDciGBTlHTK3JrnEe/0AbbvhMlXRyZvWP/bBaw4umi3uLAmX2abQMHgA3Wy2/LnkVxFHx
	4sbH+CjCV5MDr/b40Ms9Ag4WyQcVCnI1rcGBQjLcux4gUYRZ1AoTBa8Y+OYa7t3GIxSGdRTkllMbC
	PKNnHIn/IQj4fPNw1SFP+UQ816pw5Ki0t39c+b1vbzba6YzGIjwofPF2twXqn1559iSRNZAzEuR+7
	dRIrnO3HivYi86+JyEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozG4Q-00B66g-Pq; Sun, 27 Nov 2022 11:43:38 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozG2p-00B5JI-De; Sun, 27 Nov 2022 11:42:01 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 17B875FC7C;
	Sun, 27 Nov 2022 11:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1669549314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=In9W5EgdkU7a4QBxzIaCDmagtpQjNfrjtKnBMS0D15U=;
	b=Udff+wwMTpcNHQjyz4X+T/fDS74TF+cvj7xyOMfRTX4vE4j1G/tt0gXiM21m95uf/5TCNg
	EQJ5Ibj+lXCAL5X3MOlC2yT3Mwogf+tv1Ao9DuLlOQTz9ljhB3GJgcwfcjfOxSMvAAWZkx
	6iZ3CtbTQypx0OJ5Pm64nxD2Fi2kDCk=
Received: from frank-G5.. (fttx-pool-217.61.157.144.bambit.de [217.61.157.144])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id BB5341226D4;
	Sun, 27 Nov 2022 11:41:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [next v7 2/8] dt-bindings: usb: mtk-xhci: add support for mt7986
Date: Sun, 27 Nov 2022 12:41:36 +0100
Message-Id: <20221127114142.156573-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127114142.156573-1-linux@fw-web.de>
References: <20221127114142.156573-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_034159_646980_5B88C17D 
X-CRM114-Status: UNSURE (   7.12  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 939623867a64..a3c37944c630 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -28,6 +28,7 @@ properties:
           - mediatek,mt7622-xhci
           - mediatek,mt7623-xhci
           - mediatek,mt7629-xhci
+          - mediatek,mt7986-xhci
           - mediatek,mt8173-xhci
           - mediatek,mt8183-xhci
           - mediatek,mt8186-xhci
-- 
2.34.1


