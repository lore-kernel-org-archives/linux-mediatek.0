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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E24C433EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:09:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B599B2084D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBuSiUQ2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ngC5TwA4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B599B2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iDWW/8XLt4jsDlykYm9BmwUkwJRireKiiE2CIiYL5tI=; b=HBuSiUQ2Fa0lyEbpb+Lxq8RBs
	uh9eI7T03aaGhbqavfALfv/7BLUOIhRXdP54Z6TgDzskRK3lNdFCnRteb+6OsJRt+5tj2uBphQX0Y
	/+CDAXGydKvg4XqfGgdSJpxyo9s1LxaTOrYv8fY5SCwn0bqzqCjkNL74dOZpGm/TDWW6GTnGZLDPf
	hLvSfE1cg5DngYMEVuqHs9V0KUGjyNSVb23HuWgMgT1DLHKcd0QhVsz22HtAUw2lDfbxAXYcQq5aE
	zCV77U1ruADb5O2giSqQIHoxBNdTpe8f7RfJ4EUa+agzQXaFC4dsFo2dJAqJKe0l3J1/hObT0fMEy
	6t3fYKyBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXE4-0002x5-58; Thu, 23 Jul 2020 09:09:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXDZ-0002hC-2u; Thu, 23 Jul 2020 09:08:46 +0000
X-UUID: 38cdcbf1420140188858921ba68e6a23-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LkLD6rKD+tyfSOxJ/tFfCgfVHNHDHHwbNbevew2fYZ4=; 
 b=ngC5TwA4HhVdyw1bJf6rxGpjd020RJS43zVFi6WoHnD95v8Ew2gwRccN1AqLuhfcnDZOcfbWiO7S0jA17R/6rNmH6UaTvAidD4Qp81EnzReBREgVYEThuJw1Fm1JGe5nKv892KkWicZdpI71RQHIiyqi/I2BqrBR8iP9jHgFBPs=;
X-UUID: 38cdcbf1420140188858921ba68e6a23-20200723
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 692991210; Thu, 23 Jul 2020 01:08:39 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 02:08:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:08:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 17:08:37 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Date: Thu, 23 Jul 2020 17:07:31 +0800
Message-ID: <20200723090731.4482-5-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200723090731.4482-1-seiya.wang@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_050845_322952_4804C386 
X-CRM114-Status: GOOD (  10.66  )
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
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 Crystal Guo <crystal.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Crystal Guo <crystal.guo@mediatek.com>

update mtk-wdt document for MT8192 platform

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 4dd36bd3f1ad..d760ca8a630e 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -12,6 +12,8 @@ Required properties:
 	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
 	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
+	"mediatek,mt8192-wdt": for MT8192
+
 
 - reg : Specifies base physical address and size of the registers.
 
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
