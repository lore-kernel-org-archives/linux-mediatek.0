Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uXqahwKyIC5srEnczaFiSLWa9Ox/iADEUgiyfjrVvt4=; b=bS2JNQX+kMEhXp
	91Mb10AIPtq7Fm1CbU1zMkxtHozWfq1dINsJorD4wd5LdghD1mInGFP9skqJ09yVBQEMhdNX4Sj6X
	1rNxZQhU3ZFT/hVSEceVTOTAoKVnYipsziQlazxv3+k/bq+E8JnNz+XC06yEL7Zs6akV6Bs0ZfQPa
	PHrYSjk/HTVjb1WxCpkwkv+T03lShll+2ShmxIoJaR2KNb/CqtXy04ynnXlPisWrESmKNEQiXL6F8
	Ij0iHBPsQdXZBKbt1EuGYJHCd6okMYxiEeuPele/qPejgajEvMtsmtbnRTmqLUQSlamKWmW+GuYYW
	Yuhs+AIl8dJSJyGotoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt36Y-002IjV-Vq; Mon, 23 May 2022 08:07:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2pl-002BHH-Ms; Mon, 23 May 2022 07:50:35 +0000
X-UUID: 9a0fdd98561443d1b2816b23cef7cd7c-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:d8ffb39c-b983-4a82-9889-2ae0d9369855, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:e630437a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 9a0fdd98561443d1b2816b23cef7cd7c-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1954469145; Mon, 23 May 2022 00:50:23 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 00:40:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 15:40:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 15:40:19 +0800
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
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 0/3] mmc: mediatek: add support for SDIO async IRQ
Date: Mon, 23 May 2022 15:40:14 +0800
Message-ID: <20220523074017.12649-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_005033_809262_68362CCC 
X-CRM114-Status: GOOD (  12.68  )
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

Changes in v11:
- remove '_irq' suffix in interrupts-names property
- fix yaml example build error
- refactor msdc_enable_sdio_irq(), free pins_eint if async irq is not supported

Changes in v10:
- add sample node for SDIO host which support wakeup interrupt in yaml
- skip MMC_PM_WAKE_SDIO_IRQ check before enable SDIO async interrupt
- add MMC_PM_KEEP_POWER check before SDIO eint pinstate parsing
- use dev_pm_set_dedicated_wake_irq_reverse() to correct irq control sequence
- set dedicated irq in msdc_enable_sdio_irq() rather than msdc_drv_probe()
- remove unnecessary wake irq control, rpm/dpm system shall manage that
- move wake irq/msdc irq control back to system suspend phase, use rpm_suspend
  and rpm_resume to ensure irq control sequence:
     disable msdc irq -> enable wake irq -> disable wake irq -> enable msdc irq
- simplify variables, check pins_eint to know whether wakeup settings are managed

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

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 50 +++++++++++-
 drivers/mmc/core/sdio.c                       | 14 ++++
 drivers/mmc/host/mtk-sd.c                     | 80 +++++++++++++++++--
 include/linux/mmc/card.h                      |  8 +-
 include/linux/mmc/sdio.h                      |  5 ++
 5 files changed, 149 insertions(+), 8 deletions(-)

-- 
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
