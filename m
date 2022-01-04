Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFA5C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E+jmzAzZaHLhtfvkypKUGfinb9ZDgg1g2VtPPFUTSvY=; b=Ww7xanZ/rMI05z
	szp7L4Sc+rrQuDbVuCJ+HaquOHvWJ3sobnKXC7KIQt1x84+OhVujZlAkMOQeWTLhTWNqDWBKNocyO
	1P3Acs4Qc+zZucNNFRRuD2FNUl43pUdAS9bDZtjVkBl0aTW9ngeUNbetAQ8FuyBAjNGubdUTTzZi+
	LKYOZpL/27+pIz7Xyax9RLr3ZmosxjIP9CxITtTeMlwepyVJ8mLuvM5x1cNu+BqdrWS9Lwv0HjASI
	4uewCvGoQBrIGKMVMI102mE4eneji+6xHhnxGHcXC4wnCo8PKFUczlNxm8hNY0UeFCJ+G7z9Lveq/
	S62qBUyXNHW0iGjrXY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mmt-00CGdG-Jj; Tue, 04 Jan 2022 16:35:51 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4mmr-00CGcG-9J; Tue, 04 Jan 2022 16:35:50 +0000
X-IronPort-AV: E=Sophos;i="5.88,261,1635174000"; d="scan'208";a="106011210"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 05 Jan 2022 01:35:45 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3CF7E409E465;
 Wed,  5 Jan 2022 01:35:44 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] dmaengine: Use platform_get_irq*() variants to fetch
 IRQ's
Date: Tue,  4 Jan 2022 16:35:16 +0000
Message-Id: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_083549_458510_DA56D9C6 
X-CRM114-Status: UNSURE (   7.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi All,

This patch series aims to drop using platform_get_resource() for IRQ types
in preparation for removal of static setup of IRQ resource from DT core
code.

Dropping usage of platform_get_resource() was agreed based on
the discussion [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  dmaengine: nbpfaxi: Use platform_get_irq_optional() to get the
    interrupt
  dmaengine: mediatek: mtk-hsdma: Use platform_get_irq() to get the
    interrupt
  dmaengine: mediatek-cqdma: Use platform_get_irq() to get the interrupt

 drivers/dma/mediatek/mtk-cqdma.c | 12 ++++--------
 drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
 drivers/dma/nbpfaxi.c            | 14 ++++++--------
 3 files changed, 14 insertions(+), 23 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
