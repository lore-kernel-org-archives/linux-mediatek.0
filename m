Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFAAC3ABC0
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIq50VzAPDRvLfqv8bBnT6iyvFUQl6Hp2zh7m8sObPA=; b=tSmOGT3Lw6wsRNqvMtuVBPgP9V
	1/u0OfTRi4XgMbvwvqa2CQ/PoLuryDF+9hAzaqv/EbMzSPx4qWicVGViT5WjKse8fDR+7E73B5T7D
	U3sXh6cgzsvZEkmAEnUNt/N/oIeQQSlsMSGJ7Zf/9NprkJ3fRMI0r6hJMe2wNOUH+8JNswGlFv68N
	ODCEQLFop7QCcMtXrggXTmxPXCE6pwuBdXRAjY1P9FCEuXLIc3hw+fxAF8N3DJNSgEFW1ZFe4j/oN
	BRoXSEMPDVkxCBXyC/rK46VRyO+pJ+6fIw5DYtwYKhap8qcN/7kUC/QNr8i4+0cWtO58YPvaQGfcT
	Jcep4ItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfF6-0000000Fems-2iue;
	Wed, 07 May 2025 13:55:24 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf5V-0000000Fc2x-1in8
	for linux-mediatek@lists.infradead.org;
	Wed, 07 May 2025 13:45:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE9E3DC0BD;
	Wed,  7 May 2025 15:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GIq50VzAPDRvLfqv8bBnT6iyvFUQl6Hp2zh7m8sObPA=;
	b=HtdWb82G5zQkpA68ouf6UH5dh8CDKtDKpSW3/mS+wtaQh4NDizUO1L1EhL0VDwmZGKr9f1
	VXek7LWdJ5bKMWnFJBNcR5ReS8OoN1DoCCX/LZlmYwn8eno7DbcpuJC1slkfnL13Tj4RU9
	CGDOSUKPkk5qGLH7SkBdenVpDDsvkBnSGlQWJuXSYwI6U3n8YBsk2ryUCb6HHmQ6l8vkrH
	iNQbu0I96Vf/wtR0vVkyKadRyczKvxKvrKUirBY1YhlxTrD8WK3fP1uR283QlRb+wkjmu7
	uhwY2T7Oo7sYbLyL9twz1LrebYswzXg4R8fokR9OM9ML7rPk/ILbaDcseqN0VQ==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 5/7] dt-bindings: vendor-prefixes: Add SmartFiber
Date: Wed,  7 May 2025 13:44:58 +0000
Message-Id: <20250507134500.390547-6-cjd@cjdns.fr>
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
References: <20250507134500.390547-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_064529_639468_4A810CB9 
X-CRM114-Status: UNSURE (   5.51  )
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


