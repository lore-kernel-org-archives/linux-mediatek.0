Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9E6C36013
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Mar 2025 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHZQubt93g9flz+cf8eKxXCG1pfT8X6EDn96rb+XNGk=; b=DvaLGTm3eyvfr+wSauEw0X/xPm
	HO5/a2AWUpX0sege/DJGxlNOUvzxbCNppFgiYtU8sJ8j8KuWJBSNbPsJ7w5vBvniyPtxvPPXFy8hl
	x76543lUTlyYDQrZJVCn7HZtKKOwkA7FumJXSTETz1hXSzS8kUK4meg7KAIwiTfDcC5ZjzNVvrP5B
	/IF8QB1xWnMJRtk/tWDxcMT2NOJXAvvXS7I/BuzbPNUOlj0HxGs4BxEroHbNqrcuRW13HR30iuv/I
	GcKaUGMqZZ3mzfEHj05Lzrrsr/oucDWy8stziQmWeLdIpYXIhSmqXo4A1tE8vOMVXSY0VALq17V59
	CnKtwRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4m-0000000GQ4k-3bVR;
	Sun, 30 Mar 2025 17:04:00 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4k-0000000GQ1z-28fj
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Mar 2025 17:03:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06BA32FC992;
	Sun, 30 Mar 2025 19:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354236; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qHZQubt93g9flz+cf8eKxXCG1pfT8X6EDn96rb+XNGk=;
	b=djwo9TLalKWPFeyjbCMXIUYElxqlZR2dYKbX8DHr97Ssgl5G585a9LiPFwg7qZlIAQYrYH
	dUCTWitaVDKwz9/ZS0yQbggLdCDk1lTzI/7UZhz7N2K6G/qRgOiodxxiwjpW26R16D2ld1
	ByIalCe8EX2CmpoLCikJjd2L+l+ZtEaBWV+yWaxpp2zNeECOBEcBb2PNV7HcQmZeXmwy16
	QFVNyQdzlignSG9P7iFgHu2ayuY+RKexc0UOXsueaxp14jVIr+OZVUUNHHDhQYD+h0uVEO
	ARlY2tionybOr19NbUAN2Hdp/D3J2nWWpc0f6WaOod9RCyv6LSMCHjsLr82CmQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 10/10] MAINTAINERS: Add entry for newly added EcoNet platform.
Date: Sun, 30 Mar 2025 17:03:06 +0000
Message-Id: <20250330170306.2584136-11-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_100358_732433_0464BD8D 
X-CRM114-Status: UNSURE (   6.04  )
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
index efee40ea589f..ed5329762584 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8182,6 +8182,18 @@ W:	https://linuxtv.org
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


