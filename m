Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BD4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSURa5Ce4xR4svMPaEbM1FRFujNvavTN6/Yjmm89+4Y=; b=qKTxjpFF4KWuobjG/3vErJWOIN
	a9SzmFsH5fDyppz8DZE1eOR22ws0yZcNBtGjp6IxrMvqSIczLwGLZDp8/MyBSbFG4jSdO9nzeuMr1
	6aWBBt9J4ASH1Lihkfjo8jmv7PxVDc5hO5ZPB+4/W6DgtsgapEiMfoiix3aybdhRzrtf/aMT/n4mE
	mJGa2pckvsFbPBHhMIC1e3tlCkuoeGxO8MavzS8aoaVq/pePOtWbsWwSu3NS947h0a2AhGWqf8tUN
	ZB1G656+BjwKIC++VRcykyrsi9IvXS8rAzOPH48QrKTmsK7gKjFvagWFNAiplWVOG0YYC3G2sGSU8
	zblgFa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a9B-00Cpjx-LI; Wed, 29 Jun 2022 16:02:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6s-00CoOW-Oh; Wed, 29 Jun 2022 16:00:12 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B8925660192A;
	Wed, 29 Jun 2022 17:00:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518404;
	bh=jfOGEhGUqzgWmNYEYTwDX2UHrYEvnOH9l69P1HilBiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ajEpttGlWG9Yi6MtxofEuvbhb1OcH5iXhy1fbYzMq7DzDIhlEinzUN9CPTWm/XWGH
	 RCLGiSySMglgzSODPSIiJp83O+8KkqgbjfYP2AfRaYh100uvGeuVLpZMT7Kt5Qm83j
	 LiC8n0DmILsRG/vVGbevT5x03v2asvGjNA4QtG1rPIz6FpYRqH0cTH7vGHKNQ9vgQO
	 hL56sJEq4+3npq4+DtMpFeIVB1ySbU7IGbt9l0Z8pfVI+FT8RBvfFYh8bK70nuUQoq
	 n/zYcWpvuE9BvIft0Jc/cTB/+a8x/AQEya0UhxrkYTOTvxv225artM+eC7GzNhPvm4
	 CIqyy3p8yD4dg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxim Kutnij <gtk3@inbox.ru>,
	Rob Herring <robh+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 01/19] dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
Date: Wed, 29 Jun 2022 11:59:38 -0400
Message-Id: <20220629155956.1138955-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090011_005707_9A0C74FB 
X-CRM114-Status: UNSURE (   9.57  )
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

Add binding for the Google Spherion board, which is used for Acer
Chromebook 514 (CB514-2H).

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>

---

(no changes since v2)

Changes in v2:
- Added this patch

 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 5a29b7b381ef..1f9535097a60 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -131,6 +131,14 @@ properties:
           - enum:
               - mediatek,mt8183-evb
           - const: mediatek,mt8183
+      - description: Google Spherion (Acer Chromebook 514)
+        items:
+          - const: google,spherion-rev3
+          - const: google,spherion-rev2
+          - const: google,spherion-rev1
+          - const: google,spherion-rev0
+          - const: google,spherion
+          - const: mediatek,mt8192
       - items:
           - enum:
               - mediatek,mt8186-evb
-- 
2.36.1


