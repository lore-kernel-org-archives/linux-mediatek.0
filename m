Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4674EC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 10:53:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128CE20656
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 10:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5FBzmQS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BYdWWas9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128CE20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g16waCeIq98L90/T5BhwcbO+UAzhrstV8nw1IDxQbk4=; b=H5FBzmQSAOGiKqCE+hZxkIasG
	Hui4fn4/pTzGcE5FtCU9BzhB4z4FGjakuvXjbS8re0LnlAXSfIvW/Zp951SvRk4kRKL3ppn1DBe+7
	2Icvd+UJkWPxCLS2detgRQj6rqfte4TjY6PT4mmbBIGodjl7cctvD7OvMx1T6Y+Lo8jYribYGxdDV
	3lOd/qE2mDbi6fWyHCZI++rR3EpOqr6HHz/X6XTu2mIpk1klFyJUZbPT0QqXjHm6iZdG9v2qrkZw2
	R+tFxpQ8iWcu0VPc4ojjOZiEKapoAHpEW8NdGIKsSS0h05+ao65P+bjC98sq9+6r4qGHxh5lr0Fk5
	gsEwDHHSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0NEy-0003EM-Gc; Tue, 28 Jul 2020 10:53:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0NEj-00038Z-6M; Tue, 28 Jul 2020 10:53:34 +0000
X-UUID: 0aa5c07666e0495290f3320b40b0243d-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Dw3IQyGg4pE5zkiPd+QC9P5t/IY8wdV20m7D09enpVw=; 
 b=BYdWWas937HhWp1njwh9n2SWuw5QAD3o+qifB3BAuG9SsYDACF9zbjbwNWarWRH7L5l9lUHGs1gP74qk8ZZVVWZJ8GsCbhCQxX/0UPEkoqI7AtlksaspfSnbI+GPdh16h3Fd15qzkArPxsvKGXC8y9xzM6Zv6jtwAS9s7eRRIxE=;
X-UUID: 0aa5c07666e0495290f3320b40b0243d-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1284874684; Tue, 28 Jul 2020 02:53:35 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 03:43:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 18:43:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 18:43:22 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH 2/3] dt-bindings: watchdog: Add rst-num property
Date: Tue, 28 Jul 2020 18:42:28 +0800
Message-ID: <1595932949-7033-2-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
References: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4AE3E7CC99CCFE9FF0F576862D147629AD17970E556E9E6452DFBA34C0985FE42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_065333_455806_759F1FD0 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add rst-num property and update example

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 4dd36bd..df19a4d 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -18,6 +18,7 @@ Required properties:
 Optional properties:
 - timeout-sec: contains the watchdog timeout in seconds.
 - #reset-cells: Should be 1.
+- rst-num: the number of reset bits in toprgu.
 
 Example:
 
@@ -26,5 +27,6 @@ watchdog: watchdog@10007000 {
 		     "mediatek,mt6589-wdt";
 	reg = <0 0x10007000 0 0x100>;
 	timeout-sec = <10>;
+	rst-num = <23>;
 	#reset-cells = <1>;
 };
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
