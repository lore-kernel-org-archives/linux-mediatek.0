Return-Path: <SRS0=GDFl=DL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12486C4363C
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2020 05:50:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F04D8206DD
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2020 05:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJN785nA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H4oa+Kuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F04D8206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cqCxQ0iQEAmvKjRdgDpeIsQ16RL0WnUd/BLY2EhdJX4=; b=KJN785nA1YtnNVb9Ym3wpY6QD9
	ns27uWYLNPNmujk9xWWcgHah2qh9TxkGFiGlj8Lvq3KO0tAKJs4Ir9Hy127v5Dyl4pZXUNyL0yLVl
	cUkDw/5QTVRyU/4huIz2zRTKphK50jcl3RUD+W7Qp73mJrxeDg+TBilssHB9hGzUigBvod+z+pwgC
	cWsfUjkiACRV8TTYRNTI6K5uFIcGMjfTYpcUfXy/4SML7dHyMXBDCWH1KhznuNCfZD006orQKUS30
	BdoigpXxZqKsXrnI/Mg2ldkSb+loJozIr48GqkRVffEFqaXaZ6uUguSL5R/2fYG1GrtNw/77+I8ms
	WC+1YYxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOwv0-0003DK-Vg; Sun, 04 Oct 2020 05:50:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOwux-0003Cb-QH; Sun, 04 Oct 2020 05:50:45 +0000
X-UUID: 471593f5a89d4aa88e3c1349a30d86b8-20201003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=R1eNNkVeR51W23UaO/9D2srShKgkSQlKxuAx45eQzEE=; 
 b=H4oa+KucznjWV1Buh1NkQuei74vskoCFjOz4ZB8pgP2viK7zSkWk8pcQLy5PaZ2N8ifikKOvfW1LpjTt0Eh9J4ZKkC0xnyfkXvs9VZyT6id/lk17flQGCbei7E3adW9F/6JFGFeLIpIcK9WmUDXqHtTYX43+sLdLoGxqrhcu404=;
X-UUID: 471593f5a89d4aa88e3c1349a30d86b8-20201003
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1374231359; Sat, 03 Oct 2020 21:50:30 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 3 Oct 2020 22:50:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Oct 2020 13:50:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 4 Oct 2020 13:50:26 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] [PATCH] of_reserved_mem: Increase the number of reserved
 regions
Date: Sun, 4 Oct 2020 13:50:24 +0800
Message-ID: <20201004055024.23542-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_015044_007251_8DA0A55B 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: devicetree@vger.kernel.org, Alix Wu <alix.wu@mediatek.com>,
 YJ Chiang <yj.chiang@mediatek.com>, Phil
 Chang <phil.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Liu <joe.liu@mediatek.com>,
 Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Certain SoCs need to support large amount of reserved memory
regions, especially to follow the GKI rules from Google.
In MTK new SoC requires more than 68 regions of reserved memory
for each IP's usage, such as load firmware to specific sapce,
so that need to reserve more regisions 

Signed-off-by: Joe Liu <joe.liu@mediatek.com>
Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
Signed-off-by: Alix Wu <alix.wu@mediatek.com>
Signed-off-by: Phil Chang <phil.chang@mediatek.com>
---
 drivers/of/of_reserved_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 46b9371c8a33..595f0741dcef 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -22,7 +22,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 
-#define MAX_RESERVED_REGIONS	64
+#define MAX_RESERVED_REGIONS	128
 static struct reserved_mem reserved_mem[MAX_RESERVED_REGIONS];
 static int reserved_mem_count;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
