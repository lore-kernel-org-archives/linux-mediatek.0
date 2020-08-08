Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982E4C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 02:56:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D0D2177B
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 02:56:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNhy4S99";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bIEllg1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D0D2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2NGSubuIkIq/3YWIcyVpwia1nSgcRggGz2sus7CZWMs=; b=aNhy4S99JpiL8I0hi4dCUsXbPl
	/h5PrjAl08aiN172Ux/251QEb8AurLVGFOFncAVIUaYTzyMYeQmsQwOUZusmJgtupkwK2dloP7yAO
	iwA6JGnzzqN3i74WoY6qon7dCuckS6WbhkUHhwDQbnCUjRiSQ44VeZuBP0SQmFAlGNzf5e4hXhSem
	Gt9eGvlYvs8KBlN7X+MsFTeICqi+KKkBvJNBzmDsVQ2losFJp1Wij7hfPWXbGytQH6Hr8JvYVDlS4
	mt0MPjbJ3+fYTFORWPZvhby30YZH3uKV6PVVDwT6If/ojGhn3/5KxDL65ZHZ4moUg2e42FKzEsGw/
	m+7/kNbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4F1e-0006WU-6j; Sat, 08 Aug 2020 02:56:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4F1a-0006Uv-8L; Sat, 08 Aug 2020 02:55:59 +0000
X-UUID: a6fa3682c9b644c191856ca7fed6c74a-20200807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=88Oan/DCv4ZxqhgZhz72479y9BC+k/u9ZQCcKP31Pt8=; 
 b=bIEllg1Wc3n5Re0u6m+ETSJ4UqSyEaOMtkY9h8TD7uaKZ1gedulA3xfiigNtz/ir4yxe4Me1HMFK2NtGt21T5IxFBfl6Dw3J2XMcijxjcdqNJfEUrBwrmV2SlEdTIaJMEOS7Cj4uIZStlTfUhz214+3mmZZfbaRCXYtBCMYUGhU=;
X-UUID: a6fa3682c9b644c191856ca7fed6c74a-20200807
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1840183929; Fri, 07 Aug 2020 18:54:42 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 19:54:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Aug 2020 10:54:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 Aug 2020 10:54:38 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND v7, PATCH 0/7] add drm support for MT8183
Date: Sat, 8 Aug 2020 10:53:44 +0800
Message-ID: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_225558_431958_3D8FD71A 
X-CRM114-Status: GOOD (  16.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on 5.8-rc1 and provide 7 patch
to support mediatek SOC MT8183

Change since v6
- move ddp component define into mtk_mmsys.h
- add mmsys private data to support different ic path connection
- add mt8183-mmsys.c to support 8183 path connection
- fix reviewed issue in v6

Change since v5
- fix reviewed issue in v5
base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Yongqiang Niu (7):
  dt-bindings: mediatek: add rdma_fifo_size description for mt8183
    display
  drm/mediatek: move ddp component define into mtk_mmsys.h
  mtk-mmsys: add mmsys private data
  mtk-mmsys: add mt8183 mmsys support
  drm/mediatek: add fifo_size into rdma private data
  drm/mediatek: add support for mediatek SOC MT8183
  arm64: dts: add display nodes for mt8183

 .../bindings/display/mediatek/mediatek,disp.txt    |  14 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  98 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  25 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  47 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  34 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  43 ++++
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mmsys/Makefile                |   3 +
 drivers/soc/mediatek/mmsys/mt2701-mmsys.c          | 250 +++++++++++++++++++
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c          | 154 ++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c                   | 276 ++++-----------------
 include/linux/soc/mediatek/mtk-mmsys.h             |  48 ++++
 13 files changed, 749 insertions(+), 262 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
