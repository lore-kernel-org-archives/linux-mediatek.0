Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEE1EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jun 2023 21:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKE9BiQP+eOe1UTQpPcrsrjA1s2xHp5VPFiPPtT4pdY=; b=xVVjIzGATrJ8ea2iAc9Wl883Mx
	ALCH9i9GRLIMCgCbh6vmc3Vpl11EfmZg4sLYZzQ9ctSUGX/q9In6llYUDS4gUyr13hWopMPxuwVhd
	HlcWLwvOCT9X0GOSOCPGl/6kTRXyXrp+TkHloiolXFOdWH2PPRG5pP9WivRUnk/z58V7SdQKQSncM
	5OxDTJnWx9QCHB9TYmruEeu74kSUt8PmjkjkEq228q/bF9ufoxJ/UeILNZxspNIMvu+qUgdVTILqz
	JEYwSsMBgkRkNweAGVpnCPS4DcoNvcT6bEoEFY2LZ2aVxmKt+SDOI69KcDYraJnbH/qoj7wEq9zXi
	uwx5v46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGWa-00EEsw-07;
	Tue, 27 Jun 2023 21:47:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGW8-00EEbj-1L;
	Tue, 27 Jun 2023 21:46:33 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDAE8660716D;
	Tue, 27 Jun 2023 22:46:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687902391;
	bh=6/vcaD7vHgxFo563mcGSzADfJpcIhcKqIWXtcXlmyyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QRX7Y7FJczspzvg1lbr4hdqkL2V2n45ngk1lc9CQScHa7bQQYNO6BXWJjQ4mdUwxJ
	 /9TsURMA8BOHYMi0/Fu7ThKFO5dXWGl02FiKipJReDlL/oU340MrHwcADXNhUXbN/R
	 Ar7nAy7hwB1n1fFG9oX9YJpKbYno+7ObS6bmEJ7NFPjGR+Q/RZB5dHbw+Oc4zx4OZf
	 SRs4akW6zCFzxlDCOOtajVTuPnyjEhgqqkQP13tDy9KBzV7UfY0ncA2U/xN6KHret8
	 F4QmMtU7qTp035vpOCTPfbJKxor8dFaC9NlV0UgyerJSZhXuNjSgFzwVjB+KshnJ1C
	 jn/wsh0jiqtcQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/7] media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS register space
Date: Tue, 27 Jun 2023 17:45:53 -0400
Message-ID: <20230627214615.1503901-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627214615.1503901-1-nfraprado@collabora.com>
References: <20230627214615.1503901-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_144632_584179_26BEC0E2 
X-CRM114-Status: GOOD (  13.68  )
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

The binding expects the first register space to be VDEC_SYS. However
this register space is already assigned to a different node on both
MT8173 and MT8183: a clock-controller node called 'vdecsys' which is
also a syscon.

In order to resolve the overlapping address ranges, remove the VDEC_SYS
register space from the video decoder, and add a new property to hold
the phandle to the syscon, so that iospace can still be handled.

Also add reg-names to be able to tell that this new register schema is
used, so the driver can keep backward compatibility.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v4:
- Removed VDEC_SYS reg from mt8173 as well
- Reworded commit

Changes in v3:
- Removed the active clock
- Added a mediatek,vdecsys syscon property

Changes in v2:
- Merged with patch 1 (media: dt-bindings: mediatek,vcodec: Allow single
  clock for mt8183) to avoid changing number of clocks twice
- Added maxItems to reg-names
- Constrained clocks for each compatible
- Reordered properties for each compatible

 .../media/mediatek,vcodec-decoder.yaml        | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index 1e56ece44aee..b401c67e3ba0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -21,7 +21,22 @@ properties:
       - mediatek,mt8183-vcodec-dec
 
   reg:
-    maxItems: 12
+    minItems: 11
+    maxItems: 11
+
+  reg-names:
+    items:
+      - const: misc
+      - const: ld
+      - const: top
+      - const: cm
+      - const: ad
+      - const: av
+      - const: pp
+      - const: hwd
+      - const: hwq
+      - const: hwb
+      - const: hwg
 
   interrupts:
     maxItems: 1
@@ -60,6 +75,10 @@ properties:
     description:
       Describes point to scp.
 
+  mediatek,vdecsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the vdecsys syscon node.
+
 required:
   - compatible
   - reg
@@ -67,6 +86,7 @@ required:
   - clocks
   - clock-names
   - iommus
+  - mediatek,vdecsys
 
 allOf:
   - if:
@@ -126,10 +146,9 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/power/mt8173-power.h>
 
-    vcodec_dec: vcodec@16000000 {
+    vcodec_dec: vcodec@16020000 {
       compatible = "mediatek,mt8173-vcodec-dec";
-      reg = <0x16000000 0x100>,   /*VDEC_SYS*/
-          <0x16020000 0x1000>,  /*VDEC_MISC*/
+      reg = <0x16020000 0x1000>,  /*VDEC_MISC*/
           <0x16021000 0x800>,   /*VDEC_LD*/
           <0x16021800 0x800>,   /*VDEC_TOP*/
           <0x16022000 0x1000>,  /*VDEC_CM*/
@@ -150,6 +169,7 @@ examples:
              <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
              <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
       mediatek,vpu = <&vpu>;
+      mediatek,vdecsys = <&vdecsys>;
       power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
       clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
              <&topckgen CLK_TOP_UNIVPLL_D2>,
-- 
2.41.0


