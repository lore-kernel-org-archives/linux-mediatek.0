Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E07EC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11ybMyniJ93ArOC4X59ROg8QaGPMwZ60RaW6RS8PElo=; b=hJhE/odj8Ea1EsKWUMI56ItFHK
	p753wUdPaWSvExForkwf38mL3EciGSguvs4bOeLm+7U6VZt3hONSyDH+GznUrDiSFzUKFf63JJ5zM
	JJbolv3Ufyp8bfdNSL5pYhWvZ+KAq24FjVUJsBJtg+RJB8Ksbzuqlc22AF+jwCBn+7DogZCSb3Gql
	tU8P6u2hKxj6Qnsd4LNgOzkE4K2yVMA5kjd8p2dBShqs+3PsRafpycXx/acC6YSklTAEpkhrhAfMP
	pEAQhcdHkwuQstowolMoYbUrXDIzxexPwfIwGACQ++dpDlXz+sX5XjoqjgV5hXXNxRI4NfyEsqiJM
	PyCm+SNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWlt-008Uk6-01;
	Thu, 20 Apr 2023 16:04:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWlr-008Uj3-0G;
	Thu, 20 Apr 2023 16:04:32 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppWlp-0000IO-2e;
	Thu, 20 Apr 2023 18:04:29 +0200
Date: Thu, 20 Apr 2023 17:04:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/2] dt-bindings: net: mediatek: add WED RX binding for
 MT7981 eth driver
Message-ID: <b355493ed3d56396af91492b86f77f613485272a.1681994362.git.daniel@makrotopia.org>
References: <cover.1681994362.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681994362.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_090431_119987_3B1D8B95 
X-CRM114-Status: UNSURE (   9.02  )
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

Add compatible string for mediatek,mt7981-wed as MT7981 also supports
RX WED just like MT7986, but needs a different firmware file.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
 * maintain alphabetic order

 .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 5c223cb063d48..f7d578a171a4f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - mediatek,mt7622-wed
+          - mediatek,mt7981-wed
           - mediatek,mt7986-wed
       - const: syscon
 
-- 
2.40.0


