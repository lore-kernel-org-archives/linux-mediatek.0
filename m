Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65A606C161
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=35CzyVn7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAL9ZMRd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=; b=35CzyVn7UB4bkG
	yAEtsEE23J6wne+9DZBKm/A72BhW+68cksYk1zP9OVPXDt08W43GFEsYAg5oP0oBOOXxyCTa6FnqU
	A+UoGFh96BhS0FftyfNbouWKsQuRAHaWgwAXENQi1wFJ+fwXpf5rO0sl/DMokSgT6X16LDmt9SSjx
	wsXZ6/9sALYqriIxl7ZlXYIoqdkpPCk+aCBKeRoQrZNPGDPE4xN5C0XlvI/k7CWHDdcYSMIIpjnFW
	tSgq5u125Ev7SMRA6TfLAt+MG8P76RB8xK0gITJXFUO9ENxEM0GecXXpLiywcpIrzX2iB65pzdHBK
	3HYxOv0lizk5mtLM0pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCva-00000007OCZ-17iZ;
	Wed, 11 Nov 2026 18:20:10 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvV-00000007O87-0Exe
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:06 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-8458555b6a8so1059200a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421204; x=1795026004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=pAL9ZMRdfTC9hc4GMdNllLyoynEHa/YcGoInZXy/sMi7jv+zzLnGDk8LCc+cUoIkRc
         Zqb12VvIF6Itq9eYNMn/UDWSLqOTFzGPAQeC4q3qRzN9rdZUONP5TJ3uQ7dHJoWKAHCR
         0/T5JpLG4AgvIPHfCgk6BM+lTn/H3b9ns+HabdJng2Bt/dBEwFN6RLRUpez5flsOMmxM
         znDs0t3vO5uKy8YioWeFO6jL4yEJcYfsfyeQU4MsCT6++qazM0hNN1vofr9DNy8oUPxi
         jYISo1yXMGPwN5/q1Gpe1IWZ0m5yi8ToGueOBnf9WSP8zv3GTHgjBguG/b2a6q8pIsoY
         yi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421204; x=1795026004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=zQ93n5AzFzeFKUlYb/2cia9xxtfS95n/8DT8048WJ8DlknK/teuoHp3g3FrT/hsO0M
         NwxRJYjpKwgYvSavNVcwxojtnz5yOlcYjftQos/Fn5EXcgI5vX9HUUTK+8VMq4r0ATjt
         7jn2rLJf62t6ED09oE0nCtdt0RXYa/8yYSlz7S7oy7q4ClRunnEhSCIhoxqoZUaV+7Em
         CEYF9OBEH/wh3X6HeBzlTmjILT09Iwa8iX2T7DmDVJQyfHjywBAevR9MWJbdYL4F71lp
         v7DQqppsq8tGilvjdoDVXOd5SI8ryrFdn0DREXvocAcf2/y8sOb7AleHXLR800U5CgAi
         zMGg==
X-Forwarded-Encrypted: i=1; AL+hErFqf9OXzPzMkYyimSZSV9apo8eJ3faW8fKOo0pbEssWxkUR/vDTvJx2iMnw/13Z/D/e2TJIpDqUZAHXcx8TaA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/VZAQoqUX1ziQ9l5YB4LzSw2q8tqDvk4Lq9SEjcVafLcgTHZBJ
	imURlnKUA/U+cQOn4moupbyNHPNiMz2tr4CF5QXHh7S96mgpOyYfJPse
X-Gm-Gg: AYBFou1AGw6HNi+mv4U/n6iMPJUBdXg06oDm7VuJXVwSYG3SVMXkf5N0A+a98mtQZYd
	Xf+le48mvBbTrjl4/9L9slZcIEqh8g/iRBWK/KWwRM1c/T8l4uUoI+fpZUlJ/3SLiUYAQep9ZZ2
	31JC6w5wkR3HI/EvUreyM4pkM9H/ViGEsM+uPJMTxK8eGUmnmTgRWqe3St1gqsXCKASCOFbPet9
	AnYFNw1YgqwX3c2t7k6T/2oFncSgX0R9SX4rvK/z6PvTkqSDnxw+ODrWIj/p9tz2aye9ahqsjKw
	D3lNPhHPdPkGr2Gv5tQdEaT3P1Kp0TagP/77IrQUymdjZZmPCqKSdSic7mC8hBumxJC7vTW3LRV
	ngjwKM/6oD7q/EPmZGo0j1uJ7NZlajB2Ra2Cf4u+MKHiOobeACdzh3siIBT6ghA24plDglxOQtj
	t5nBgUrxB0k9FoOJGSHveYtxDPxQbYGUSamFt55UH9s7eWNxpJI92lU+2rZGjCGmc1P1pVTq3r+
	31eE/yN2FA6Z2iE+LM1KdnhQFoKvx0rd5qb4ugkZ5wNi/Zv2nESlFoUpbb1ZQ9peNu14XY/bHmm
	HsOxZCuFRxzyj5UkrpAXazpELRXE2bB3qEL6/DeqIe3AMVjondMUy0UENFa8LItk8kzaBAp10pz
	XB4zhRWHRa4LPPVEFdfI=
X-Received: by 2002:a05:6830:2e07:b0:81b:864b:7f02 with SMTP id 46e09a7af769-860f25e9047mr4277570a34.2.1794421203737;
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:52 -0600
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8173: Add the keypad
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1040;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XWTgqrmP7rORvhppkX5O4ecuuFFQiKCRGXT4o7Blnls=;
 b=3naZYMrXC7w2FeYZunhhVF3fjUGhFJRhyC1EwGqndsw2Uvt/Vy4tRBxmpspeKTjgLQIaHzQBL
 G+jVqjThFk8AXAHg/aysmbransIpv4bPfqEkl6CtjrE6Nmuidatej3H
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102005_133655_893E6D4C 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT8173's keypad controller is register-compatible with the MT6779's.
Describe it, disabled, for boards to enable with their key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2ecdea33672e..61261fe643ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt8173-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&infracfg CLK_INFRA_KP>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		cec: cec@10013000 {
 			compatible = "mediatek,mt8173-cec";
 			reg = <0 0x10013000 0 0xbc>;

-- 
2.56.0


