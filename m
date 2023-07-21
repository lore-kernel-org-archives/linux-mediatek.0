Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3517BC001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqQMlK/pzn0p4yJ3zg+ZD/qeXyUR8Iel7FtLPOV8ASo=; b=KGl3jNkfuRrsuk
	KMIYoLm9pBhGyCL4L6xU0jcCaHVUUP5yUY0Hj2ro+2987Vt48JN0zJCqwdAyNrX0yY8yqPKeUrkJL
	DnS/8LJO6yY46bBTRt65Znws/UNaX/swC/Vl18qmfJcuDB41rgBI/CZetpesp8q9EN2xnF7K//Y77
	ih98HPbG1NCvl3Cng7wCZX25jkCEaRqjd0i/b5gtBZsN83DA4aSipPM8kM+3xfkSbGnVsm79W6lpZ
	wvz7O5xz6hNv98hgiN1Ju0oNGCrORBhEaVByxvp4tmhVbdS8ZsU94rSUBh9oXVcb0oKw1DC8+/PGH
	vMLOh7E10cs91sF1o4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwZ8-00F1vT-0I;
	Fri, 21 Jul 2023 20:17:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwYy-00F1q8-1h;
	Fri, 21 Jul 2023 20:17:21 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 45F8566070F4;
	Fri, 21 Jul 2023 21:17:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689970638;
	bh=ehTO0bBdiUBnxc3FCLmoAl4r+1iM6TYsafFXQgwkiVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJ8T8wQBHooucWo+cc9mIwiPnMnhtx+qYSjG/XWZ8tzWbC0jgT6P4GZecHxOkNgur
	 UTqcexCKC3HeZnhFfd1QgktXQkBSv7kPZ/DlDUSUxH2ZoaeChcuJii1D35uwZhZvqw
	 WBExTFmQncimXi/07VqkjUWXFVly7JEt2p977tfUHbge7JxMUvBxQqgfumm/T6zXuh
	 5Q3cgB1pSS+j9v8/sa+HwTET8uqx675oiXgN+P3ZRK2gA+Yo3XGZSnfMRHeokEQgD5
	 VjGdR3bcFS5s25adNP6VQWM7boqJUT/1gNhbTaqcU0vw8tZaqz7OLZQ3ujvdG820pX
	 TcD3mTdfVjfBg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
Date: Fri, 21 Jul 2023 16:16:55 -0400
Message-ID: <20230721201705.387426-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721201705.387426-1-nfraprado@collabora.com>
References: <20230721201705.387426-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_131720_694059_BC70FB7B 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.41.0


