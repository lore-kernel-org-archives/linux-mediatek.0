Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E904C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VbLAIhfCIuFV2PqWAGuzamKM8rAHhjfLNlWer6AeBPM=; b=Xb8bYSiPXo9FuL
	qNPhf5tXUr0D2MhX0/aveR0dGwK31ni8QUxPdMQrMr13qKdU7kTuY4o5rk/hCP3eaH+fzddkx9YkY
	HLQwValEjsPNyz6v+dubCWdwcpmiZt0GL8lIeOpDhJSC3SqxSUHt9HNHwxHBqeXNeG6qz3OHzkXq0
	1+v5Y4tstP8o5a6uu3k3jcNOx7WsWfaj7j4IfTZUCJV4DcKgBpnGp7VpBmknyrR1VanouKUhvBwxB
	Lr6zOf42fkfy/T77JxgW7el8uKy/FaphB1TXKsK5veY4woPKn0c5j7c+CghFw7fImQpBcoJAHvOli
	e/iIqir5JNZ7xhCoHo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n04HV-00Aqla-Rs; Wed, 22 Dec 2021 16:15:57 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n04HI-00AqhZ-Rf; Wed, 22 Dec 2021 16:15:46 +0000
X-IronPort-AV: E=Sophos;i="5.88,226,1635174000"; d="scan'208";a="104375071"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2021 01:15:42 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 41CE640A14AC;
 Thu, 23 Dec 2021 01:15:40 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] dmaengine: Use platform_get_irq*() variants to fetch IRQ's
Date: Wed, 22 Dec 2021 16:15:31 +0000
Message-Id: <20211222161534.1263-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_081545_026031_A9F501C4 
X-CRM114-Status: UNSURE (   6.29  )
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
 drivers/dma/nbpfaxi.c            | 13 ++++++-------
 3 files changed, 14 insertions(+), 22 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
