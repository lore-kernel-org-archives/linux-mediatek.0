Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C88C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 22:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olZVqBxUHrCiolGK9NWE6VIr3eewCh+D5XOSfwpCqjQ=; b=C7IAe1yoOExQ5cclET6c3t03w2
	gogy5V6Glm72Y0zYO9uMnhH4HyPJx89DvOaczlX4VS0j5RQG0nYG9q0t1QBHrrfTaEUGFkbnxo0nc
	NmhhNkrYIEGWnIOlvB6crb7tDIX5Vhg8Tg3iLICsX0V4dZkWWvGHmf+0huq/iBtNu1UPnViudw1Iw
	lJQq/UxyeeRNudRpQB85h46ILWqg3ywoAfp26GW5ni56rTyNerUcbqa19SJtou4XCK+S+nD9djKvB
	hQNNEmY2kT7IoUc4xOZwE4zgKyfXq351lWv/dY5YCJ2ctT8NvRNU9+745Pxa75n4dsorF4OqSY9Rh
	Z+ByvVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2KTL-009PWp-Ra; Fri, 17 Jun 2022 22:29:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2KT1-009PRI-38; Fri, 17 Jun 2022 22:29:28 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6BDB166017A7;
	Fri, 17 Jun 2022 23:29:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655504965;
	bh=2DDhEoaBfgt4wsHVlUpB8ibamMdj8d9hk/UycwO7uRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oC2rTTJGncm3bu3b6euHGrSLiC6DZw7mLdunOZZq1rYYiX71DAAW1dA0oBmrd4IeZ
	 pGy/EU2lS44XbWAQFEUwnJxYn9UD7cd+kg/NpOht8vGR/qaix7M6Km1Tg2vtqVGCX3
	 V8HgGeAMMYfaUwCbtV2YRE79SPT+sQM2DJwm5uafklRFBD5KstnLCXB+BBsQbdJCZf
	 EFED2M0LxmElwxLvwZynXfDD9LqOCcaPDjzjuHA0W6h9Ft+9OV9TatSO3uDn+5xQ5f
	 nAnuxHfrtxB2Mwclsg07Sz8eVktoZ+KVTrZnfWHmUazgTU1vWYlrqUAxdgjr3pFcW4
	 GDzTc8hs+yb2A==
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
Subject: [PATCH 1/3] dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be optional
Date: Fri, 17 Jun 2022 18:29:14 -0400
Message-Id: <20220617222916.2435618-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617222916.2435618-1-nfraprado@collabora.com>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_152927_385723_B95C906F 
X-CRM114-Status: UNSURE (   8.96  )
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

Add missing "minItems: 1" to the interrupt-names property to allow the
second interrupt-names, "wakeup", to be optional.

Fixes: fe8e488058c4 ("dt-bindings: usb: mtk-xhci: add wakeup interrupt")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 892718459d25..63cbc2b62d18 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -57,6 +57,7 @@ properties:
       - description: optional, wakeup interrupt used to support runtime PM
 
   interrupt-names:
+    minItems: 1
     items:
       - const: host
       - const: wakeup
-- 
2.36.1


