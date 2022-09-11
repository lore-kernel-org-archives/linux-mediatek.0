Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72616ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zhROwD3MVTnqx6OPlzfDHhCtDdWIlCJRV3//JwkNpy0=; b=J5sKGrjVw/aaooXUela+iacEgo
	syERh9Xn1EPArUe0G4oddtw5T7XJsBmmqX0LXDZbHK1nG0ejsfWhODOn1m6Znp2Jw2JXo0GqSRxoP
	aCmu3fWJ/4mw/jd+SGQEJKU5v0Hs0T0WeTEE55busovxRKorhdTbo9jpKh0gVPS0RgMLXD0gv5SFF
	IXl9b/+hdEW8HfRs8Ge7dxSDemixNojA8sBcW25jNWIn92jLzwDZimDObbNignc/5rKz51J6XEZJZ
	WEIgVG8fI+8k8a7RcTAtDWR02L57JgLB+PcvYbGGLNx3P/6Lx1tLEd0Z9jQCzSeiwSehhTprYMW+o
	JIPoXh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP2D-002ptI-3E; Sun, 11 Sep 2022 15:38:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP1r-002phw-KK; Sun, 11 Sep 2022 15:37:53 +0000
X-UUID: c807953c38cc49829c093967852a7e8d-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zhROwD3MVTnqx6OPlzfDHhCtDdWIlCJRV3//JwkNpy0=;
	b=EUR9V227PrWfLEVUCisuaQ8hF9NdShdR5AYz21DtrK+A0cGzVKHDsRgNybkWOoRR6Mldg7iM8JPM8+wWB5yVQXhOV/GzUsxGwLGoIzfRldp26zycO5XuGAQ8Zov/DdOoD03VDJanzzZ74fqeAIkGb/GVnZOK0NubNaxhwWxaWXE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:62c31c4a-5119-41e9-802d-0f2a915b2278,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:234f06ec-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c807953c38cc49829c093967852a7e8d-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1442149739; Sun, 11 Sep 2022 08:37:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sun, 11 Sep 2022 23:37:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 11 Sep 2022 23:37:43 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v3 0/9] Add gamma lut support for mt8195
Date: Sun, 11 Sep 2022 23:37:25 +0800
Message-ID: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_083751_784307_F1249032 
X-CRM114-Status: GOOD (  12.82  )
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
Change in v3:
1. separate 1 dt-binding patch to 2 patches, 1 is for modifying
   multiple items list to one and 1 is for moving mt8195 compatible.
2. redefine variables to reduce memory usage.
3. delete unused symbols.
4. separate 1 drm/mediatek patch to 6 patches.
5. rebase on tag 'next-20220909'
---
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


