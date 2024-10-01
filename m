Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0319ECE7D0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejGJNBzCUSn/2STvxEtP4Qm9W+BBPtGa+kdNm7gnwwU=; b=g1qjlOip4zRYg8
	KoG6xspb3Z7HJvdD0+uB4Qwk5C6iTZqmu7tBkdsOpZiTQEnlz+JfLVx54zjPxBxIaZGyCs9V1Npqc
	HmfXDuOq8J/sSdpfyH38Op/T/0yOJNjvvMrAxKLKxNw83z2KEYRtcEMrm+OqOTFg7y0X9xgHGKJk/
	OP1E21gBuMCkKp3CRS2UWw28jqQuSst2GgDH7DxJBC4W1su98CHF8fCz2HLJN/Cv5aDLRVgbo9N2V
	vW2HuyVSOlYK9yrPSZGJ34DZ4Eb9YbbH3odqLB2dTzaM4FxJs6GeKJgb+o22rykmRckwu9MTwzlY3
	PnAGHxd4K5uifZiWOaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbIE-00000002Z6y-2x7E;
	Tue, 01 Oct 2024 11:43:50 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb6I-00000002WMw-48cx
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-719b17b2da1so3887383b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782290; x=1728387090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejGJNBzCUSn/2STvxEtP4Qm9W+BBPtGa+kdNm7gnwwU=;
        b=WnAlb3q611HZwRtoSAbWFYm0pNwxESrRwP/2fgdL5YMOZrLC/3MgHsEyZ6E3ALWgxt
         T5DQSQY5PRtFVB+3ytG+mYI2ZdACWNAfCXD7cD1GGHiH1pSnktoOxpcTYaXXLvL4LMbu
         CGzHdekM0VJ8/PLgbCTEfiUgR7/dj8yQWxNlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782290; x=1728387090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejGJNBzCUSn/2STvxEtP4Qm9W+BBPtGa+kdNm7gnwwU=;
        b=SIbWYCSzOx5tB0yE9XEQq+NE+HM9VQyWwmo4kos9+fKwr5wzv9xMpFlvcnQh6zXdwe
         3HBJbDjo5B7jlD2zEpV6O4IvK35P3HdA1nQBcy+tedoM864Ef8tsw6dfgD+tQDtAJUBk
         QAomGRwUY/BUqtQE2VzurDMcr7xGkSkzkwLU6ucRo2lEm5j8eSo0dCKdx/UKXr//PqPc
         rOhQCdIgOyuXnmDTJwQ0OD85x9yJy4jKcS86NH+ORPVcFbNrYx1ET4nRfewUApHWq5tx
         E8oaz7pKESwDX+unsFjeCA8wtomzghbFeF/7vu78t8V2Ucz2Rx4YHsk9DVMutgtiUjmT
         rpPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0BYOm2J6JXUBSmZh3lBjCsqZ5MuRfo5DjOLmqQsWm/UBAnuuk4l1umGTGRJUO0vtmXXvnOvL0ANpZ9vQAdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YynrzBn9YO1uz+zR5id1W0KNY3IPy1z3EXhD8MJUQttK+zMK80S
	uzhAxnsrr+nfnC7hEe+DMBI8+sT/5ENH4OJsBmx2Wi4/xxmTLCiCBz8anYCzig==
X-Google-Smtp-Source: AGHT+IGmqm0A1CKXunN+IYhXZlTEbv5bvkc+2qchW2O8DdvX6JHtqPJaxZtG+8eE9yYDL747Fo4WoQ==
X-Received: by 2002:a05:6a21:1583:b0:1d4:e500:ad6c with SMTP id adf61e73a8af0-1d4fa64d6a4mr21967043637.3.1727782289986;
        Tue, 01 Oct 2024 04:31:29 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:29 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 4/8] dt-bindings: media: mediatek,vcodec: Revise description
Date: Tue,  1 Oct 2024 19:27:22 +0800
Message-ID: <20241001113052.3124869-5-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043131_038497_5D8A662F 
X-CRM114-Status: GOOD (  19.74  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Revise the description of MediaTek video decoder to improve wording, fix
typos, simplify diagram, and extend the pipeline architecture used in
newer MediaTek SoCs (MT8186 and MT8188).

Signed-off-by: Fei Shao <fshao@chromium.org>
---
Feedback are welcome.
I've tried my best to organize the existing information with some
educated guesses, but there might be inaccuracies or gaps still.
Please let me know if you have anything to add so we can make this more
comprehensive. Thanks!

Changes in v2:
New patch.

 .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
 1 file changed, 59 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index a500a585c692..52a96a5aec96 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -5,52 +5,70 @@
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek Video Decode Accelerator With Multi Hardware
+title: MediaTek Video Decode Accelerator With Multi Hardware
 
 maintainers:
   - Yunfei Dong <yunfei.dong@mediatek.com>
 
 description: |
-  Mediatek Video Decode is the video decode hardware present in Mediatek
-  SoCs which supports high resolution decoding functionalities. Required
-  parent and child device node.
-
-  About the Decoder Hardware Block Diagram, please check below:
-
-    +------------------------------------------------+-------------------------------------+
-    |                                                |                                     |
-    |  input -> lat soc HW -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output  |
-    |            ||             ||                   |                     ||              |
-    +------------||-------------||-------------------+---------------------||--------------+
-                 ||     lat     ||                   |               core workqueue  <parent>
-    -------------||-------------||-------------------|---------------------||---------------
-                 ||<------------||----------------HW index---------------->||        <child>
-                 \/             \/                                         \/
-               +-------------------------------------------------------------+
-               |                          enable/disable                     |
-               |                 clk     power    irq    iommu               |
-               |                   (lat/lat soc/core0/core1)                 |
-               +-------------------------------------------------------------+
-
-  As above, there are parent and child devices, child mean each hardware. The child device
-  controls the information of each hardware independent which include clk/power/irq.
-
-  There are two workqueues in parent device: lat workqueue and core workqueue. They are used
-  to lat and core hardware decoder. Lat workqueue need to get input bitstream and lat buffer,
-  then enable lat to decode, writing the result to lat buffer, dislabe hardware when lat decode
-  done. Core workqueue need to get lat buffer and output buffer, then enable core to decode,
-  writing the result to output buffer, disable hardware when core decode done. These two
-  hardwares will decode each frame cyclically.
-
-  For the smi common may not the same for each hardware, can't combine all hardware in one node,
-  or leading to iommu fault when access dram data.
-
-  Lat soc is a hardware which is related with some larb(local arbiter) ports. For mt8195
-  platform, there are some ports like RDMA, UFO in lat soc larb, need to enable its power and
-  clock when lat start to work, don't have interrupt.
-
-  mt8195: lat soc HW + lat HW + core HW
-  mt8192: lat HW + core HW
+  MediaTek Video Decode Accelerator is the video decoding hardware present in
+  MediaTek SoCs that supports high-resolution decoding functionalities.
+  It consists of parent and child nodes.
+
+  The decoder hardware block diagram is shown below:
+
+    +------------------------------------------------+------------------------------+
+    |                                                |                              |
+    |  input -> LAT-SoC HW -> LAT HW -> LAT buffer --|--> Core HW -> output buffer  |
+    |              ||           ||                   |       ||                     |
+    +--------------||-----------||-------------------+-------||---------------------+
+                    LAT Workqueue                    |  Core Workqueue       <parent>
+    ---------------||-----------||-------------------|-------||----------------------
+                   ||<----------||---------HW index--------->||              <child>
+                   \/           \/                           \/
+           +-------------------------------------------------------------+
+           |                          enable/disable                     |
+           |                 clk     power    irq    iommu               |
+           |                   (lat/lat-soc/core0/core1)                 |
+           +-------------------------------------------------------------+
+
+  The child nodes represent the individual hardware blocks within the decoding
+  pipeline, such as LAT-SoC, LAT and Core.
+  Each child node is responsible for managing the dedicated resources of the
+  hardware, such as clocks, power domains, interrupts and IOMMUs.
+
+  The parent node is a central point of control for the child nodes.
+  It identifies the specific video decoding pipeline architecture used by the
+  SoC, manages the shared resources like workqueues and platform data, and
+  handles V4L2 API calls on behalf of the underlying hardware.
+
+  The parent utilizes two workqueues to manage the decoding process.
+  1. LAT Workqueue, for LAT-SoC and LAT decoder:
+     Its workers take input bitstream and LAT buffer, enable the hardware for
+     decoding tasks, write the result to LAT buffer, and disable the hardware
+     after the LAT decoding is done.
+  2. Core Workqueue, for Core decoder:
+     Its workers take LAT buffer and output buffer, enable the hardware for
+     decoding tasks, write the result to output buffer, and disable the hardware
+     after the Core decoding is done.
+
+  These hardware decode each frame cyclically.
+
+  The hardware might be associated with different SMI-common devices.
+  To prevent IOMMU faults during DRAM access in such cases, each hardware with
+  the unique SMI-common device must be placed under a separate parent node in
+  the device tree.
+
+  LAT-SoC refers to another hardware block that connected to additional LARB
+  (local arbiter) ports, such as RDMA and UFO.
+  It requires independent power and clock control to work with LAT decoder, and
+  it doesn't have a dedicated interrupt.
+
+  The used video decoding pipeline architecture across various Mediatek SoC:
+    MT8195: LAT-SoC + LAT + Core
+    MT8192: LAT + Core
+    MT8188: LAT + Core
+    MT8186: Core
 
 properties:
   compatible:
-- 
2.46.1.824.gd892dcdcdd-goog


