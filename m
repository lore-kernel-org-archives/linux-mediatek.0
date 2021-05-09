Return-Path: <SRS0=dq3f=KE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F29C433B4
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 374D861026
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 374D861026
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yRxgN5OUEa7EFY/cQ0ib7kTXPK8nZ+WBUX9jKXg8aUc=; b=DYqkAF2KQP/LeXGZE89X2s4Oc
	86y8YI+oXValxyVreBuSsidlzhBGmxI8Co3mlF5Y1Pik31SVs9fbvlLWvai5oxQ8CIbuCPdnF+Fue
	yn9g2qjb9OaCW7YKKYZ1mgWxsb7eTcJQvP+kOLH1caYesobBAwB41ehn/w0ksFmtWjBnid+4gYhHh
	vOGjw10PAMK1a0iQQRn6kJnvtNDZKPK3KPY/4/ZShqB2lxvHx7a4d9biw5UBbAAsXAF5ndnsjbGLM
	XDo4cmzaHI3+GiqXweRF5WE/ocu0XYx/jh2Wtb/fGrpX32hZxWVo/hQKW51snoCbSqymDh6XgL4Nh
	B/xw/6n3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfqpK-00CJfZ-Kg; Sun, 09 May 2021 21:19:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqni-00CJTj-Ui
 for linux-mediatek@desiato.infradead.org; Sun, 09 May 2021 21:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=34VzXed8Kgnel45ijfIuHRVvR2WQNHxzGVweg14wlj8=; b=g/6kfOtv9aaytY104eMTzCHsdy
 KxpY7pyUv58tduJOQcUYA8hSYtThoS4Tq304loZ6j64Q6/3NXRWCum9B6ZsOWsIv1Po/xO6IKOiAi
 a8GHP5H8mZRJzNTBjQexfs5D/uHUjJxrCSrFTkjUXjX5w1HLqfzr0WsEfSdPyp/VDRo6NoSB1PR9b
 6qHQHRr6OQfAKEOc9fnyVxePHYcDnuAinbwqlNFYWe6cPIL4pajCJ2iLIy1qX1aiUh769LsMlezdm
 b77xniUfptWz3Ii0ZgFPsyYQQHNC4REnVSTg2ftPG9GLmzBBbwciKyG1N/tBOpTwX3R+Q0/RDdQKv
 O+NCiL8Q==;
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqne-0087WJ-JC
 for linux-mediatek@lists.infradead.org; Sun, 09 May 2021 21:17:21 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 9BBB16C005F6;
 Mon, 10 May 2021 00:17:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620595029; bh=pb32XrLr2f8ZsH/s6jvd/OiiD3RMHBuJn7UkoYGE4U0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f5Tc3LrWHuTWwJWTQZ0ql8/AwPuSIJK55zIexqTDkGxGJAN/kCiuTv2kpATI956wr
 ExO86Ui+zgHBa9DDxQ8ffWvIiyapq3gtO5OL3WWw1A319kz1i09+SnhzzexbBI/R6A
 0UjE1lsfZKczhRHL14w8rcI/oewzeBnraL5bIHFs=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 7C10D6C00504;
 Mon, 10 May 2021 00:17:09 +0300 (EEST)
Received: from localhost.localdomain (unknown [196.196.216.231])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id B5EB31BE009C;
 Mon, 10 May 2021 00:17:08 +0300 (EEST)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: watchdog: mediatek: add support for
 mt6577 SoC
Date: Mon, 10 May 2021 00:17:01 +0300
Message-Id: <20210509211702.549-3-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210509211702.549-1-arzamas-16@mail.ee>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210509211702.549-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6N1mkZY3ejOlg1i/QnLYGwQ2qTRLX+z5iJm3kEIZgAiJPFvxYip5XRGylGp0RXi8ujwX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210509_141718_818991_BA91981B 
X-CRM114-Status: UNSURE (   7.41  )
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

Add support for Mediatek mt6577 SoC to device tree binding
documentation.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60de829..f5a5404523a3 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible should contain:
 	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
 	"mediatek,mt2712-wdt": for MT2712
+	"mediatek,mt6577-wdt": for MT6577
 	"mediatek,mt6589-wdt": for MT6589
 	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
 	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
