Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D45C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENCrdfVQ+RZkNuMOFIOvZa2YRm3n3MpEUQ7QXlNm1ao=; b=xeo/oPSBejnBKH
	Gx2pYiVgZAPE07+O1pD/1UiD8aECOLymgtizZOSuwjTAOywQYrrXCHJHkg1CjVk6YnA2tan4ihd61
	dKtXJ+ES5o5pcNL1AkitNZF/W8yUe0NJMAwpDdnYL9rkcSMffmZIVO30/OzU1SI42+3Av/GsEO32v
	Ux2gw7lnjBGVwNFMrP5/HdN8yAaQx4NwVTm7BtQ0Ual8VOQlxMGF/89YZSjS1QKie938MqYnQs3y1
	6/CWO6WZMY0XYV435dnOGiyp/7m4hO4Bth9kScjEWDIH8O1KbjCYwI7czOOBilLOUcJuuIXdicQdf
	nW70pOiR7h3V/ayH4xyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n53Hy-00ETer-1I; Wed, 05 Jan 2022 10:13:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n53Hv-00ETe7-Bt; Wed, 05 Jan 2022 10:13:00 +0000
X-UUID: 122dde7b011b439ab3454e1e6799314a-20220105
X-UUID: 122dde7b011b439ab3454e1e6799314a-20220105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1768729642; Wed, 05 Jan 2022 03:12:53 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 02:05:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 18:05:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 Jan 2022 18:05:28 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Ryder Lee
 <ryder.lee@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 0/2] Add toprgu reset-controller support for MT7986
Date: Wed, 5 Jan 2022 18:04:54 +0800
Message-ID: <20220105100456.7126-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_021259_431578_FAA1349C 
X-CRM114-Status: UNSURE (   8.77  )
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

These patches aim to add watchdog toprgu reset-controller support
for MT7986.

Sam Shih (2):
  dt-bindings: reset: mt7986: Add reset-controller header file
  watchdog: mtk_wdt: mt7986: Add toprgu reset controller support

 drivers/watchdog/mtk_wdt.c                |  6 +++
 include/dt-bindings/reset/mt7986-resets.h | 55 +++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt7986-resets.h

-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
