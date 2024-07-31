Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD116C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 12:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doFfXAdFce+mHfwQqD0retC6vnN+u/7Ff0DYCz/QITI=; b=ZVfqbt8NUhe26fN6DZM5Q1h6qd
	r9bkkyBJMSorjk6RmlmPmBVM20RhwqT/M/oo6u80bD63bYbuM1f+wcXFSkhb/IgBNay7a1Q6BUeCA
	jD75pE8IVjHxxuwhZ9Zo0BZPOAW5vavuInEz4NWLlW/i5zdkz98d5EGJmMtylWhSMEb86e0Wtj1Xj
	kyVlH+4UHycu6+F7qTMPl83F9SWcztXjv+c4fJhCUv15QiPMVMiDDoMPs/uXjT3+F4Y/ZKCviw2ka
	Cv2DJTl4BlUzFL5C7miyEeSgrQkLAZ57AxuJbbiWsoWroWH/FlSmnDI5kMdVQGlCUDJ9lhGj4KRJj
	CjfGydTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8He-000000011Rf-0Fjk;
	Wed, 31 Jul 2024 12:18:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8HI-000000011NW-1791;
	Wed, 31 Jul 2024 12:18:01 +0000
X-UUID: e9db74184f3611efa6c87f6b4542ff6b-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=doFfXAdFce+mHfwQqD0retC6vnN+u/7Ff0DYCz/QITI=;
	b=DZIlnf5e9llC+JfX+bs7/gmyoRLXoqByuSqO8AXUHiiymtNlvkWOkbkHQAIKT7o9ffFcFRqxkciQFph6vGAsdkO4r8I7NH/CmKL+qT8ZjzBYom5cxYt7ZQEMWAoIvbpNGtrTGbiYPGb1xOjUJrogNm5NibhseBr6DPyCt3ndL4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:618346b7-4deb-4c7f-a0e5-291932a9a9b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:75841fd2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: e9db74184f3611efa6c87f6b4542ff6b-20240731
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 386780820; Wed, 31 Jul 2024 05:17:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 20:17:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 20:17:50 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Conor Dooley
	<conor+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: Support multiple reserved memory regions
Date: Wed, 31 Jul 2024 20:17:29 +0800
Message-ID: <20240731121730.1196-2-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
References: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.303100-8.000000
X-TMASE-MatchedRID: x6uIgBUWMExlJTodqNqEzkg5Iem1vm3HMZm0+sEE9msa/zWbQz3vDnIg
	OX9HH0Q4DGo03EdVgDKjp64yUKGpZAe8DFR77Tc9R+GtoiXVeDFYuTsoeO+cJJsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNa6KQIvxVddMz2TjDxPo/IhKuQ3j/AQWx0ba8Mi83eAhDQwJC8nENETqCy
	Yebl7X7A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.303100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F99A50D39DB22728D64E0B3D9C7D062858A63D0629F3B6FE71372A746F0533C22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_051800_334326_849A9883 
X-CRM114-Status: GOOD (  10.86  )
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

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

Remove the maximum number of 1 for memory regions.
Instead, add some descriptions to ensure the integrity
of the documentation.

Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index d05d1563ec19..3362c8ffdccc 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -55,7 +55,9 @@ properties:
       initializing SCP.
 
   memory-region:
-    maxItems: 1
+    description:
+      List of phandles to the reserved memory nodes used by
+      remoteproc devices.
 
   cros-ec-rpmsg:
     $ref: /schemas/mfd/google,cros-ec.yaml
@@ -123,7 +125,9 @@ patternProperties:
           initializing sub cores of multi-core SCP.
 
       memory-region:
-        maxItems: 1
+        description:
+          List of phandles to the reserved memory nodes used by
+          remoteproc devices.
 
       cros-ec-rpmsg:
         $ref: /schemas/mfd/google,cros-ec.yaml
-- 
2.18.0


