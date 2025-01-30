Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAA2C0218A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2025 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZF0HMCYX68OKhMzSmI5cvEyhV5FmUFM2PrnYXYJETjc=; b=dd4KQKu61Kppd4E1Guf+IDvu8f
	gdCAiiP1+zM9uj70C2LcY2zZyFEOGXkjjtmT4QYVdQf56pEJcDaUXqV5w1fhCoDvn978VjyVGdSw3
	qyrwdRNtIr442OghsSJK4VjnthYbxLU59w1JxaC6Y8r0imv23ik8HLpiK4hbaAt836mxRK9AoC/r5
	q/+gaI6dhYLDDFII2lzxa7Z+5yXVyPY8ha1qEz4BAyb3zOYmX8FCpIUT/1T8/RQFA6wg6kj6Kui2i
	tAiTMril4rweD3dE8nbGKY5TK2z9ZY3wIs87N226R8Sdnt5gV/mW5IS7QxvOl4e7CGsv9Ha7+kxNz
	5HqIvlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTiw-00000008m2r-0gdz;
	Thu, 30 Jan 2025 12:32:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTha-00000008lnF-3Y2g;
	Thu, 30 Jan 2025 12:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738240281;
	bh=7SBQfrRI2oth98VXFTxo4EgRQoJmwkt7eFh7tw9GTeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p4TRrDDeMdpBKdhXbEUc+/V4mBPsRUYHbMNlD6FHSbP+TGkXRM1YLi12N/hffmhMS
	 7PBLTaIsDPoFxJWKrE8vnyx7XuZ3kdH/jkRHwxO7EwGgiSBLCRBlE3niw3XfuIay8Y
	 ibTC65HgB9Fks64c8mYsV2AU+slMLVk1//U0bVZklhUkpDeRP4/vBe8RvsKF+niZA7
	 8c3DcpGujGukbmzpgYfuAw7ulJk/vwYFJbHcUyYhvdj12LbVtWno8VM7Jtc3rcCkJn
	 7YH+R4vVyjeRu6ZvUDbKgCHf3zqlDSKU75GJ6/ZyEVfA+/CgZslqLLJ8ap52G99NKH
	 t4f6TMbJJPAPg==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 120C117E10C2;
	Thu, 30 Jan 2025 13:31:20 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jan 2025 13:30:59 +0100
Subject: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-mt8370-enable-gpu-v2-1-c154d0815db5@collabora.com>
References: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
In-Reply-To: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738240278; l=1442;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7SBQfrRI2oth98VXFTxo4EgRQoJmwkt7eFh7tw9GTeQ=;
 b=hW27eiliAuhLJ3bX0TZxDlJAjNOQ3m9sjFDp5etbbNB2TQuNIoz+VdYFqr6/zFYNwyD1nmLS9
 82XZOVKIPdnDZ28vclIYMp4N+2V2SA0LuF4ZGkHNmbacKv3oPNvmtC0
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_043123_037691_BEC97B77 
X-CRM114-Status: GOOD (  10.83  )
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

Adds a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
This new compatible is needed for this SoC support, as the other
existing compatibles for the same architecture (MT8188, MT8192) do not
match the required power domain number.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
+              - mediatek,mt8370-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -217,7 +218,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8186-mali
+            enum:
+              - mediatek,mt8186-mali
+              - mediatek,mt8370-mali
     then:
       properties:
         power-domains:

-- 
2.48.1


