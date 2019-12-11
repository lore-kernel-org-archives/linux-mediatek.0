Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CB3C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:59:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58CD6214AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNSNKv06";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="McbfYxin"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58CD6214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=opbQSXQ4RMa/goiDEJXmmk30R4AG5vj6/Xu6hnQG0Os=; b=aNSNKv06TF79d0
	/O1R541yCk5/y3H5miW2eNtTHwqSStT+oJYQIzmnbzjR7zBUhL8o0wgqAQX8W3cCbxhNOFKe1b230
	++6Lnzhsch19qpE8qYY5oyVCWRDVojCOzVWH5VszROHXcuO0FSv2UcYunQauYlnDveNrMiZGZWobd
	5efHmXyqXLTG9RvNC+IWVg/u7NsG/4ylx14jEZFTL6gYNWbiNo0WdS0I4b7ebO/LGJ0SOW47BTDUj
	te+l1wBnrWuCue7Bc6yN7dzTqpxW98PEdinGU45qY1YQkVxOnDY0lKt+dVY/vRVTArKypeKks+1+8
	Sx/p/ejuHhcqCw7ROJqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if3S7-0004Rw-B3; Wed, 11 Dec 2019 14:58:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if3Rb-0003yZ-4j; Wed, 11 Dec 2019 14:58:28 +0000
X-UUID: 1cf45311ece343b8a3b41394ae50ee7f-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=iimza8cqkvrV1lF7V0mYtKiaYJScHBfp3AjzMCxE4gQ=; 
 b=McbfYxin0QzvYRwbfiyfmOWg4ApFUFf/WLl05Ijxl4NwINWOblsTVAUgcAtJt1L5tlW+GeBRco5odUuqAHwECDHayxBJUexDkaDzzsqYhK7hjljmj2kcO9cmNvm/P2NCL2EtqptbPJuwZxxTKXtZtzs7aJiukRiNyRRdJhmI/nc=;
X-UUID: 1cf45311ece343b8a3b41394ae50ee7f-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1349574589; Wed, 11 Dec 2019 06:58:22 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 06:59:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 22:57:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 22:58:12 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <yong.liang@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>, 
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: mt8183: fix audio playback slowly after playback
Date: Wed, 11 Dec 2019 22:58:10 +0800
Message-ID: <1576076292-17860-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5F62D8D084A80CC349A3731985D8F145B72F874C43D6FF6BC54D7F63ECB79F4C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_065827_199943_D48761E7 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: sboyd@kernel.org, yinjoe.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

This series patches add reset controller for MT8183, and audio will use it in 
machine driver during bootup, they depend on the for-next.

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

yong.liang (2):
  arm64: dts: mt8183: Add reset-cells in infracfg
  clk: reset: Modify reset-controller driver

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  10 +-
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/mtk_wdt.c                    | 109 +++++++++++++++++-
 .../reset-controller/mt2712-resets.h          |  22 ++++
 .../reset-controller/mt8183-resets.h          |  17 +++
 5 files changed, 155 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
