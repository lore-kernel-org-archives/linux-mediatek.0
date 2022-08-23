Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DFC3F6B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 06:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ezLuXIgmXVhWQiBdObuX64UkcXjfkjUJZ/LZs4T6Kk=; b=eC7iboWeXd0K1nTRyN9wYcHnY8
	WZiJt89MXQgnGjTfldVepJZ81HanKS2TCiMbB8H2BOtfRmhFitUx95SbTDA5u1rra1YmJW8hj/jKo
	iWJ+dhpki2Tgq01L3M+5og3AUxdmy4IArsRqunhVW9zZT1zAzKDMrIC8iaalKocjGDa7SpSCCuEpd
	Y/P6XTTN5BdJK/ZqH1lntQIRAme3HQPxseMuWyzv9sfmJKoxmdadVtxJupVPWKQuKnSkf5bdulLTP
	VIrJmzKt0wsB4VttzkLqwSj5LNaIdWGZ45+j7Th495nNE+jnQu1q20g1NFZ7IlHbqeb/rukCauXCM
	TqhmK7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQNHA-002pEH-Aa; Tue, 23 Aug 2022 06:20:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQNGd-002p5P-Jr; Tue, 23 Aug 2022 06:20:05 +0000
X-UUID: 3726e64d8f394ebdb7b563f1fc19ba65-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6ezLuXIgmXVhWQiBdObuX64UkcXjfkjUJZ/LZs4T6Kk=;
	b=i8Sr/E7CO2Z/f+qjld0yWgQIzhWNIFsb/pwNaN79EsYsGjdHuBQUIGi1U0AuIpfYy3ovNXVoq8OYZmwY0D+mRXbXTZVhopZLSh5NF1c7LmWH/nPiBoxzW7KzUOysqYrOmsXt8GQ/WV2PcswvI4gxTHoOc5R/zwnPFSQ6Wan5lSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c164fb61-69c8-4118-8042-492c742f6a5c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:389851cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3726e64d8f394ebdb7b563f1fc19ba65-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1274676461; Mon, 22 Aug 2022 23:19:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 14:18:41 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 23 Aug 2022 14:18:40 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
	<yongqiang.niu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v3,0/2] Add dpi output format control for MT8186
Date: Tue, 23 Aug 2022 14:18:35 +0800
Message-ID: <1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_232004_425449_3DAE2FD4 
X-CRM114-Status: UNSURE (   6.96  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Base on the branch of Linux-next/master.
This series are based on the following patch:
[1] Add MediaTek SoC(vdosys1) support for mt8195
https://patchwork.kernel.org/project/linux-mediatek/cover/20220711075245.10492-1-nancy.lin@mediatek.com/
[2] Add MediaTek SoC DRM (vdosys1) support for mt8195
https://patchwork.kernel.org/project/linux-mediatek/cover/20220804072827.22383-1-nancy.lin@mediatek.com/

Changes since v2:
1. Modify key nouns in the description;
2. Add the label of jitao to Co-developed-by;
3. Macro definition address lowercase problem and function naming;
4. Add missing a description of this property in the mtk_dpi_conf.

Change since v1:
1. Modify mt8186 compatiable location.
2. Modify MT8186_DPI_OUTPUT_FORMAT name.

When MT8186 outputs dpi signal, it is necessary to add dual edge output
format control in mmsys.

Xinlei Lee (2):
  FROMLIST: soc: mediatek: Add mmsys func to adapt to dpi output for
    MT8186
  FROMLIST: drm: mediatek: Adjust the dpi output format to MT8186

Xinlei Lee (2):
  FROMLIST: soc: mediatek: Add mmsys func to adapt to dpi output for
    MT8186
  FROMLIST: drm: mediatek: Adjust the dpi output format to MT8186

 drivers/gpu/drm/mediatek/mtk_dpi.c      | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  4 ++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
 drivers/soc/mediatek/mt8186-mmsys.h     |  1 +
 drivers/soc/mediatek/mtk-mmsys.c        |  8 +++++++
 include/linux/soc/mediatek/mtk-mmsys.h  |  3 +++
 6 files changed, 49 insertions(+)

-- 
2.18.0


