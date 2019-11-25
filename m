Return-Path: <SRS0=x9ei=ZR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB94C432C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 03:14:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4463C2080D
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 03:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWMnxl/p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MZaDQ/yG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4463C2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=huedmfQmBmLaW61fn3519Jms5ZTqvReiYPCsbE6FO9M=; b=mWMnxl/pcY7a6a
	OROKcuMfy6iKCzURGKqugCvfHdUjthGxbQHBKgzTW9ujCwhmb2H1ugUshDJQeLgF7RpNO1kFUIuRJ
	qNmLk7G1mO6nyxzLv7q2gpnnTxYkjt7qnmXdOFCEQBwJn1bhfp8r+SfCEYV9vwRGzRH/B16e9EaXN
	9pQskcVZv9QfY0Mj0zBmTs5GulSgrbB5Zr+sDa9AaMDpeV5OKcc1Oc5n0DB5a7S3FIUqTuN8sM8MF
	Yb/BddmGqE/K5zMwarKiIF8hIfu6mRAxOmimLE73Wlchrnhuu7BPllOMFXrM3mYxPiFOBiZS6x8XZ
	uXA6/jKKqZ4w1oEdevNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ4pd-0002by-Hm; Mon, 25 Nov 2019 03:14:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ4p8-0002B7-Cw; Mon, 25 Nov 2019 03:14:03 +0000
X-UUID: d390b5ed835d4007bb39e7bdb1a0dcca-20191124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xPwAuPbYqVTpCU+/Qwr9HRbYfn2HZlsgAk8+/UzaHEI=; 
 b=MZaDQ/yGQYYCwIAeMGMv+MS6RSBn3LccpITF7gB4LjWyMDAEQJjxXbcHUqhUQqDOckoDC+l7fcaTamCrwvaZWafVRnZtxmv7e+77iRyGgb+n15Y/J130gu0J6BAv9SGoqM4egC1j0FuX/Yr8V8tE+nCVC51y3GhrXOifHS79F2Y=;
X-UUID: d390b5ed835d4007bb39e7bdb1a0dcca-20191124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1064894327; Sun, 24 Nov 2019 19:14:00 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 24 Nov 2019 19:04:24 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 11:03:49 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 25 Nov 2019 11:03:52 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <mark.rutland@arm.com>, <yingjoe.chen@mediatek.com>, 
 <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <linux@roeck-us.net>,
 <wim@linux-watchdog.org>
Subject: [PATCH v5 0/2] ASoC: mt8183: fix audio playback slowly after playback
Date: Mon, 25 Nov 2019 11:03:48 +0800
Message-ID: <1574651030-29519-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_191402_448375_205E0752 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: alsa-devel@alsa-project.org, yong.liang@mediatek.com, lgirdwood@gmail.com,
 jiaxin.yu@mediatek.com, perex@perex.cz, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series patches add reset controller for MT8183, and audio will use it in 
machine driver during bootup, they depend on the for-next.

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
  dt-bindings: mediatek: mt8183: Add #reset-cells
  watchdog: mtk_wdt: mt8183: Add reset controller

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  10 +-
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/mtk_wdt.c                    | 111 +++++++++++++++++-
 .../reset-controller/mt2712-resets.h          |  22 ++++
 .../reset-controller/mt8183-resets.h          |  15 +++
 5 files changed, 155 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
