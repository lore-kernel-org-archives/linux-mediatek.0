Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0E8ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 02:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NrwrPJesfMxF24UrBwPkkWx5Tt9KMma6+F9KyakqTOg=; b=D78TLcFexl39fkgaeuPjzY3gJS
	7rcgq8Ladogw9wx+Qt7FR3+IgcYwg/04bQ+p4xGMNWnONiCbPVu2UvI/AQueBtw4DuOx7Gwzk6R+P
	J6+f5VY37XPVPeUU1pq8t9gY59/HNj4TeEZxnfry4OfCSi3VZiGox7Ag3Er5XXhHUz8MD27EU1bXS
	0n6ai3Bprt/w0U6TSoIsUC2rVVW9CYXhojq2DusUw4LE3JqPJcTH9exYAVu+y6kKvyLOjwEjdGP13
	g0+bwNysEMQEszKlW3df1O7VAcdU5nNvDwEHKRcJFs+1wp5QBgbt22d5qEg/dO2FbKuHzlOlfZVeK
	jIkUwKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXZ4L-006Far-Vh; Mon, 12 Sep 2022 02:21:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXZ49-006FWo-EN; Mon, 12 Sep 2022 02:20:54 +0000
X-UUID: 4eaa723899bb4f78bdbff5ac49e1961b-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NrwrPJesfMxF24UrBwPkkWx5Tt9KMma6+F9KyakqTOg=;
	b=VKEMEYM/Rl6hhzh1ROXJZWvU1h+Jci/eGFZKNVVfYuh/z+zvUhwKF7L9YSubSerNRj3VfSRDVW9OsgFHYgWUr4oTYy1QF/I7E+kFaBUGxwa4NwFj3TvW+OpCn5TpN81j9aOAlVqABmfvyliY3EI0ClaTZNeJnxU4HfBxaDoNIjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:85c1c5a0-4a58-479e-ad76-6a4fd7a7fd54,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:61b3475d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4eaa723899bb4f78bdbff5ac49e1961b-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1439614307; Sun, 11 Sep 2022 19:20:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 09:30:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 09:30:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
Date: Mon, 12 Sep 2022 09:29:57 +0800
Message-ID: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_192053_609397_168CB8FA 
X-CRM114-Status: GOOD (  12.65  )
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

Since the gamma_set_common() function for previous SoC,
such as  mt8173 and mt8183, is designed for 9bit-to-10bit
conversion.
mt8195 is using 10bit-to-12bit conversion, which is
not compatible with the previous function.

Thus, need to update the function to fit the need of mt8195.
---
Change in RESEND v3:
Fix build warning
>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:59:14: warning: no previous prototype for 'mtk_gamma_get_size' [-Wmissing-prototypes]

Change in v3:
1. separate 1 dt-binding patch to 2 patches, 1 is for modifying
   multiple items list to one and 1 is for moving mt8195 compatible.
2. redefine variables to reduce memory usage.
3. delete unused symbols.
4. separate 1 drm/mediatek patch to 6 patches.
5. rebase on tag 'next-20220909'

Jason-JH.Lin (5):
  drm/mediatek: Adjust mtk_drm_gamma_set_common parameters
  drm/mediatek: Add gamma support different lut_size for other SoC
  drm/mediatek: Add gamma support different lut_bits for other SoC
  drm/mediatek: Add gamma support different bank_size for other SoC
  drm/mediatek: Add clear RELAY_MODE bit to set gamma

zheng-yan.chen (4):
  dt-bindings: mediatek: modify item formatting for gamma
  dt-bindings: mediatek: Add gamma compatible for mt8195
  drm/mediatek: Add gamma lut support for mt8195
  arm64: dts: Modify gamma compatible for mt8195

 .../display/mediatek/mediatek,gamma.yaml      |   8 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 115 ++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   9 ++
 8 files changed, 109 insertions(+), 35 deletions(-)

-- 
2.18.0


