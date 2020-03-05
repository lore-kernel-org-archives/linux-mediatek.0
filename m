Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C641C3F2CE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 01:51:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6034920848
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 01:51:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bNfW20Ip";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b4WhZ0c0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6034920848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vzEjQVToH2VL7ztvZGZBtYuKFlCxpblgR7mderEMXkc=; b=bNfW20Ipxd8bHI
	B9Cn6MHnQ6eKt3t6o571zh4D3fO2gYCOKoeTei3/lRA3l+xwP+j26K2J9NwQShnHCC0DvhTrlo9bE
	RV5w4RhdNeoKF+p3dx74t21vyIbDrJd29qzt+poqx4onzwS8aJdm5/0IVTwd5h3LWf0u9B7ekSZK2
	PIj65lnwWcGjtjVy/aiEoc+CeDarC++YWRWi5sS+dla10ciJksGH7vhBRDoO2mEJqwNe7enV10V1h
	/VsR2DAneeIBp+PcG/Ar00k6ufvp0cMOo4HYjp4Y3k4fPnsidhmsEQAvCSmzf+GuC66JDm1xBQGxS
	DEHJ3Y59B1i3UARfYDbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9ffW-00078i-Sy; Thu, 05 Mar 2020 01:51:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9ffT-00077h-AQ
 for linux-mediatek@lists.infradead.org; Thu, 05 Mar 2020 01:51:21 +0000
X-UUID: 549dacae66f6465894ce76bea5233b0e-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=yNE8qYUfGn70ZBeOmt6HoS4PVXCpWIv9nVFD/rwaGU0=; 
 b=b4WhZ0c0ndNVWVHCk/wbavoWsxpoQE4ejcWwQDgR6xOtiMfyWlA7ylfD4Lr84Stm+q7Ct/kW4VtPOdrMURHDmkZBnqvY6iaSVToilq1fWMnvy8zSOCgVmvTempBIyhx4Vtip3E2V6GqMF5Z4VNp5M+RWlMXNbmbrpUTMsEBqD9M=;
X-UUID: 549dacae66f6465894ce76bea5233b0e-20200304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 577685418; Wed, 04 Mar 2020 17:51:12 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 17:51:09 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 09:50:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 09:50:25 +0800
Message-ID: <1583373069.364.4.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm fixes for 5.6
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 5 Mar 2020 09:51:09 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_175119_370991_41764775 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
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
Cc: Phong LE <ple@baylibre.com>, Sean Paul <seanpaul@chromium.org>,
 Evan Benn <evanbenn@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This include OVL, cursor, and gce fixup.

Regards,
CK

The following changes since commit
bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-fixes-5.6

for you to fetch changes up to 3d2ed431b8f39483477bc3c3a2aefbc9778ffe12:

  drm/mediatek: Handle component type MTK_DISP_OVL_2L correctly
(2020-02-25 13:02:22 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.6

----------------------------------------------------------------
Bibby Hsieh (4):
      drm/mediatek: Add plane check in async_check function
      drm/mediatek: Add fb swap in async_update
      drm/mediatek: Move gce event property to mutex device node
      drm/mediatek: Make sure previous message done or be aborted before
send

Evan Benn (1):
      drm/mediatek: Find the cursor plane instead of hard coding it

Phong LE (1):
      drm/mediatek: Handle component type MTK_DISP_OVL_2L correctly

Sean Paul (1):
      drm/mediatek: Ensure the cursor plane is on top of other overlays

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 30
+++++++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  7 +++++++
 3 files changed, 28 insertions(+), 10 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
