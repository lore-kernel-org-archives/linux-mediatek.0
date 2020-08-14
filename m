Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE13C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 06:15:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42F820656
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 06:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LL0An8Fg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g+NWiDZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A42F820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tn4D26wiEKVwPVlPcCqzGv/1lRwkRe3uAtddFkir6V0=; b=LL0An8FggdplQtgq/TIxJ78Ba
	qauWhldEz0byLYDXhm1XgHfZHIs6DPQC3S84wB3OXm/gWBP5LzR0P/TcWm6l+XFAyekY39klpsxrg
	qB7rTJh68wuaTJSbD8+CrJCcU/VSCpjKRfYh+JwOGdGjPoVmH9akWI9Tx9hDdWUW9Q2no4HWI0OYG
	8gYSXJSpj5B8SNRwU5u41GmzseB4pt+iPNtuYk5WYijO0R+bn5/tZY3+e6G/JTMsfkwVu4R+AkqAD
	INKrbmlqrYHtsnEDooPTLoc28vBEtBiCLzGDgMOc+Wsc7HPhbI1P7ceQ4iuPzo+mKUw43QNLzJmUr
	xSl4sqUng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6T0B-00021T-Bs; Fri, 14 Aug 2020 06:15:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6T07-00020L-8o; Fri, 14 Aug 2020 06:15:40 +0000
X-UUID: 96f14123033745f5b3da8b5455befdc2-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qLDakBeiLbmANdjXt3bA+JvN+jwjGyd1xiqJb9UZTck=; 
 b=g+NWiDZWCs/Mz4mGt6HsgaM2T2rsrU+ACfqB+tClVN4f/B+BxZOjVjvwB8KSjM460l8mHUPn1/XtcYRgoo3VukDtHfLsHwkMRoQD1cyqzbqsqCX5Z32edXuygOacsKJ7mYqNpo5rOevGRVD36X6JjTaV8JRXHt7lPy2Z2vtocks=;
X-UUID: 96f14123033745f5b3da8b5455befdc2-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 915491179; Thu, 13 Aug 2020 22:15:36 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 23:05:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 14:05:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Aug 2020 14:05:27 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 3/3] dt-bindings: timer: Add compatible for Mediatek MT8192
Date: Fri, 14 Aug 2020 14:04:54 +0800
Message-ID: <20200814060454.32200-4-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200814060454.32200-1-seiya.wang@mediatek.com>
References: <20200814060454.32200-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_021539_545569_DE89382D 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds dt-binding documentation of timer for Mediatek MT8192 SoC
Platform.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 0d256486f886..690a9c0966ac 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -22,6 +22,7 @@ Required properties:
 
 	For those SoCs that use SYST
 	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
+	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
 	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
 	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
 
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
