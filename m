Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A897C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 07:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581AB613CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 07:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 581AB613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eTjRRkfrnTckp3ca7jYhDLsRIsjFi64hBUYt7dzr2Qs=; b=vw0ooJUjpvXd5i
	uWhHrqdknqqgqiH1o6/QjfTLSoiD8oe586I2o7r3B+dDqOX1OQZ1q77fyROftv8k3ul4Jui8L4Vcs
	rUGVQBYzS5eSyJGcK5yYV4L47top1CEM5Fj1tKdf4bR9ou8zrhZ5aCIWc8YwLFYiTEaVCd1rU5j+c
	tQLqS9NsYSSFZtIuR0SOhQPIirVNg9cOVCd40oeO6rcZRhIReLVElzfta48h7S+oEc0F5Yr+NbM8N
	0BtyQOEzMxc5Ora1Gy4BQlcA1T1/7n9yPrNAKnwZJtsyosIboQqq1p1WspxL/fqumzKP/6HSg79UT
	EWGO20abI6bLkb8NGz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltmgT-009MXZ-0n; Thu, 17 Jun 2021 07:43:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltmgC-009MU8-Kh; Thu, 17 Jun 2021 07:43:16 +0000
X-UUID: ca985663800c4d2db8bddafd2e99de1b-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eFMNRY6r/nj6BgGyS+FTi/kwbhXZ+Whzx9IPACIRw70=; 
 b=Y3jRAZTIHmAG2/3jPFd3UPlDmFA2OECUAZgdvJx8X9h+YA0RxAPyQV1NRCPQam7hwsKZw47huCAldLaRyNmBMr8mQjW+tFl5Xgl2oyEDax5ymACGjFzOmTe3mPPDg2DntnF1YME9TD3YPlFeKTrbVHGELSPaAPgq56Xju2n8MfM=;
X-UUID: ca985663800c4d2db8bddafd2e99de1b-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1439415130; Thu, 17 Jun 2021 00:43:11 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 00:41:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 15:41:39 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 15:41:39 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Hsiung Wang
 <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH] spmi: of: Populate fwnode in of_spmi_register_devices
Date: Thu, 17 Jun 2021 15:41:33 +0800
Message-ID: <1623915693-18727-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_004312_725416_52DBC6EE 
X-CRM114-Status: UNSURE (   9.16  )
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

This patch allows the of_devlink feature to work across spmi devices. This
avoid unnecessary probe deferrals of spmi devices, defers consumers of spmi
devices till the spmi devices probe, and allows spmi drivers to implement
sync_state() callbacks.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/spmi/spmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 51f5aeb65b3b..0e679a483ce9 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -498,6 +498,7 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
 			continue;
 
 		sdev->dev.of_node = node;
+		sdev->dev.fwnode = of_fwnode_handle(node);
 		sdev->usid = (u8)reg[0];
 
 		err = spmi_device_add(sdev);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
