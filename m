Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADF2C87FCF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dt9vlcydU/YbRJfpDpXE4aXNkRtIlfruo5E7HWzTMA=; b=x3LdBHlUMM+L7l
	WWPWbOen3+8RNVPhua//ChSl3wrZ/K1G1wUu9DWLRoO7e5ohNwx7Y33v4UGKaOdXRoPI0gCq89DMD
	oTFq1rDli2It/tp1FZcI5b67t53jprNCgqTSGPZIf7LRtgSB3sDG+lHyIbzZJ0MhnSIV9AVA71QNt
	25SmI96G48Zj0aa9HbzU7/dbx4GXhUUlM5wvvTeltZq+B/g2OVzk0p5KrXTQ+ZoQRkqHE1qLO0HX0
	AnZAViM4n6t3h5hf9Th1bZGXNl8XhiGLX2bkNFFCrILw/cdDqw++GwjCVx0EAh81+VT6tf7JTnpJP
	Ns7BcvjzFUVVh1YhRVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw84-0000000AfCX-4Aar;
	Mon, 04 Aug 2025 14:25:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivJ6-0000000AXo6-2Gs5;
	Mon, 04 Aug 2025 13:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754314371;
	bh=ercQN29j590aHpm9+xA8hm1HdQq4WZB6Q1EllLqESa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e3lJoDgQEhq4oap7y5IdSE+kxRF8tHZ0W6wDxkCfzrAhotv2C9LzW6zlLkj4H8UnX
	 NcOtDy7AUvpdovsyjs/0izCwO29xV8zPZWPrByJla0OfMJbbD8i+qd0gOeDJbCb9vI
	 CGXQEy0mAk/pIKU8ebVQZjO82DJAJ4OHQ/ARXyfAUYP7bbv2cXyDIxQgyUluH+hHI7
	 zOE1H3WID+aVItyRnp5gA110WH9cfosb7WR9GojVccK/QOks62ULgL+8A8QUD36NcY
	 TtbfYNfgMf1Rxh5v871sm/V+mRYmaGhfOy6IYKHWsYdntL8FBfmAVzGMx65i0Pn6iq
	 h/czDa+NKrIJg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:865e:547d:4830:837d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5F6F17E132A;
	Mon,  4 Aug 2025 15:32:49 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v3 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Mon,  4 Aug 2025 15:30:35 +0200
Message-Id: <20250804133035.309990-10-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804133035.309990-1-laura.nao@collabora.com>
References: <20250804133035.309990-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_063252_724654_BF95C23A 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8196 eFuse layout is compatible with MT8186 and shares the same
decoding scheme for the gpu-speedbin cell.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 4dc0d42df3e6..c90b026e40bd 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -25,7 +25,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: mediatek,mt8188-efuse
+          - enum:
+              - mediatek,mt8196-efuse
+              - mediatek,mt8188-efuse
           - const: mediatek,mt8186-efuse
       - const: mediatek,mt8186-efuse
 
-- 
2.39.5


