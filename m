Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28873C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5cnBIGTFta30P7mscy72z68CYY3xkJ8c8wqppX2Iub8=; b=ZF0bv4Kp6qno471DuoA3gnZXsN
	owdfWy1Tdr5itnLHx16DXAlHSUmMpSlj6CAQhFySPA2y2VNG8RdXPXM/jSRJlrS3ZSIBrZblY9AYH
	mWCoKE4YOnpotnJ/XvrVptNKb8HWIFsoQ3HWmD53iwN6/SHIWRVL1ao8SAAGl+9iykIM/jsjreZPr
	kKYeXEPCK9HpdYi3jJasfsIK5LHOW25a33yFQsCLl4szbnu0OTm0RD/t9syxVpw+7ZkkyBUw2vOIg
	YlSZEwkVggROVQ8icXgx7PsRCEya9WCA0sMUN2cWeo45uqpUn8qTLPBeIIOWovAgzkynoeDeM0psz
	BY4ydZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51RW-00BlNU-1n;
	Mon, 20 Nov 2023 10:23:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51RQ-00BlM9-1J;
	Mon, 20 Nov 2023 10:23:48 +0000
X-UUID: dcbf7d9e878e11ee9b7791016c24628a-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5cnBIGTFta30P7mscy72z68CYY3xkJ8c8wqppX2Iub8=;
	b=fWek+mEMdXrrEXd3HldEsWJgUSIvoAoxTP1IPVAFgb3hNChyR5V42IjmDwbXYNYki83IT+m8SR9q/Ik8qUbHMhMpm8GaEpv2xGizTae0fUu+Qmz6KVK5p0nv500fMuZGsN5fFOGotLjOJUWpNesdsZLot78ydMN6UlUyozBqufI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:91bd817b-9ebd-4208-8647-98e8a6a3c54d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:8e7e4360-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: dcbf7d9e878e11ee9b7791016c24628a-20231120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1867273581; Mon, 20 Nov 2023 03:23:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 18:02:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 18:02:59 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Garmin Chang <garmin.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH v4] dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188
Date: Mon, 20 Nov 2023 18:02:58 +0800
Message-ID: <20231120100258.3428-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.349200-8.000000
X-TMASE-MatchedRID: BHLx0ZeYtM1eiY7hjuuIsm3NvezwBrVmCt59Uh3p/NVHZg0gWH5yUTP7
	OSqW2R7sUYCBevv5+axRS7xjEb+dxB9J5bZqJbIJe8FaKRfM2oOy4iyjvVWToqdrpTvh7T6o88Q
	4SiSCA0uVMlcqqHWd7fNdJKB44KmGkfRhdidsajMURSScn+QSXt0H8LFZNFG76sBnwpOylLOY9r
	8YLxxS4dgS604jgwkFQVackz7nDBjHrR5lGQU4zkV0FoTjxQgL0J69tGon+X3UgUmiG7ib0MxU6
	jcX1FK3fA2Q/royHVoXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.349200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A2E3637E6938936CF704E8E60C8754BE664BF24B380C333488BD6569875CF8BA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_022344_897897_028AF953 
X-CRM114-Status: GOOD (  10.81  )
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

For MT8188, VPPSYS0 and VPPSYS1 are 2 display pipes with
hardware differences in power domains, clocks and subsystem counts,
which should be probed from mtk-mmsys driver to populate device by
platform_device_register_data then start its own clock driver.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
Change in v4:
- Squashed binding patches
- This patch is based on [1]
[1] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
  - https://patchwork.kernel.org/project/linux-mediatek/patch/20231117054345.15859-1-yu-chang.lee@mediatek.com/

Changes in v3:
- Separate binding patch from driver patch

Changes in v2:
- Refine commit message
- Refine commit title

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 536f5a5ebd24..50324248b965 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -32,6 +32,8 @@ properties:
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
               - mediatek,mt8188-vdosys0
+              - mediatek,mt8188-vppsys0
+              - mediatek,mt8188-vppsys1
               - mediatek,mt8192-mmsys
               - mediatek,mt8195-vdosys1
               - mediatek,mt8195-vppsys0
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
index d7214d97b2ba..860570320545 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -43,8 +43,6 @@ properties:
       - mediatek,mt8188-vdecsys
       - mediatek,mt8188-vdecsys-soc
       - mediatek,mt8188-vencsys
-      - mediatek,mt8188-vppsys0
-      - mediatek,mt8188-vppsys1
       - mediatek,mt8188-wpesys
       - mediatek,mt8188-wpesys-vpp0
 
-- 
2.18.0


