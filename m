Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E0606A327
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QKZj4LeD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfN1xX9k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4KBHPFKj2qwMwwc1Q5EeyKyjx5sRcICnCsSXsgsl/EE=; b=QKZj4LeDbBD/bHBWIxk0DXvoO2
	BRTUnGwCnBT0Dd2zwW3cSliR1o3IpQZ7J21g7m+PzUkh6Acs8zcJBaoKpK9ZnelpEvEJtfa62YCLJ
	hWb31GIFKPo7IL7Md7K5IvOE8yjicKv1FnMop70oHTwPBwsLdRNevTlqj4vvF2Xy3jzutuLIOOz6e
	bxSo6faKRGnkzbmFpPJvKJXNPaTkN1Xn/r4bIkxd5ixXbFPooq/xcxjWaJRuU12ytIE1V5xje98nS
	U3naUHZ/e9k0WjpA1efOtQrXZw/+NEM3xlqUNLcYeDqKpWoCUfC4UEyNjeE1uQQ2YLYAHD9O/gyrs
	o4tqVj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYmx-0000000DBAf-10YO;
	Thu, 26 Nov 2026 12:41:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYmv-0000000DBAI-33c6;
	Thu, 26 Nov 2026 12:41:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03D8261D28;
	Thu, 26 Nov 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795696880;
	b=0giCUYlg4+PRXuKfluGu/SL+E+qi14URCwSFc+H1PJNkevCfTwe5XRD38F7VwcmIgM6y
	 S1z1oN3tzSN7AHmidxBx7PcOJRP4ICCrp7RvhasKDfao47CgsUF0CzanNpd5XtS0pWOR4
	 cUteVzTRb5/x4mDbTKmHaOlE622v6JdYWLTZAusYSxzRr04Re4WMJyxQpKRcbPkRpW1IM
	 IlW1A/wAaMRHKt44tOL1XzK8OLliY7XNrXqnOCN1irHfq/Bb+U5XZpsZ5moSEOlax3/dD
	 NbhnNrBFK9vEqE5C2yxYxkP85fAn8+Ia4v7U3gBJA7KKsfsvR1qE5zptun9H4z2ZDTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795696880;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4KBHPFKj2qwMwwc1Q5EeyKyjx5sRcICnCsSXsgsl/EE=;
	b=JFhwhBVW64vefDob9oI9CwcwEtKTBuiABfeZ/Y9b/ObTBtLiaSI2VYJ7vJ1E6tJlJjWu
	 Q9C+GIr64cwLA4XoAcdyAkQOv7YOoFn/EixiX99ULIxKzdmEgHKtpZvgxRdmme+ERpBiP
	 u9kuYOu1KnhCZqSn3yg91fIOnGp2qnJbCn6XlnBlLTaJSwX/IbBbx5nniTmIknvzw4wmi
	 Ejdkfu2x05BMrfBE2AvjXTrZ1eii1XRGb1fQkOxWQHjE53LIdjhGKFCB9HepebDCtrnXu
	 75wNT91jcik5dtx/t7Eb/d1pc2wRh64n7ag38a+WHLmZMuRJkADpJ+8W30eEAzG5NUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 515B91F000C0;
	Thu, 26 Nov 2026 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696880;
	bh=4KBHPFKj2qwMwwc1Q5EeyKyjx5sRcICnCsSXsgsl/EE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PfN1xX9kd5AqWKofZh8IYqxlbUTacqnGLFw1493G/odWB2yawRI3jvJI6Ej4zxbAF
	 5LaZELBYfcsJQAE8jXTF2uzMsIugkP63jMzs8agCkJ20zJMo4oI9be+3aqywq5Al0D
	 YfnjuwC2rmUp3URdLqIaHDlPIaFJ0EIFihpWaFWnf+Ltudm/1XqQWYEH7OaRUZL0P4
	 eHnOBsaWym7TmzhmbtpHpf+u7/W1Lk1h1ab/umRoCPLYHcEWSH/1/pQ+mF9wIJcRlr
	 /zjj85Srj9+u/slWUe3VxNUq6DeButiVDFp8aGvrqrylCmHKYsMOrgreLIuRABVOxo
	 UfFMtJXsE/sIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 99CD64D4CC;
	Thu, 26 Nov 2026 12:41:16 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:39:55 +0200
Subject: [PATCH 2/8] dt-bindings: serial: mediatek,uart: add mt6768
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-6768-init-v1-2-abc364a2447e@protonmail.com>
References: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
In-Reply-To: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795696875; l=876;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=E3ForiWHUX2QUXzzHv/US4eQykht5PXx8WEv7OuTHPM=;
 b=t+TAPIl29ebfaMD+EKRgGeR2Otx1pnk2948kk4fZJ5YjA3NtG6E6FVSNFQBKjzT62Vtu95jC3
 cMizYbY5L5YBYF2g3deQVFwO7mOVPdyY3k/c64IUaWPRY21vVaKdWrE
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6768 UART that is compatible with the
mt6577.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..1ef0629c6015 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt6589-uart
               - mediatek,mt6755-uart
               - mediatek,mt6765-uart
+              - mediatek,mt6768-uart
               - mediatek,mt6779-uart
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart

-- 
2.56.1



