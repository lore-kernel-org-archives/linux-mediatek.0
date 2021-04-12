Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F351C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:37:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A34C61209
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A34C61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVpN6J8aULaQn+oRJ3gPgjqLmR6QEwOqL8MajY139s4=; b=AYmULBrNPFnjxJhXVaz5weGtpR
	E0qok2Q/yMD6ybX/NRYAD3qnzTWVmdUr+I5Lua3Tfri3RR85g6F6AbHWOPHIQmDZZU1AhyKsHBoke
	aLlWxW2QzhihSp4738ZsauxueslKMLooHm3ZJ00hDS6XJeB2H2sMFgDEGc1d2LBd5MXRkP6vHc3y7
	duv6RNWfDVLETrpVIMJaes/EkBdL90OTIHEvXGoGXI9PQssh+iqLkJne2M2PHBmQQ9QNzJCTp4rSd
	INJvccBsBOlaUHEXszZcHg0A9WkcU+iDAgl7IKEF7mmUnWYG1M0PXJAJEGyZHI2+rrWB5FLFexh1y
	/uiISKIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqBt-005pGy-J2; Mon, 12 Apr 2021 06:36:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqB9-005p9a-TR; Mon, 12 Apr 2021 06:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=NTXg+uke429viTrLPQr9wcKwhZZUAfHH6B5KN3uqYBA=; b=LG1RtOLTzrRylbpNgw8E5ZFmRd
 CZOxg9zE1gDipPAX32Vqte3CX9GQXf6QqPADtXSRhlVsOLW9Z15lC5+FkWuvvrHoXUIC0AsjRXQGQ
 Dk6PlE0Syng/IS2yPfQuzen4D7jgo4SQGdkf5ZJiAkSYTLbX4/L3K/34+I/yPvbi6qRNvRFdN1G81
 qoRoTZcEqLi5UjKB5FgPy6Y4yGqeXYjLb8nYHykWav52CufnExAy/RZcM6Unj7KXB4sULENsLsjG7
 gzVSkUoYriG63nw6sJUswwIZXfbyMeAK7W8GZW+n8qZgEcBzvjPlmjap+ZGI3P2/FHZN+i559vRnn
 vhH2LSkA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqB6-005u8B-BV; Mon, 12 Apr 2021 06:36:09 +0000
X-UUID: 2a1f68d4531a4d04b71bf3bd39345432-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NTXg+uke429viTrLPQr9wcKwhZZUAfHH6B5KN3uqYBA=; 
 b=sAX3j86HpFy5C5TgFQ74nyv2wAnoQEHnAG4+aU21NyABsLcwMb73BPMbUIRagzER3+E6D5AAF5VrktaPkFcngeMy/49LxwiZQpb21/9RbY6tqRfUk1dI77jZ4DhknBtWltOjRi1g064/CXgVvOZHl7PscsKxECZP3NgEn1Mm+Zw=;
X-UUID: 2a1f68d4531a4d04b71bf3bd39345432-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1688953355; Sun, 11 Apr 2021 23:36:00 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 23:35:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 14:35:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 14:35:49 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>
Subject: [PATCH v1, 0/3] gamma set with cmdq
Date: Mon, 12 Apr 2021 14:35:44 +0800
Message-ID: <1618209347-10816-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B38F95F394A55B17AF54078330921F9F4A0C88959C336EC271FA7319CCD28762000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_233608_420065_FBBC6EFB 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on 5.12-rc2 and provide 3 patch
to set gamma lut with cmdq

Yongqiang Niu (3):
  drm/mediatek: Separate aal module
  arm64: dts: mt8183: refine aal compatible name
  drm/mediatek: gamma set with cmdq

 arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   3 +-
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 167 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   |  11 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  18 +--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  39 +------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 10 files changed, 213 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
