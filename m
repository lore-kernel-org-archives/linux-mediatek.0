Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BCEEE498F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ubkwjqV2lXFkSpUOKT36FzNrE2xtejfwvvZDBwt45wk=; b=qPKzy+aHbmRf/u
	qDr0HW0wWyI+JF0/TleIZdntK4zGRlrFj7dR/UGspq9YAjVmGCqKiKvAEn8tZ8wPzzX+GUwZ0X/1u
	3GYkWfZodnGp9ALufwF5yNbfUzx/dgnfE1CEhoPzYUFrPScwp+EpYG7fYg9OqacF33vQC6tdKZQBI
	SYQbnC9g+Q/i3URoVtQ/yEGQbW1mMF1Ee1TQfXKG1zhC5V2mfy2v/hr+YtLZ/YL2ITa4JolCL7pMj
	PGxivyMqTtjKqeNp6l1axVBKdS4WsFAYT8DXO9Hm0o8UNP1Uvzb78MOsEOXIO5qBHsc8yFaFY0EH3
	iM+cv8+uG4z3RVGM0LrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKuw-00000009AE7-11S3;
	Wed, 11 Sep 2024 10:49:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKpH-000000099AS-2HUP;
	Wed, 11 Sep 2024 10:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726051433;
	bh=Ip66BIhkD3crNPgchKI/pt+cRMu/HakEdQjbpXQUZ/A=;
	h=From:To:Cc:Subject:Date:From;
	b=ZHp+FWWUDz21rYHgDRSgDlX8UYELkBD2UVvP+Iwo4trP18oh7CMsNOMp+KCXOcDny
	 xOpFvRhvssH0ZLzc8hZjrqBddZXATvSF9SiAMGq/wFWyGsJ2rX7DPR0n17qt9G4lbv
	 R75g0mMwpHUgI9h7yCsiIDS4EW1QPKbzZyAZc7EXg4a7uJqR7+pFnHlW8K+dcEGflv
	 /lCDRuwpcwZmcch0b3UpZC/ErnVtPeuiLY4lZTLVY3Rlh7sfD329jr+BE36Uu04TFN
	 31tV8qDqdlsRuH1lycn0UfA5LZeBOLSh/ZIAJZGASsae+XmjMcqY+v7EGY1QHUG1lv
	 W4NrO3XjWLXlw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C05E917E105F;
	Wed, 11 Sep 2024 12:43:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Subject: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Stop requiring clock-names
Date: Wed, 11 Sep 2024 12:43:27 +0200
Message-ID: <20240911104327.123602-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_034355_762365_A03EAEE2 
X-CRM114-Status: UNSURE (   6.76  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, houlong.wei@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is no reason to make specifying the clock-names property
mandatory, as the Global Command Engine HW needs only one clock.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..ff5d010fbcf0 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -56,17 +56,6 @@ required:
   - interrupts
   - clocks
 
-allOf:
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              const: mediatek,mt8195-gce
-    then:
-      required:
-        - clock-names
-
 additionalProperties: false
 
 examples:
-- 
2.46.0


