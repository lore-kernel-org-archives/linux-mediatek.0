Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA61FC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TzusHG4BQAsjX+PbVKUr1Z1TZLDoEwzdv5oKP92xs9w=; b=xxKnZKfbx8xGroYzKwZm2AfOV6
	D42DMT9+HSoN17ky02ZfbwSYoMkiJl4MJ0QMgq41oNf6hbhXYWCik30acaOHRV1HAuzm+/ZNoFCec
	+gH8Z3v1AB/5O33xd4YtgtxNOUb/6cMrQOK6wW6HJotjr36jNBiSWj8rLDFGagyhN3MYHhv54lDmO
	4G2oCCZ59i0K0wltr2DMUHuQNk7kqV5G35nVHfnmaL9EqzaaEkyJMdHkapwa2U8NRv45ULEJrcrYs
	aFntYWoADcvtcP0xAecH6ygP3GLs9OcN64+ksM59kwVnOuwhOBChe+r/uuKjnb2Oze6gQh7nWuFSg
	zgEZPErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4FG-007ImW-Nr; Mon, 22 Aug 2022 10:01:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4F2-007IaF-Sc; Mon, 22 Aug 2022 10:01:10 +0000
X-UUID: 6ca9e6f61a6547f8aef06c1b2330d709-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TzusHG4BQAsjX+PbVKUr1Z1TZLDoEwzdv5oKP92xs9w=;
	b=fDb1jcjzWLjS1fOnc9VivNyuxbBH+ZSY5ENMrE9QKzWEfI2Ql1Fj3pxY/byijaOmdrtfRl7D+XJrNhwLQ/528CustKtML8OOWRT/M5/kPGdqsRTYukZZR9EOfljX+mQvpvg1QcgeNaZlbFire6ALs/D1ICLUyEUMQnLgF+83Ijg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:abbbc2c4-9ca8-414a-bfda-66e4f86ac4d5,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:4a1e3acf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6ca9e6f61a6547f8aef06c1b2330d709-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1880992589; Mon, 22 Aug 2022 03:01:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 22 Aug 2022 17:20:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 17:20:10 +0800
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, zheng-yan.chen
	<zheng-yan.chen@mediatek.com>
Subject: [PATCH 0/3] Add gamma lut support for mt8195
Date: Mon, 22 Aug 2022 17:19:42 +0800
Message-ID: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_030108_970214_066B5A5E 
X-CRM114-Status: GOOD (  10.21  )
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
Base on series [1]:
[1]: Add driver nodes for MT8195 SoC
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=666741
---

zheng-yan.chen (3):
  dt-bindings: mediatek: Add gamma compatible for mt8195
  drm/mediatek: Add gamma lut support for mt8195
  arm64: dts: Modify gamma compatible for mt8195

 .../display/mediatek/mediatek,gamma.yaml      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 97 ++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +
 10 files changed, 87 insertions(+), 32 deletions(-)

-- 
2.18.0


