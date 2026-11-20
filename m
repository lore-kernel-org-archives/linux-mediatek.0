Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AE60A2609
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 03:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZVyujA0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHlJ1uw3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WLJppFL4Mw+ISOhDzHcNXkwUXDowBgytVU/dwM/GPt0=; b=gZVyujA0xliWzu
	yqqLfGCJPskgjMX/nPYB4YXbL2XenI6YT3CqYy7UutkBwug3YajU/SOzBzjOywWYFSmnVbyQAYAUf
	Xm9xwGAhuk/2s4AQcOARDzDfjmNVIpPV+CPpuC2WiK3F1fkq2+riVtisNHvO5AZ3CGalAYTuHWuy0
	EbwWGYqWIVDMaKpwoWuHnmwYVNzi6EAgVtroMvUfj2b1teIc6rA0HA+qaB1q53xdWVys5Hn3v+l+M
	ZRD4MKqIRmJw9Z5SnaldVK7qgFZnZqaIrDoNjZCMDf+k3LIFJxPM247Ra0Dr1btvrgE3AuczdLhN7
	xa7iH4C5JGXyRKxLCbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFFP-0000000Dx4w-326l;
	Fri, 20 Nov 2026 03:25:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFFO-0000000Dx3s-2I7k;
	Fri, 20 Nov 2026 03:25:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB0F74136F;
	Fri, 20 Nov 2026 03:25:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795145109;
	b=SnAYUX/DKy9s4VL6utwigEAwCQrxX47gj74vPv+KbHTa3TQHZLKwLNHzPfB3bwgWLeu3
	 EFz2n7l4Ntfe5HSkXhAljWY4dYx5m+1JVn/GYJg0q9GHojFWq/t74P4gE7tocVY7fhqav
	 cpgXDYPcL2JZJqxIgBgOnH2AbfAXwQpVgAlpHvhVp3Ma0PAjMa17u/o6f+JnxDg68mZKo
	 ZmNE/T3ykrjEVWJard5C3xEccR4zS+HNZPkfjrzOYT0Oid6k58ApYOo+ztgUAQXd124hl
	 2NxmUPbgDPfKfoIQmfjR8R8AU8vmJz47tleYgpwPuZqHQkeg94A4TZJmU+oBb46O7ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795145109;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WLJppFL4Mw+ISOhDzHcNXkwUXDowBgytVU/dwM/GPt0=;
	b=W4OaSsLId4uPPjQxfFgbgz5wCAIhWa/9SUegPpkogCS+rsH4DXZ6V7TlNx5+g7TZiGwl
	 PdElG4363Gz4bN5aC3ZWz+Dm4aPnieLu13au9Y0/nuxQTQKVFLzxJwhqPqZUC9EcttT4G
	 XZ8v7wS5XMvo7Ezi6jyXO8kdaEa4EoVuP46lpRjqPba79rUHtgYJ8XfHYwuq+JRt0Es3w
	 3cmtmnxYH+AfYsQZyxLBpQFUzwulLxkoIWUfUlDAEblG6yzin5NJbwiirtwAgljZZsnWK
	 4d3D7NnF6iJu7e6qGnvUbc1RiUpks2Va+HWqPcitfb4vPWHXVEVdCYyekkA+dfQwJgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECAC51F000CA;
	Fri, 20 Nov 2026 03:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795145109;
	bh=WLJppFL4Mw+ISOhDzHcNXkwUXDowBgytVU/dwM/GPt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NHlJ1uw3kz80H+9JcntZx8/6EFs7oVNRQjNS8FThWVh+ZSk+Bb6tHh3oIjRbZVLET
	 0WK8iyNUw+s6g2L5Wd5LAY0YZTYcrqAe46it1RIm8lYAPHxDlvsxveGW3g0v2QV7ms
	 7+y5uiydgQtWdEsJhivCvDxtuxGNKCoyZAhni9Fy8H5stoXsQXg/CDBVo2tJR/vByk
	 KIkOLQTCpcsnv0+/m63QOc2rWvjN4GDA62MELuxAt3+kj9CEk/FbsNg+RBtLzOm3cJ
	 nOQKM+gBCOSrxcF6+CIaCTc+PBlpGmRT+2+DLRokj3EClmiY6CT7i7yCbOLSfUeo6c
	 Y8yGTkzV9RTXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 77C654956D;
	Fri, 20 Nov 2026 03:25:08 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Fri, 20 Nov 2026 11:24:55 +0800
Subject: [PATCH v13 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-8188-smi-clamp-reset-v13-1-9a9516e81c1d@mediatek.com>
References: <20261120-8188-smi-clamp-reset-v13-0-9a9516e81c1d@mediatek.com>
In-Reply-To: <20261120-8188-smi-clamp-reset-v13-0-9a9516e81c1d@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Friday Yang <friday.yang@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145107; l=4444;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=myLx/H8ZE3QU456AZ+2tsE0HkVBhqvt9eD/4HGo/j7c=;
 b=977oJxxJHn924x5I+izxiFab4XsnUxA9DUMiIDZn27azxUnOvD54jXa1t7hCfSrH1Ine7wmvF
 EzR8tW9b7+7DuEnLTYFsPgmjSmBwc7y68ZOnG5+1WxJzhGWiyjFm8kC
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: congcong.yao@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Friday Yang <friday.yang@mediatek.com>

On the MediaTek MT8188 SoC, bus glitches may occur during MTCMOS
on/off transitions. The root cause is a hardware design choice in
the camera subsystem where the SMI LARB and SMI Sub-Common modules
are located in separate power domains and controlled by independent
MTCMOS gates. A timing window exists after the main power domain
is enabled but before the sub-power domain is enabled. During this
window, unstable glitch signals can appear on the bus. Unlike other
subsystems, the camera subsystem lacks a GALs (Globally Asynchronous
Locally Synchronous) hardware module, which would normally handle
cross-domain synchronization and filter out such glitches.
In contrast, other subsystems have their SMI LARB and SMI Sub-Common
within one power domain or could rely on GALs for synchronization.
Thus they are not affected by this issue.

To prevent these glitches from causing bus hang, SMI requires clamp
and reset operations. This change adds the 'resets' and 'reset-names'
properties to SMI LARBs within camera subsystem to support the necessary
reset operations. This reset setting is exclusively required for the
MediaTek MT8188 platform and remains inactive on other SoCs.

We also add 'smi-sub-common' in the smi-common binding for MT8188.
This indicates that some SMI LARBs are connected to the SMI Sub-Common,
which in turn is connected to the SMI Common. The hardware block diagram
can be described as follows.

             SMI-Common(Smart Multimedia Interface Common)
                 |
         +----------------+------------------+
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
       larb0       SMI-Sub-Common0     SMI-Sub-Common1
                   |      |     |      |             |
                  larb1  larb2 larb3  larb7       larb9

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../memory-controllers/mediatek,smi-common.yaml       |  2 ++
 .../memory-controllers/mediatek,smi-larb.yaml         | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 33c989f7fc33..65931adcc6fc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -55,6 +55,7 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8188-smi-sub-common
           - mediatek,mt8189-smi-common
           - mediatek,mt8189-smi-sub-common
           - mediatek,mt8192-smi-common
@@ -125,6 +126,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8188-smi-sub-common
               - mediatek,mt8189-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 9a5dafd7c07e..79ef73e52c5d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -71,6 +71,12 @@ properties:
     description: the hardware id of this larb. It's only required when this
       hardware id is not consecutive from its M4U point of view.
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: larb
+
 required:
   - compatible
   - reg
@@ -129,6 +135,19 @@ allOf:
       required:
         - mediatek,larb-id
 
+  - if:  # only for image, camera and ipe subsys
+      properties:
+        compatible:
+          const: mediatek,mt8188-smi-larb
+        mediatek,larb-id:
+          enum:
+            [ 9, 10, 11, 12, 13, 16, 17, 18, 19, 20 ]
+
+    then:
+      required:
+        - resets
+        - reset-names
+
 additionalProperties: false
 
 examples:

-- 
2.43.0



