Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C90C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:18:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E85D206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dtrr4A10";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UGWzU3Ul"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E85D206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uZ7rGCvewqcAg3IDhHHD19tND3pw4RZGP3rz6+0S0mw=; b=Dtrr4A10mxNHIMFDT78QhVB+Q
	DzqeF6jHe39fjy198l2OPuHDRZgOG4dbYC3GnAgBaraLNoquI7i83fij+BCbNsvffL1HAP2oHhe2r
	Wk9sgd83D92UKTtJN1p2vUkivdRTYkLQaxW5OnE8NJYXaPKxrVw1rrQq3UXg1SuAX5MbPadasfLxc
	VbjxJqki9dy2KvsDCb/T21ap51sGEWgo+uBOw96TTVQ5ti+7IQn9DOAhJNNsy/PtbVotwHczB5/hm
	6sUOOXWgiDcgcZJ2LbbKbft6N0BszEl5E9eiC0Fxyw8bOIbEcHRTqh/6WO9vsJxwaMgFX4TA9k2KC
	P9yeruDEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXNC-0006AH-2v; Thu, 23 Jul 2020 09:18:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXN6-000698-Pj; Thu, 23 Jul 2020 09:18:38 +0000
X-UUID: 6f47fddb0b5243d1aeb9eb68acdf8321-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VUimYVBdlfMRsNpI/7dqGrtRjsY9u4/ZFKxfCAFSY+w=; 
 b=UGWzU3UluTM7atv+uP9wE+OBppf7ISs7wieSDND4N/KnMeMmDnkVfCrCvnQyjzFTgZFGCTssmemwqlC4TmWwWvvTn/xBvGB/+GZIAcbvgDubwr70kdPvo2AfsX7TYPrQuJgrK026UPp+0jEI8YwkjGxXmQymMgS0m8Yrnx//QMA=;
X-UUID: 6f47fddb0b5243d1aeb9eb68acdf8321-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 977939953; Thu, 23 Jul 2020 01:18:30 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 02:08:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 17:08:28 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] dt-bindings: serial: Add compatible for Mediatek MT8192
Date: Thu, 23 Jul 2020 17:07:29 +0800
Message-ID: <20200723090731.4482-3-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200723090731.4482-1-seiya.wang@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_051837_036923_D5A473D7 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, Seiya Wang <seiya.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds dt-binding documentation of uart for Mediatek MT8192 SoC
Platform.

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/serial/mtk-uart.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 3a3b57079f0d..647b5aee86f3 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -19,6 +19,7 @@ Required properties:
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
   * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
+  * "mediatek,mt8192-uart", "mediatek,mt6577-uart" for MT8192 compatible UARTS
   * "mediatek,mt8516-uart" for MT8516 compatible UARTS
   * "mediatek,mt6577-uart" for MT6577 and all of the above
 
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
