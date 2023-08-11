Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E15C04A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0An2e1abhdIFPUIRrageueiL8VrU4x/yiS800RQ/7AE=; b=JI88iIr4Xqlj/c8P0rjTTLKfCX
	Fgb4CKIwuXhvly9YxAq7hZzZQw3Wzw5jFVy91C/jo3sLV7lLegen6fWbqsx1DVXp3mqx3VhvUF08t
	LOpqc+6Vpo4yyWEhGu3KyxJv4ucFpRljhcVHqkECjW7JWN2RBhLoLd/HRLJBDLGJi/X6bgHD0doBW
	4n59HCBhc8op7nZJvimHSWyKNU/k1pbrvHXdSmP+nxLom7+Hwr7XCCyJ/zeHAubG1ak8SHXwVmS+m
	Q45t11b/uL2wBeqxYLhVblIh4QnHE4bNNjPtSE61xDfbJoicI7X/vQSptvcAReEf+rH8EfzXM2Ags
	5MJAkCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qURrS-00AgHd-39;
	Fri, 11 Aug 2023 13:07:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qURrQ-00AgEi-0L;
	Fri, 11 Aug 2023 13:07:25 +0000
Received: from eugen-station.. (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F38F0660724A;
	Fri, 11 Aug 2023 14:07:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691759238;
	bh=VXusoYfjHaf1R8Q5raJ4gZK4qcwaz24tSqOkD12Aa0A=;
	h=From:To:Cc:Subject:Date:From;
	b=m8YQ5hghF7NJPiDxoc0eVVVZW0KT3+2lKdL7KpjLs3T6BxQzGVqflAELP09jpQOva
	 HlTaaoipnyBpu/3hJSrIVt4UDpTzRWTR4qmJhHq9X8Azx4jDM7yZizsCCk3H3t1Fhb
	 ceQ30FZ58AU7DW3MyV5yuuYLrnAwLkSwn2zYf4C/fRHCrPtY36/oyHHugo0IlG4sE1
	 l/DJM/FmWQsaF94awvFv8xWprPaUGPYDcV0QQPw7J3kx0HwW0xFh6B8SDTexcgr11o
	 1DPHnpoDWquQy189H7EWvcmQUQPP3Hib3n7MMGjmeJ0749lDj6aXjNAfQkb7dzxTCV
	 D4KR5yNet74cA==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH 1/2] dt-bindings: phy: mediatek,tphy: allow simple nodename pattern
Date: Fri, 11 Aug 2023 16:06:59 +0300
Message-Id: <20230811130700.72787-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_060724_315287_A7163044 
X-CRM114-Status: GOOD (  12.80  )
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

The pattern for the nodename only allows t-phy@... , however, for the case
when the t-phy has no `reg` and only `ranges` (basically when the t-phy
is just a parent node), dtc will throw this warning:

Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property

For a node like this:

	sata_phy: t-phy@1a243000 {
		ranges;

		sata_port: sata-phy@1a243000 {
			reg = <0 0x1a243000 0 0x0100>;
		};
	};

it is normal that the parent node 't-phy' would be without any address, as in:

	sata_phy: t-phy {
		ranges;

		sata_port: sata-phy@1a243000 {
			reg = <0 0x1a243000 0 0x0100>;
		};
	};

because being just a holder it does not have its own reg.

However the binding does not allow such a name for the t-phy, so with this
patch, making the `@[0-9a-f]+` part optional, such node is possible.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 230a17f24966..2bb91542e984 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -64,7 +64,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^t-phy@[0-9a-f]+$"
+    pattern: "^t-phy(@[0-9a-f]+)?$"
 
   compatible:
     oneOf:
-- 
2.34.1


