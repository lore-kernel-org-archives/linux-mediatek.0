Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F10C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 09:37:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1A961A23
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 09:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1A961A23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+J99QHPTjUp6Jm6oLZHgeF46mDpzaLwe9GTgWUR/v7o=; b=SujIEVDi85z7txg9WB3/bja5kt
	ReX4/dq9LVPHa9GJrU7wbF95yDFU0B8e+Tj5DlolWHe5zW4PllSje2la4m28NLzUqM0rIxTuTQ2kA
	EhSZ4KwqwIuSouIuKmPz120prn7Ch7pu47shMFh/qz/+ReQSI6P3PrKoECQaEK9sNV6GkJ9nUdWHr
	HQa+gCeGJqp17nj923+neq6niJgBQn+oaWYZW1hlx9bojbdbgcV7vJLkAJp+CGkzu9pP2aNdFtlTf
	oyyzusB7gTAjXsBqVeAvaY5UH+ABLlLzYujUBCVj6LS8ByzyVBzKZtICb2FP+Oej3EniVch+Sg9A2
	87RBc8xA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPMQR-001760-PW; Thu, 25 Mar 2021 09:37:12 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPMLh-0016BN-33; Thu, 25 Mar 2021 09:32:19 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5fvM0CJMzPlJ7;
 Thu, 25 Mar 2021 17:29:35 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.177.129) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 17:32:00 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Qiheng Lin <linqiheng@huawei.com>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unused variable
 'count'
Date: Thu, 25 Mar 2021 17:31:51 +0800
Message-ID: <20210325093151.5913-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Originating-IP: [10.174.177.129]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_093217_731706_EEC12111 
X-CRM114-Status: GOOD (  11.82  )
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

GCC reports the following warning with W=1:

drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:80:9: warning:
 variable 'count' set but not used [-Wunused-but-set-variable]
   80 |  int i, count;
      |         ^~~~~

This variable is not used in function , this commit
remove it to fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 8ae9efab6d02..98b1d3577bcd 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -77,9 +77,9 @@ static int
 mtk_ppe_debugfs_foe_show(struct seq_file *m, void *private, bool bind)
 {
 	struct mtk_ppe *ppe = m->private;
-	int i, count;
+	int i;
 
-	for (i = 0, count = 0; i < MTK_PPE_ENTRIES; i++) {
+	for (i = 0; i < MTK_PPE_ENTRIES; i++) {
 		struct mtk_foe_entry *entry = &ppe->foe_table[i];
 		struct mtk_foe_mac_info *l2;
 		struct mtk_flow_addr_info ai = {};

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
