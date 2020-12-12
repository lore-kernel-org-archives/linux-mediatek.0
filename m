Return-Path: <SRS0=F1mA=FQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0FFC4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:12:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD09A238E4
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD09A238E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VfZXFpC0lHyxGfbDNhyffL5ekhv9EaVvtgS7wN4QUnE=; b=TvKIIsA1mvm4sXwOUWzvdzYA+B
	PTfQ1WJY0PizJDz6oT31ZkwGXut7Gn5H5Di6Kh9lAjMAHKTxNa/v/8QMISCPvHYU21OY0F+DkM4vI
	jFFjO2CN/lN2ccpcJr+Xm9cejjDg+5zoxH25wdqou0ugqmw3Ffk2CGuIkafWWJbYg1wWQCz2aH+Ey
	1h0QZluWlvD13Kwwcbqwm1F4ODF+HdGBqzNf2fj/4/U9IvXeJ5O1Oi32CCh4z/3/xmM2FnvYCefXU
	cg3TMwQ8scZ99ulNeBzCp62GSITp7bj9JjDeJmgXQFjCK3LPYUdyGreQZRZdljnpAX5cpYt8iSBfh
	Nj3drdQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knwH0-0002BY-IQ; Sat, 12 Dec 2020 04:12:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwGS-0001up-04; Sat, 12 Dec 2020 04:12:13 +0000
X-UUID: 3eac34a58aa34a94965b3759338f302f-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vT0tEz7O56Ljx3heYOs5Vu1t2ZKW5D5UM2elnjUqRL4=; 
 b=d2I8SpT81AjXg45t3rNyLc1PbJS21I0GaCfaKqtn3edXAbBd22fJ7311UjH1OtbGSXfK3Zo81jwt9haT3zTXropEHYbhJQKWwzMs6zIRdNZ2CcgYX5v1AEYyu5F+fY8NexCBBze/yUNYw6sOKK0FJ/GLKLQgBDb/EtC/adgCsX8=;
X-UUID: 3eac34a58aa34a94965b3759338f302f-20201211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 228861187; Fri, 11 Dec 2020 20:12:04 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 20:12:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:00 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 00/17] drm/mediatek: add support for mediatek SOC MT8192
Date: Sat, 12 Dec 2020 12:11:40 +0800
Message-ID: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_231212_227447_5828E711 
X-CRM114-Status: GOOD (  15.00  )
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

This series are based on 5.10-rc1 and provid 17 patch
to support mediatek SOC MT8192

Changes in v2:
- base mmsys
https://patchwork.kernel.org/project/linux-mediatek/cover/1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com/
- base mt8192 gce dtbinding file
https://patchwork.kernel.org/project/linux-mediatek/patch/1607141728-17307-2-git-send-email-yongqiang.niu@mediatek.com/
- add dt-bindings description for post mask
- add dt-bindings description for mt8192 display
- fix some comment in v1
- add mt8192 mmsys function call

Changes in v1:
- add some more ddp component
- add mt8192 mmsys support
- add ovl mount on support
- add 2 more clock into mutex device
- fix ovl smi_id_en and fb null software bug
- fix ddp compoent size config bug
- add mt8192 drm support
- add ddp bypass shadow register function
- add 8192 dts description

Yongqiang Niu (17):
  dt-bindings: mediatek: add description for postmask
  dt-bindings: mediatek: add CLK_MM_DISP_CONFIG control description for
    mt8192 display
  dt-bindings: mediatek: add description for mt8192 display
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: add disp config and mm 26mhz clock into mutex device
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: check if fb is null
  drm/mediatek: fix aal size config
  drm/mediatek: fix dither size config
  drm/mediatek: fix gamma size config
  drm/mediatek: fix ccorr size config
  soc: mediatek: mmsys: Use function call for setting mmsys ovl mout
    register
  soc: mediatek: mmsys: add mt8192 mmsys support
  drm/mediatek: add support for mediatek SOC MT8192
  arm64: dts: mt8192: add display node

 .../bindings/display/mediatek/mediatek,disp.txt    |   6 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 130 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  34 +++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  84 +++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  50 +++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  48 ++++++++
 drivers/soc/mediatek/mmsys/Makefile                |   1 +
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c          | 119 +++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c             |  18 +++
 include/linux/soc/mediatek/mtk-mmsys.h             |   7 ++
 13 files changed, 496 insertions(+), 14 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
