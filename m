Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CF5C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 09:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C388E23102
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 09:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C388E23102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c9hG486OO8wBK+rDpitpBp6ESZzk01+fE+fyZ/3/ujU=; b=tQ57ojt/OBoI1SXMqAz+Gqdgc
	A4qk3WEdHwWu5uB1xwcF6TLWP4oidFcIyXDIfff74DPOIkzuuM9R9ewyAK3AXqUwi02RGE7qz2ut1
	eUPifjDGIEKVy2sfixdWlc77gk099KCF6OLaGnK/y96ttQxL1eQiLpkhXONlTphFOg5r160K3WsDx
	DUQYW17r+fVFmKzLZgadLd2ljPp82Cip5IToa6QXn0HzCo5NhonF0vMgq10gZiscNaIYKs7pLMm2n
	jk/5kIbEHSJ64un8K00/0wi8VXqsd9FTxQ7rRhGHl2jq64lArCCY5iFdmgjXL+TOaMwK4qI1ZB1KN
	4qUf4E7Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpTDM-0001PA-Bg; Wed, 16 Dec 2020 09:35:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpTDG-0001NE-Co; Wed, 16 Dec 2020 09:35:17 +0000
X-UUID: 1efffed97e7b4b758dad7cdf6220a8cd-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YnDeB0EPUzDizrn05Xm88U+V8lPbgyBHW/XlFVfhGEY=; 
 b=BNzSqzxkPGozl0oi6S7ucCYK/cXqe1A+noETXQCyCdmMSqMG8hf6OZNttUHdLw3XHQfHi/xx6hY5WaGVFMcrIcvjE8c4l19Laihf2ByXE8aElbW4zY4arCifM2QFZNc8efGG9oiasjqNa8umdTyJ6YLVMnxu7BGQHTK9uS98ZN0=;
X-UUID: 1efffed97e7b4b758dad7cdf6220a8cd-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 548956733; Wed, 16 Dec 2020 01:35:11 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 01:30:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 17:30:35 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Dec 2020 17:30:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 02/11] dt-bindings: net: btusb: change reference file name
Date: Wed, 16 Dec 2020 17:30:03 +0800
Message-ID: <20201216093012.24406-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9746B196A47EC8930E8369463CB93A980E2478B3795A4CD1C9DE7341FC534D662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_043514_614490_80AC0CD3 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay
 Abraham I <kishon@ti.com>, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to usb-device.txt is converted into usb-device.yaml,
so modify reference file names at the same time.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
---
 Documentation/devicetree/bindings/net/btusb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
index b1ad6ee68e90..a9c3f4277f69 100644
--- a/Documentation/devicetree/bindings/net/btusb.txt
+++ b/Documentation/devicetree/bindings/net/btusb.txt
@@ -4,7 +4,7 @@ Generic Bluetooth controller over USB (btusb driver)
 Required properties:
 
   - compatible : should comply with the format "usbVID,PID" specified in
-		 Documentation/devicetree/bindings/usb/usb-device.txt
+		 Documentation/devicetree/bindings/usb/usb-device.yaml
 		 At the time of writing, the only OF supported devices
 		 (more may be added later) are:
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
