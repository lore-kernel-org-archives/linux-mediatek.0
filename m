Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497BCECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q/haoBXwmCcSGqCrXJVhbdriz46SeDPCtnhCp0ocTVg=; b=3sMvg3tQW7icHHoeMZZsyMAq+n
	X3toM4mY+OJIp8vMwX6YFb6owJrreERTYndI8U1CROeoOwEkp95JaPseaLn+niG/j3A+FLp7kIQx3
	pBs2C8Op31zNPQWm/SP8h9eS/YSV6YzQdMLOgS4zs4II7z74OOn2Zgp1PKSyeBlS9GzZnIaWRkx1w
	VRHeysPkhcaVRr2kPs+Iq3PVIGFeEbib2sFbUhqTsuFStGgqwuqJ7pgKkuBf1LLerhgZsJxK6u5kQ
	8G3MeFSaDhWFK1MM2plXNJVTUEqcB2WePr+XaBY85iWSFln7U+O0gtls2IiizdDPheanDjdnhemRG
	o9rwBmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadpa-004JSw-1p; Tue, 20 Sep 2022 14:02:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadp0-004JCA-Cu; Tue, 20 Sep 2022 14:02:02 +0000
X-UUID: 3fddbe8dd0014f6998d9c09d8880b22e-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=q/haoBXwmCcSGqCrXJVhbdriz46SeDPCtnhCp0ocTVg=;
	b=pP8GJlssTltsh/znF6PaQ7Mi/4SkTBmpFrRWrIeZuuBAns9c6MW0z6pXy4pWA2XcbYKd2VH8wc5lWp09sV1eFnL8NiO8IOG3hQknqvYfwASLQJY3ub6L20b44Bee4inlsukd5S7SpzO6hgmuM8nv2Y2f8uyavssJF8fQkU8mpvA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b05b3cc5-574c-49a1-a483-c906d7a57312,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:b05b3cc5-574c-49a1-a483-c906d7a57312,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:909d4b5e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:220920220151MPVRTG0P,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3fddbe8dd0014f6998d9c09d8880b22e-20220920
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 373737143; Tue, 20 Sep 2022 07:01:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 20 Sep 2022 22:01:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 20 Sep 2022 22:01:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v3 0/6] Change mmsys compatible for mt8195 mediatek-drm
Date: Tue, 20 Sep 2022 22:01:39 +0800
Message-ID: <20220920140145.19973-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_070158_460676_C6602055 
X-CRM114-Status: GOOD (  12.87  )
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

For previous MediaTek SoCs, such as MT8173, there are 2 display HW
pipelines binding to 1 mmsys with the same power domain, the same
clock driver and the same mediatek-drm driver.

For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
2 different power domains, different clock drivers and different
mediatek-drm drivers.

Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
and they makes VDOSYS0 supports PQ function while they are not
including in VDOSYS1.

Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
component). It makes VDOSYS1 supports the HDR function while it's not
including in VDOSYS0.

To summarize0:
Only VDOSYS0 can support PQ adjustment.
Only VDOSYS1 can support HDR adjustment.

Therefore, we need to separate these two different mmsys hardwares to
2 different compatibles for MT8195.
---
Change in v3:
1. Keep the original compatible "mediatek,mt8195-mmsys" and add
   "mediatek,mt8195-vdosys0" into the same item to make the tree
   fallback compatible.

Change in v2:
1. Remove Ack tag in the first patch
2. Change the compatible name changing patch to one revert patch and
   one add vdosys0 support patch.
---
Jason-JH.Lin (6):
  dt-bindings: arm: mediatek: mmsys: change compatible for MT8195
  Revert "soc: mediatek: add mtk-mmsys support for mt8195 vdosys0"
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  Revert "drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195"
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
  soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   4 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 128 ++--------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   6 -
 drivers/soc/mediatek/mtk-mmsys.c              | 145 ++----------------
 drivers/soc/mediatek/mtk-mmsys.h              |   6 -
 include/linux/soc/mediatek/mtk-mmsys.h        |   3 +-
 7 files changed, 37 insertions(+), 261 deletions(-)

-- 
2.18.0


