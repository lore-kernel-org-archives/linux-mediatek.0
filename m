Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9490BCD4F3D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 00:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPHg3PhRQ/iRlu2JQO+wt+J//uW4Lc+cTIqd/znwy0w=; b=wtusSafnTodqJEyNkCN3kWCysc
	+Vos172M2GfDANAfNDgplaXib/jplzDOtI79gXIkN0wrth8PBMB+gTAFZfdQboEvPTT0Qr4bIiYDv
	HP5nRzeYQ3/dAd55PG8Q+dz8NfYqp9UrQxp/TMVL/jQNrZ7cXcJIsCvVxfgDW6k+/j1OlXuj/1V/Z
	qtV+zcU3eTk7fHIRE9a3N56nvEykJaamZPwcGndAH87B8+Uw9UyJGdzn6g+4wg1i9wpaIZALp0Aw0
	E6G9Knwv9t1h2y0GCa3cBKEgP2kxGUXxX4SVFz33kxiI23clm0BDVka6lgCANcUykGc4XJBneWDmh
	sufpM6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm5Q-0000000Dleq-3ULx;
	Mon, 18 May 2026 00:44:00 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm54-0000000DlNG-3vUJ;
	Mon, 18 May 2026 00:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UP
	Hg3PhRQ/iRlu2JQO+wt+J//uW4Lc+cTIqd/znwy0w=; b=qFIrxqYlAAyOpwBXPR
	wvEMCmwLAi4HbuXJMO9BsujHYMAnbT/IPoQy9JYunlrEkMEBRLlA5FMO/HrBbLD0
	78xKL1YydB75uknp+oIB+XCvLjlgVdCPl4cK9gluy33ugXFyXd31+EFIg8aLP/Yv
	JuZklAWk1+0XZdEMjjg5/P4Ok=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S7;
	Mon, 18 May 2026 08:42:56 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	ryder.lee@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 5/7] PCI: aardvark: Add 100 ms delay after link training
Date: Mon, 18 May 2026 08:42:44 +0800
Message-ID: <20260518004246.1384532-6-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518004246.1384532-1-18255117159@163.com>
References: <20260518004246.1384532-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnj6SIYApq2fikCA--.4779S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWfGF4fJw1UXryftF1fZwb_yoW8GFWrpa
	y3CrZrJrs5tr43ua17Aa4fWFy3Wan0ka47Jr92gw13ZFnrKryUJr1jk3sagF17ArWvvr13
	Ca43t3Z3Gr43XFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziSfO3UUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxFZ-GoKYJEOSwAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_174339_319473_38BCFEE0 
X-CRM114-Status: GOOD (  12.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Aardvark PCIe controller driver waits for the link to come up but
does not implement the mandatory 100 ms delay after link training
completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).

The driver already maintains a 'link_gen' field that holds the negotiated
link speed. Use it together with pci_host_common_link_train_delay() to
insert the required delay immediately after confirming that the link
is up.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pci-aardvark.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index e34bea1ff0ac..fd9c7d53e8a7 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -26,6 +26,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 
+#include "pci-host-common.h"
 #include "../pci.h"
 #include "../pci-bridge-emul.h"
 
@@ -350,8 +351,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
 
 	/* check if the link is up or not */
 	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
-		if (advk_pcie_link_up(pcie))
+		if (advk_pcie_link_up(pcie)) {
+			pci_host_common_link_train_delay(pcie->link_gen);
 			return 0;
+		}
 
 		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
 	}
-- 
2.43.0


