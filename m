Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE13C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:12:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0986113D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0986113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GCVGeWMN+MIhzsxRwnj2L5keV4/fJwMGSlrfuwVy0xM=; b=M4unyXb00JhJAM0yGqATuGJY7m
	QoJQFYNtGHCP+3i54L9dzeIJPzORj/jzMngd5eDoGs2fSvvQUWovQYsAD1lYFee2W+Ztm73PX3cQO
	W6KyrSj3KSHbjxSuV1rtmL0FYVuZl11HecScrC7QynyU9UkhGAJpj4CcySeRYQjIk7bkrWLitKoAi
	ep7LSZ3+ti5syxnm/HhiD2uB/8rHholVCt5QdtC/4L1j3kjrFOzZyk6YV8o4w0HyY1zKy974ZfJUe
	kb4KxgA/XOWIRxOpLhVluzq79ZSGDiIXXxNhaL0Z+wNhoqqxQcv6vqO0t8JGHMDwbaMElUL5XIier
	wAgunKdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lepy3-005q64-Oe; Fri, 07 May 2021 02:11:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepxu-005q4t-5O; Fri, 07 May 2021 02:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+CRFEW7jC3GF7ncxsEto7imsYG75x1r73+pauOuqj1w=; b=A3Yr4iWzoQiz66D/ebud7QnpkN
 wqLabeAAp0gNZa4MKgsFljl9ttVtcKFQKJjplrGjIb0lky/6Weivnqh64kovD/JNlhyfPyWmoUbCd
 gf4Yl9i8dYCqtJkK1thq1+r5uIJZ9+65nKh7OveGoYEVF67xbfocP4BsIrgJ+ViVRVj00930m7Bk2
 gVXfHbAMvapdiIYI6Z4hUPV2VeJh/xPTImyrjTBjrReoE8fuZpOxZt/NFd0yN/5JiwKDyeR8ZNW8P
 hu/ymQesjnDdOosAW+MHPzKqSHP6Uh2M7F+YaHbAOeynXQ5p813U/PWeQbMNaY/830l82simeRwJl
 Lkv49aYw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepxr-006WKP-F8; Fri, 07 May 2021 02:11:40 +0000
X-UUID: 0a8a0073eaec4017b9af1f86cfdaa292-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+CRFEW7jC3GF7ncxsEto7imsYG75x1r73+pauOuqj1w=; 
 b=QKeUkQHWTgmiiP3B1zU6V9G2HtNVczCnPXOq8aNLYXAD3v1j0xFcA6oPCQOtqtsVxstXnk6TNm/aIwKjFZXYADOuNtUIpaTORXiJiMBWpd/d36aX/OvCoqe6KX5KfgUVyOPBY2UZQvHtGVgQXNJwqavc6I3H/bLc6Nlm8Umzy40=;
X-UUID: 0a8a0073eaec4017b9af1f86cfdaa292-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 656585801; Thu, 06 May 2021 19:11:32 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 19:11:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:11:29 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 10:11:29 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>, "Sergei
 Shtylyov" <sergei.shtylyov@gmail.com>
Subject: [PATCH v3 1/4] usb: xhci-mtk: use bitfield instead of bool
Date: Fri, 7 May 2021 10:11:24 +0800
Message-ID: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_191139_535456_19220494 
X-CRM114-Status: GOOD (  11.59  )
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

Use bitfield instead of bool in struct

Refer to coding-style.rst 17) Using bool:
"If a structure has many true/false values, consider consolidating
them into a bitfield with 1 bit members, or using an appropriate
fixed width type, such as u8."

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: split @has_ippc out into anather patch suggested by Greg
v2: add more changelog suggested by Greg
---
 drivers/usb/host/xhci-mtk.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index cd3a37bb73e6..94a59b3d178f 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -138,17 +138,17 @@ struct xhci_hcd_mtk {
 	struct mu3h_sch_bw_info *sch_array;
 	struct list_head bw_ep_chk_list;
 	struct mu3c_ippc_regs __iomem *ippc_regs;
-	bool has_ippc;
 	int num_u2_ports;
 	int num_u3_ports;
 	int u3p_dis_msk;
 	struct regulator *vusb33;
 	struct regulator *vbus;
 	struct clk_bulk_data clks[BULK_CLKS_NUM];
-	bool lpm_support;
-	bool u2_lpm_disable;
+	unsigned int has_ippc:1;
+	unsigned int lpm_support:1;
+	unsigned int u2_lpm_disable:1;
 	/* usb remote wakeup */
-	bool uwk_en;
+	unsigned int uwk_en:1;
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
