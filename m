Return-Path: <SRS0=lfsG=J4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFBBC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 03:14:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7036761409
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 03:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7036761409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=av+Ij7d6erZoiLc3cNCSWYUKFKwHeekBYyuW2k8L1kA=; b=J6pHjvDTjBOXBRCTDhBdP+U3zU
	KrLF/nD7KWU8LYlI5ejAgKEBhosjSVWa8kNM3sNApFaGBCaoeJhRM8/HgaDR7hUDFyWZrzOymOQFN
	JE+as9QjJ0TWl35NfHRUKfMgzS7AkdoHjxcZmo076NB6GN6TQaiTUjGX60PmHhOI9TMntd2Tov9Ld
	bO3G8kz3OzH2LYwZS+XXvB0MJpyZF3KaUEBRVdc24sNloF/xBPY0uXmm2P9GutdJ4EVWxh3JEPwxN
	bjZobC2fAINpfU844mB2PUsF8r7fj0b/0Q+nebvlh8tfJyQSyuIWef3RsCSUe9oIhNJLiZwNdgj8z
	vGBGc2qg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcg5N-009HAt-FU; Sat, 01 May 2021 03:14:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcg4r-009H7y-Jm; Sat, 01 May 2021 03:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IKFj6pl9gPFOZY0aloXCMAdsmYga95ggaknIGlk6Sgc=; b=yOLZJZsz43KH6HZ79VCEF/uLA3
 2dkrNxgCCmTD5G9gzBVuhTY995Wv+R1SmERrk/uEqX+wYe470UTeQJ9jnVhfdfMrDkpCEC2Jc14y5
 J5vL72ebxsArDYcVsD5y7B00loimj3wNhPG6ilSIyH6Gl1wQSC8YVr2ZxgUvL33RD+wxogmwROkC2
 ZZNqlk1wOVP7e/YlWaAgCkrmpwf9J8x+bYW2o9NPYUs8/r3Q57bCh67at5Z08mFvMHaeo3zb/gbWS
 pQEZlWZvtqztVpbkzCCgv5ZXhLm7wRK/X0Mk9ZEu2opTkaX2ut4hWhOC92Ds7hcw9F/XZYaCePH/i
 XLIcHF3w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcg4o-001nKv-7G; Sat, 01 May 2021 03:13:55 +0000
X-UUID: fffdf7a0676e46c784f6684af13c6982-20210430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IKFj6pl9gPFOZY0aloXCMAdsmYga95ggaknIGlk6Sgc=; 
 b=sxPNAp0ZQ+mPLap6sNd9HszGVO8uw9KgYEjduUt8SonNH4NguzppN8CidoFuOP4kL6tlQs5Ayr3npwN/GGN11zOeixs8kmutdyvdkC9Zd2aRcpfPe3yz9m3iw2z2wTm1orD+BNrIYOsE/KC32kWgDGk58kjJI0oPe85drXB9t78=;
X-UUID: fffdf7a0676e46c784f6684af13c6982-20210430
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2068851943; Fri, 30 Apr 2021 20:13:46 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 20:13:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 1 May 2021 11:13:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 1 May 2021 11:13:41 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Hung Wu
 <chun-hung.wu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v2, 0/2] move page flip handle into cmdq cb
Date: Sat, 1 May 2021 11:13:37 +0800
Message-ID: <1619838819-11309-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_201354_294865_71E67378 
X-CRM114-Status: UNSURE (   8.51  )
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

base Linux 5.12-rc2

Change since v1:
- add none cmdq version for patch 1
- add one more patch to clear pending flag

Yongqiang Niu (2):
  drm/mediatek: move page flip handle into cmdq cb
  drm/mediatek: clear pending flag when cmdq packet is done.

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 103 +++++++++++++++++++++++++++++---
 1 file changed, 95 insertions(+), 8 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
