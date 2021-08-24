Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5886C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:31:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB1E60EB0
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BB1E60EB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUKjfXZ3pzgXcml9RdmdfGcTa9LqwZnPXEZN9uSkT+o=; b=D2G9bebf1l8sPX
	+niX+1cDeBgYUHaBp2aN3UC2pqddpKPyTA97chGq2UXVwunvFNQSEYWMD4MaIxqYYqrlFGc6n8xip
	9M//87ykH+UvvPsmK9aNSCKvyrznPLRJxPAOaAjCFrXw+LZJnAbdhCkkJ6ALQZ1+Eia9WItX7BNH2
	8SUwsAr8dqujfsgEFJV1EoJEd627qbLyY06EjtwJHcCcin91r72L/YbH6b8+3Fe0gGL4zhYNzsVFw
	uj2b+o6b19pHDMB19t2E+U95K91upfyqWlzVL9ZuaeR8AR5mnlQjaRWkujdoOb4FArSlQbR5Jcl33
	LSiNFCvPZtFGt7W1jCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIN9M-001NuK-9Q; Tue, 24 Aug 2021 03:30:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIN94-001NmS-U4; Tue, 24 Aug 2021 03:30:42 +0000
X-UUID: 7930c749183146ef84eb236abdbedf62-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UxRjaeiWcm3XfePJXtxoFP4OPfO1obmoYMcKTfEX4Wo=; 
 b=LMJVXu7cSdgtHlW4ms+4A/OQRjcaDgNTi2KYFkTf6gIJ5qxaAdwjkF7WuUkjZvUA+2MbILsLL//qyJSrjXdZnMkp1pxrS79X76GETiPF0wfnIvOPhuObNPjuLT+SkuUSS/N13IXC6TEamzgPKEe/dxlBGCyFh/5uZQZgl4ywDHQ=;
X-UUID: 7930c749183146ef84eb236abdbedf62-20210823
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 764560518; Mon, 23 Aug 2021 20:30:35 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 20:30:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 11:30:32 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 11:30:32 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>
Subject: [RESEND PATCH v5 1/7] i2c: mediatek: fixing the incorrect register
 offset
Date: Tue, 24 Aug 2021 11:30:22 +0800
Message-ID: <1629775828-19993-2-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_203039_001552_C05081E5 
X-CRM114-Status: GOOD (  13.03  )
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

The reason for the modification here is that the previous
offset information is incorrect, OFFSET_DEBUGSTAT = 0xE4 is
the correct value.

Fixes: 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")
Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 4ca716e..2661ed0 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -193,7 +193,7 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
-	[OFFSET_DEBUGSTAT] = 0xe0,
+	[OFFSET_DEBUGSTAT] = 0xe4,
 	[OFFSET_DEBUGCTRL] = 0xe8,
 	[OFFSET_FIFO_STAT] = 0xf4,
 	[OFFSET_FIFO_THRESH] = 0xf8,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
