Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D5FC33C99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:04:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F211D20838
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2blEZvl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NKCRyL+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F211D20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAanX1KE8dlHsDBVJgl+NB/LAIH91WwF6JgyQJo4K7Y=; b=f2blEZvl6I79LI
	IZt36F4ug7u6dNaBq+PT6dXVFFpBk8BhRUDy6W9ZHsmOUwVt/XB5hLuKRFKT0BFLNv9Ae1cGHRLsg
	M4nZAOuXwz8tuaXri/qKBBLl7X7QB4KEW3+DwuAY+QN/Upk3jXTipHtbtFyVAYOAw+5y7g5HXEkvE
	ssXE7BxycfshrYee+gzKrMNwyKIFp5gYpj/pl24UdL+yMXGm4gBew5SuTmcquAzUgEdHk/re414Q5
	1AHzPQ6r0/lnklFTfREx57j5WqBFLk4iWC9L/iLd/c9rSZfjd9JhsluRlA1GJqw4zRRChHYV2fLyF
	kVe5NRn9XerxVYmXYzww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipoLV-0003MQ-JL; Fri, 10 Jan 2020 07:04:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipoLT-0003Lk-Fb; Fri, 10 Jan 2020 07:04:36 +0000
X-UUID: 320c610b795740ff849c7592aa73ac34-20200109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=P3n5D3Gnhy1NP5hvBdfMtlX5qxR8Gfe2dv5Rnak/iM4=; 
 b=NKCRyL+IQH4InU6kj0lC7MK1MX+8njEDuQyH1yChSocxJYcsPMfGDXXRHWNaN3fXlURrsBPuPe340RSrTKvqNvsaplaYSPAl7IkJ9F152yhbauweGnAhcYCMoOdVSKnehFJHer0VR/3ekkBc4AR05GKpK6KFHW1zcq1jCzIWJmU=;
X-UUID: 320c610b795740ff849c7592aa73ac34-20200109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 912798038; Thu, 09 Jan 2020 23:04:30 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 9 Jan 2020 23:05:08 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 15:03:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 15:03:55 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <yong.liang@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>, 
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <chang-an.chen@mediatek.com>,
 <freddy.hsin@mediatek.com>
Subject: [PATCH v11 0/3] ASoC: mt8183: fix audio playback slowly after playback
Date: Fri, 10 Jan 2020 15:04:19 +0800
Message-ID: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_230435_528287_EE1A6E72 
X-CRM114-Status: UNSURE (   7.65  )
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
Cc: sboyd@kernel.org, yingjoe.chen@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series patches add reset controller for MT8183 and MT2712, and audio will use it in 
machine driver during bootup, they depend on the for-next.

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

Jiaxin Yu (3):
  dt-bindings: mediatek: mt8183: Add #reset-cells
  watchdog: mtk_wdt: mt8183: Add reset controller
  watchdog: mtk_wdt: mt2712: Add reset controller

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  10 +-
 drivers/watchdog/mtk_wdt.c                    | 105 +++++++++++++++++-
 .../reset-controller/mt2712-resets.h          |  22 ++++
 .../reset-controller/mt8183-resets.h          |  17 +++
 4 files changed, 150 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
