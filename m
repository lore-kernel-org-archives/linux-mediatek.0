Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58096C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 07:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E5761040
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 07:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20E5761040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=98YEWa7S4P/na8dGb+wAhWh9WxhZYGCS3cAbORQ9XyI=; b=aDLxrOglpI1pi3
	QCGijr3FUfhtphT+DYNfZ779l3vsj03FcKyYEajU39Wh39QseKWuj1SrPlFqnugHxi+f6AI0HwYDq
	CFIDHz5qGKTxtetGmQVFTwQs73CuglMzKgb+XSeNxjV+4ikII4pAfO6S3cu6Nz8M9veJHrXmMt+Vo
	DAAMDfeIAjx0aaAYddGVaOSRtNDqE6omPg4h2VYozsgZqQgymNisWsdNGuI3Jv39IefsJ+jYPDwWw
	FG4/imiArXUn9BxegHc6r3y1GzXxFquGSQA4DaeaJWHnJT7Z+2PHHTx6Ce6Cg7q7jQFYZeeHrhWL5
	byYdPEItaPJC07AsnN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfGhS-000s43-Nk; Tue, 26 Oct 2021 07:16:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfGgu-000roC-Vv; Tue, 26 Oct 2021 07:16:16 +0000
X-UUID: d0989b82adaa40ee900703d402eb1e4d-20211026
X-UUID: d0989b82adaa40ee900703d402eb1e4d-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 14099351; Tue, 26 Oct 2021 00:16:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 00:08:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Oct 2021 15:08:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Oct 2021 15:08:13 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, Ritesh Harjani
 <riteshh@codeaurora.org>, Asutosh Das <asutoshd@codeaurora.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-mmc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, "Wenbin
 Mei" <wenbin.mei@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH] mmc: cqhci: clear HALT state after CQE enable
Date: Tue, 26 Oct 2021 15:08:12 +0800
Message-ID: <20211026070812.9359-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_001613_068144_EFB116F6 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

While mmc0 enter suspend state, we need halt CQE to send legacy cmd(flush
cache) and disable cqe, for resume back, we enable CQE and not clear HALT
state.
In this case MediaTek mmc host controller will keep the value for HALT
state after CQE disable/enable flow, so the next CQE transfer after resume
will be timeout due to CQE is in HALT state, the log as below:
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: timeout for tag 2
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: ============ CQHCI REGISTER DUMP ===========
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Caps:      0x100020b6 | Version:  0x00000510
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Config:    0x00001103 | Control:  0x00000001
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Int stat:  0x00000000 | Int enab: 0x00000006
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Int sig:   0x00000006 | Int Coal: 0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: TDL base:  0xfd05f000 | TDL up32: 0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Doorbell:  0x8000203c | TCN:      0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Dev queue: 0x00000000 | Dev Pend: 0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Task clr:  0x00000000 | SSC1:     0x00001000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: SSC2:      0x00000001 | DCMD rsp: 0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: RED mask:  0xfdf9a080 | TERRI:    0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: Resp idx:  0x00000000 | Resp arg: 0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: CRNQP:     0x00000000 | CRNQDUN:  0x00000000
<4>.(4)[318:kworker/4:1H]mmc0: cqhci: CRNQIS:    0x00000000 | CRNQIE:   0x00000000

This change check HALT state after CQE enable, if CQE is in HALT state, we
will clear it.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: stable@vger.kernel.org
---
 drivers/mmc/host/cqhci-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
index ca8329d55f43..b0d30c35c390 100644
--- a/drivers/mmc/host/cqhci-core.c
+++ b/drivers/mmc/host/cqhci-core.c
@@ -282,6 +282,9 @@ static void __cqhci_enable(struct cqhci_host *cq_host)
 
 	cqhci_writel(cq_host, cqcfg, CQHCI_CFG);
 
+	if (cqhci_readl(cq_host, CQHCI_CTL) & CQHCI_HALT)
+		cqhci_writel(cq_host, 0, CQHCI_CTL);
+
 	mmc->cqe_on = true;
 
 	if (cq_host->ops->enable)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
