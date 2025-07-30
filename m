Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890C0C83F26
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jul 2025 15:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skHs3OlHSz9Q2Xnt3rP+ayldgN2O9IRiCIDoLEC9snk=; b=dAgOv3Zg400BPg
	xKzR6Q/weKMA3XC06jg89DHCcJi1RuU0vtITbkg945HATYcty7G1YihbEPUpC8O6vAXAvQVl7VHG0
	Y01O0tlwerYDtZGxB4BUSj5JcRJHnmyeU1tEnfdgW2Vt1jJUml52m17Zu4ju7linsjThjTaG9L2x9
	MLJoPw6lTlpmlmrl0DIp8oQ+EIxx1GHLuE9Iib0MRsAlxeZQNYAeAi9iqBfLCNtyPLVb7DtrJtxdS
	PavZmwfY6asi3yPyzbG25sJH90D5G7gnF20I/hoc0EPNtnGgq3IrxefwwxXhTtWnxhQF1KTjldpDY
	25511a46z57eZ5UH/C1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh920-00000001sLK-1tbh;
	Wed, 30 Jul 2025 15:47:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8dd-00000001q4f-4C2t;
	Wed, 30 Jul 2025 15:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888960;
	bh=Hn1macxBsiwE8zIVXtjtrzSVv+kL8zbKJT5C2OuAsOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d8595H4/FxuZuk/QCIb+PXEPxoFNt6QxfKgDuQUz6v+RDVaefb8DuTmutdarVe5m3
	 TSzeC7uLRfMHEBc5jVOhv5RsQVzqCKFWMBG0KogqiIB+29t5n6+AAkYe9T4fci3O2F
	 IrYY8XB61nbZI7Cruy4xymeabhnTudTpybiWQvzpzbFEe14IeSugacbfhJh74TWLas
	 3j5dIx2G1zenqrO0oDhLQbdZmOqMrTGzScP5N/LrpIPgNTuyKr+hrSbMJL3nXW2B12
	 kVk3UTX87NubKeMhGNn+YUKMrJa8l0iaTwzcH3X5Y0iOf6aMnE57vPl9flx00hyFSR
	 65O8mmbhSD5sQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F1F817E1315;
	Wed, 30 Jul 2025 17:22:39 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Wed, 30 Jul 2025 17:21:28 +0200
Message-Id: <20250730152128.311109-10-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152128.311109-1-laura.nao@collabora.com>
References: <20250730152128.311109-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082242_178624_F3546E59 
X-CRM114-Status: UNSURE (   8.52  )
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8196 eFuse layout is compatible with MT8186 and shares the same
decoding scheme for the gpu-speedbin cell.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 4dc0d42df3e6..455b96c1e1f4 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     oneOf:
       - items:
+          - const: mediatek,mt8196-efuse
           - const: mediatek,mt8188-efuse
           - const: mediatek,mt8186-efuse
       - const: mediatek,mt8186-efuse
-- 
2.39.5


