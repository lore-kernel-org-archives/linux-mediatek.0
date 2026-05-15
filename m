Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C06CCD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=; b=3D8Qke1+0vcmrtgIoAzxdbkJ1W
	IWKiMnd50yJAKFLjNiCgvkVJb3Rw2srl5UX8s1yAg/1+DiloeXxOXAquzqrRZlOuINzJUJqqE0win
	zYw1fy3hswt6fdMDG6RsJ2FDd4sExZqJ3ssLRFcGAPJXATkQsp2ZV3T3BXSAhe6+m7zcO2/StScNk
	zTwTBaO9JtxrqYS9klA1RFfW1eqvxrM4WsHwOuxdMPKRQU9rzaDPLWs6e1rCBe5mR5F1xMpUrF4l/
	Y3bJ2W7bHt0KRvTtL2QzlX8WNSorYauETFvL1ibLLyRf1fSvK0eInKx4fANfai/Etk4qZYpG10SUg
	OfhsAGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRJ-00000007oyo-0PHA;
	Fri, 15 May 2026 09:02:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRA-00000007opD-40O3
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-369576666d5so249206a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835748; x=1779440548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=d85x2wnd2+w1uW9roM+P8EuRDpWiSFCI1gkqegiyyyziB6rjqEEXbw27ltr5haaHbb
         IHGiHtYm/o1rR8a2SCvbpt4mAkEj9DoGGDykAxIJEEzKSmd178kiX+Rjb2ocyGuuvfiF
         XLjEcuGfJAgH+EsrIVO9JPbsDk13180Q+CfA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835748; x=1779440548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=pursQY+C7qzRszJMjT0Af4Qy0h6gVP2FpoqZ8ApGly2n3+vaVma7nN+fgeMJBUPSex
         cFKNV5EgI+UD/aqHpzdo8TTzTgQZbytE4AqRk1NkafOfQkCnDwsyULJRgIB5cx27DlwG
         yFUlXQwT3gqMHAw5i0YJkcX1L8uEQzEwbPrpqZTc3ios+JgciiJlWwU/hWl668vWoE47
         O11fpx3ht/UesUZYtNnji7H+QlxtOa2PPdoRr2OnAf1Qj0MOqsQ2p5l3rw8dXQI2uNXm
         VDXUg2LTt0qhYe6gKbzgDvaUQT1DFSQxBM70sU1Ix0JVCWHu2PcQAW2iu9ICHKvj+TmY
         lFUw==
X-Forwarded-Encrypted: i=1; AFNElJ9tm9EAbPKOXzLu7+2zzZbSC+PgjPNsEw9WQ8e13IMOpVflod07cTRm57KSgoF/57i9vSQBNvBWE2aZO1ZYZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiKhJn3W27REY27uy+kKJf5CqhEJcdFxctxkkuGcvhTpvJr78X
	7xJxGRCl2Iw02juEAkI3PrLzPJCQNo6K/5h6A/evOn/MKxuGo9sKeUWDdk1+NTVdLw==
X-Gm-Gg: Acq92OGGIooSAOa1hZsypEKwyDew3D8D/tY3ImJMDfy8pDw94LUFPUgr3U7M5Aiiipd
	NQdfScwa5NSeKja5r0hqbRxRF/YqfTlfnE/qyX/98JosClrfuEJ8qXH4gpSslakA2o7npbzzhPC
	dlncBmrwlZdOEx04Obuo1i3XqOpqFlJHKmiRSWaaPfOrOM6w8ri37OBKTWq5N+Rug0ZAAnvx84N
	XjaSl9JGpj9MWJOmdDDTY0KXdqwZBq5eKxcOby2VftcNPc33s7B4VOCqHpsrZY78GPS0NVxHRWs
	cet9g+FH3EZVC5Eati0QBL1ySD7Sm4vcdlSSp/oEgamYECPOOPP9sRZrs9xoRfg71SS8OSiAH92
	/SE/SsUCHob5rPkitB03hSavETsAx1X6Rtmkuwwbn9mYUUT1Wi5Mnlyl38Ej9gx162zfLO0eAMA
	j7QZ8S4I2TQyg02LEnnB500OXAKb+VIFp9tRHj+BpQg1rlEO6k3n7SeaP701XHk5d8nE9h2s8TV
	DRTivatee7/jPRahfE=
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr3137430a91.20.1778835748348;
        Fri, 15 May 2026 02:02:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 06/12] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Fri, 15 May 2026 17:01:42 +0800
Message-ID: <20260515090149.3169406-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020229_339545_C7A66C11 
X-CRM114-Status: UNSURE (   8.88  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.54.0.563.g4f69b47b94-goog


