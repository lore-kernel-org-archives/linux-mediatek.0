Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697BDC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCBB613A0
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDCBB613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/fYgGbWqIURtPwWSX4tbvU1ixlduR03/mwlRMeoliGk=; b=Ro2rmesfqdBqIAf/5SOzd5DVa
	D2jXYBh6wj5lEFasSiItJK7jkSab020Mma/UbIf9jSn6DdpVMUFB8Or/5Qa/Xz24dA9YyY5faDt6Y
	o12w8xikoW/B8RrDzqwLF2a2AaydkbKPoUS9ePXt3q94Iz66NJCTLjsHqAjuqrD5XqdFGWBslA0Yc
	SqSq7kueXUz7ItiK1q5EHlbRRKqqJir1P1UtzZQlk5upEuIygPyzJeDG0jODgVPJoWi4hejyVPgBv
	xCzeA0Ok2xr7HLRurWfFdHrgnRw0HeX8+arWTjtlcoEr1HQh25SPxsR6pdv8Hl/EvttJWVJUXlu1i
	50gI/u1aA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU3RO-004T2g-NP; Wed, 07 Apr 2021 08:21:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU3Qw-004Sy9-Ea; Wed, 07 Apr 2021 08:21:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B46E0613E9;
 Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617783662;
 bh=0AGwy6Tl68VsWBu68wDgwZ5CzpVE/d5ORNGmhEDws2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WKuVO9wh5JlK3fEanSkKl9+DRqJv/o7YL8kRRt+Tg84Tsa51MfDp1r/ViTQY9MQXJ
 /JdJ1o2+EGgIaJJPDblasGpT4Kv9scKk+/1iU5a2mKMmJ63aDQIgTKcckwYVP3qIwm
 9Y70muyNlMCoWxBpG6UyGuJJgiEpYfKq7cqpL76tNBUJRqdcKjYfK1+3JNs399a6wL
 QhFUpYIWkBJZzV2lQSigCPcZJAt1DnGIsczqQolFzV8W5oyBWF1Hg5LJwIEGMQDpFr
 Q8ZzAPbTKLyPAMKCdoC3y8qNrgrukITdvYLuF0U7JQwfokNw5o9jsTksWqrHE1wvqD
 0eG0z3HmrqyFA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lU3Qq-005i2N-H5; Wed, 07 Apr 2021 10:21:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Bin Liu <bin.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rick Chang <rick.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Tomasz Figa <tfiga@chromium.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 08/19] dt-bindings: iommu: mediatek: update mediatek,
 iommu.yaml references
Date: Wed,  7 Apr 2021 10:20:47 +0200
Message-Id: <8776972e59432915779acc5bd62d515e5532b612.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_092106_986319_2EDEF123 
X-CRM114-Status: GOOD (  12.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changeset bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
renamed: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
to: Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.

Update the cross-references accordingly.

Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
 Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 93b160df3eec..fbb59c9ddda6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -64,7 +64,7 @@ Required properties (DMA function blocks):
 - larb: Should contain a phandle pointing to the local arbiter device as defined
   in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Optional properties (RDMA function blocks):
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
index cf60c5acc0e4..39c1028b2dfb 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
@@ -19,7 +19,7 @@ Required properties:
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Example:
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
index acfb50375b8a..5e53c6ab52d0 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -17,7 +17,7 @@ Required properties:
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Example:
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index f4798d04e925..caa24943da33 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -25,7 +25,7 @@ Required properties (DMA function blocks, child node):
         "mediatek,mt8173-mdp-wdma"
         "mediatek,mt8173-mdp-wrot"
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 - mediatek,larb: must contain the local arbiters in the current Socs, see
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8217424fd4bd..a83ebc1a1c7f 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -18,7 +18,7 @@ Required properties:
   "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
   "venc_lt_sel", "vdec_bus_clk_src".
 - iommus : should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 One of the two following nodes:
 - mediatek,vpu : the node of the video processor unit, if using VPU.
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
