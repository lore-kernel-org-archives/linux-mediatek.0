Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9623AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94ilEXfCLffhiRYddiEogkBqG+ZrZ94gPKf64hnLXTk=; b=hDkuEflEt8Pw1oQc/FvLP3wKbd
	b24VQjSjefYAqaYDQxozCjiyow+QxIg/YhXNnsNq7yxy70nudS9nvgXJkzU5tZvSKjWC/gwtU54LC
	k25oLa1yhSTv3Nn5n+XPihgtFqopLLcZ+Y3Zwi+UOnZ7Puq2ya0XfhFCn6QFyWDhvcaZfj0KfHvx0
	tKyyt6XwVLEDPRAnBHiBGE1c+psz5bjgfA55LuRD4bTGeVuhy/YBupCwbgrkfh/ruttTNsuUthWpH
	Vpt+ZV7RdVhTG3yWoclatbndnU3ffhAeicY3z6DzfEEGAX+8C8UkrXe3nJp4bLUu/31x1M+aUXiBA
	xvc+oFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sju-00GZq1-Lc; Thu, 23 Jun 2022 19:43:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sdd-00GWqx-7V; Thu, 23 Jun 2022 19:37:14 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C448C66017EB;
	Thu, 23 Jun 2022 20:37:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656013031;
	bh=kok2Tk9hNC8W/8hBE+yjTgkvfCjAF1IKTQhZZf2MFyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6UvB1vgu6Ke9+L8pNqa9NYbo0Ma5QNsklJOHsPJQiCYD0Nt+bJD+wvZZi25MVYmd
	 bdGsdXKjCH63Cd1KQ8ord23GcpnzboiI7MynL6TBUwRH1AMG74rGQ4rI/QqaPVrgeh
	 SwZqRrjfYFn1XZbHTHpEAkvwYjtLqf8aJ38vt7Dq2KVttpve7cXznmCCVv3P9kFVMT
	 hv7lYf22stokSgbpIAX0x/iWcuEL9fhyln4jFppmTcOrofFnIRHVRptG7uTkoBclDZ
	 NZqWh4EpdllpxED/zZSk9tKfOfw1oiJfuw8ApPtCc99MnxmEMCv/A9Z4uW3ZxLgRjg
	 wPRcM8EBIgTdA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: usb: mtk-xhci: Make all clocks required
Date: Thu, 23 Jun 2022 15:37:00 -0400
Message-Id: <20220623193702.817996-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623193702.817996-1-nfraprado@collabora.com>
References: <20220623193702.817996-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_123713_512934_F320665F 
X-CRM114-Status: GOOD (  11.19  )
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

All of the clocks listed in the binding are always wired to the XHCI
controller hardware blocks on all SoCs. The reason some clocks were made
optional in the binding was to account for the fact that depending on
the SoC, some of the clocks might be fixed (ie not controlled by
software).

Given that the devicetree should represent the hardware, make all clocks
required in the binding. Subsequent patches will make the DTS changes to
specify fixed-clocks for the clocks that aren't controllable.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Undid clock list changes that allowed middle clocks to be missing from
  v1 and made all clocks required instead
- Rewrote commit message and title

 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 63cbc2b62d18..1444d18ef9bc 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -67,7 +67,6 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
     items:
       - description: Controller clock used by normal mode
       - description: Reference clock used by low power mode etc
@@ -76,9 +75,8 @@ properties:
       - description: controller clock
 
   clock-names:
-    minItems: 1
     items:
-      - const: sys_ck  # required, the following ones are optional
+      - const: sys_ck
       - const: ref_ck
       - const: mcu_ck
       - const: dma_ck
-- 
2.36.1


