Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A524C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:19:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6027C613A9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6027C613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6+I4etQhdSI8s8QLNiWVq65wkC91H07Z0Zwy5dERfO8=; b=Dvuqd5BAUrGAl5cOGfVy5DWM7
	rHuhanH6fXG7ZWs3zlJvNHH64VlB3znXj1s7wF8+W2dv067A4KR1JfizbF70XvTCm28bE9r/IOLZW
	YcaxXYcnE0JLZhsHigwX/HMw8pYU13rs/cBtTU3MEXqjkR5RGDBVkRs12WR67r1e7nLFFf2UmyjSn
	6RXi9FZndULw4e2h4e562lvFSEJWPAN8gtqB5WSU9whswmAzojxTBO1URXXkfiRTJ7QBnYkC1o6BI
	ouVxJkU80c4s4s7VV42bP3q5BlDIk0zAs9znc6AcMSDF5Hm3PvglAbN1LTlbDHFMp6lh1PkK2nTm8
	x4GBivNyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZo2-00BoIy-W1; Wed, 14 Apr 2021 07:19:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZnR-00BoCI-Ma; Wed, 14 Apr 2021 07:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=HjGiWBjyu6A+GgmhVGsc+L99a2vTJ6lDw67Lca0qSWg=; b=eVSeq0OVhwVkBkXTqMFupB2O8c
 R1SHIf1MqVmynTvKLP4zh/pK0zCCoMH7w+8ydiYOVe8i/VdZ0lYUQRrugoDuP+Qk2eBV5pfDmdhyO
 mwc14QijpqfIoTCqDT4Wtz8VSLjiCRiRhZZ1urR/3kMr7B0bYSk/wwmfJFyc0jH/p4fPgHIBleGU0
 76Hn0svG3fa45bUY5p5QKBFgRErBfO/ru8YBEOmuxngwNC9NkEm8F3gYIiABAT6OB88Qv6GRYZalq
 dfK7b4473nNpY9nOc8nKIBchgbTIea9pU1tm9P9JUFlpet45+2YLVHrz9Q3Uv5kfYVxumwNA5Re3W
 tUi1P4Qw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZnP-007Z6E-33; Wed, 14 Apr 2021 07:18:44 +0000
X-UUID: 3c0470756d3b4230b95ce0d4e2ae1d52-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HjGiWBjyu6A+GgmhVGsc+L99a2vTJ6lDw67Lca0qSWg=; 
 b=Y8uU3lX5YiBoVCW9BtubOShAj+ISokYKjPlk6Bu5bn+aN1pU/xVZM9JV8MZeFQhuGHue64WCLx5Z8UWAwOrkeXU7NiH64JMW91Hg5UIbIwjaAXZQY81Yayc4iXrH00iBay4Bj0guLrCxVE/hSbUgRNq7UlbfHJWpddcCXZBV8K0=;
X-UUID: 3c0470756d3b4230b95ce0d4e2ae1d52-20210414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 109285573; Wed, 14 Apr 2021 00:18:36 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 00:18:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 15:18:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Apr 2021 15:18:33 +0800
From: <Yz.Wu@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Seiya Wang <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Ryan Wu <Yz.Wu@mediatek.com>
Subject: [PATCH v5 1/2] dt-bindings: nvmem: mediatek: add support for MediaTek
 mt8192 SoC
Date: Wed, 14 Apr 2021 15:17:48 +0800
Message-ID: <1618384669-30070-2-git-send-email-Yz.Wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1618384669-30070-1-git-send-email-Yz.Wu@mediatek.com>
References: <1618384669-30070-1-git-send-email-Yz.Wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2153594E3DC16CB8EE200EA279803974DB3C9AA670F07EACE53D9D6F10F45B2E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_001843_162983_D4026398 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Ryan Wu <Yz.Wu@mediatek.com>

This updates dt-binding documentation for MediaTek mt8192

Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
---
This patch is based on v5.12-rc2.
---
 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
index ef93c3b..dbd4da8 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -7,6 +7,7 @@ Required properties:
 	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
 	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
 	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
+		  "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
 	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
 - reg: Should contain registers location and length
 
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
