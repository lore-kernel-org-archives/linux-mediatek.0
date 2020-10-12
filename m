Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B81BC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 10:21:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A25FF2074D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 10:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZdJXuvJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CoPRnWTp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A25FF2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uZ3QpNsoxXTk+smlw+gTPCaYODKmaeH7qic5vJ8t6Zk=; b=WZdJXuvJfxv4z6fbSGtKwwIIJH
	kSa4a26runnCfdxzQ+dcSZxZeAm+zZcCPMXY17UKqjqjfP6wjrIA5rGyhdIxTawfmZDGKXLWHmyTV
	noQ5ZZKlEoIFOrzztGpMVwgi3QmUHu409x7Q/4C94m/TvFHYHnI9IRXUDyR6wr4XVylhq/INig6TZ
	R8sqcBmdA3Fa2Za6+hoU1Wr+L5jq5Fa1QxoOivfrkeBBZd58SO8/T8tL0pb2nl0MNKjY1qtQ76V5l
	Q975rbWH4Z2b6G8XAQk+q6FR5ZGaPV6OnJqK/cIAyvD/BajfChXA5IP9e3CR0ckmtRZ/DJO/rPEzw
	p10U6CYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRuxT-0008EG-3V; Mon, 12 Oct 2020 10:21:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRuxN-0008DB-4b; Mon, 12 Oct 2020 10:21:30 +0000
X-UUID: c14de3a3d2644494adb3f5ff4a638c41-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sV7v6zcBR17fd0+AW0xQOpWr/elRpG4GNvg37vzsCsg=; 
 b=CoPRnWTpTkGDwcsJ3xupDsz2ATlpeXOHy5wk+g4WHCiCinJziwDtJgHGPEMCoU/LXJPXJe8JN1YVXMBbqev4IR2JL/LsRZTl1gUjcrIYR+nL0pxz/IFOp91YYEr9e7s+Ycp9pw+Tyze5Tff9O/Q8yGG3gf6uwbG7vovbFL3JhF4=;
X-UUID: c14de3a3d2644494adb3f5ff4a638c41-20201012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1210231621; Mon, 12 Oct 2020 02:21:14 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 03:21:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 18:20:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 18:20:58 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <marc.zyngier@arm.com>
Subject: [PATCH] irqchip/irq-mst-intc: Declare mst_intc_of_init static
Date: Mon, 12 Oct 2020 18:20:56 +0800
Message-ID: <20201012102056.4156-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_062129_315335_08EF2FFE 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: alix.wu@mediatek.com, jason@lakedaemon.net, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, wc.shih@mediatek.com,
 linux-mediatek@lists.infradead.org, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mst_intc_of_init is not intended to be used ouside of irq-mst-intc.c,
declare it static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/irqchip/irq-mst-intc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index 4be077591898..cf6de04a73b4 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -154,7 +154,7 @@ static const struct irq_domain_ops mst_intc_domain_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
-int __init
+static int __init
 mst_intc_of_init(struct device_node *dn, struct device_node *parent)
 {
 	struct irq_domain *domain, *domain_parent;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
