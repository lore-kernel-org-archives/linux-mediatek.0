Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1181ECCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TucMTel3hohwxs6kGcphC2e2kM6zgmyC1hJadPP2us=; b=EbypvNrrKyJf/eeheK675WNGQg
	diusPykM0WZmdIbI+8p5QvNZ4MHvgC3RNectfarqiTvPAj09WTb9PGCL91nFoo1Tf5PMBuA9z6WBt
	7dtc3IcO71Yto3PszWe2hcTJ1DKd+/QX3A9A7Huia0Q88WRLeafk39Jbo6/e4R1V6vujbjoOVJwaT
	aHYjj30Yh4ld3R28XKoRekR5iFAuFR1DcLTaWQnSc8buW0qY3YZMA05R7m9rLSDH09xjZLGvMqgMd
	gPcrrif4uJmNplhxwNJtmJdq1cNowCEUiPU4THMd0JSeIv5cUL7EXRK/6ShlcCoLrWbcl8iwZFCrR
	yTGAFcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmWt-00000008D0S-0I16;
	Thu, 26 Sep 2024 11:19:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stmSk-00000008C1f-1niD;
	Thu, 26 Sep 2024 11:15:12 +0000
X-UUID: 9581e3547bf811efb3adad29d29602c1-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8TucMTel3hohwxs6kGcphC2e2kM6zgmyC1hJadPP2us=;
	b=uGYNDIOdBVGkCpGXyCkd607b//ZF9MDO3UvGSAIJ93OOCY3/W8woSLU5Gu+Me7tQXqZ2fjui9UXXPtOONAha2aRWGNEgFI2pycuXtamqf22knGVY3/4fxgg1xJyGGkDT3Kv2Zqpl4NoKgAFz/LlH8079Vt5Gw++wBaoxpMk+DGI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:54d4fa55-cd8a-4a16-8002-2994ddb7bd50,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:0cefced0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 9581e3547bf811efb3adad29d29602c1-20240926
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 670555272; Thu, 26 Sep 2024 04:15:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 19:15:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 19:15:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu
	<ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, Ben Lok
	<ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, "Chris-qj
 chen" <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v2 5/5] dt-bindings: display: mediatek: dpi: Add mt8195 support in power domains
Date: Thu, 26 Sep 2024 19:14:49 +0800
Message-ID: <20240926111449.9245-5-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240926111449.9245-1-macpaul.lin@mediatek.com>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.896300-8.000000
X-TMASE-MatchedRID: k8Cd32tj8sEDFgoHQs6fmo7Su3QulAZ5AWQaZTMSP87fUZT83lbkEOSZ
	Xqpiw34H8gMEd8ypEKNwN7+iItfSth9J5bZqJbIJwCZxkTHxccnJ5SXtoJPLyL6majHNXd7Go8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtqghXpaTf3SrfCJlZUJnnduI+qs8eq/YRT6HjoeF/jdcsN6
	OqbCF1maekXSEz/hmVJtoaSBlm7M9iXRhtqPi8cH0de3y1eaDB4sOrsb4iT/K/bbEolHIgZUOc7
	GjOamnWv5a9cmIodEszD8HZ4XvJ2ZRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.896300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4C671D08952117956573CDFA07FA76C03FDDA8D6790DA04E86A4B8DFED1EE75C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_041510_512944_97C5E773 
X-CRM114-Status: GOOD (  10.79  )
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

Add power domain binding to the mediatek DPI controller for MT8185.

The dpi node in mt8195.dtsi was triggering a dtbs_check error:
  dp-intf@1c113000: power-domains: False schema does not allow [[44, 18]]

Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

Changes for v2:
 - Because of the corresponding dts fix has been reviewed with a Reviewed-by: tag.
   [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@mediatek.com/
   We still need this change to fix the 2 dtbs_check errors.
   So keeps no change here.

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..07acc8a76bfc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -89,6 +89,7 @@ allOf:
                 - mediatek,mt6795-dpi
                 - mediatek,mt8173-dpi
                 - mediatek,mt8186-dpi
+                - mediatek,mt8195-dp-intf
     then:
       properties:
         power-domains: false
-- 
2.45.2


