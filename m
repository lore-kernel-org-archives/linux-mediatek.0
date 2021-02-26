Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B9EC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:58:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5925B64EE7
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5925B64EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iRr9oIf6fLCBWzONTcnlpBJ6CHWbp43a1t8D7q2XvuU=; b=G+Y4f9sgBU3seHcONZ+WOOYCbh
	4S2Twxkdq9p+qHPn5o4xckgCVmb1MAoVlqFbbMIVdF+4FeVrXOaV0HyEfSnWB7KfxH8E5zk4p4tJF
	0pH6XVkkPpmTSSJeUMnxobLohvmZoRBbdWSWZPRYsXsTLTx1fIt5sDQIEp/8Lchjq155+93GLzD6B
	+G8Z1HMw6Z5/asbQ7SUzYPE54mhcK2nplYcvGhjpoQr1CshqxRBywWwofQV9HCkuPbFlgl6qlIG94
	DFslGwe47MST8pPQbkBUTfvuFh38xKO5w8QpUDCTjloVgY57G0r0c8iquI5RumsAni5VSNzBZd33h
	3cHfFDPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFap6-000618-JD; Fri, 26 Feb 2021 10:58:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFap3-00060Y-G4; Fri, 26 Feb 2021 10:58:14 +0000
X-UUID: 66b4a901e8564bcbbe20308a1a674d4f-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lyfYnTXe/coTTB7gXO+MvfdbFXuQEGJgwPKteQcICIk=; 
 b=F6ksIZeZWVYnGHhAAe7nv0oK7Rh4hLPNYlaL0zgsJGr6UqQSUwgJ3Lj5nT39QHBuAkdJyn6KUlEbj/fXZwYjxC9pvtHTb4bNSbG48N+Pi+6sWbkrcdJcV6pZcTW+Ye+CifHEKa38jWOFikRoB04MFHZmj/rW/0zZnJFCe7E9bYQ=;
X-UUID: 66b4a901e8564bcbbe20308a1a674d4f-20210226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 841191955; Fri, 26 Feb 2021 02:58:10 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 02:53:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 18:53:00 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Feb 2021 18:52:59 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/1] dt-binding: mediatek: mt6779: update spi document
Date: Fri, 26 Feb 2021 18:47:40 +0800
Message-ID: <20210226104739.16943-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 15E7D563F64BAEE36CB077D353793D0660DB7673C23501664A9C857E8F27212D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_055813_767818_C0DB7FD8 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: devicetree@vger.kernel.org, Mason Zhang <Mason.Zhang@mediatek.com>,
 wsd_upstream@mediatek.com, hanks.chen@mediateka.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
