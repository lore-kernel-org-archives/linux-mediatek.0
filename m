Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AEEC05027
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 00:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oY0cdQ2marUD4OwIM+M3GAu8UjLnrue0uo5NTNBc7Qk=; b=fPkRSvBPdF6/Iu
	PddEvQA+FrM92/6s1lr3MfJJKqrrJnWurrmaAUfE8nAsNn7KF7CnRez5+q6cBRDUvJk6Zqe80mE/3
	2x57sLTlHjl/gKMUQ5Fem9fmbC4J99uoG2gQFGDSVyppYnqc/t9yQUtDztHrxQbAgws4lIbKfxxlt
	HNRky7blgVhj9YPFCROC1s98N2K4Wab4iKWj4vmrjiBVTIrR0/yxdqNmk6rOEeFkiUfqNR/w/Qjts
	xxkCbj9CQidMUqI6/5UaPlpO63x9xvBc2EO7ZcQUk9OhB7esuoJCyzx3f/8wvxQGU2FxldmD2AKxu
	E+vPrK8Mdm+s8KI96x9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdjI-0086SH-SF; Sat, 11 Feb 2023 00:27:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdj0-0086LG-N3; Sat, 11 Feb 2023 00:26:44 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E713B6602116;
	Sat, 11 Feb 2023 00:26:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676075199;
	bh=vAh5F0xQSN2iFphfoEobR6dMKY7ybq2RJaHsZgPrfQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aaXJA6Da+8w0do39ysgw3mQLUm7gHjxhyYm+3CHGnT0qWpRVmVBS0GirlAQs/yR4y
	 /HWrYFYj3tPSvh4+QW/ik2LEaRCOOP4ZwTsppwHs6tXcpRZwYcSAO56h7/+DNashoT
	 KJFFXo/tfochTYJjVrNv88Kul11HAZCiti+N2a2/0cOBBjLWeLm0vF3A5WoKE7Vs/Q
	 mIknGU+UKVB+Je0GQ3Q/mtGAxUWeODEO28kwJHI4rHv1YJpq6WX1k43Qh3bWQG5LSd
	 5j8Fsvlb57cm9BgH8zWnitAYBvrz2PDv+9/fAorwTwV5m+0RYCS9u9AEp4KJFXU7DL
	 jLXbkSu2WyaoA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/5] dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
Date: Fri, 10 Feb 2023 19:26:22 -0500
Message-Id: <20230211002626.454844-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211002626.454844-1-nfraprado@collabora.com>
References: <20230211002626.454844-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_162642_936065_A4E774E4 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding for newer version of Google Hayato: rev5-sku2.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ae12b1cab9fb..11458cd16109 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -133,6 +133,12 @@ properties:
           - enum:
               - mediatek,mt8183-evb
           - const: mediatek,mt8183
+      - description: Google Hayato rev5
+        items:
+          - const: google,hayato-rev5-sku2
+          - const: google,hayato-sku2
+          - const: google,hayato
+          - const: mediatek,mt8192
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.39.1


