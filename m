Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37052C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 18:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6y8DCLGgIB6E+jS0xu6W7OvTfTJCt2vYBo0WeQVJxH8=; b=lKUbHiKN6+ZTL1
	chsqGq3qU1/5whreN0kilJ9uOg8L3bP0RoZsfsjYDNw+RG7+D/C40XUjGnYxFUR9BYIlUyTha47mX
	ovDYlDDhMGd2hkFHv3sjC8bQNG9VDFh/yrUje5SaAK5mTmdkl8PSdhSmWLQ6L/gIrsqUBJbrdd7xJ
	uHxP6AVpyWycYcPmkTo57O/kQMXnERB2OBwdnnmQvmzobd+/SD2EKUFxmrEAccW86FXNPNY0OoL3p
	g6mkkG/gtmkwP+ZzgzyS3PpYHhKCkx1hBMd/tTJARcPv0UB7hwboQiQl/JgsaMvSF9UrSrp8Gkmuu
	Iw0PxG2oiakik3diH8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myICo-00Bwa4-JS; Fri, 17 Dec 2021 18:43:46 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myHlj-00BjzP-PO; Fri, 17 Dec 2021 18:15:49 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="300580626"
X-IronPort-AV: E=Sophos;i="5.88,214,1635231600"; d="scan'208";a="300580626"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 10:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,214,1635231600"; d="scan'208";a="466593784"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 17 Dec 2021 10:15:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B0728109; Fri, 17 Dec 2021 20:15:51 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/1] serial: 8520_mtk: Prepare for
 platform_get_irq_optional() changes
Date: Fri, 17 Dec 2021 20:15:47 +0200
Message-Id: <20211217181547.48182-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_101547_927962_FF95C972 
X-CRM114-Status: GOOD (  14.26  )
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

The platform_get_irq_optional() is going to be changed in a way
that the result of it:
   = 0 means no IRQ is provided
   < 0 means the error which needs to be propagated to the upper layers
   > 0 valid vIRQ is allocated

In this case, drop check for 0. Note, the 0 is not valid vIRQ and
platform_get_irq_optional() issues a big WARN() in such case,

It's safe to assume that 0 is not valid IRQ in this case since
the driver is only instantiated via Device Tree and corresponding
OF APIs should never ever return 0 for valid IRQ. Otherwise it is
a regression there.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: explained why it's safe to assume 0 is not valid here (Greg)
 drivers/tty/serial/8250/8250_mtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index fb65dc601b23..328ab074fd89 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -621,7 +621,7 @@ static int __maybe_unused mtk8250_suspend(struct device *dev)
 	serial8250_suspend_port(data->line);
 
 	pinctrl_pm_select_sleep_state(dev);
-	if (irq >= 0) {
+	if (irq > 0) {
 		err = enable_irq_wake(irq);
 		if (err) {
 			dev_err(dev,
@@ -641,7 +641,7 @@ static int __maybe_unused mtk8250_resume(struct device *dev)
 	struct mtk8250_data *data = dev_get_drvdata(dev);
 	int irq = data->rx_wakeup_irq;
 
-	if (irq >= 0)
+	if (irq > 0)
 		disable_irq_wake(irq);
 	pinctrl_pm_select_default_state(dev);
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
