Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5072CF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJ51bIMH4FsxYabGeTzOeOw98h2VfMLg1v5MjZNaur0=; b=dCkBM78wPpYfD7nvJmpX2S7R3r
	PD1UVaO9d6/5xvxvkyzxSP5OOVkkKxm/2degVJtSKpuDjh10S5oTxnAuzFPsPS2qqcDikNfPjw6Nn
	PwSEACQcyhAVoimEY6I0k8pg9/31X2oSYcTjZnf5Vm1Hh239RFA1fT2/AHJtRkbeOrIkIqlF6ANL1
	WO25t1osk4WSDU4hWNrBafEV8X0Xb5adX8aBxklY2Wnj4oChqSGT/Hr9MOAvuy9CwRE5pC48kVMFi
	b6pYmI8cVKxPBX68D9xIcHuXRC8M8CHVvQ35qs27TLAuIgT08Jq9gnOiZ+/ljxiHjKxn1RnyY+NlA
	xAWqHcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svBzL-0000000GMlL-3UXp;
	Mon, 30 Sep 2024 08:42:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svBvx-0000000GLqU-1Dn8;
	Mon, 30 Sep 2024 08:39:10 +0000
X-UUID: 738f20567f0711efba0aef63c0775dbf-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xJ51bIMH4FsxYabGeTzOeOw98h2VfMLg1v5MjZNaur0=;
	b=T4leJ91lWKyYxhdoywASF0nwxTgFcMqXB7UjRXs6c/fRK24tVmj71JEiAs/o2+KK6TkCy4sAmxLYva/g39vQujHp8q+0pNdsvhrDRLiEhnWGa9L5aqFSIaMRkW8GW3++yOaJdaQg5a5I6VpYUB4Z2zcxW4eLTvyRZyQ5FSmjCS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:ecd82a39-01dd-474e-b67a-d09e134987d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b4fac79e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 738f20567f0711efba0aef63c0775dbf-20240930
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1942930029; Mon, 30 Sep 2024 01:39:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 16:39:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Sep 2024 16:39:00 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rohit
 Agarwal" <rohiagar@chromium.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v4 4/5] arm64: dts: mt8195: Fix dtbs_check error for mutex node
Date: Mon, 30 Sep 2024 16:38:53 +0800
Message-ID: <20240930083854.7267-4-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240930083854.7267-1-macpaul.lin@mediatek.com>
References: <20240930083854.7267-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.706900-8.000000
X-TMASE-MatchedRID: wYKjk3ae4OLLmPsfsKViBzyQH9QLmFOgMZm0+sEE9mv/evmlVf9xZgxm
	8TLlhkMG2y0jybZAxqx7nZmSglxg9sJjog0sYBeSrDFtme53KvvvJY9pBzgg1GaBgvyiTOIIo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtE2g3s9gzxyXyxX428Cl+h2d8U+js/dFeqSdQdlq9mHxcSB
	jgFsq28+3XIPXXag5Nhnw0MBcoL2anTe9CgP5EDzRTfGTKVrWw4sOrsb4iT/K/bbEolHIgZUOc7
	GjOamnWv5a9cmIodEspRnLV2kwrLg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.706900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D45A9F6C55319F27E7981181201A189406106B8D4450AE29DFE1F1AE1E8CB1682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_013909_369729_0ED87AF7 
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

The mutex node in mt8195.dtsi was triggering a dtbs_check error:
  mutex@1c101000: 'clock-names', 'reg-names' do not match any of the
                  regexes: 'pinctrl-[0-9]+'

This seems no need by inspecting the DT schemas and other reference boards,
so drop 'clock-names' and 'reg-names' in mt8195.dtsi.

Fixes: 92d2c23dc269 ("arm64: dts: mt8195: add display node for vdosys1")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 --
 1 file changed, 2 deletions(-)

Changes for v2, v3 and v4:
 - No change.

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2e1b41359b43..ade685ed2190 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3331,11 +3331,9 @@ &larb19 &larb21 &larb24 &larb25
 		mutex1: mutex@1c101000 {
 			compatible = "mediatek,mt8195-disp-mutex";
 			reg = <0 0x1c101000 0 0x1000>;
-			reg-names = "vdo1_mutex";
 			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
-			clock-names = "vdo1_mutex";
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x1000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
 		};
-- 
2.45.2


