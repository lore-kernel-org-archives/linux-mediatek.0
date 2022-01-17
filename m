Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C723C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pt2ijldyg0gNr3yYtPxUZLtD3sIQk7EuDfvz3tMwpwQ=; b=o3kFG5Q5Sb6s55
	/Op+pX+JS8d2oWBWKiNLJgERwXXKGe8a+W+yuzYFo59oYSBAwdwfyKEIEy/Q7PqiCJLr1w1gnwVUn
	GJ7o1ENh4VikzmnhF53YF78HlP8ZtxfwILLGTgTfqgWG7821qpgXv/uuvh5uDgRsxItPstN6gy7R+
	VKsgzn6gBBaLjyEaTe/bSTdgbP8X8JZKS2AVBK+RvTNHXMvVmlRr5BZXIdRZAFQc2/kySPlBdFVNt
	HI43ISH4YGg4Xbd7Z9zxhnv3ukBri+3ccNUvhkhwsdyC24iBlu8mX/Onj3aMiR/Au3KceocAfIFs6
	lGQXSxCuxRCUrq4uQPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9NQv-00E4Ya-JC; Mon, 17 Jan 2022 08:32:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9NQX-00E4Q8-Cj; Mon, 17 Jan 2022 08:31:46 +0000
X-UUID: 201cf22807fc4dc79303c5a820ce0187-20220117
X-UUID: 201cf22807fc4dc79303c5a820ce0187-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1927220151; Mon, 17 Jan 2022 01:31:39 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 00:25:54 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 16:25:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 16:25:51 +0800
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
Subject: [RESEND v3 0/3] mmc: mediatek: add support for SDIO eint IRQ 
Date: Mon, 17 Jan 2022 16:25:36 +0800
Message-ID: <20220117082539.18713-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_003145_453800_BF2A310D 
X-CRM114-Status: GOOD (  10.00  )
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


Changes in v3:
- correct abbreviations with capital letters in commit message
- replace copyright year with 2022 in mtk-sd.c
- remove unnessary pointer casting
- adjust variable order to reversed xmas tree
- remove a redundant blank line
- refine if statement, following standard pattern

Axe Yang (3):
  dt-bindings: mmc: add cap-sdio-async-irq flag
  mmc: core: Add support for SDIO async interrupt
  mmc: mediatek: add support for SDIO eint IRQ

 .../bindings/mmc/mmc-controller.yaml          |   5 +
 drivers/mmc/core/host.c                       |   2 +
 drivers/mmc/core/sdio.c                       |  17 +++
 drivers/mmc/host/mtk-sd.c                     | 125 ++++++++++++++++--
 include/linux/mmc/card.h                      |   3 +-
 include/linux/mmc/host.h                      |   1 +
 include/linux/mmc/sdio.h                      |   5 +
 7 files changed, 149 insertions(+), 9 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
