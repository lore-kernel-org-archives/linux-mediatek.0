Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1F606A330
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oN30DPF2;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gfEnwJOs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/4jBQf+2hS3DAsRaFcqGX6vFD+jXw9epZKaxG7T7JiI=; b=oN30DPF2Z0WKHt
	ALJd8ksbE8K3b+AAqxId1a9q72VOVTcDt7koi0ukLTyEMDMFXQb6vzOVFeccF1tBsMnApMPRHvnKd
	+jxsIrwRdSWoGVZoVyLFxhnW6K1Snbk5bXgEC07misRh1EYy7mUtzYq5rTBW+CFBGVtK1cWiQ7H2h
	xYgqaeL20ANnsKOgTEl7gWR81g8ApVhCqdCXFV/nCoLlEsTXptKxmJgFRM4+ZWa9W+TdXxobK/p0N
	4+8ZA9hu270vl71T+ASiegHkR96cila9os4NLV1GSBlw9aY1vYSlkXFeeK/nLASgQMQz44Iwfh8oA
	j5wl0mp4C4d59mRnp0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQtd-00000009KAO-018g;
	Thu, 12 Nov 2026 09:15:05 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQta-00000009K7e-05Lb
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 09:15:03 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-15dd124bbe7so6375074c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 01:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794474901; x=1795079701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4jBQf+2hS3DAsRaFcqGX6vFD+jXw9epZKaxG7T7JiI=;
        b=gfEnwJOsPAuKFiYCj0SzF2/Ini7HZLchW5DcSyrBzkjoZYI7V5Vc3CddxqxddSoVB3
         bl4GTImeI2kyaQ8+6C+RCO1C55XbnAEjsVRtbB5xesyo2IhmZXQVF8CiPE5MHujSksEv
         EJrZpB+rdwJzS0x6JEdx/+U0wcJu4ura/7+e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474901; x=1795079701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4jBQf+2hS3DAsRaFcqGX6vFD+jXw9epZKaxG7T7JiI=;
        b=PYkPH0ZAcjm7cKwjHF1s2SC0tqOfOf5ABdjNOJQZL6Ef0eYu3OLP9qs2OMphdeOvhR
         5L/Szjc2dl9QR5qpLPmZb1MMiXB3DFXgqJTE6grLJMXmMGkOQnqej1RhtAYSb4EyYHX/
         fgvJ+E94AXMYIQZ9XQC9WfCwMNM1V/28ts3yR+lKRPbB1IIFV5d2WtIcOBAsBldYRopH
         5mk0qVvhXgpUnYtQBsmjxN/dP6jjJV91t9t28oZ+pM4iQhfOa3YSKKfx6sMjClS+bxy/
         VueMAVC9XqzDKrG+AZ5QLAEi8AO/5nWzNtdNTwjbJXcFptz8gEmRDmBqtnjvTryPThD7
         xCxQ==
X-Forwarded-Encrypted: i=1; AL+hErEQgX97e8QeHvoaSibnwegA4d4e0Pq9GUekKVB6AefRhuPmiCoMJBSmjms25z07RWC8viglWRc0x5Sb2VyKyQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ICI4ANAi+JT4SnOo6tRFLpwwwuwBIWs+KaCuFB9aOXkZmawgK
	zvC6YJuSPqg7sS0vNWnyC2hyEGIwmonkJ+bD4XOBUlNErLNYHUjHnZ6L4qI32qzLTg==
X-Gm-Gg: AYBFou1e4hhU2MF3926fRUqi0JtRJ3LClhwJIquUUU/RA67Y8kHgkSm+q25Y7YNAx4t
	z5yvOqyIALxB7akP2Xp4JuF0WfAiMJAS9el9FfOwzYo3lU3rAoMEh+g/R17ot5barSyD70aYSdz
	FWA2znt0q3BzixP7bw8zWO0k0nqd64/NKft8IT61YvP6DovtCKypNWRrS8yBR/SJEmFTD4l/d3o
	QBD4tKUlfvgXdPeSNh/0ZzF8M0mwuloiMsZD+poDdPkbB1hxG09Ao1Fn8s1RcqNkneXiVl1LYmW
	gRkVQuYcJMbkCRa6bW/TIlSZupJYF5tNxzEzrwKS0buJC/ONNHVK0oUdgUFoid5CuEVMHYI4WYK
	P+mxnDTWTxAns/3r0xiPELmo6IeiqAOxUdecef71JMhQHFEX0Ov/ghDenrUu+2ywwvYearHawg9
	IqNmtHzKxSD8XAbb+3poUii7qydz0XJvoCzLcVjrVhv8iJ9SE82A+C4INIb4MkBsSX1ampQSFLY
	ksfSU8NrRZ7Kmo7Y1RU84gGign2i/oT9QLEOLH5q8fYlGt2CDMSPLBKt5lxkwuqYCplmKLEdgII
	KE3BFKkv27IL055gHOJ/KLxLFYKoskaXgKCKPVWcFZWT2IzQ7mX6C20Uhp2y2Iak00yO+G8wfG7
	CGW0aOA==
X-Received: by 2002:a05:701b:4510:20b0:151:2e62:fe5b with SMTP id a92af1059eb24-1b3c0304105mr4870294c88.22.1794474901309;
        Thu, 12 Nov 2026 01:15:01 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:3df7:8811:7670:7b44])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3b5b2fc09sm48205792c88.10.2026.11.12.01.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:15:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8390-grinn-genio-sbc: Fix Microchip USB2513 compatible
Date: Thu, 12 Nov 2026 17:14:47 +0800
Message-ID: <20261112091448.869620-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112091448.869620-1-wenst@chromium.org>
References: <20261112091448.869620-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_011502_100150_B45D52AD 
X-CRM114-Status: GOOD (  18.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When modeled as a USB device on the USB bus, the USB device's compatible
must follow the pattern described in the USB device binding,
usb-device.yaml.

The Microchip USB251x family of USB 2.0 hubs has two bindings, one is
for I2C connected and standalone platform device (usb251xb.yaml) and one
is for USB device (microchip,usb2514.yaml).

Since the hub in this device tree is hanging off a USB host controller,
switch over to the USB device binding's compatible.

Fixes: f4d1eace54f7 ("arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
IMO the standalone platform device variant should be deprecated. If the
device has the hub standalone without a configuration interface
connected to the main SoC, then it should just be a child USB device.

And the platform variant hanging off the USB bus probably never worked
on Linux, because the USB subsystem won't instantiate platform devices
outside the coverage of the onboard devices driver. USB worked fine
because the supply is always on, and there is no reset GPIO. But folks
really should check if a platform device was created and if the USB
device has a device node attached.

OTOH, the USB side of the onboard device driver is missing the PIDs
for the 2-port and 3-port variants, i.e. PID 2512 and 2513. Not fatal
since there isn't actually anything controllable.
---
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 7a31cf6f27db..b69fb599ad53 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -470,7 +470,7 @@ &xhci2 {
 	status = "okay";
 
 	hub@1 {
-		compatible = "microchip,usb2513bi";
+		compatible = "usb424,2513", "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&reg_fixed_3v3>;
 	};
-- 
2.56.0.567.gdb80ae8cd5-goog


