Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA043C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+m03N3gITpj3ugbxfrxQzYYn3Qm4db6M61x6pjROXA8=; b=fTTCRz3foiJPErTZU7H6pYdT7f
	iJvXWW9O9F91MS8auhiWz0SaMTdYotCKb0WR9XAR23autbXAm+6I4jztaoBwAHVnhhEIae72ABn4g
	W2P0dXmKJyv7DHlZSpIovgtVNm5t8hC4wZIGicmPr9PxwhESlA+2QpLytcr2LnTgTIzgXzyP4qwib
	96Pr9g5KfZzdN2S3mDbNKYLTbCtcJ1ykYl6BU7I0OPoraWkTcPDBSN+ivR/F3Xi5//6y0qdVCR8lf
	v7eaAN35Q6TO9LNLV7hEyA7jlA6pTcRm0U7/oxsk22djE8bQ9k1ph/TqqDV7NOaUptFrFt3O8q8+r
	lgJm4zkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9tcR-005b96-QE; Fri, 08 Jul 2022 19:26:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9tcH-005b4g-J6; Fri, 08 Jul 2022 19:26:19 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 52D5866019F2;
	Fri,  8 Jul 2022 20:26:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657308371;
	bh=XB+Q5+iW9bzcYdl1fBbqu9s42fjAPkdcGjUotn5OaPM=;
	h=From:To:Cc:Subject:Date:From;
	b=aAjTkJkxs/dZshN+srt3jMFNrbpIL9P4Xd9CTTckQX5iZDBqf1Ce/WjXCA+ekWoUE
	 qBLcmyhpoR/8rczvCLZwMVOp4tKqKTs9Y/nUzg+TSzbowItA6xb/GoxwjnEV2pUDgB
	 wAF0Qq97/uPv3kXY8F5kdsfP3OrqUMLHDBulNZ1JJlqSACpP5Cx6vCW2rhmXt36eWf
	 DXne89DgjSxE1AZWLja3vqAJiinx/G7Y1bTSjNcL07NZ5rg8zj9cC05qP4uLgFIEhT
	 Jv5DHCY/Re4aRnglvJYWNVPjGBV75pGJDCmpGMO7p7OQDDQqqorNEs+XcEcptx5D8J
	 UNHbLJPMIl2hA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] Revert "dt-bindings: usb: mtk-xhci: Make all clocks required"
Date: Fri,  8 Jul 2022 15:26:05 -0400
Message-Id: <20220708192605.43351-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_122617_804245_677CA1D0 
X-CRM114-Status: GOOD (  12.29  )
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

This reverts commit ebc4969ae125e65fdb563f66f4bfa7aec95f7eb4. That
commit was supposed to make the binding better reflect the MediaTek XHCI
hardware block by requiring all clocks to be present. But doing that
also causes too much noise in the devicetrees, since it requires
updating old MediaTek DTs to add clock handles for the fixed clocks, and
going forward every new clock added to the binding would require even
more updates.

The commit also didn't update the example to match the changes, causing
additional warnings.

Instead let's keep the clocks optional so that old devicetrees can keep
omitting the fixed clocks, and we'll just add the clocks as required on
new DTs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 1444d18ef9bc..63cbc2b62d18 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -67,6 +67,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     items:
       - description: Controller clock used by normal mode
       - description: Reference clock used by low power mode etc
@@ -75,8 +76,9 @@ properties:
       - description: controller clock
 
   clock-names:
+    minItems: 1
     items:
-      - const: sys_ck
+      - const: sys_ck  # required, the following ones are optional
       - const: ref_ck
       - const: mcu_ck
       - const: dma_ck
-- 
2.37.0


