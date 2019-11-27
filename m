Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC74C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 14:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385B72064B
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 14:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CafXK/7K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uRMQFQup"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385B72064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHxcmE+0DARDWHEU3H9FqupAVPbpYtVCbHocqnf5nuc=; b=CafXK/7KBcREfs
	nO9HZqmKacONTsGvr8h5sMQj1Vp5JGS4hyg5x8tmgilvs4fZ7/6qaHZ9Z33wUytScFatw4Mqe0HXm
	l+bMqxzy1GCgD3SvCC89K9VlRhojs4xhPYamBZVimFaoqnRWt6qE9VbdyU9RFDr9Ve3ARjNRIePHB
	rdaKJVVByn4htQfuk+KR6SMc4RFeCcFmUFBe+feKvw1qTlgXFRKfWMO4Ysi67Te3kqw0o2CVALLpk
	iQoA0u5NFqPiBrqJssTkTvrBvo9lJcd/jIUCpUvx15HdGFU1VLjp+9YhzxfOQ7SSr1Si3J7t2stcG
	TJcEYOt3HC1y8xmT7zzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZyEl-00082c-DE; Wed, 27 Nov 2019 14:24:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZyDv-0007Fx-Au; Wed, 27 Nov 2019 14:23:20 +0000
X-UUID: 740cbe5c503c45609c4aeb9f70f66c48-20191127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cF2Om7X85XQimoGPg+VUY4Aqoy6qnXHiU7JTF0y3r6E=; 
 b=uRMQFQupvqFkrThMzspsv6IPiZ3M81H8L2EF9Xd9zrcWL2OgcFJOI0Rs5SUYEyO4u5mQmxYO/hbNqmcEBbFPuAZO1e8uRIBppL+vVHi6Ah0QxqwhdcxUO++yxn2PEYEKLMaUqcaI0xy16LJ/NGUv/7rPJOh5sjtu4GYhvt7BTXw=;
X-UUID: 740cbe5c503c45609c4aeb9f70f66c48-20191127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1667908637; Wed, 27 Nov 2019 06:23:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 06:23:24 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 22:23:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 27 Nov 2019 22:23:03 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v5 2/3] dt-bindings: rng: add bindings for MediaTek ARMv8 SoCs
Date: Wed, 27 Nov 2019 22:22:57 +0800
Message-ID: <1574864578-467-3-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
References: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_062319_373767_D2A1FF60 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Crystal Guo <Crystal.Guo@mediatek.com>,
 linux-crypto@vger.kernel.org, Neal Liu <neal.liu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the binding used by the MediaTek ARMv8 SoCs random
number generator with TrustZone enabled.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 .../bindings/arm/firmware/mediatek,mtk-sec-rng.txt |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/firmware/mediatek,mtk-sec-rng.txt

diff --git a/Documentation/devicetree/bindings/arm/firmware/mediatek,mtk-sec-rng.txt b/Documentation/devicetree/bindings/arm/firmware/mediatek,mtk-sec-rng.txt
new file mode 100644
index 0000000..741fcdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/firmware/mediatek,mtk-sec-rng.txt
@@ -0,0 +1,18 @@
+MediaTek random number generator with TrustZone enabled
+
+Required properties:
+- compatible       : Should contain "mediatek,mtk-sec-rng"
+
+- method           : The method of calling Arm Trusted Firmware. Permitted
+		     values are:
+
+		     "smc" : SMC #0, with the register assignments specified
+		     in this binding.
+
+Example:
+	firmware {
+		hwrng {
+			compatible = "mediatek,mtk-sec-rng";
+			methods = "smc";
+		};
+	};
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
