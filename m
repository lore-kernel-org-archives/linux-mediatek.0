Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED83C61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 07:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucv5SkaPMyQeyclM1BmQvoovqtCfyR4/Dim+QgBHR1o=; b=E3z02j5NXbjt2s1HVq0LMl/D0d
	3mFpk54sIIpFJQcCMh48AOMtMxjtdoumkMNalQx5a41Bcsl7ybpe2KqKbIJIWanwuMneY5yfC7UqX
	JpRDhIvm0yH3ssd1IQOQzSoWui30OrAbDRlPdZc+prrq1UEEFg8xdktjpuN/q/Hk9onyLIhfdI4oz
	fNcTRxPYffhMziYLkC8tvNxuCZRvvsspWceF8MP+apL+WwaCIN2nWZc+J0E60oj71aV9JASn34JHF
	YzIIzXymFu2CM5/8du95sqg+s2Ma2Ktxdn/+ZgpGVPKbHv+zjSyZDcKeJg/mAvtNSM97KAhTnK+C3
	5PFJs62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKU-006LWv-2p;
	Fri, 24 Nov 2023 07:10:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKR-006LWS-2p;
	Fri, 24 Nov 2023 07:10:21 +0000
X-UUID: 82ad43d88a9811ee9b7791016c24628a-20231124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ucv5SkaPMyQeyclM1BmQvoovqtCfyR4/Dim+QgBHR1o=;
	b=VxqIVKdEubNRAiNV6Wh2gZcuNNU45Kx+CqV7exlVNKARHV8q6Pd1eED17au59VCuIg25SemqGcqi0fgFBVstFAt7D/rYLzHMYDpp6W5QZn3ZpYObVHGJYTZenzzMJ1nFZjh2DZSSWQcSJ1wZxVXYZ/4g/H/qa9YVXlu+73Pu0DY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:7dc8284b-0aab-41a1-aa03-0fdd5f1122de,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:d6d50573-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82ad43d88a9811ee9b7791016c24628a-20231124
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 73073833; Fri, 24 Nov 2023 00:10:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 Nov 2023 15:08:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 Nov 2023 15:08:45 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Wenbin
 Mei" <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Axe Yang
	<axe.yang@mediatek.com>
Subject: [PATCH v1 2/2] dt-bindings: mmc: mtk-sd: add 64-steps tuning related property
Date: Fri, 24 Nov 2023 15:08:39 +0800
Message-ID: <20231124070839.12484-3-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124070839.12484-1-axe.yang@mediatek.com>
References: <20231124070839.12484-1-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.449000-8.000000
X-TMASE-MatchedRID: iSQL5szRvdEWnPlK0Y8cfo4V8tCoXo/ShV0srjoqtx/1yFIyxT4nyxJ4
	B8fZD6Dx7p17JCLIX7cfSuixqQMLLLvhKf49TtYAbBu6+EIezdyZf5btvM85AQ6QlBHhBZuw9BQ
	FWu9qPYararPPtIvi4m9yZj3aufb5HxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWBpMM+r6atzvo8X
	R0jECZh16xAW23XWT/308PTuSCsS/VQpeWxO19jEMMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.449000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4C2FCFED837D2B2B439CA89CB93E6C99526F618A8D15075F1ED0FF75C59294CD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_231019_924285_5F1FAA8D 
X-CRM114-Status: UNSURE (   8.80  )
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

Add 'mediatek,tune-64-steps' option. This property will give MSDC
a chance to achieve a more optimal calibration result, thus avoiding
potential CRC issues.

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 3fffa467e4e1..c33301e2ea33 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -145,6 +145,14 @@ properties:
     minimum: 0
     maximum: 7
 
+  mediatek,tune-64-steps:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Some Soc need enable 64-steps tuning for better delay value to avoid CRC issue.
+      If present, tune 64 steps to cover a complete clock cycle.
+      If not present, tune only 32 steps. For eMMC and SD, this can also yield
+      satisfactory calibration results in most cases.
+
   resets:
     maxItems: 1
 
-- 
2.25.1


