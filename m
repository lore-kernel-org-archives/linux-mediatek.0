Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010DFC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:00:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B6D23136
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B6D23136
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gf0e2BsbURsNWnoLZUTFnY6FB9ScREvkCGd+GDqotcM=; b=JpBTRxNeNzDqfOXrQZ13Wqshb
	o5BWJ1kg7hnfrCohZp3qwGYe0qi1y+m2h1YIdfmKI3BFiL9Uc3FJOR3NPTlsoRYwmT0zyulXzx13s
	DJo16TmepWR3koYqsdCmSQifr+k9NW3LA4I6XCzRAD5HtOT1bxL+BkRpmGw4RsYz57gcsbUdWnTX6
	R4m0COuFYtIOYhrPy8aoSdn/lAHcZp/Ufbnw0LcCs/hw3Tst74zw7+Vk+LNyIB5JpKumGELLSpQyt
	cqwE7UzKmbwr+r4EEWRTi5SArRx6rxbIXKstY12ORe8Rw18LRcwMq+3QHwyqw/kbLl5UAc+0ns9BO
	g6RSac5bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdsX-0003jX-RQ; Wed, 13 Jan 2021 10:59:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdsC-0003UJ-L1; Wed, 13 Jan 2021 10:59:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65B06235FA;
 Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610535570;
 bh=OG8KARVyVfWYeNIgPTfTdgsyg/2eyYBbFoiOqndpscA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C6y6kfCLqJoaNBZjagFxC2DgAOjVcfgzTmVYim/sVNZZ1oh8fWHV2beHlGn9HAkST
 6t/Z6cmxn97UbDjITbUJOS12Zl+6FJaySTwjuPuByHABHmi4Zh5ojE4zWrunibi1Xr
 jkpIyRZBEwuyM1K4qu+Mjz97juTQL3qfYo6F5tqmsrOLjYfrTLgDNIANMNdiWNa+KV
 +4zicVDyahiyVYwCZumJzJtAymc1gCCavBO5nRiroinsvcD+kcS2xxXlCysuxz5xtQ
 /gVvgRDRGkZkF1Vl9vTCrDaRmUpd76mbqlkcwwYDskSgngmx+NLTkT3nT0m90DK6uW
 uu51KA4N23VNA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzds7-00DpGp-SO; Wed, 13 Jan 2021 11:59:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 22/24] dt-bindings: memory: mediatek: update mediatek,
 smi-larb.yaml references
Date: Wed, 13 Jan 2021 11:59:23 +0100
Message-Id: <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_055932_868725_F9EB0D43 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Bin Liu <bin.liu@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changeset 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
renamed: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
to: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.

Update its cross-references accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
 Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 865e1e1b88ac..ed76332ec01e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -61,7 +61,7 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-wdma"
   the supported chips are mt2701, mt8167 and mt8173.
 - larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
index 044b11913c49..cf60c5acc0e4 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
@@ -16,7 +16,7 @@ Required properties:
 - power-domains: a phandle to the power domain, see
   Documentation/devicetree/bindings/power/power_domain.txt for details.
 - mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
index 736be7cad385..acfb50375b8a 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -14,7 +14,7 @@ Required properties:
 - power-domains: a phandle to the power domain, see
   Documentation/devicetree/bindings/power/power_domain.txt for details.
 - mediatek,larb: must contain the local arbiters in the current SoCs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index 0d03e3ae2be2..f4798d04e925 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -28,7 +28,7 @@ Required properties (DMA function blocks, child node):
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
 - mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 
 Example:
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
