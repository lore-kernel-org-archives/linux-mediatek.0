Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A8BC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSz4Phy1sU4AYzPNTRLcNbWCOa2kWe3Cz56MzMoV4lc=; b=R8DmKO67kAssGog9WGBudRoEuP
	gCRqievji5xxo8E7JfW++J1kDZ4j7L6OJEsMWJwztU2jmXE8MMKW4TD/t9kKhCQF+rtfxpYlPnVg5
	UiJ3YksGVizYknME3n8JDqtAry05ph3I9q8+B9f3gXrn7AGR487Ir+m77Qs3wyE1dAs28DmZKKio5
	7UFEdW43HLR20kpXRImFfRRHLVjzz0O/Gqi82XaQVPNrdQVWc3xjCXNStckws+TgUNpEnTktXIJFZ
	XkzKXB/9avnGIZMBrOlH0/nROrOc+TUQbK7HdNnQNnWUlUEohIHiP5rBI3b0pD4umUkDseGWWC7ht
	UTaXoTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a7O-00ComT-7T; Wed, 29 Jun 2022 16:00:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6r-00CoPS-7Q; Wed, 29 Jun 2022 16:00:10 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9EE86601947;
	Wed, 29 Jun 2022 17:00:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518406;
	bh=XpyEub610YnsHC64VXOfExg4aKEWhPEsupxIb1vB3IE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X6+wKWuzrjtOkqr78Fyi6hOyp2uZ8SogvLHfNlUmit+gi0Tp3/Z7dLflDlruLDrTq
	 wR1/YluBvz4Dtpwmg9CgxTqNGTRaoJ2SPw6T7YY3p2Lni96uyBI6PYD+cBA3KtlMQR
	 weE0gGWW50+Rt96ia4GTwN39GagN6B7La5vN9Fw0QSbC9SM/duV3DCd4boJcK4JTq2
	 DZ2PDcg8mW0wpiSWDF+5mXLnV4AqfpgjpbUzxAlQxDuvgCh3F5bIZHhE/HWMCO81oc
	 8QENu+K34KTY5F/7+LnV3JVFctQe5u8g1R6pXKqCIOlgPgyUn9T1Wx92qJY3Vk2x+p
	 kk7pziTk0ZynQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Maxim Kutnij <gtk3@inbox.ru>,
	Rob Herring <robh+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 02/19] dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
Date: Wed, 29 Jun 2022 11:59:39 -0400
Message-Id: <20220629155956.1138955-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090009_448501_23B24B90 
X-CRM114-Status: UNSURE (   9.72  )
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

Add binding for the Google Hayato board.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>

---

(no changes since v2)

Changes in v2:
- Added this patch

 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1f9535097a60..dd6c6e8011f9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -131,6 +131,11 @@ properties:
           - enum:
               - mediatek,mt8183-evb
           - const: mediatek,mt8183
+      - description: Google Hayato
+        items:
+          - const: google,hayato-rev1
+          - const: google,hayato
+          - const: mediatek,mt8192
       - description: Google Spherion (Acer Chromebook 514)
         items:
           - const: google,spherion-rev3
-- 
2.36.1


