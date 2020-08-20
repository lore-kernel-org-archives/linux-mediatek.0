Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2262CC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:06:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59B8207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AwIuAOwC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H50p1cLS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59B8207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fy4SOUUvZGwxXGyVNHKXqfHV/1nJnfKuh0wPyiOe9Fg=; b=AwIuAOwC/LrnRQUYJMpeElAXwM
	fSMmS43SDWngf70KgQMHx/SQF2IkTPwvW9dtAVdHICG+HSQ+iOwh4zx4sUQw7wBi8LljwKX9IlzZE
	Nub95u5e1yq9/1W/FMTsud/DKfjl3lqyu3rUpfHAjAarZhZT+i63Z4SYVA+ZFJ27FhXgasQj8Cwsh
	62mecuWnLeuz1kJe0sfNj3oT9ZN+id9DxkHaTjrGKz/5C/dvOGaIvocdGajMWeLjXlFW361Zt8pXM
	9KMtRXb07By1SIX8q0ZeNwlC9PQo/9EomGYwlWk4uaQZrksEMcWG63jVo6wV0DOGcOgpnCqYtxkEy
	VAiBD6Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8diB-00058Y-S0; Thu, 20 Aug 2020 06:06:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8dhn-0004wm-P5; Thu, 20 Aug 2020 06:05:47 +0000
X-UUID: 02087acb25b0470c8c44cd8337619f79-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eMCqHf5VNCtvq/O+QRSOEtg5Xwd+1FDGSGsrpAcq+Zw=; 
 b=H50p1cLSaa6yZkxGMAOBt95ilGFI8Sf1kEmNVRDSikomonml6E72LPaIXeztiyFmhmMMk97ecVFs3MG0Z5eXQrVrpZFYd8amO0b2Pw3ohFccb7wkwggVAqFsUsLMWZT99T2haxjp+NKeqWBamsiU0NE/PIriewX+rnfNlvp2gUw=;
X-UUID: 02087acb25b0470c8c44cd8337619f79-20200819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1791903434; Wed, 19 Aug 2020 22:05:35 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:30 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 00/21] add drm support for MT8192
Date: Thu, 20 Aug 2020 14:03:57 +0800
Message-ID: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_020544_012119_ED070949 
X-CRM114-Status: GOOD (  15.19  )
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

Yongqiang Niu (21):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  mtk-mmsys: add mt8192 mmsys support
  mtk-mmsys: add ovl mout on  support
  drm/mediatek: add disp config and mm 26mhz clock into mutex device
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: check if fb is null
  drm/mediatek: fix aal size config
  drm/mediatek: fix dither size config
  drm/mediatek: fix gamma size config
  drm/mediatek: fix ccorr size config
  drm/mediatek: add support for mediatek SOC MT8192
  drm/mediatek: add bypass shadow register function call for ddp
    component
  drm/mediatek: add color bypass shadow register function
  drm/mediatek: add ovl bypass shadow register function
  drm/mediatek: add rdma bypass shadow register function
  drm/mediatek: add dither bypass shadow register function
  drm/mediatek: add aal bypass shadow register function
  drm/mediatek: add ccorr bypass shadow register function
  arm64: dts: mt8192: add display node

 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 126 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  22 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  41 ++++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  27 +++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c      |  84 +++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  80 +++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  48 ++++++++
 drivers/soc/mediatek/mmsys/Makefile         |   1 +
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c   | 182 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c            |   8 ++
 include/linux/soc/mediatek/mtk-mmsys.h      |   6 +
 13 files changed, 623 insertions(+), 13 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
