Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFA8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1N9h956Bt3ixqVMsp1a4VhX9wVwf/p1nPZbmMs8HxH8=; b=bE0AW0mn9H9QfBMqTNhhp0cvjO
	p7CXMxd71gaefX8pTWc65homQNe9Zxj/Sew8xTAWPBwoFOZTNh3JnAdhFy4FqDAk9sV9lajRGqfNA
	PtYzBKPU1PXnuuIi7eZyGWFcVzOzDae7a90xqzD1+gmufwLyrIF15jFVZJ/JObKHcKKlhtnMwG0I9
	qnZqvW0iG0lkBiDNp9qNG5F+PwgVjnkUytWMwpacMZ1iyaUtGGOT9O6IEUY7jydeERIIfowE92icz
	o6RHAvbRSUYJxJrnJLjkOxEet4SP1wcWldw5jmuelldyrZ364I8iVgsBAuFhtb6xyKwCkM0Ttmy2u
	6KyYhlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rzD-00GksJ-1W; Thu, 30 Jun 2022 11:05:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ryw-00GkmJ-Dc; Thu, 30 Jun 2022 11:05:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1B6C6601948;
	Thu, 30 Jun 2022 12:05:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656587104;
	bh=eGFqIXIFYAXFE4MO2t8tHeXxZXxmMvb3vwAEEfOAIgg=;
	h=From:To:Cc:Subject:Date:From;
	b=axcyMITDCmjnCABiyM0+gfZYWbeDjlhi8gINRkvZHtV86da9BWJ5WPUaHZn8K6JCj
	 o+Ry4zGywO+mKDjGqkVyAiN+09ft6LyWNBHyhViJcbCuJfM5YYkwcj3fEfhL+d5pRx
	 kpVEvo7WoPkbEJQuXcoIby2bTeRWwR/SnKicegM55mJIK6FmH9LDKrhfOO13iRw3JL
	 bVComaH/GB6bw5BBQHJ6FUw2CFPAFZlSzR5lDE8C0eukRQhJTxUz85t2OhlOSfy8tA
	 2ot9UJVA4VAhA4BaiF4uVhhjudZHvbjHqOn2/asQKDdlBDt7mAs8u8YdjHdHb+ojXX
	 5acWxIqdbo4MQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: pinctrl: mt8195: Add gpio-line-names property
Date: Thu, 30 Jun 2022 13:04:53 +0200
Message-Id: <20220630110453.186526-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_040510_663379_3A93B8ED 
X-CRM114-Status: UNSURE (   7.52  )
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

Add the 'gpio-line-names' property to mt8195-pinctrl, as this will be
used in devicetrees to describe pin names.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index c5b755514c46..15989743afd2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -29,6 +29,8 @@ properties:
     description: gpio valid number range.
     maxItems: 1
 
+  gpio-line-names: true
+
   reg:
     description: |
       Physical address base for gpio base registers. There are 8 GPIO
-- 
2.35.1


