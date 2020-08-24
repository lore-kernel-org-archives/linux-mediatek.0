Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33582C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 02:49:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036302078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 02:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQAsSbAo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y7K6vJzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036302078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=abWolN/DOIwNIMz3ja78jyuut9Ui0O3w2iYaYlLSs84=; b=rQAsSbAokVJrHtqRZUMxmsRZ2
	qgDbkV4zekQToPHwq1RIZKsaeuwViQhAbdHG0xsCh5NMuYLS+3Sbi1suiM35iHtKlwXviTEgasXZZ
	bE+6Gg6hbVIPtyTXxEO8Cy+17gvPbtwDt2628RA2zYAjs/+bI/PSmU4Jz1dYXW0XSDP9hubVmrqFU
	1HenbB5dA4MboYO1kSg2vuTjOg0nGh52j70Evf1QRdfJdKcG4RLuP4XCh6KwHKKJ6Jfazy5WywvAi
	47UuHmvUwOZxOuZYPNCdH8A1pnnTprVv/EHGNJdVvMyF++6n3EzIpuRO8/xXX/Tw7UBH0LmHHRSfe
	2piQGQajw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA2Xw-0006yI-VA; Mon, 24 Aug 2020 02:49:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA2Xn-0006vX-1y; Mon, 24 Aug 2020 02:49:12 +0000
X-UUID: 44c40a0e64744afd8e52b2427d08ad3b-20200823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MQ+lWRIMzlLcIAlBgmbEN4Xfo27oGH4DXQdB75/Yr0g=; 
 b=Y7K6vJzVgIzjrVzAZBU2NeknkxBwY5bq0dUA1qjHPEoHRMl9v239GpDXy2cHTXpWbt5xzAwcj3L3HDDg/I8Kiinp127Ow55bJ2YrYn4vKQ9rzUS6MrADIMu+iIx6IaEU9AgozcKncn3k7e0OG54kphJCYe+Br6HmV2slyNAq0hY=;
X-UUID: 44c40a0e64744afd8e52b2427d08ad3b-20200823
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 214403919; Sun, 23 Aug 2020 18:49:02 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Aug 2020 19:49:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 10:48:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 Aug 2020 10:48:54 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
Subject: [PATCH] MAINTAINERS: Add maintenance information for MStar Interrupt
 Controller
Date: Mon, 24 Aug 2020 10:48:56 +0800
Message-ID: <20200824024856.12845-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200819153757.28993-1-mark-pk.tsai@mediatek.com>
References: <20200819153757.28993-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5ECEB2847F83711C8D72F1725AB1012FAAD0F315FAF4E860FF3A8DD04AE7A0CA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_224911_292472_85DD1094 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add entry for MStar Interrupt Controller.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..8ab08fccd915 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11754,6 +11754,13 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/anttip/media_tree.git
 F:	drivers/media/usb/msi2500/
 
+MSTAR INTERRUPT CONTROLLER DRIVER
+M:	Mark-PK Tsai <mark-pk.tsai@mediatek.com>
+M:	Daniel Palmer <daniel@thingy.jp>
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
+F:	drivers/irqchip/irq-mst-intc.c
+
 MSYSTEMS DISKONCHIP G3 MTD DRIVER
 M:	Robert Jarzmik <robert.jarzmik@free.fr>
 L:	linux-mtd@lists.infradead.org
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
