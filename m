Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEC3C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyMuc6+z6Czz6mBk9Fo6HyijgYmHTnDSU3jNKbiRzWU=; b=Jfy8x1VoftcH3oNIyEC+lBwkMZ
	pL2nIuuo9LjuPk6POPWvC0OWpJ5i/3MqCKOwOKvU0+lTowMnvQvJnJZDEQYUboIhDtw9FYv+77SQb
	itPomU95ZNxt2YTwJdjUr7owRnINsBbdeYHYdoMQ29NOt8lwwFzNB26uW1nwXZvy109ka8x67uhww
	k9qxBkyJcxzeRDS1qarJ+7arZj9Dl5sP22t/mS8MGkRdf86c1najipJTS7zuRzHQ0trC5YOFfqZXW
	nVsOMnIDAQ9MpCNjgzEIvE5r5SZauYst5aMOFlPTZg9rCYWvVhZASYF8pez/h9FtKBdIt36DLtjOx
	mGhF6+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuOr-004D8G-Kw; Fri, 03 Mar 2023 01:39:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuOp-004D5u-2q; Fri, 03 Mar 2023 01:39:56 +0000
X-UUID: 48905650b96411edbbe3f76fe852e059-20230302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tyMuc6+z6Czz6mBk9Fo6HyijgYmHTnDSU3jNKbiRzWU=;
	b=H/pVhggzKmW/NSqylZHPxYrKNz9i5+wZ8DbK+eAN9iHz9eV+ACfoUko2UmGwPyfjnGY2g+YomMebii51FQvDs1DTjtLQ961HUMOgMsWW2QOX9k33kGjcGuu/OpifzEmgFkqtpVgIpy9ZJw8cOemBYBZ2o0HwMtvzwa6rHP2RqnA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:f89cf4d6-e0ac-4e7e-8d32-a5190821e0aa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.20,REQID:f89cf4d6-e0ac-4e7e-8d32-a5190821e0aa,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:25b5999,CLOUDID:29419bf4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230303093901985AIBF2,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 48905650b96411edbbe3f76fe852e059-20230302
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340934626; Thu, 02 Mar 2023 18:39:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 09:38:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 09:38:45 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, "Allen-KH
 Cheng" <allen-kh.cheng@mediatek.com>
Subject: [RESEND 2/6] media: dt-bindings: media: mediatek: Remove "dma-ranges" property for decoder
Date: Fri, 3 Mar 2023 09:38:38 +0800
Message-ID: <20230303013842.23259-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
References: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_173955_157518_8804BBE6 
X-CRM114-Status: UNSURE (   9.78  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
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


