Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38FDC369D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Apr 2025 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgYHCHNLZhXHkXFDQAs/9vHqNNNImu0dpU/ViiHu3Sk=; b=uy7SuJfanO8ZCtO7a/cvxozI0a
	uioLHa2RJzqy9olE0BeE7+LxZrfaUJOaFhYroZT5R5yOmUhprvjHnHp/q/9kvXjGKeLpe0ZoyOKyw
	267sG6FWjCSrmhw62IT9VFwQEXcedt5O77snh4A0aIlLSCEvAiPASRKKLiYHH/qmKpXYmSq1QF4Mr
	+YGt2hz4RBsaO+/HFWxAGH0uTOHhvwHzBtoa7WorTASj1PJiUoMtmRYA44vg9PQrw0IHs/fxrXtmr
	yBEEobPhE/EWdpY4TGGUdzYYCtKg0NhIgOOavLIcj0U/WsZMIcXN/bD5DVAGynFULOIiWsV4rPx1M
	hzt28klw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7cC-0000000D1Hj-3qnV;
	Wed, 30 Apr 2025 13:36:44 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7aa-0000000D12r-01ux
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Apr 2025 13:35:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A60FD91928;
	Wed, 30 Apr 2025 15:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020102; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FgYHCHNLZhXHkXFDQAs/9vHqNNNImu0dpU/ViiHu3Sk=;
	b=O1KHwqtzBzVsh4YZgbK6l8bchX+RcA5MVsBWE45rn/FP2Z/x90x07aCMMOQFG2LXPYylIL
	snm+O+KhLnHu5ShUyhoCrTgFElls+9kRdAgrQrJNs2XBzMcHqrucoRpSq+5iVwgJ9wAjTM
	RezYGU1OzDVFdCauZPKdcTFNouhp5KKly9Ac7dN/fJXuod9S+Nj/XY+q5Kwt23MjrjsI5z
	pSIec3Z4MIkVdpW8eh1hbQbAFK0/TGoKooWL4ggTxlUPINNzLsT53ANm+2xoQXkfSn2M9X
	wxsDSG9WhIry64KlEzGGf9O3x+wEFPqfOQUiD9ILuBgsLKtq50hMk57XsyJ+cA==
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
	cjd@cjdns.fr
Subject: [PATCH v4 7/7] MAINTAINERS: Add entry for newly added EcoNet platform.
Date: Wed, 30 Apr 2025 13:34:33 +0000
Message-Id: <20250430133433.22222-8-cjd@cjdns.fr>
In-Reply-To: <20250430133433.22222-1-cjd@cjdns.fr>
References: <20250430133433.22222-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_063504_239494_23EA0511 
X-CRM114-Status: UNSURE (   5.72  )
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

Add a MAINTAINERS entry as part of integration of the EcoNet MIPS platform.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..5b2536150996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8352,6 +8352,18 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/ec100*
 
+ECONET MIPS PLATFORM
+M:	Caleb James DeLisle <cjd@cjdns.fr>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
+F:	Documentation/devicetree/bindings/mips/econet.yaml
+F:	Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
+F:	arch/mips/boot/dts/econet/
+F:	arch/mips/econet/
+F:	drivers/clocksource/timer-econet-en751221.c
+F:	drivers/irqchip/irq-econet-en751221.c
+
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
 L:	ecryptfs@vger.kernel.org
-- 
2.39.5


