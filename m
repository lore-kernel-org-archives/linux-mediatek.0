Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8186FC48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 18:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419C6610A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 18:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419C6610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DE91nxEQbRWdacnAADgs/HErfP8dAKyOGtevFlrxWoo=; b=WUUzuM1yzCdBW6
	w/fuuYrmzcWcSfqAnyiextBX/iPtHcVXmN0NZkMy1HMUHm/5tvXjiz+UIY2qzwWaNItr6/3ssKDoX
	UG52FBLimoFxx6ZWoUOXTDmdFdwx3Iu9gIf3WkirNjMqMAP2Ayqci4pmmkwG5GbOj/1DqWtonmltd
	Nhejpb9IBh/qN7Ps+22wPWmdzh+zqT6xNC+BKZZfRxNAxcWbU5+2hcSI7BLfwljCgApHDdSnCAnWJ
	o8C0zbIV8166IdHi8MPG/AKYcAEuIEBK6iBTrKF+44XCHEiTDlV4WO+qwZvpwlXk6nUVUEufGzIhm
	jUHCvTGM1VleHHe8jNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltDWi-0021C8-2k; Tue, 15 Jun 2021 18:11:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Qq-000E8e-6K; Tue, 15 Jun 2021 13:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Ms2V43Y+zG4rJT5W7kdWWCyQOlck/Ej4cx++NxLHMfo=; b=PXK5OmCq9zgcgabQwFgYSP8lNo
 NXn1Vq/rGLlcQJBnoQHjg7iQs17ZwQWa/597gV4y6Djk7f5dJjM1oWVqOoZGFvbERHaUXVUBR0eZg
 4d2EIN9wdTdbCGj3e5JHCzUpznDENvZWHNG0Ax7kklTpZv5SeInIp5LCXOcvtalbIrBVsYDYnrkZA
 ufzSWHtEYm475wTNjeydalvfceVK4+VgfmqgyLDNIg9O4KN2Paplp1Cbc/NB9ipkUSexIYiD6Se8y
 UsLhxwlM069YF0rA7cEVWfvCz0fxCzzmQ7JseqOtAYZgVrAaOhCbVLUEDrfMQBcG81yq3jahRppwK
 ryl5yX/g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsyUz-007FmL-TU; Tue, 15 Jun 2021 02:08:28 +0000
X-UUID: 6925187f63444a17aef0bb7ba969dcb1-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=Ms2V43Y+zG4rJT5W7kdWWCyQOlck/Ej4cx++NxLHMfo=; 
 b=dlAxpBdPIXIZ/CbpzDFw0jAJb7Mslfmgr3AJ1kIK/cOKZ5mIZ83jlGqbhe0fUCdUNhv1wAuiaoXE7rqeWNWOGmvfVruIFq9pcppYWvXrkrmXS3BE1nEDo49gS/QnKMx8sldYzs5WN8qIaJU39hmSrwdgwSsFTPF8JLp0aRKJFN8=;
X-UUID: 6925187f63444a17aef0bb7ba969dcb1-20210614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1028627078; Mon, 14 Jun 2021 19:07:16 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 19:04:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:04:22 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 10:04:21 +0800
Message-ID: <1623721803.24597.9.camel@mbjsdccf07>
Subject: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, Mason Zhang <Mason.Zhang@mediatek.com>,
 <wsd_upstream@mediatek.com>, <hanks.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, "open list:SPI SUBSYSTEM"
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 15 Jun 2021 09:50:03 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_030826_395738_FCA9D3B2 
X-CRM114-Status: UNSURE (   8.06  )
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
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
