Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894C8C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 15:34:26 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5216261628
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 15:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5216261628
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jqIa0ZQeFph6rw2lfQYY0PsjhdVcFC++BM90cGXcpk0=; b=pb0/fCDZAHp4RY
	Ju7pRrcYeTRvLnCjiKj75oqLTRh1RYLnJ6WdWyqs/6RMQIUaVjMC1pukkNSdo2ZZ661JaFD3zjx4N
	BQMRsPczo//3huFGk3epHlfW+nlXpgybUrrq/OnU0tobRUMs5Ksx2rCqG9/uK/DOdfxpr005W2at6
	aDiKN7FLU2ijR8p1iz09BA2xkl2oUaV8BDZ/SXH8o9rwdveVoWa3hi33Hz50xRCYoZ720iKgeQsph
	qK406Y9LI2vIUaj+BME9qPylkwFL4h7hp/blglW8V6n62UyEhq19645QwjGKu2uEmSZ4QjhKv/R/u
	fNX6/90n4oKjkrqi1lSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltB4a-0010Hg-A0; Tue, 15 Jun 2021 15:33:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9R7-000E8e-09; Tue, 15 Jun 2021 13:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=HgQEMPAQwFVw316F5Bb8QONY/lmsE8nLMBDtacQX7JI=; b=gthjjJ1x9QozFjNUhpP+izoZrJ
 RV16C/EUIs50n6bng6X4DsQUfulnaW1R3ARaFZYL7Gze8RMh1asupiPgPf/MQcZB9813oe8TGOuzV
 7D9n8V8Tpm2eoDcTMaPuPoeL3aHFBd+pykshaJJTn42xNqaprHxxcAsOqpxBv4vMTZxJU00SRPR3k
 WzSAsCm85F43K4OibglHrFD46YfMEX96mwHOEfsJNI8L21x16FVjW8z4gcxjQWlppf9jW+ZQ381Hq
 R6z0Ry97QBCTiZs28xv5DvDLY2MdHKjxysSnS+CLmEvDGguJ51NVwL65ysP59ZRYsCe16TkZymx+0
 mTgt8VnQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsyEn-007FE0-0l; Tue, 15 Jun 2021 01:51:42 +0000
X-UUID: 0322c4dd54cc44d19d13848c10030524-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=HgQEMPAQwFVw316F5Bb8QONY/lmsE8nLMBDtacQX7JI=; 
 b=t3LvgieWBiOCwyg6dSv+mDsiKdf3OzAtFRQhDIgA06QHvTwrwjODC8+0XU4Caf1YqPyQkJgI4BvzQf8zOiEVVe6CJsmU1ipIuD+CefYkbNfLqGJzsBzTqwDlMxjko9L2ivHs3VYUBvs4o9PvgavCYhdcswbuWScXKY8gwAe3nHE=;
X-UUID: 0322c4dd54cc44d19d13848c10030524-20210614
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 965305208; Mon, 14 Jun 2021 18:51:17 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 18:51:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 09:51:12 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 09:51:11 +0800
Message-ID: <1623721012.24597.3.camel@mbjsdccf07>
Subject: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, Mason Zhang <Mason.Zhang@mediatek.com>,
 <wsd_upstream@mediatek.com>, <hanks.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, "open list:SPI SUBSYSTEM"
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 15 Jun 2021 09:36:52 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_025140_653610_19837792 
X-CRM114-Status: UNSURE (   8.48  )
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
 


Hi Mark && Matthias:

	I have fixed commit message, thanks~

Thanks
Mason
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
