Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA6FEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 02:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOLKL9NJa0BDY/y3Vru7MJtGMdTwIgCiyE/U5u/zfS0=; b=aA7OTiuuTG3ynIP0bjemKyA5j1
	6zS2fnNnrLCbtQQcLB7Q+vSQYPQ9BGFsZ8HdYlwinhEgdxtQefoyg4d/fD5SUH/BXBLXW4x3M2bTc
	hA4S8LJT47Zb5ZDttUm25Ezpchy19Iv3FiDyP8O0yoHc7ZRCO55Pa6H15U92CmEmws2dq3PGB77OL
	ZCEqYuF19xciLH5s6coNV/AvuT8d9mx0cXRk0TBQZO3NFuGxpxgCdI/LMtMFE6A1x0KQw4nIuY8uL
	NvJMHMeLLtRjDEE82nFKMxwRCI9adK6QeYu4rxz8icj99Q8m/2ndmkwIRz4q6oljPht2Krctyr14+
	cZWI0BmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ3SQ-00DNUl-2l;
	Tue, 11 Jul 2023 02:50:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ3SO-00DNU8-2F;
	Tue, 11 Jul 2023 02:50:29 +0000
X-UUID: aee56ce61f9511ee83ed1395ce914268-20230710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OOLKL9NJa0BDY/y3Vru7MJtGMdTwIgCiyE/U5u/zfS0=;
	b=nmgWow6hJkVWGY5IJo+w5gP8gt7AH1yVxA+qvLzRf5ls35C5Z7Xw8uAypgVZfv0ehaKD+JslRaPshSsrA7inX6QC2uRUxA7mPtl1o/pw80X4QdDudnfZOSUIhKdZKX5I9Q0YK1Esg4UuVO6kQ33wlE2wEfOSS4IRAUR+MTZ5tr0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:d31c7b0f-f9f6-4f04-9672-abcdba28943f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:5065160e-c22b-45ab-8a43-3004e9216b56,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aee56ce61f9511ee83ed1395ce914268-20230710
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1777880506; Mon, 10 Jul 2023 19:50:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jul 2023 10:39:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jul 2023 10:39:48 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH v2 3/4] dt-bindings: soc: mediatek: pwrap: Add compatible for MT8188
Date: Tue, 11 Jul 2023 10:39:28 +0800
Message-ID: <20230711023929.14381-4-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230711023929.14381-1-jason-ch.chen@mediatek.com>
References: <20230711023929.14381-1-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_195028_750572_12CE10DB 
X-CRM114-Status: UNSURE (   9.80  )
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

From: jason-ch chen <Jason-ch.Chen@mediatek.com>

Add MT8188 PMIC Wrapper compatible to binding document.

Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index a06ac2177444..c2f22e7dbcfb 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -50,6 +50,11 @@ properties:
               - mediatek,mt8186-pwrap
               - mediatek,mt8195-pwrap
           - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt8188-pwrap
+          - const: mediatek,mt8195-pwrap
+          - const: syscon
 
   reg:
     minItems: 1
-- 
2.18.0


