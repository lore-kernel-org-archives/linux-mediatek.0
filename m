Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3341C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3622664E15
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3622664E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EXwtKiSVAVAVGTgPP9iyTRkvLbi36DHLU7LGuAZe5+g=; b=suiawJ/FuRqSYpVHavNbSKGlq
	B38dM/sv6yKIgWx+EdO9mTRd+s/tUqzPnD/7r2lEMNuNsXJzwmY2MyXRDEesJGR+0oAtjgkowciPk
	f4ZtbqpcWy6H2V1dbevmohDKIGGpgbs8M28iEb1wmwP+FrbgJ9Pb/QmH8S5rXyLM14+c3aOzoilJJ
	QTwi+TuxdW65PTPmJRwbaqM8BnMVkK263ocKARIjumnheTt/a8rKxmYfW04DXv2C8Fp4AXe79j5d9
	WsaGt+Hp6XcaIrdSB16FlMWfrcoytHyWBbxjQ9nEmukgfD3OfYMnl2rvjyWhnWSRm9DUBlxHWRiIt
	LSnb42NHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6MPB-0006QG-T9; Sun, 31 Jan 2021 23:45:21 +0000
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6MP9-0006Ph-6d
 for linux-mediatek@lists.infradead.org; Sun, 31 Jan 2021 23:45:20 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 74FF3455628;
 Mon,  1 Feb 2021 01:45:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1612136717; bh=fG1Sn0FuefSJnl7h6oGEFll4/tvlfiI7RwsFgXZJoDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PnSTMPGP8rpwjBiEv/ETVgqeTmY9Lxib2B9qTU+5tnjz9EjUZ2XNl+X5NTHoXgFok
 ubCas5dMEeVYw9sppJeFz9xiajugOPnht/pk+OXjUDM6Q4xgFdYimJojVqQZUlLLV1
 Jyf/jTDGZq3Xw6nKe5Dae+TKHWeMmR6qHcx+enw0=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 496764541A5;
 Mon,  1 Feb 2021 01:45:17 +0200 (EET)
Received: from localhost.localdomain (unknown [165.231.161.4])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 8F65C1BE00BA;
 Mon,  1 Feb 2021 01:45:16 +0200 (EET)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Subject: [PATCH 1/3] dt-bindings: watchdog: mediatek: add support for mt6577
 SoC
Date: Mon,  1 Feb 2021 02:44:23 +0300
Message-Id: <20210131234425.9773-2-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210131234425.9773-1-arzamas-16@mail.ee>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +dBm1NUOBlzQh1+kSn3cDQIzqylVL57ojpKmsm5UmmeDUSOFeE0TUhO2g21wTGK8og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_184519_481409_6B0D8934 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Boris Lysov <arzamas-16@mail.ee>
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
index 4dd36bd3f1ad..7f84ec1b8dc7 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible should contain:
 	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
 	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
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
