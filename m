Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E603DC5CFC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A060161357
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A060161357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UeYh+ZHWdxx65ZcMDj95wXX847g0UStcq/r1BaqqPwc=; b=SxQbD7kpt9ZjZn
	yIsXT6x9CKDfJT/7K12WxQArSjNo4Zng/3b8FwQF43Vk3agqgXfKD4igjgxba4jqX4fGjFEsOAXYK
	tNHW2VUzjJCkTlebyzqkjQf/iV97wYKKCcg6NJBcXys1wakaontzkl+ETTlJI0FKt6CaQf2VSVbMt
	iWLqNdAa40GGZHVwLuy+8qWeMFiBpHlLV5V/uIVyGGIMrMLEY7fdX15kEHCMneULy4BoecjiAPg2+
	MefoJt8N/7DfxEWBe5GtuisNkOqmYVTK08ifbeVhgF35DMn1QQlQ7t4cJL8dhW3cKxYoSP+NIACBg
	zOaKVslqbC91Jj1GQWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45Ja-001myB-GV; Thu, 15 Jul 2021 17:38:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45JF-001mqa-JD; Thu, 15 Jul 2021 17:38:07 +0000
X-UUID: 364673dd1cda47a7b6bc4fd22e3b40c1-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nAK6ZJ3ee85JDcQCsneiDFMT/ejqwqCHFPYQdU/nj54=; 
 b=l4naPozdvD6rCg29fIZVKo5WA3AgxyZ0SaSEmYqEIUza7z0PQg9ZvEje8Cgi/Z/T1GtOzy0WpZf6h5cB1iRYw71c6BrV+OZSt7e2xbrlQYzkSN80DyQXL8ua9TsQ05eZLOjZd6ivoa6ZXxON4Vl+WJ4WKxZVx4i6ed5ax95GKSU=;
X-UUID: 364673dd1cda47a7b6bc4fd22e3b40c1-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1523574766; Thu, 15 Jul 2021 10:38:01 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:37:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:37:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:37:51 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 00/12] Add MediaTek SoC DRM (vdosys0) support for mt8195
Date: Fri, 16 Jul 2021 01:37:38 +0800
Message-ID: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_103805_692134_5FFB04CF 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The hardware path of vdosys0 with eDP panel output need to go through
by several modules, such as, OVL, RDMA, COLOR, CCORR, AAL, GAMMA,
DITHER, DSC and MERGE.

Change in v3:
- change mmsys and display dt-bindings document from txt to yaml
- add MERGE additional description in display dt-bindings document
- fix mboxes-cells number of vdosys0 node in dts
- drop mutex eof convert define
- remove pm_runtime apis in DSC and MERGE
- change DSC and MERGE enum to alphabetic order

Change in v2:
- add DSC yaml file
- add mt8195 drm driver porting parts in to one patch
- remove useless define, variable, stucture member and function
- simplify DSC and MERGE file and switch threre order

jason-jh.lin (12):
  dt-bindings: mediatek: display: change txt to yaml file
  dt-bindings: mediatek: display: add definition for mt8195
  dt-bindings: mediatek: display: add MERGE additional description
  dt-bindings: mediatek: add DSC definition for mt8195
  dt-bindings: arm: mediatek: change mmsys txt to yaml file
  dt-bindings: arm: mediatek: add definition for mt8195 mmsys
  arm64: dts: mt8195: add display node for vdosys0
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: add mediatek-drm of vdosys0 support for MT8195
  drm/mediatek: add DSC support for MT8195
  drm/mediatek: add MERGE support for MT8195

 .../bindings/arm/mediatek/mediatek,mmsys.txt  |  32 --
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 126 +++++
 .../display/mediatek/mediatek,disp.txt        | 219 ---------
 .../display/mediatek/mediatek,disp.yaml       | 464 ++++++++++++++++++
 .../display/mediatek/mediatek,dsc.yaml        |  73 +++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 111 +++++
 drivers/gpu/drm/mediatek/Makefile             |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  16 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c       | 161 ++++++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 372 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  14 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  35 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  36 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 191 +++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              |  93 +++-
 include/linux/soc/mediatek/mtk-mmsys.h        |  10 +
 20 files changed, 1717 insertions(+), 259 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
