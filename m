Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892F9C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 12:28:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5946D613D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 12:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5946D613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zaaiIP9xlM+8XvkjuFRAREX8PXbV4W9RzO+f6E1YLL8=; b=uNWrTV5nss9dm+
	xgsffuU4O+UCAngoHi6E8lm8kj5i0tcYJtaruBg1rkrSEsAHY+QlfLR/v8YHvaU1N7+pO6jNJYXlu
	QyrmPEtjkHT/jpqv1kR2uEw2JKOVW2mq3BZNw9S0CJxBJOskdXm6kNVwK6qpdXZ2DsOR9m/Z0oAAE
	YXlwwT5QCRpTvdOeLmpVuTb1DpiZIA3iiShRXcA8RU5NcsHpWel8DW/T66/1rgulHODeh/zQm7Bdg
	xjPlDMVVHS9wHIUNMNwj9WJQWUrjFcAhFwbcfJkr+Tsrd/tkNPGeWN83hrF2rjwTK0by3IdvJkKNa
	HOvNKlmwtX0yn4GN2Z1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrgH7-005ExD-4j; Fri, 11 Jun 2021 12:28:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrgGq-005EuZ-Gt; Fri, 11 Jun 2021 12:28:21 +0000
X-UUID: 74a05684ac464c99ac2d8e3836a75195-20210611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=5WTI0sd3QrS6AzdAtUg1zyVx5qtJHQj3wy1A/5ifOvk=; 
 b=c3J8bZfFR7uB26v76G5+YiFVPE/BIYsvjJ66mKc8Q26DmTkgcFCCdOW2JxcxcReViIgxCDS9Mr3etmYy3yOa4yb9FOZLSab4frhlePsKHt8kSjXxWGP+w1XT0Ns2W0rPoKAz+alkeGDe8G2QRHjlQ145LNAqkjUw441lZLMh1is=;
X-UUID: 74a05684ac464c99ac2d8e3836a75195-20210611
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 503534829; Fri, 11 Jun 2021 05:28:17 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 05:28:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 20:27:56 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Jun 2021 20:27:55 +0800
Message-ID: <1623413625.22727.10.camel@mbjsdccf07>
Subject: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, Mason Zhang <Mason.Zhang@mediatek.com>,
 <wsd_upstream@mediatek.com>, <hanks.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, "open list:SPI SUBSYSTEM"
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 11 Jun 2021 20:13:45 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_052820_588668_E0E97C00 
X-CRM114-Status: UNSURE (   9.69  )
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


this patch update spi document for MT6779 SOC.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 Documentation/devicetree/bindings/spi/spi-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
index 9e43721fa7d6..7bae7eef26c7 100644
--- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
+++ b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
@@ -13,6 +13,7 @@ Required properties:
     - mediatek,mt8183-spi: for mt8183 platforms
     - "mediatek,mt8192-spi", "mediatek,mt6765-spi": for mt8192 platforms
     - "mediatek,mt8516-spi", "mediatek,mt2712-spi": for mt8516 platforms
+    - "mediatek,mt6779-spi", "mediatek,mt6765-spi": for mt6779 platforms
 
 - #address-cells: should be 1.
 

Hi Matthias:
	
	I'm sorry to disturb you, this patch is stay here for a long time, Do
you have any suggestions about this patch? 
	We hope this patch will be merged as soon as possible,If you have any
concern, I will fix it in time.

	Looking forward to your reply~  

Thanks
Mason
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
