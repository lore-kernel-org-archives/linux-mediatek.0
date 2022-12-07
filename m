Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83220C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 06:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G5CgmoJNqi0WF3OrbuFaLqD9wd1bS/NEuB81IeqtVY=; b=HKx56szgU3+KnsvNtKYlMpd4W+
	iLS2Q65wWnWKf/UX95EuU+ZcBUTYXWEX7Ap/4VZgNFjNYIrW9TQRJ5aPtfC/PxExEowOr9lkFmYF1
	wGQ7GomdWkok/S9F6YR1MSO2OW8NViYLYCTIeSDmaYvNW9mU0ADMYAHBaAzE/CiuEaYEtuCG2c8JS
	izDzTrZIUIQ4eWTs8pyVlaYY5fsd3yqZ4CmhqJlQSeWH3Z0rzJI6kmckrF/1tllPERnQa+GkhL1mG
	fuVgRAfL7frXy5mWCDtaqJ+V+jJOfRn8sas73Thg0vvTcQvgMA4kPbUw3ocmhWU0dvyfhCc7vunDv
	Jx1RBe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2no3-00Cizw-J2; Wed, 07 Dec 2022 06:21:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2no0-00Cis6-NG; Wed, 07 Dec 2022 06:21:22 +0000
X-UUID: 47c5b8d5329f46848e23537a9e820954-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1G5CgmoJNqi0WF3OrbuFaLqD9wd1bS/NEuB81IeqtVY=;
	b=aY2TYQZO47pJZhU3otENs3N4iz2SL2et78Z4N7MdSVodd8B2BuOaMaufARBRf8yF2HIdSa5yquadGWY2HR4BtpEfqPjeSrr7bbAPQ0vTRyTWqiRHLIs6e/ImEe2rMpzSuez6RnwN3BY5xZ6wcHaUk8pvZSTLVpphBtlv87CR/aU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:8efa4239-0dc6-4537-9b9d-f0b1ecf8ad97,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:710be1d1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 47c5b8d5329f46848e23537a9e820954-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016068089; Tue, 06 Dec 2022 23:21:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 13:51:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 13:51:10 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v6 2/3] media: dt-bindings: media: mediatek: Remove "dma-ranges" property for decoder
Date: Wed, 7 Dec 2022 13:51:06 +0800
Message-ID: <20221207055107.11333-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
References: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_222120_799782_08B0CBE4 
X-CRM114-Status: GOOD (  10.13  )
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

Because the decoder nodes already make use of the iommus property to
configure the IOMMU for address translations, having a dma-ranges
property makes no sense.

In fact, after commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for
bus controllers"), having a dma-ranges property causes IOMMU faults.

Remove the dma-ranges property and update the example.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../bindings/media/mediatek,vcodec-subdev-decoder.yaml     | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 46308cdaacc0..7efc70ae4406 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -76,11 +76,6 @@ properties:
       The node of system control processor (SCP), using
       the remoteproc & rpmsg framework.
 
-  dma-ranges:
-    maxItems: 1
-    description: |
-      Describes the physical address space of IOMMU maps to memory.
-
   "#address-cells":
     const: 2
 
@@ -151,7 +146,6 @@ required:
   - reg
   - iommus
   - mediatek,scp
-  - dma-ranges
   - ranges
 
 if:
@@ -185,7 +179,6 @@ examples:
             compatible = "mediatek,mt8192-vcodec-dec";
             mediatek,scp = <&scp>;
             iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
-            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
             #address-cells = <2>;
             #size-cells = <2>;
             ranges = <0 0 0 0x16000000 0 0x40000>;
-- 
2.18.0


