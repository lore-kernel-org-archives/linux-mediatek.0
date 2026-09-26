Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A70C98332
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2026 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=; b=Nsf3QnCTzi/aAeLgPBfcieQOeq
	wjmnsJze5MnAfRfjMVOTHvTj8DVcn/uY0e3MziXYcpTCwODOP3e9SHj2d3P4b1d+mIPRyRyA0wnxa
	KfDWr/90zFRGSOKx7NohjwBjCF9WS2+wa/Vlv4RGohQydPEC33cj8DUCLi2BNlA5Eu6I5DadXK+eM
	ox/2dhm8f1urt+SLkXC/wyNOeX5wCTvRKdYNTgnd1SbDc1crraF+tFiSgwaJ74G6skyoqadoSaTT1
	Zw3lkhd1Loef14y8Cn9lFiucKonbbnHxq3paljLD6TKJhMy9ikawlzXHYQPAaWTJ4k45cpes7+QVb
	uLXbCGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQMG-0000000FJLe-1XqR;
	Sat, 26 Sep 2026 11:14:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQMD-0000000FJKl-4ANx
	for linux-mediatek@lists.infradead.org;
	Sat, 26 Sep 2026 11:14:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2caced6038eso10219775ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 26 Sep 2026 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421257; x=1791026057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=;
        b=CJ95c4NfOAou86MumexIftSg0Wm6dndqE9qcsFwNGIa4zjI9e7kq3W6IWIl7RptVem
         zmOt0OboPesLi0kE2ZRR0Z8boyH1vTlnuowpavNHh0JBINLil1nHlBRDxzB1UhLvZXbp
         77ye4eVF1djPKDCKQHDEsRbGdOsoOyCZQWGeCYo60fmjyFDhkQbbJAfuSk2BJRrEDieR
         48P5E1+cToWlQgaPrgSkdvTndYX7cbfdN1Npc0c04iqIkfjDV8iU2qQIlBKWm0o7Vz5I
         Qt7RyoH+A7QiG4O7CMdjQhP+iDc1wRFRmRPQMBVd5x18KZqLUzd1zC0SSBNy92Uxw7kf
         uv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421257; x=1791026057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=;
        b=AMlc2vb5vTUSkErFnuqzFyTAnWKrjVDqGa6GrYVjOXsz1V2eDl77qnX+oyp/+yTT1E
         CIqC3MAsXqC/9ItLadN/Udy9oMlgBU4et5zeHsotjOk9EUe0xyPKzKScVBwLmEfo0qaH
         XD/tmukA/8uUVTMOUumi4nGBRPhSuWkMjVATbe+AYFCFRTTTXmVy1qlp62t6KiTe9ewc
         ZGwyPUdUkMNeQyu4KiolY+KrdEg3L7ukqPYLiLCCqK+62K7oxVlSidQzZ9DjnQFznJOQ
         TslGiEcnjNpu4iZC7fYSGHVo1FBuBvHsF5J5N4GqF8ngfFvE7qu5t0R+vqtcnVfed7DZ
         Enew==
X-Forwarded-Encrypted: i=1; AKwUvBzmHNseXd7PIR/xNk2WD+bnHK0//HwqMD3gyRPPpvzGoAdkdcLcE9vFMOu2UYnaT7nuR6bf9LZSLMrHi3MCkw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLO3z9GPTDBvCMc7mCOvd3kqjGLbZ7I6dxfaqtG2j3DguYYU3+A
	rFzKa2z1bosSl23Ns0gx1xMW2Kz+JZSsQ5h7pUlKwtd64gbzN9K3HExk
X-Gm-Gg: AYBFou2INO/V70bd7tTAbUyY58Aoo4mmBwK2Gp7fkev/PVICaejlb2XbYtjr+bQhz7+
	ZxiRrGRLR/SfZ+jasuzawFPbDJ3lC/a1PDPJEpPsND0dRVBwpDdTqCuOrXWfOPv7gv+ESO8RIPV
	04zigl8+gyney0ORIEi6odPyEi6/cJt0BJzgmSBJ9kBCLXzSk3F8++RtYRuVlsygDkeoixSsbt/
	c+LDTfTifUvTVD3f8pn/1+4v7sbqF+/ZQf2lHwLAvf4t7SKyIF44Dpz/jMDxaRkKhbytLNWbxsO
	QYhbdwEDvwmQnb5gHFQKHW2miBrVvfTJ8VGSCsLbj72hf3ooo+I/LrqhhaCRWoe/9EOMo4JHeri
	Kv++Z9aJepuJkp48ClPTObDm52GFwXrcX2tbeLvX6pHUaJfZEBf9+KrdqHCCloBUhqFR664yuiS
	1m49TpiwRvDHQ5kUz/FDIXNSltkvYyilguwI1+FC4HCGgdsiNg9kdMAoOEOxjcP9UON6n/LVFdC
	DKZKLs83Nskn9NLgxikY1ZkqWol9Yc=
X-Received: by 2002:a17:902:bd47:b0:2df:8f81:e5ad with SMTP id d9443c01a7336-2df8f81e8efmr23449745ad.25.1790421257028;
        Sat, 26 Sep 2026 04:14:17 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:16 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:13:59 +0800
Subject: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU reset
 indices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_041418_062268_9B18BBB3 
X-CRM114-Status: UNSURE (   8.58  )
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

Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
Use their register bit positions as reset IDs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bindings/reset/mt7629-resets.h
index 6bb85734f68d..828919eee298 100644
--- a/include/dt-bindings/reset/mt7629-resets.h
+++ b/include/dt-bindings/reset/mt7629-resets.h
@@ -53,6 +53,15 @@
 #define MT7629_PCIE0_USER_RST			30
 #define MT7629_PCIE0_PIPE_RST			31
 
+/* TOPRGU resets */
+#define MT7629_TOPRGU_INFRA_SW_RST		0
+#define MT7629_TOPRGU_ETHDMA_SW_RST		1
+#define MT7629_TOPRGU_DDRPHY_SW_RST		6
+#define MT7629_TOPRGU_INFRA_AO_SW_RST		8
+#define MT7629_TOPRGU_CONN_SW_RST		9
+#define MT7629_TOPRGU_APMIXED_SW_RST		10
+#define MT7629_TOPRGU_CONN_MCU_SW_RST		12
+
 /* SSUSB Subsystem resets */
 #define MT7629_SSUSB_PHY_PWR_RST		3
 #define MT7629_SSUSB_MAC_PWR_RST		4

-- 
2.55.0


