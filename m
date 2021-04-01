Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CA0C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 12:18:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D176112D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 12:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D176112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/fYgGbWqIURtPwWSX4tbvU1ixlduR03/mwlRMeoliGk=; b=fwC9F7AxYyFvTbeL+mcTzeHze
	DZiyUROONVI2FcD3XTfhWJBhh7rHz6PEiyHeKiGPsMgTXg+LjSc8hPaQBo6qtIa+FThIJprm5RoPv
	W88bwjDhW7KAoUIRfJFQ3Z0o9Dni2KxjXW4OokqdR9Py9u+7epdfewJnAvqleOITJ8lXHlkOMlIU5
	uOzW915UhqU6W0H9toW7ga4fQO9fycnbAgehlSupE3QhT7FObtUcfLT3+4l14SO4Hra1Pxf8G34cw
	0FaELG5DiZkL4rk4Eg8WVQCXW9pTAohh6ir7IslezSQQDhbDuMZ6s0CEXiLbim/Y+qF6/rttmaM2x
	Dy7gsZ01w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRwHE-009ZEI-UE; Thu, 01 Apr 2021 12:18:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRwGu-009ZAl-H2; Thu, 01 Apr 2021 12:18:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D152561222;
 Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617279477;
 bh=0AGwy6Tl68VsWBu68wDgwZ5CzpVE/d5ORNGmhEDws2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j9+6sIJKmL+XOmxe06aUOTq1k9rbWG1ko3gLDYYloZawQ+uPzb6HyLO0axwBtY/Ml
 jEkUoJ6zUkX7bndJh8cFEKmiybNNqXDM2/N51fsLAcRv8KSFdfsOq6t2Lqw1c+7owx
 JlUeuTdafy2N/TkneDHlThe1fAG/peHgxaKuZ5irClbtzrgNvwG8Cu6cjpJDu8Pyqw
 VQJfPHNNFDlpcQ/t/ynxrYUdvt5ngXcTEQpbbm6CBM3/TsOtiSwbO6j9L3XnbMHcrh
 42PaDgiDzIgzIOab1guPYd/uAMB7PqTriadjZY+MZAe3kyHidi2bMjqQMX6tN1Jeq0
 7oNNkgvReRKmw==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lRwGo-001c3X-GL; Thu, 01 Apr 2021 14:17:54 +0200
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
Subject: [PATCH 26/32] dt-bindings: iommu: mediatek: update mediatek,
 iommu.yaml references
Date: Thu,  1 Apr 2021 14:17:46 +0200
Message-Id: <f1a798e2d5ffa829d0324333a1af91f1b3a63dad.1617279356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_131800_933757_84C6000B 
X-CRM114-Status: GOOD (  12.40  )
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
