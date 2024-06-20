Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E5C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBfXbGSZzJ1bzOyGgFLoZdQ7cLHObW7qQd4WribkHLY=; b=sLOPrXan0yXVnXMt/4AUO3ytQw
	Rb7bJQfYBCLLFsiQ1k8FBB/lQEfEpCrfOkgtFmeP/70hun2UZUgAIdtMimU/97yt8iiGw12butKO2
	r2aRUOeyRCOwgkb1slVft86TYqhsTUHbiEQdP7Abc7RRx0GQ/4yvhEDeo1p+kPlPF+LFMIoKkDbFu
	htQJa1xSVCN3brU0W4reYgUtyW36of3rAvl75JnXqJky8IVyfUTrwGPh4SMW9rV/tdHjS4PZJSRa5
	LQuEKxY1ornJICr2B4u+96pibFNSTnTr9W9b760R8jjjHBarkdTzxWPt7R9E8tscb/LT6CUT3DV01
	xguePt2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEig-00000004VfY-2C7m;
	Thu, 20 Jun 2024 10:08:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEiA-00000004VKa-06MD;
	Thu, 20 Jun 2024 10:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878088;
	bh=Qj/kipAraX9/0CVC2c8sN/n2d+6ockxINPF5uDszWlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gV/5gmma6Co/G7DtA+fQ1jljPvTh6b/RlAEPYpuQRpZCQoXDdG3ggbCBD5hW7IpTB
	 srLuDy2qRmJxHsX98n93oQbeWHPplZyDqmJogTIy4BPM6tv8SGzS1KJ3PASqTrFUXA
	 d5eRRAhY3WR2vVciJds3aAMJWdTlRALiiWBis1tEZYxj52YMBmDqoeBucWWwM8Xs2p
	 7Xoh92coDKYrurL2X7vFP5utWUmXwP3RNTvJqLijIpQpMZLlgKeHb2i1etvF1yFWV9
	 4jE6ndyo6ejBCk95jHM1JP9Sryz0lpzlq/ou7AQChASzcDn8Gf9Fe8JnosxPTqmYuZ
	 zo7kmVZA4O8Pw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 17FCF37821B9;
	Thu, 20 Jun 2024 10:08:08 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/4] dt-bindings: mailbox: mediatek,gce-mailbox: Stop requiring clock-names
Date: Thu, 20 Jun 2024 12:07:50 +0200
Message-ID: <20240620100750.1075790-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
References: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_030810_352282_74A76BD5 
X-CRM114-Status: UNSURE (   7.12  )
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

On all MediaTek SoCs, each GCE Mailbox have got only one single
clock, and this is true in both SoCs with a single mailbox and
ones with multiple mailboxes.

Stop requiring clock-names on all GCEs, as there is and there
will always be only one CMDQ clock per HW instance.

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
2.45.2


