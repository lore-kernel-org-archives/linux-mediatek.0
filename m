Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E2C55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93E3C21527
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UzTdCBGJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KpNXD8Me"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93E3C21527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nb6ffyCNaFkjxnlEM+kDK7PB8NODzolczdOtzBSnUws=; b=UzTdCBGJEO+6ZpEf/haaXssA5
	WXzJgSf6P6UIRhG3H/4shzkPImBxhJSCs4KVfbnUH+jnEyEVHieykaQC2QTmlB9CN7j3qZGv5DHtZ
	f3mRZe/AJWwRszNJbJ1EGFthDmRwRQu0DzHHrOB20rpU/l2W9QKJMX2DUE1JngPabtqU24/817umJ
	l3i5t1dYhJR/ePFAyxUxcfjanZ0eiBh1LTzgu36skywgsyDQ3aC8ZilfWsL/NAnFcchZlgMcm0tg9
	eX4Keq3mHKJB5tiR5V2hG3NbGOmnSlUmpGPRLe/G77iNinOpRk045Fjgn0VJNDzSBOxA/hWXAWYkQ
	tbcqDqQAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsXi-0001qi-KU; Fri, 23 Oct 2020 08:35:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsXT-0001if-7w; Fri, 23 Oct 2020 08:35:08 +0000
X-UUID: 128b0997d4a24fc7bdecf0b83a88d68a-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hl2C1/KpnGuBDsUTL5EqzX0y7l/0KQjCffhP/cb6JWg=; 
 b=KpNXD8MeQ9PK/0j9az84jIYg9KRYvW2TMJ/5A3qdTrA/ZAl2cEd3A6l1KHkaaK67otGu9AddGTM+gwGY1HRedayyQBhN4x/FZB66v1kPKbpEzwYkWsnWRYSSl7VAesiNt4WxnsiwT3671eDdYmt+VOOFMkT9FiPhERb9Kofj6OE=;
X-UUID: 128b0997d4a24fc7bdecf0b83a88d68a-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1207706088; Fri, 23 Oct 2020 00:35:02 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 01:25:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 16:24:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 16:24:55 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 "Santosh Shilimkar" <ssantosh@kernel.org>, Amit Kucheria
 <amit.kucheria@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, "Dave Gerlach" <d-gerlach@ti.com>, Florian Fainelli
 <f.fainelli@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 2/6] dt-bindings: arm: cpus: Document 'mtk,
 freq-domain' property
Date: Fri, 23 Oct 2020 16:24:49 +0800
Message-ID: <1603441493-18554-3-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 53C7D773113909F92F9C837D2A74572C57D32B39C264274820D612D1E8E54F962000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_043507_527654_8AB634DA 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: hector.yuan@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add devicetree documentation for 'mtk,freq-domain' property specific
to Mediatek CPUs. This property is used to reference the CPUFREQ node
along with the domain id.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 1222bf1..06a6f5b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -255,6 +255,12 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  mtk-freq-domain:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    description:
+      CPUs supporting freq-domain must set their "mtk-freq-domain" property
+      with phandle to a cpufreq_hw node followed by the domain id.
+
   power-domains:
     $ref: '/schemas/types.yaml#/definitions/phandle-array'
     description:
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
