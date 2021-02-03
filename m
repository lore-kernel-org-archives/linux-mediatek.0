Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82220C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:33:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205A264DD9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 205A264DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YhYx4H9rZ8XIvArA4TNGEpYbrpPKBcM7OR4H9gvdXZY=; b=ECJ5EV8vVk/wU4fCF4RymCIdAA
	VcldjC6hpACScCoFvwK4/zWwGXAJ8yUIeuDbYW4p9AUZifJ+IvLzZXv4S3vj0kVSF4CDZi5zGrM8J
	/ZBRHBYCYdKKb5yebPYMkAxzKLizeKICjl+myrFzHfv4LIacvdzi8N0DI0oClcrqbsGJx2o5pHjxS
	jmQR+tCp+2LAKNraXLH/KLTRENE9hlKVombZZmvLmAUzsdrv3S3PHkQMeX8qt8CKEdy21YqHhrP87
	MRl4Dk41yxUlXiZwREqarXmXWuw53nmYoNOY2Ku38J27cSHtRzy1Pqbd7mD2YDkXPpwbG4Q2KfS6s
	dl7USR+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Bir-0001vq-8S; Wed, 03 Feb 2021 06:33:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Bio-0001uR-Qi; Wed, 03 Feb 2021 06:33:04 +0000
X-UUID: 254a7467557748dbb877414d46e1b05b-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kvt11SlkOZybA/MDMjfWqmErggnnd9YVI0O6nOjXt5U=; 
 b=VJS20Gp93t4NnDNbcJzF9Tav5kifJc4ySKMI8jARThAvZRxyFIv0wLMOlfvcHzdI7fN9f7B+1XJt3G4AG+pA3Ug8gzuH/0ybw/mwbe+LWuOz1ezOJKPZkwwQ8g7mn8OlRrmrNI/Pr2ivG9fSUA60jhak7cWS48IJs9DS1X3m5Sg=;
X-UUID: 254a7467557748dbb877414d46e1b05b-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1656060507; Tue, 02 Feb 2021 22:32:56 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 22:32:49 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 14:32:45 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Feb 2021 14:32:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Subject: [RFC PATCH 1/3] dt-bindings: usb: mtk-xhci: add compatible for mt8195
Date: Wed, 3 Feb 2021 14:31:57 +0800
Message-ID: <20210203063159.11021-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: DB33ADAD09D7543E95313A04B7A5561973C6E8CA455E17167FA0A7B3AE61E4762000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_013303_060699_7223D63A 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
exclude IP0) have a wrong default SOF/ITP interval which is
calculated from the frame counter clock 24Mhz by default, but
in fact, the frame counter clock is 48Mhz, so we should set
the accurate interval according to 48Mhz. Here add a new compatible
for MT8195, it's also supported in driver. But the first controller
(IP0) has no such issue, we prefer to use generic compatible,
e.g. mt8192's compatible.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
index 42d8814f903a..02cba4212f7d 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
@@ -16,6 +16,7 @@ Required properties:
 	"mediatek,mtk-xhci" compatible string, you need SoC specific ones in
 	addition, one of:
 	- "mediatek,mt8173-xhci"
+	- "mediatek,mt8195-xhci"
  - reg : specifies physical base address and size of the registers
  - reg-names: should be "mac" for xHCI MAC and "ippc" for IP port control
  - interrupts : interrupt used by the controller
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
