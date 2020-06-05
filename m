Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7BBC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 12:56:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4030D206A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 12:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X8UmQaLL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4030D206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9aaGXaT4bPb1zbs8MxHTNsirPlAX8u35wYdYVVamSs=; b=X8UmQaLL1gh1Jw
	Sn6UKjkbMHmMpBAl2QLOASu756c3O2Umo1n3fXi8P379yNUhp7dTeNZnyuJOFC5hoBISnpftDv/xm
	c11BOgVW6PMJR2GTjxg9Xia0Qwx9fUTOOXJBIe68e8RS+QcW+6pEC4Bo0ZkLHz3ZIyt/0P5qO/eAz
	ljj1Sf6WF4z5MOcptq31x+CfVGy4rv9F58aGAgNf2pM1JPpqKsYZXO7QljUnNbVvUYQk54tkPetfz
	UOUPGPi+H4JgYEqByJ/l5swXF+DCAdI85wMNumxTBa6bQK1DOiGqYPN1TCPBZJoic7cv+1vUEui9d
	NCMULIQKd172lbwL8hpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhBtY-0003Vz-7k; Fri, 05 Jun 2020 12:56:24 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhBt4-0002zd-71; Fri, 05 Jun 2020 12:55:56 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2249545|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00490445-0.00740592-0.98769;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=frank@allwinnertech.com; NM=1; PH=DS;
 RN=13; RT=13; SR=0; TI=SMTPD_---.Hib7hso_1591361738; 
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com
 fp:SMTPD_---.Hib7hso_1591361738)
 by smtp.aliyun-inc.com(10.147.41.143);
 Fri, 05 Jun 2020 20:55:44 +0800
From: Frank Lee <frank@allwinnertech.com>
To: chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com,
 mripard@kernel.org, wens@csie.org, tiny.windzz@gmail.com, rmfrfs@gmail.com,
 frank@allwinnertech.com, marex@denx.de, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mmc: sunxi-mmc: do not hide address in sunxi_mmc_irq()
Date: Fri,  5 Jun 2020 20:55:44 +0800
Message-Id: <20200605125545.31974-1-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_055554_438984_650DCC15 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yangtao Li <tiny.windzz@gmail.com>

Using %px to show the actual address in sunxi_mmc_irq()
to help us to debug issue.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Frank Lee <frank@allwinnertech.com>
---
 drivers/mmc/host/sunxi-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 5e95bbc51644..dcd30c3e1fac 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -574,7 +574,7 @@ static irqreturn_t sunxi_mmc_irq(int irq, void *dev_id)
 	idma_int  = mmc_readl(host, REG_IDST);
 	msk_int   = mmc_readl(host, REG_MISTA);
 
-	dev_dbg(mmc_dev(host->mmc), "irq: rq %p mi %08x idi %08x\n",
+	dev_dbg(mmc_dev(host->mmc), "irq: rq %px mi %08x idi %08x\n",
 		host->mrq, msk_int, idma_int);
 
 	mrq = host->mrq;
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
