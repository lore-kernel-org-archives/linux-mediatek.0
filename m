Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BFEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 06:48:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A1464E41
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 06:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A1464E41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e7wYAziK8WZPjA14scd9rtCREgphABK/rT9pm5WcBsE=; b=Q3nu7rXH+0STTbZn1Mc+vmkVqt
	PLQ/ACLrTvCvYSDmEqSMyP64V3UttmYnvwbVrYfmZ8/tJncwQv/e8tJLhbkNhmKeLMLjP9IQMydi3
	gNPqCtuynzUxZtKlb+NbF8chCcfZRfzpkmbMKIdMnCR4z3FqV0Nqgee7UkSdNFJ2P0HbZpRT86SEr
	REhTLWn9tgprYsE+vapAgjPGlLKk7kSn4SR+jYbstDJ/IRnBTME9sY2oN7CckYulGdIJhG59cnmE9
	Neue2krV78jaznFhHlGxf/Vtk97cWv98uCbBvQq1GmqpQRSogp8wC3CRZ08v3qbj+IH8VQKr3dIOF
	uC62SnVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLh1A-00F4qQ-AM; Mon, 15 Mar 2021 06:47:56 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLh0o-00F4mc-Rq; Mon, 15 Mar 2021 06:47:37 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzRkm56DPzrWhk;
 Mon, 15 Mar 2021 14:45:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 14:47:21 +0800
From: Jay Fang <f.fangjian@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <matthias.bgg@gmail.com>, <dan.carpenter@oracle.com>,
 <huangdaode@huawei.com>
Subject: [PATCH] soc: mediatek: pm-domains: fix missing error codes
Date: Mon, 15 Mar 2021 14:47:57 +0800
Message-ID: <1615790877-55259-1-git-send-email-f.fangjian@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_064735_375988_A358A383 
X-CRM114-Status: UNSURE (   7.65  )
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

From: Zihao Tang <tangzihao1@hisilicon.com>

Fixes one smatch warnings:

drivers/soc/mediatek/mtk-pm-domains.c:492 scpsys_add_subdomain() warn: missing error code 'ret'

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index b7f6976..5778dad 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -487,6 +487,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 
 		child_pd = scpsys_add_one_domain(scpsys, child);
 		if (IS_ERR(child_pd)) {
+			ret = PTR_ERR(child_pd);
 			dev_err_probe(scpsys->dev, PTR_ERR(child_pd),
 				      "%pOF: failed to get child domain id\n", child);
 			goto err_put_node;
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
