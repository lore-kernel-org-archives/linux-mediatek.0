Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1985ACAC5AE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PYii/wjRN6f5w2gYFSSZ4aGmKPxv60CLe4GWP0amtY=; b=Hwpdgk5YB7pFhWbva9K6Zw3f0H
	uxsgfEOLW5hn7ykLjEHGjIAH7sHZXGqDb5WxkUAox4QJ5+lhA/FOeiyVXYhixprVQ0dCEFwrxkL6S
	cIh6YJX0Qt+tYQBg5l0FNY4OwiwmnDnzHviLrnMXBWpoN3hP/qCuiJUI3Ts7A2VF1Ik5mYrHoe3l/
	ismtOqLdcCGFYqeuOGcoix7RIRHuE9jTQtIIrQBGT3Oj925kf5oj6QluZXJHeWTmBzuSVimcI/Dte
	PeCS893AmcUEYnMYKg5LOy+Ei+wvuicOOjICl5TD8GuGTCR6ViIxOjso/Zh+MGRE4N0kC/UThAHuW
	5oaPTb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25L0-00000000EsA-1CHE;
	Fri, 26 Sep 2025 10:06:02 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Ks-00000000Ej2-0Lb6;
	Fri, 26 Sep 2025 10:05:55 +0000
Received: from sven-desktop.home.narfation.org (p200300c597166BE00000000000000C00.dip0.t-ipconnect.de [IPv6:2003:c5:9716:6be0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id 9B90EFA130;
	Fri, 26 Sep 2025 12:05:51 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Date: Fri, 26 Sep 2025 12:04:52 +0200
Subject: [PATCH mt76 v2 1/3] dt-bindings: net: wireless: mt76: Document
 power-limits country property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-backoff-table-support-v2-1-16d3726646c4@simonwunderlich.de>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
In-Reply-To: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=se@simonwunderlich.de;
 h=from:subject:message-id; bh=pa03GJbD9ITiVTNCYJUKaELBwKC4tTy/GDvazBnS/g0=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnXUst5eepFFq/ad+KQhsRpjx9CvNFtV8XDe1dVNl2x3
 HCAQ2pxRykLgxgXg6yYIsueK/nnN7O/lf887eNRmDmsTCBDGLg4BWAiC1MY/oq19QrVPlg0K/vc
 n1MTTfSd8qLjC6XOzGSdV/HuSZSi3EWGf8ZpGx4rrGS+sM41Ly3o+FTPi2FZrOLPnkdMeuC6/ZS
 FJQsA
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_030554_301464_DE10A253 
X-CRM114-Status: GOOD (  11.95  )
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

The commit 22b980badc0f ("mt76: add functions for parsing rate power limits
from DT") added filtering of the power limits based on two properties:

* regdomain
* country

If either the country or the regdomain matches, the power limits are
applied and the search is aborted. If none of the two is defined for the
power limit, it is a global (or "fallback") power limit. The last
"fallback" power limit in the list will be returned when not matching
regdomain or country was found.

The idea is here to allow to specify "overwriting" country limits in front
of the list - just in case a regdomain is shared but a country has
additional limitations.

But this property was forgotten to be defined in commit 2de6ccebe0e7
("dt-bindings:net:wireless:mediatek,mt76: introduce power-limits node").

Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index eabceb849537c418650697da86682ef04c979193..f8f72f3f1b1dd185b4797be38b87c621ef3eac08 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -151,6 +151,11 @@ properties:
               - ETSI
               - JP
 
+          country:
+            $ref: /schemas/types.yaml#/definitions/string
+            description:
+              ISO 3166-1 alpha-2 country code for power limits
+
         patternProperties:
           "^txpower-[256]g$":
             type: object

-- 
2.47.3


