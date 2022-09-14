Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E47ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssA9NXWudmq0MFx6Lv1t2vJ31edpV6Ff8KhCFFzDyQo=; b=nlWpOmWgwmdWjmf3CQ7P0M9eiw
	cXoPIWHR4fCd3w12qQKOA1NbGpQryU0KRAYc2neZV7Wo2FhJQWRSFccAl4q7vmHI3Ey8ase0hkK5T
	dy/pBO/COBjqdUWhAMjm+CRiJBrsbK/wD4mqADZPEYEs0XAxkdq6cXXjC3XnZe/CUYxTujjStmlii
	umIS5VuEtz3Rc/R61+NNi3ReFeRE/wEyE0d0cdog1goPawE31ZL8cHnVxNEMw8uVNAkB70MZPF42e
	2BJOzPI8i+GXMhhsnuw6mMmNkpfgPnSKVH/T/m8LbiDNhYDkfpF1mMxbRTayJY74ewBE6s5+OGgAa
	Vn2KclCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPfr-00FAP2-6t; Wed, 14 Sep 2022 10:31:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPfB-00F9U4-HS; Wed, 14 Sep 2022 10:30:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C48F2660201C;
	Wed, 14 Sep 2022 11:30:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663151436;
	bh=eNWg78i6IYPaEzcnokszyEzeRsi6y2fLOfB+IH74hdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Et5hkc4hpifH1Xcx0RfbmnH5fLsfSQ3jNiwdNjijH+OX3uYQpKl0MN50RpTehBatH
	 TemrjY/qNZSMl5tR4Wy7hI1CHJGXG141Ijpwk/eSlwWLdWX7nv91/HNI7ZzJ2i8i2U
	 zSOpcVuWIAcuKmA4cTcOi8CqLzoURRSBxnqU1nDVFNvQ4QWfi2bXkFr+FY2X1HELF+
	 cbYU1qk0GEbfX7I/lyNyfdH7RdecuRr87ItxfLGqrWx9EwOMriraJ9/HtGHHkVQas8
	 4VhJUb9O5vY3IwGA8m5LJ3ZY42n4Sfn1Pd7iFXA9mr8Bkja/Sq4FAxbpwothXGV22y
	 TZySjhfZkTJZg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	chen.zhong@mediatek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6331 keys
Date: Wed, 14 Sep 2022 12:30:21 +0200
Message-Id: <20220914103021.43593-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
References: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_033037_728958_9B1A8BBF 
X-CRM114-Status: UNSURE (   8.48  )
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

Add a compatible for the keys found on MT6331 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 9d8a0c3aebca..2f72ec418415 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6323-keys
+      - mediatek,mt6331-keys
       - mediatek,mt6358-keys
       - mediatek,mt6397-keys
 
-- 
2.37.2


