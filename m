Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB85461056
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB85461056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2kROYy+2xmydL0GOrYrAF58ZIvq+/fEPxwMA5TNxWXA=; b=FV37aaagSNOfsa
	0LYVZ/y968RALgv0uSeGOuZhAwJGXuo6Ii/e9c81B3NksCSr5IPdk/wHcj59ka+G19NNH0I9KaAaM
	qZtqjDHbr+lGqS25TXOk0Q9DGapNQxZoSCV3JGdIoesnxdzDt4HPoCu/VHlmJ5aRi337D6SqvLpsl
	XfjMW2LgFNmPImCY8JyTCOhkhq1JQFyljT/SJQYp98jVMaa9XHLthGHl8/M1Kq9dHMedv3NgujcQn
	pTp2Tys8ed01uIEwj3Pl1rVu6jBAqwAygbEc8JM+t6b/nK81od0oQtki2fVB0IhsMrOn97nj81WRg
	HVRBdALEldBSw5b5xbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRDIs-00EAZX-MV; Fri, 17 Sep 2021 12:49:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRDIo-00EAWL-1F; Fri, 17 Sep 2021 12:49:16 +0000
X-UUID: 8870901468c8419f98ea48ce75771e01-20210917
X-UUID: 8870901468c8419f98ea48ce75771e01-20210917
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 96940289; Fri, 17 Sep 2021 05:49:09 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 05:48:04 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 20:48:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 20:48:02 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Avri Altman
 <avri.altman@wdc.com>, Wenbin Mei <wenbin.mei@mediatek.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Yue Hu <huyue2@yulong.com>, Bean Huo <beanhuo@micron.com>, Adrian Hunter
 <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND v4 0/3] mmc: mediatek: Add HS400 online tuning support
Date: Fri, 17 Sep 2021 20:48:00 +0800
Message-ID: <20210917124803.22871-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_054914_147978_DE1B25D5 
X-CRM114-Status: GOOD (  12.12  )
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

Change in v4:
- split driver patch into a core patch and a mtk-sd patch
- use mmc_get_ext_csd function
- move mmc_get_ext_csd() to include/linux/mmc/host.h
- modify some commit message.

Change in v3:
- add detail descripthion for hs400 dly3

Change in v2:
- remove the check "mmc_can_ext_csd"
- change the hs400 tuning condition for "msdc_cmd_done" function and
"msdc_cmd_next" function
- use "-EIO" instead of "-ERANGE"

Wenbin Mei (3):
  dt-bindings: mmc: mtk-sd: add hs400 dly3 setting
  mmc: core: add tuning support for HS400 mode
  mmc: mediatek: Add HS400 online tuning support

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 12 +++
 drivers/mmc/core/mmc.c                        |  8 ++
 drivers/mmc/core/mmc_ops.h                    |  1 -
 drivers/mmc/host/mtk-sd.c                     | 79 ++++++++++++++++++-
 include/linux/mmc/host.h                      |  4 +
 5 files changed, 101 insertions(+), 3 deletions(-)

--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
