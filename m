Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29B5C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 14:24:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DABE21D7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 14:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kgsPDzhe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZWvd5NLs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DABE21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dMPlkOTjnMeoBQmVSupHuUFyxPM2EAxoJw2GoNAXIis=; b=kgsPDzhez7sBLDU3f1KwwlulyN
	hZi/25EFy9+rlAgcyHB6iXzHknkYuxUPBtvGoj80qL2LZaEhOLlJWDZJ/OdSO66GpnsMsC01qMwDg
	oUZgIN7aQdUUyZ0ylNHAgem0lrJCelGpGhnznMBCj1YFG3pr7nA4RkiHyd1YPOw8pfz+uZo1p/4Ig
	6cqk9tFYcN7k6yVQFyYZJcrtovksWg7b4VmM3xCFU81YL+0pRQcC6vVMQ9/Wu+r7lH958xuPrCKhp
	/OffGiA7I5fwZp1yHvjrxwxfLbu4ul6hpspf9IpdfYu1ra2IjLd4/cuni63itRhO6eisy041pyzzH
	3pC9YmKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiefc-0000tA-W2; Fri, 27 Nov 2020 14:24:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiefY-0000re-CA; Fri, 27 Nov 2020 14:24:18 +0000
X-UUID: 7d3bc0a55bc24d96aee4f03155f63138-20201127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=dCA5lnKpTj/TD7z+W+aHBdfH+mZie8FSB7tJCebLSFQ=; 
 b=ZWvd5NLstxNe0iWR6eygKYpYwmKupdjYnWqpbdcVPI1kgr7qNyNxREjLxrJmsO5ygd14DCWRhEg93+ahtVI1mTaSKqChkbGxM5BkBclYWCMOuRrnkpGVCwhUTyZXE7v32z/LI1mHl5yjwlWhxldWRLYvzishuCmTQyK0eweIXJk=;
X-UUID: 7d3bc0a55bc24d96aee4f03155f63138-20201127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 466056745; Fri, 27 Nov 2020 06:24:29 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 06:15:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 22:15:32 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 27 Nov 2020 22:15:32 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Subject: Support 1 of N SPI interrupt for interrupt distribution
Date: Fri, 27 Nov 2020 22:15:28 +0800
Message-ID: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_092417_185415_30511491 
X-CRM114-Status: GOOD (  11.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

*** BLURB HERE ***
The GICv3 supports 1 of N selection of SPI interrupts.
When the GICD_IROUTERn.Interrupt_Routing_Mode == 1, the GIC selects
the appropriate core for a SPI.

Actually, dispatch the interrupt by hardware Interrupt Control Unit
is more efficient than irqbalance of software logic
and no need to implement software contoller to decide the targeted CPU
on various platform.

In order to reduce interrupt latency, all interrupts are targeted to
each online CPU defaultly by 1 of N selection of SPI interrupts.
That is, SPI interrupts might be serviced simultaneously on different CPUs.

[default policy]
AS-IS (target to boot CPU)
       CPU0       CPU1       CPU2       CPU3
 29:     92          0          0          0     GICv3 141 Level   ttyS0

TO-BE (enable ARM_IRQ_TARGET_ALL)
       CPU0       CPU1       CPU2       CPU3
 29:     23         23         24         22     GICv3 141 Level   ttyS0


Hanks Chen (3):
  irqchip/gic: enable irq target all
  arm: disable irq on cpu shutdown flow
  arm64: disable irq on cpu shutdown flow

 arch/arm/kernel/smp.c              |  10 ++-
 arch/arm64/kernel/smp.c            |   9 ++-
 drivers/irqchip/Kconfig            |  12 ++++
 drivers/irqchip/irq-gic-v3.c       | 107 +++++++++++++++++++++--------
 include/linux/irqchip/arm-gic-v3.h |   1 +
 kernel/irq/cpuhotplug.c            |  22 ++++++
 kernel/irq/manage.c                |   7 ++
 7 files changed, 138 insertions(+), 30 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
