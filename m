Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B0FC33CB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 08:59:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78B7C24655
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 08:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TiuJ0T8i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WKM4s8x7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78B7C24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5fK1tMkg0X6w1hYUm28ltUSUy0KTYo6WY/0pTR2mYQ=; b=TiuJ0T8iYe0Ssg
	kOQgVSRhNCuqQdrQS0eXcy9wsZIq+MQSDmHZllAl6r1FMRV1yRLLZ6EnWYAgNa+GMNKHUHkXzDtVx
	4xLgZuXPbEIpZVYNoEysvGtaKfTINFHgw0Iz0N2wXHReExWuQDC2xoie8evxX16QjOao5RyV2ag1k
	D5O96X7J3Ofo5OzfYSzJ6iMiUvNf7hciedr/n4Usn/TUb2zjcTxs+xrESA/aW0avP3oIARRipg0tu
	bJ68dd6d42YcEm3fN+hLg0Xa3j1R30ysVsOPmrAR5QVemeXNudDZdx3BtxQVaI2jHdGEw0oGHxGkz
	5NqSX7goP23LxpPsHmHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ireW8-0002YD-17; Wed, 15 Jan 2020 08:59:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ireVr-0002Gs-2X; Wed, 15 Jan 2020 08:58:57 +0000
X-UUID: 8e7b7373972e4af8900f261b2478513c-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=UunoMdrTa5yiW8ikAsKa+Kru5ZGQaRL2GDjuh52c1xM=; 
 b=WKM4s8x7uySODSryQ9BraD5Fba8+6UAiH/siwKu7CWdp2lUzmpVDAL5EF0qgqnEWngs8PACPwAnWfA3G+K25kULmS7oAIU3zYRfl/XZacNsDC89A2Fwx/leBinCcgMZgIXd/MDNeqhQAas1l3wG6+I4FS+yudMyfI5hy8ZI5EB4=;
X-UUID: 8e7b7373972e4af8900f261b2478513c-20200115
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1599314029; Wed, 15 Jan 2020 00:58:51 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 00:58:48 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 16:57:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 16:58:42 +0800
From: Yong Liang <yong.liang@mediatek.com>
To: <yong.liang@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>, 
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <chang-an.chen@mediatek.com>,
 <freddy.hsin@mediatek.com>, <jiaxin.yu@mediatek.com>
Subject: [PATCH v12 0/4] ASoC: mt8183: fix audio playback slowly after playback
Date: Wed, 15 Jan 2020 16:58:24 +0800
Message-ID: <20200115085828.27791-1-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_005855_156509_A6620679 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: sboyd@kernel.org, yingjoe.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

This series patches add reset controller for MT8183 and MT2712, and audio will use it in 
machine driver during bootup, they depend on the for-next.

v12 changes:
1. Split MT2712 from MT8183 for mtk-wdt.txt

v11 changes:
1. Create a new patch for MT2712.

v10 changes:
1. Modify mtk-wdt.txt dt-bindings.

v9 changes:
1. Remove Change-Id.

v8 changes:
1. Delete cast: (struct mtk_wdt_data *)

v7 changes:
1. Delete no use code.

v6 changes:
1. Simplify toprug_reset_assert() & toprug_reset_deassert().
2. Add members for mt2712_data & mt8183_data.

v5 changes:
1. Add Signed-off-by tag and Reviewed-by tag.

v4 changes:
1. Fixed wrong signed-off as correct mail suffix.
2. Fixed patch subject that add patch version.

v3 changes:
1. https://patchwork.kernel.org/patch/11164283/ and 
  https://patchwork.kernel.org/patch/11164305/ has been merged.
2. Change the name of mtk_wdt_compatible to mtk_wdt_data.
3. Remove toprgu_reset struct and use mtk_wdt_dev instead.
4. Get the value of sw_rst_num from .h file.
5. Adddd mt2712-resets.h for mt2712.
6. Improve commit message.

v2 changes:
1. remove "WIP" that in the title of patches
2. add hyper link for the patch that depends on
3. patchwork list:
https://patchwork.kernel.org/cover/11164285/
https://patchwork.kernel.org/patch/11164295/
https://patchwork.kernel.org/patch/11164299/
https://patchwork.kernel.org/patch/11164283/
https://patchwork.kernel.org/patch/11164305/

v1 changes:
1. patchwork list:
https://patchwork.kernel.org/cover/11164173/
https://patchwork.kernel.org/patch/11164181/
https://patchwork.kernel.org/patch/11164185/
https://patchwork.kernel.org/patch/11164187/
https://patchwork.kernel.org/patch/11164175/

yong.liang (4):
  dt-bindings: mediatek: mt8183: Add #reset-cells
  dt-bindings: mediatek: mt2712: Add #reset-cells
  watchdog: mtk_wdt: mt8183: Add reset controller
  watchdog: mtk_wdt: mt2712: Add reset controller

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  11 +-
 drivers/watchdog/mtk_wdt.c                    | 105 +++++++++++++++++-
 .../reset-controller/mt2712-resets.h          |  22 ++++
 .../reset-controller/mt8183-resets.h          |  17 +++
 4 files changed, 151 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
