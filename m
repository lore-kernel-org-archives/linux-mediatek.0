Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EEBC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 13:06:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9842161373
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 13:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9842161373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUKjfXZ3pzgXcml9RdmdfGcTa9LqwZnPXEZN9uSkT+o=; b=nvRx+gUMKc8yeq
	PwBPSPoZ2pw1YfvL950i8rO+OqVWXq9YWKAn1hTnR/rblKUAxxaRz8t6GivAnttFmEqvshKY2cZ17
	oszhrR6LD0D4obVqRY6Ieszb1BozBVQK7D/qXWyK5dvZodHIKrPzFirlQe0Es/pRin5TmDh050Fam
	p4Fbn9NHGt2NDEFf3kSrfYOiCLJTUdm/psX8pdtIBpuwyHbhmnGJJ6QHIWCkDTrjLjYOiq+4rNN5D
	E3gt/opdTAqbaZXShMoHbmq5b6ZpS+1qkFDS1DdERXT8fBW23kUThVZcyV2/SM1AQBrmDnZpP7+2g
	AfuN+hb6pe6L0OlluM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9ej-00Gvid-L8; Mon, 23 Aug 2021 13:06:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9eH-00GvW6-Du; Mon, 23 Aug 2021 13:06:02 +0000
X-UUID: 5bace8c051404d9994de084e58cc0068-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UxRjaeiWcm3XfePJXtxoFP4OPfO1obmoYMcKTfEX4Wo=; 
 b=oWezIoprMGoxUBsyFWL+4gdlObsrK54O55cEMtn9f57NvQWUOa+KkdMZo2w/jHKZePMPynNZbcWE/huNXTdTaVJ7HA6dQ760k5oO0PUdniy41kQGcUJO5CKdHagtBw5V4VZ3fw15vwGQpDE8k9r98ckIYKyPMgrm0Hfx8UDfOTU=;
X-UUID: 5bace8c051404d9994de084e58cc0068-20210823
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 365652048; Mon, 23 Aug 2021 06:05:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 06:05:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 21:05:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 21:05:40 +0800
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
Subject: [PATCH 1/7] i2c: mediatek: fixing the incorrect register offset
Date: Mon, 23 Aug 2021 21:05:31 +0800
Message-ID: <1629723937-10839-2-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1629723937-10839-1-git-send-email-kewei.xu@mediatek.com>
References: <1629723937-10839-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_060557_533327_165D2BB2 
X-CRM114-Status: GOOD (  12.29  )
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
