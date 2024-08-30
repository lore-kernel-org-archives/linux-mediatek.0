Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAB8CA0EFC
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPqT732b21fU/+A4vA1tTR/mY6i6sKym9BGS8yjQ1+k=; b=DkMfgyYj5KGT4KFnULavE/NL75
	posgzbFnTtTf8+sebRdLqW8V5EP+jWMHLXe3FrIJI7l1cr84lbkA9RBKRDDM6YlxcUoICkzUVSKtD
	jn0BNu4xPNQzMyptA71BMIrndjx4IFFLO8mcDrwrA9ZxmfGYLtYsOnbh0R5Y+iaTxfn1IotfsUxgG
	Fo6BQzbEhvutpMVqQO4nQWp1SmGwtjqvzDH9gRvMbmOMaKXHp8ZpEMCXl7vXyZhLUgUS2tdsc33Tb
	hylgRHARCGWihsSUPHUwwaWk0u/7Y7qKCekJsV9dtpKDV2ojp8LseadQRyTGEx5uwbhSQEWtUc90p
	NYPTtC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzZ9-0000000605M-2gyV;
	Fri, 30 Aug 2024 11:13:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzUc-00000005yZq-2cFo;
	Fri, 30 Aug 2024 11:08:41 +0000
X-UUID: 316685e866c011efb3adad29d29602c1-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dPqT732b21fU/+A4vA1tTR/mY6i6sKym9BGS8yjQ1+k=;
	b=umBqFU7H060WCELddKCTzug2qj+D5lCsf40i9hlVTcLu8Zm0IjskvMtYBNbU8wbkvk7FHmGSJnHSK5e+vN6cG366FDNRPyqByvSagJ4XyikYc/7ugvVza3PbxA3kF4f18dTD+soMeyIo/bQyxbhtJEuRReZRnX7pqhBB59MBvCw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f17d3852-2a77-4aac-adec-4305478ab92d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:198e30bf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 316685e866c011efb3adad29d29602c1-20240830
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 34971407; Fri, 30 Aug 2024 04:08:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 04:08:28 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 19:08:28 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek
	<pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>, Lee Jones
	<lee@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Flora Fu
	<flora.fu@mediatek.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 6/7] dt-bindings: power: reset: mt6323: merge to MFD mediatek,mt6397 DT schema
Date: Fri, 30 Aug 2024 19:07:31 +0800
Message-ID: <20240830110732.30080-6-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240830110732.30080-1-macpaul.lin@mediatek.com>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_040838_689736_75A6EA75 
X-CRM114-Status: GOOD (  14.26  )
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

Convert mt6323-poweroff.txt to be compatible with DT schema.
Since this is a power-controller device node, merge it into parent
mediatek,mt6397.yaml. Subsequently, remove mt6323-poweroff.txt with a
separate patch.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/power/reset/mt6323-poweroff.txt  | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt

Changes for v1 and v2:
 - This is the first version of converting mt6323-poweroff.txt.
   This is because converting mt6323-poweroff.txt together
   with mfd/mediatek,mt6397.yaml, so we've create a patch set
   instead of submitting single patch for each subdevice.
 - This patch has been made base on linux-next/master git repo.

diff --git a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
deleted file mode 100644
index 933f0c4..0000000
--- a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Device Tree Bindings for Power Controller on MediaTek PMIC
-
-The power controller which could be found on PMIC is responsible for externally
-powering off or on the remote MediaTek SoC through the circuit BBPU.
-
-Required properties:
-- compatible: Should be one of follows
-       "mediatek,mt6323-pwrc": for MT6323 PMIC
-
-Example:
-
-       pmic {
-               compatible = "mediatek,mt6323";
-
-               ...
-
-               power-controller {
-                       compatible = "mediatek,mt6323-pwrc";
-               };
-       }
-- 
2.45.2


