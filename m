Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475D8C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Apr 2025 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb5rET0brVSsp0jg4oH2Anac6dKr9y457nVDZGrKmSI=; b=HYuEpqfmBBHVIl8Bpn3F/PZ8CA
	8pzqOnAY8Xlu7NYdCDtUtA3RUM/cpgIgTRjnWz7wBcSFjs1/S9UukzkzY035In0wz3UMF2dzDI36U
	XDLRD7o729I7piIVzy84Mcr+mfEt03qp89TcW3TDYW4xMId4p93A6Sp24ZFjAFahDa8uQ4o44m2t6
	Wz7+miHr6IlGYuPkPJ1lPJP/vla7tzYi9R/7D5C5OmEz4Ul/rmx5qGk7YrDA8R3Fd31ATKPH+qGWd
	EMV70BNtPWg1GQD1D1cnfNHoJzQOZeH1XrrSSocp3Ca2xxwAjmkI1blcASg+2kvNNS4h+jce5A5SH
	/h70tMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7cC-0000000D1GX-0Ugr;
	Wed, 30 Apr 2025 13:36:44 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7aU-0000000D11j-3kAG
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Apr 2025 13:35:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6A378F1FF;
	Wed, 30 Apr 2025 15:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020097; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bb5rET0brVSsp0jg4oH2Anac6dKr9y457nVDZGrKmSI=;
	b=hgr9kembuYgr71mIkhMUmW/+Y7uRPlEbThQPAAEGVn2Tuf3VfPqTePdK2Df2q7iZKbxaEX
	HuiHmggkB80JICd/7gaFV0WnXT4ugOpxQHb1CWW2Tlyk5iZP93icg67uuTRUEfjzOhou2F
	+8S7j0qYTZ54shODhuAqQOlHoBsE4y5mxA6yFf2UcwONFlOw9kdRngOz7dsKSv7KR0sk2E
	dlKSMUp2rcYlKNM6KKd+pLzzgoX9OteGVBNkPyk6F0tW3zbdg2ORcYMvfwnFeddH/EnK79
	HJCpCFr102uSaDOj056ec2cfeL9z6p25lgPkYgXegerOIIC/nkVDgdDDQziIxA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 5/7] dt-bindings: vendor-prefixes: Add SmartFiber
Date: Wed, 30 Apr 2025 13:34:31 +0000
Message-Id: <20250430133433.22222-6-cjd@cjdns.fr>
In-Reply-To: <20250430133433.22222-1-cjd@cjdns.fr>
References: <20250430133433.22222-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_063459_103508_8BF4B200 
X-CRM114-Status: UNSURE (   5.47  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..421fd5c2e41c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1396,6 +1396,8 @@ patternProperties:
     description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartfiber,.*":
+    description: ShenZhen Smartfiber Technology Co, Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.39.5


