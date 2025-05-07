Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB44EC3ABCD
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrjxiKt7lKLcOgSH2fhDYWG/J++M1ZtRLxV3n+zZByw=; b=J0s82HmqUCl1Zw/DaPrcbrX2UH
	aeRRyYDbnbgud9WzQPxRpsvwaHk5/8TviRsdKm3B2Hd9vTFUqVUQlG9yuUJM+PQpt8MdMx9JcRXHX
	xgUiGNc5LBsuF2bvktv7gMv78iYMwG/2KjMt25CJ6vNPFpUH2fgHIJGAaAw2MbizY6K4ZVNaO/8Mw
	gYkXhF0RhgQVPPXMxYpVXEN0vwHZ7MF9EjrIVG/IUd4D/+3hVv6s0TjlongEmDIyKUoGLipWNPGMd
	8OPJarYpDfShgOOMmrQKpdkctMHuKX6vSjQXYkh+k2lSv25v4xEppJjH+BwVasCjR7gUIr3O7UU4S
	DpXtRNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfF7-0000000Fep7-3msa;
	Wed, 07 May 2025 13:55:25 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf5Z-0000000Fc4K-0acd
	for linux-mediatek@lists.infradead.org;
	Wed, 07 May 2025 13:45:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A800DCC5F;
	Wed,  7 May 2025 15:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lrjxiKt7lKLcOgSH2fhDYWG/J++M1ZtRLxV3n+zZByw=;
	b=YfrfliAfVwmRInkw0wX0s6Jq9OXbEAZINo2ysDegfPFdv4uK0AqxMe8kfOOXOaLb01U8tc
	ReDRmpGvanRTAOttouvbfsg7nzBGhGKHGOnpVNmXBzVlgyPHl/Na1UvwKcFmmNoX/JsPqD
	i8s1+1RPjxmfCBGfgZBf0OF5vvYst0tr9BQelpz4CuumzyWAkCeBD64gaulNfuSyImHZn4
	dycayg7KB2OIxaryaaygJwefQ/WZRRPUP/95KiCwWwxQrWfiNFlbSf2iEt+70Au7q4AYHp
	luS+TyeK7tIQE8qGVQ7LKpGWgEe1EhEPG546aSysgjsIxF02Z+zdQ58XU5txpg==
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 7/7] MAINTAINERS: Add entry for newly added EcoNet platform.
Date: Wed,  7 May 2025 13:45:00 +0000
Message-Id: <20250507134500.390547-8-cjd@cjdns.fr>
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
References: <20250507134500.390547-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_064533_363405_9F827D92 
X-CRM114-Status: UNSURE (   5.57  )
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


