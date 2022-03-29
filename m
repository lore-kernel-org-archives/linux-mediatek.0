Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289D5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 03:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=erUo8YAfjmWKYAJkXwC1n+IJ1xkDygpXYux3LmmnOLw=; b=hBegamqcup6mqm
	+3TXupr9bt7Be8dj8GqQIpOF7v5i576LV7jc0J7fkkEckYKE7cZPegyVlPvTVck2u4Ha/KrevsX36
	1Fu9DzkyPpeMju7GJKasnt7BXZQx1GEDslwE29djes8u8gDNFBVVxQ8/+aVDOWEAXE3Vzviiwkz+x
	6XCj1eLk27MNlogi1Cp4OPq8b9KV9LieLTgiD4AADaGCpQqgmQ3sorenWatJrqs2QSTbwBEiPto6w
	aAgYazIYypjtJ3SG3aGvUBKoF0quqgEuQUmCVOXgl/O/5bOr7vrYYUIph5P2GTmznMpkroooHBN51
	ryxbpT+WaobuPZ/ySaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ2Xv-00Aslw-Ff; Tue, 29 Mar 2022 03:29:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ2Xs-00AsjZ-JR; Tue, 29 Mar 2022 03:29:25 +0000
X-UUID: 62f53b9dbb7f4a7eb8fe9a588a490ac9-20220328
X-UUID: 62f53b9dbb7f4a7eb8fe9a588a490ac9-20220328
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 626823814; Mon, 28 Mar 2022 20:29:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 20:29:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 11:29:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 11:29:15 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Axe Yang
 <axe.yang@mediatek.com>, Lucas Stach <dev@lynxeye.de>, Eric Biggers
 <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd
 <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v9 0/3] mmc: mediatek: add support for SDIO async IRQ
Date: Tue, 29 Mar 2022 11:29:10 +0800
Message-ID: <20220329032913.8750-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_202924_690068_3BBFA8E9 
X-CRM114-Status: GOOD (  11.29  )
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

Changes in v9:
- remove pinctrl "state_dat1"

Changes in v8:
- remove maxItems property under pinctrl-names property

Changes in v7:
- add device_init_wakeup() to register SDIO host as wakeup source

Changes in v6:
- abandon cap-sdio-async-irq flag, use wakeup-source flag instead
- extend interrupts and pinctrls in mediatek mmc host controller DT documents
- add mmc_card_enable_async_irq() to access enable_async_irq flag
- simplify wakeup irq implementation with dedicate wake up irq related interface

Changes in v5:
- resort variables to reversed xmas tree order
- restore old copyright year range and add current year back

Changes in v4:
- add MMC_CAP2_SDIO_ASYNC_IRQ judge before lookup eint pinctrl
- replace spin_lock_irqsave() variant with spin_lock() in eint irq handler

Changes in v3:
- correct abbreviations with capital letters in commit message
- replace copyright year with 2022 in mtk-sd.c
- remove unnessary pointer casting
- adjust variable order to reversed xmas tree
- remove a redundant blank line
- refine if statement, following standard pattern

Changes in v2:
- change flag name from 'cap-sdio-async-int' to 'cap-sdio-async-irq'
- change corresponding macro names from xxx_INT to xxx_IRQ
- resort new member in msdc_host structure
- refine function msdc_request_dat1_eint_irq()
- rename msdc_{suspend,resume} function names, add suffix '_noirq'
- add MMC_CAP2_NO_SDIO judgement before parse eint related pin setting

Axe Yang (3):
  dt-bindings: mmc: mtk-sd: extend interrupts and pinctrls properties
  mmc: core: Add support for SDIO wakeup interrupt
  mmc: mediatek: add support for SDIO eint wakup IRQ

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 17 +++-
 drivers/mmc/core/sdio.c                       | 17 ++++
 drivers/mmc/host/mtk-sd.c                     | 94 +++++++++++++++++--
 include/linux/mmc/card.h                      |  8 +-
 include/linux/mmc/sdio.h                      |  5 +
 5 files changed, 131 insertions(+), 10 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
