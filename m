Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96279C3F2CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 05:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C41246A3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 05:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NWg5b764";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HZd1Q1Jf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C41246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=co4h1u4eNDmO43SGlsKTC3BWFAfX+pdQZx0+LURNYF4=; b=NWg5b764UtiVV8
	uj04GqXixgD1O53+pRECCCMW9zHXPylaJyB2NYKSXYVTes+WRBnsFk1xWewBDo0mIGar9tyBUwrVy
	a0B/nDLsa5ayMg4kfNNDMX+wd7ZhzbANGFPJVjnFR5CkERqXPSEENji/iKNi8WwY5HwgFrBXKOJVo
	8HFikLKeddjZ3b9loDec7CsQcLMB3XXueRdw16UmyWMmJDLfd/SJp/4ySMKJSPtq2qQCmF8x+fdkU
	lVsSl8oM0SmqefpjzYb0S+b8Vz3H3Blg4cp22ZbM2QXzPWOtJ/m2L/A6wDZW0Sb8+lg53BRkXjMnZ
	Qgzo9CAQIUqpcgHhFluQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Y6l-0008Ug-Jv; Fri, 28 Feb 2020 05:22:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Y5x-0007rc-9L; Fri, 28 Feb 2020 05:21:54 +0000
X-UUID: 91fc9f6c3d6b49e89a97718a3b3a6f77-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5KIAJmoTEhesMxKkwMtB3WhawX6q5b9wBfPte+p7ggk=; 
 b=HZd1Q1JfNttJHcoiMumBh4M3tSM+OOdiPOoGOvCXbXvO9iJDtXlL3tYmTGSrKELu8X8B2y2Y+2LoNjQ8galAFGXq7ANmjLvJyKNh+3tImWRh15NMpvDZ4m4SIp3y834E1YvDH7HyJ6djvllt1SMWdedY4M+u/4vYlK9RLN2k/Pc=;
X-UUID: 91fc9f6c3d6b49e89a97718a3b3a6f77-20200227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1291030499; Thu, 27 Feb 2020 21:21:43 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 21:22:51 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 28 Feb 2020 13:20:19 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 28 Feb 2020 13:22:05 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 3/5] dt-bindings: display: mediatek: dpi sample data in
 dual edge support
Date: Fri, 28 Feb 2020 13:21:26 +0800
Message-ID: <20200228052128.82136-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200228052128.82136-1-jitao.shi@mediatek.com>
References: <20200228052128.82136-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E6A35A8FBBBA0DB47C5247E006E296AEBC0EB808C45CC54F3D701B12F8FF21282000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_212153_328801_73117E98 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add property "pclk-sample" to config the dpi sample on falling (0),
rising (1), both falling and rising (2).

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index 77ca32a32399..4eeead1d39db 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -19,7 +19,8 @@ Required properties:
 
 Optional properties:
 - pinctrl-names: Contain "gpiomode" and "dpimode".
-  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
+  pinctrl-names see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
 
 Example:
 
@@ -37,6 +38,7 @@ dpi0: dpi@1401d000 {
 
 	port {
 		dpi0_out: endpoint {
+			pclk-sample = <0>;
 			remote-endpoint = <&hdmi0_in>;
 		};
 	};
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
