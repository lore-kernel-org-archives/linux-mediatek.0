Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46259C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 20:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otPkhQIuhbQhyaFJc5KXCglkhYIXEyCDR3tzV22Czbc=; b=g0WEXuaHcRIBMAEdxOE8co0N3S
	uVYWI9EgQtX/IX/LgBl/W3Ue0srD/cX851avRV7qphSP8N38M3SuW7xg0eNpHiVrecgVHHN7mP9SU
	A5pKDts0AUKvwSpPQuB19OwH8CHvdTzwXeDoQBQGGrH8m4Cc1anEmkwYOOGFslieeta5m7Zx7kJgU
	5BJc9Fa7/Zm1rPRDERlt7IYjquBZySn9R1wOdYoDA4T15TGQ+sWtYMSJUqE3SGLV4rRCeUa+jpkAv
	lLt1lEHUtsNhV8jLfp1j3ogWGOKfPnRuRH4IrSFqN7jqPQZJdDg6DJYnyk0jrBWT8QkwoM76wR5NH
	Mw6rDpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboc0-007dtY-DG; Mon, 13 Mar 2023 20:17:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbobV-007dhs-0Y; Mon, 13 Mar 2023 20:17:10 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A8116603095;
	Mon, 13 Mar 2023 20:17:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678738627;
	bh=a0ACMrsAE4Kq1AVU9P7WDGQSsNeM2g+il8kNy0WJLjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+eBKtdwxY4ew+09WRNe7pex08M81kOrK5Z4izSfBQm9xlUCvQZIH843H4eFkYni4
	 V1mxjkCBY1vJDkjvpHoLd4+/HTn0ZYLBdewh95oun40KKf+TMZUFsmoDyk3aRjapjk
	 jSPirxiGeK9cxyfbG3DijUbCF+W3bE+y3b2eWoFoiTyN25VChObNkt23aNVza/SQDM
	 sr68ezhR8jPGxgYuHXj5hC3YZOdz5wCwGT/pLAMk9U2+Lm55V71Vpv43NTpGlDbPDE
	 thztXU+VMbHEFc9xCZtYuW60oQOQwUqWx2dICb/cq6GipAl9acyygdz1v7t0lCqsRp
	 /VU76VJUTDRBQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/5] dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
Date: Mon, 13 Mar 2023 16:14:40 -0400
Message-Id: <20230313201443.2275101-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313201443.2275101-1-nfraprado@collabora.com>
References: <20230313201443.2275101-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_131709_213571_0B0F74D6 
X-CRM114-Status: UNSURE (   8.43  )
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

Add binding for newer version of Google Spherion (Acer Chromebook 514):
rev4.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 11458cd16109..fd6587253191 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -144,6 +144,11 @@ properties:
           - const: google,hayato-rev1
           - const: google,hayato
           - const: mediatek,mt8192
+      - description: Google Spherion rev4 (Acer Chromebook 514)
+        items:
+          - const: google,spherion-rev4
+          - const: google,spherion
+          - const: mediatek,mt8192
       - description: Google Spherion (Acer Chromebook 514)
         items:
           - const: google,spherion-rev3
-- 
2.39.2


