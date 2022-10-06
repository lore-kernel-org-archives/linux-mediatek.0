Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B38C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 21:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+gjZJJIkJ9lKgBUPuLTLr2lH1DXNpAYjNYOeXTUr6c=; b=LZbpYrf7bOkqAxMrWAX8q9Fnfm
	0F6DTxuAlBSuNtl6j3QW+idnSOYd0n+h8GKBk0o7VGhHNEUHkgJNXw73olyRacPtqhH9VHm5DA+NA
	S8u6PeWUjM0zW41skUNAiAYad/fMY0nNP1+7C4KqnVddnVdsM14p51Fd5GvZ3L8yPLNKiYlsCVyEC
	FCDAHQxeNbpvtC75LTfuh6PeyhYtvHH9sW1zGpRBC4+i1izinon5m1dTdM5y+Oi8A6GNq16niPTM6
	WLZQtTnrRvDPZEviWfv8pMDXjMJUFYIx0I/nM+6GdVuHEB5cu/E0/oPX5nZcrsHmQLZgzhPx+KwhW
	eBxspI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYOl-005NCM-SP; Thu, 06 Oct 2022 21:27:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYNC-005MLO-9X; Thu, 06 Oct 2022 21:25:43 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E3D5D660230F;
	Thu,  6 Oct 2022 22:25:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665091541;
	bh=2X8il5bV5d/ZjSiVrXx4NYjDMYkt9VJPEiLKp1Ds5UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQCxAaumyufWsY7kjrWXZrig+YtTpIyZC545MeQjJNmM0uUROlUBdNi4Fjg5IKu7A
	 FqweZhPE9o+aC9SbqEZdFOO8cZ8Wy8toQyyYSwQD9BQOVcOG4k3HfzjUc6DalJdXF2
	 Nrz6h+EJ2XGFnMa1QTZhqS9sxUbsuDiBlOXvs6ZjsA9kK5Nn+SJlwxa1XS2OYGDGAz
	 C0zg5EDs5yBcBEhj9XkzS7SZBGMX943umqu1E6VG1O9PJz9kJH7eOgsqz08CkNMmYQ
	 m5OlYWFJM++EWPQCv6NyCIIu75+iJRNz4X+UWzvEmd9sCQMZLLAPQY3x7t/mGtDIWK
	 C4tkmTAOr6IUA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/5] arm64: dts: mediatek: asurada: Add aliases for i2c and mmc
Date: Thu,  6 Oct 2022 17:25:28 -0400
Message-Id: <20221006212528.103790-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006212528.103790-1-nfraprado@collabora.com>
References: <20221006212528.103790-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_142542_489119_7FB8F5F7 
X-CRM114-Status: GOOD (  10.15  )
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

Add aliases for the i2c and mmc nodes on the Asurada platform DT to
ensure that we get stable ids for those devices on userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added this commit

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index dac2d4f5e670..758ca42a6156 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -11,6 +11,18 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
 		serial0 = &uart0;
 	};
 
-- 
2.37.3


