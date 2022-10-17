Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06004C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMoGK6t6fYgg/EQRDzZCZ4FUszG8HE/2N6GDwKaceWc=; b=IHumssjfy9M0gZ
	BQmKhyyezT8K/pyWo3GTTTjUrjiEkPbBQvusJjAT+l219M1i4n4JMo+ZSAkLdaPWkPoS0XHvrNrb5
	iXYJhbTvAAnnEh/InLkfDDXzpPzzqa53x5NWVp4jf4fk+gMsnQ/q4wuao8BVr2bMCYG1DuJWS7fpm
	emT5OSNllu0gweo+NSoWBzXjmAl/wiC74kmUSRP1wJY2PMINaqaABdP90VVIrqOXdDZ+qTWYkLdFA
	8uIlZXBGQAXU8cAJyyXqvI4oPb0+UBeSq5StT5G2MczCsgopZ6tzxcSG2ZwQL0za6miue86vDH/KW
	D3MSQxYajQaKlDrXbekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZi-00ANd4-Cj; Mon, 17 Oct 2022 10:42:26 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZJ-00ANAE-E6; Mon, 17 Oct 2022 10:42:02 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id E668960465;
	Mon, 17 Oct 2022 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMoGK6t6fYgg/EQRDzZCZ4FUszG8HE/2N6GDwKaceWc=;
	b=AeY9XAE4RRWQuzaIeVufBTsHmDk5yCP/PErSXHo7ThHxKxTlQffHQvMj/qoPdlZTrK8Z44
	sil24YykueP2/tNXRjOLgyUmUjQVn5JPfIB65ExVK0CCQg3LvkNJTTxX6olaAW9Vhb2sb4
	Z1g9QrAs4TOuEREX247cLyH5zM5hGGA=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 41B054075C;
	Mon, 17 Oct 2022 10:41:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 01/12] dt-bindings: phy: mediatek,tphy: add support for mt7986
Date: Mon, 17 Oct 2022 12:41:30 +0200
Message-Id: <20221017104141.7338-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104141.7338-1-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ce0d7166-4c86-46b8-bb60-def14e224c93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034201_645626_3880F0EC 
X-CRM114-Status: UNSURE (   8.02  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 5613cc5106e3..230a17f24966 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - mediatek,mt2712-tphy
               - mediatek,mt7629-tphy
+              - mediatek,mt7986-tphy
               - mediatek,mt8183-tphy
               - mediatek,mt8186-tphy
               - mediatek,mt8192-tphy
-- 
2.34.1


