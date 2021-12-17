Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z6wG9MhDqNLMQl4PAn92j+zJT1EvUIfFvjvpjlotiC8=; b=u/3hrwdC7c3BTh
	VuWE9YEV2iRqoq1uCTj7RiP1YaZj0jJIdIOP8CCZiV1YwkSjhnMIMPmzAB0TlMzjvoRzh6k8dPuil
	IU1Vz9nGOgY9w9ERel8Poxsy+M3y4GeGeVAjgdjT2uL2m6NJtqi1xf60M5B7JZBCqsM3epUtT0xOB
	jrnfd2yI+ooe5cYhQ6qnDzy1cAPHKiXsN6y/nPtGrEKVMWN/5tJF++lPVopPmyqPBx+i5M1t2690r
	6enkrX98Ph3oj/EUEHVTcJw0mhqxD/CwTc23x+1nvkYAWrkbSZil0NKbVTij1hHAwaOz2hS1DaQS0
	uho6/FAIlaD6MayTI1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEv2-00AqfD-1V; Fri, 17 Dec 2021 15:13:12 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myEsV-00Ap8b-3F; Fri, 17 Dec 2021 15:10:36 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="263944492"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="263944492"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 07:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="754582910"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 17 Dec 2021 07:10:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C6467410; Fri, 17 Dec 2021 17:10:39 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/1] serial: 8520_mtk: Prepare for
 platform_get_irq_optional() changes
Date: Fri, 17 Dec 2021 17:10:34 +0200
Message-Id: <20211217151034.62046-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_071035_184598_DEBD8BB0 
X-CRM114-Status: GOOD (  14.06  )
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index fb65dc601b23..8d3e16d7bf63 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
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
