Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB1C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bPRcJwo6xsSCSwIaeAHSl5TpF7dT8vt1ryzp6V3Agsc=; b=4meyD+BBqkQC+IqIVGOuHs5Ivq
	gBngBvhRA40YkFbsaZEzD/ni2FaK9W4DV8GmkZlSq1tNci68DOXvqpf8Pe+42vH9cJBOhYHhQ8vQC
	oNLrQAHiBY0gr7NYE7Y8QY6doxpvHcAYsTgqvfpPfijSpLIERp0/qBRJt11nurXOlh5Q/06h4xEJq
	dqZul/txhSEZ5SRbzWug3qoF4Kb+6PpyN+m7XxQk5rXX0fUkBihqqmDuDV+QcdOEBZIN7n7RtvHb5
	x3+bFcj/VJpOTTVmqSTfGJ5sMc8SnpdZ3YXVo3c6GnyImp9ypum/VEZu/Hyq82fG3miZWO9Mdr2EM
	qxI8AzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE6m-002Msa-1j;
	Fri, 12 Jan 2024 09:45:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE6i-002Mrc-30;
	Fri, 12 Jan 2024 09:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052743;
	bh=IJ0fhahSkBQixlmEf3QoSmH4xGCg8CHJlBEhtfGdLM8=;
	h=From:To:Cc:Subject:Date:From;
	b=xF2OLl39wqqJO0TA3f5smqCQhLClBMqGoWzc+IhNY9x7wNUhvQ4D2yAB9RZ1h6CAj
	 S81nrzPjhZUf+/Biy3FyEAYk5Us59/bXA5WRAexnVZpERmXexIBGSYuWi7nJ7mrMAM
	 MeXgOE04Twr5J6IiarBICERj8O7gC7MIUDvjz/4AMvrlpnhoRVISBGGWt74o/u0hXi
	 1JEDzIX5UTgngaCooH/5JiceZkb6u+WP2qnQp+of/hkbAmwFHyJGsyyXiqFD4QTrAk
	 1JZwdmmKJ8YitiJpMPIwFCRT7DmEX5NL0xByT5ImcFFwN36hDvPKxXI4WMjziyM2n8
	 Oqn29EOzVTfkg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 70B0E3781FCF;
	Fri, 12 Jan 2024 09:45:42 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	cy_huang@richtek.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/2] dt-bindings: usb: mt6360-tcpc: Rename IRQ to PD-IRQB
Date: Fri, 12 Jan 2024 10:45:37 +0100
Message-ID: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014545_135301_7FCF8FB9 
X-CRM114-Status: UNSURE (   9.32  )
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

Since there is no user yet, rename the only interrupt of this device
to "PD-IRQB", avoiding underscores.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index 053264e60583..0bea23ce2f09 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -24,7 +24,7 @@ properties:
 
   interrupt-names:
     items:
-      - const: PD_IRQB
+      - const: PD-IRQB
 
   connector:
     type: object
@@ -58,7 +58,7 @@ examples:
         tcpc {
           compatible = "mediatek,mt6360-tcpc";
           interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
-          interrupt-names = "PD_IRQB";
+          interrupt-names = "PD-IRQB";
 
           connector {
             compatible = "usb-c-connector";
-- 
2.43.0


