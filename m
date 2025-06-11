Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03A2C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 06:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmGTr9Avtp+9E1jrxJpsP4+QY45B/matmjkDOASukCY=; b=FONHUOMFTgL5hL9+3XLiaNmSMj
	hBCQFPF0soYkMNdyAms1e9AoE2/u+eAreRExOcz4Q6ROvyBGZVOUVq6A/oY24il6sylMdb/IMibTz
	L0MY8ODZjGd2ulfiy3YMS2hPvfIv5yJ8u5g7+peGLn+2n7cfWf8ECHWeBQLTL4pxH+ocTpuLyjxOF
	gR1Annz27O1alE8QL0Vbu9YUTjie43HkGJR/uZ32avnLaxrBoYV1Qyl9hrRZFhHeEsJrSSUKpEYn2
	kYFJFKI4LIzsF2z2LKyBr/mE1g4ny8HxQ3t80l0V43m+kRA0qH6VRZLao3zX2B/P/+FlGe2cuMJoF
	3VJIAqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEj6-00000008wPt-2ceN;
	Wed, 11 Jun 2025 06:14:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEj3-00000008wMK-2aXT
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 06:14:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a528e301b0so26318f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 23:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622456; x=1750227256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmGTr9Avtp+9E1jrxJpsP4+QY45B/matmjkDOASukCY=;
        b=bPvzDI03ciiJMi6VJhX28larJgauL0flqN6uAUpx8RlR6Eb0tI6wzaykmIUE1Oz7sl
         BR9WQxlDtuqztvWqjyK4/rSgNAk7wZDTGfl9RvnRWwTidqrxJrLBXSJQ0KYbu6oqEKAf
         DgQoYcQzHvtoj/rw6GgpOfgL6hpGD9SV9DArsM+Q+jYv3nDS+scUJ0uZu97r13nzEO4L
         MbfoKQy5LnqlsQDVbMmsPudGPcO3knou+EVnmnbtKGftknE7Fz3kksxyPcI77C2epUqO
         S53NcLy1ehmbNH6WMrjJqvkbdu0aBiITb+VYCFf1UejJyJmdxmuOu5jcGrQbQKY3GpMC
         ZywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622456; x=1750227256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmGTr9Avtp+9E1jrxJpsP4+QY45B/matmjkDOASukCY=;
        b=YwtvSsyhW8KjA7nDpgyqlU2tIT/jQfwKThjh7x3BQH742hThBWiGMM840OOOXtcfcu
         Eu0qTMA666ixlMj9QXTwgSytnS9gg/nwL63uqGH8Xzo5FQThZQwNspfMPJ/XSkQH+mgN
         Gz0eiDcKOjgMQJHXYPDm0nxv3ogTy6pplSnnQWrdPjUOg977mt2K1kpKevu2CKJTcm+0
         z0GPolD+YDHPYDNYZHp6R9OSKsO1CHOgY+jdD3IAGfkcpYYFJ5P1oy4ERvP3q9oKSLaX
         LVkdjwE4CorDdoK1IPNJ5xMWuK9Mkheaoc71L94KFZ4o0Nsv7u+7O8hanbe+7hiuOThY
         ahdw==
X-Forwarded-Encrypted: i=1; AJvYcCVW/xNobVZIVpInANDSdQ+YgWlE8Qt62/NndJWjDc1yo7Q/UdumG9xy0/YUtMtf56XEupeFK1VdAAVtr2KIDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuhibViFsQJ82MqK4WXJkzuB3UmvWDHUTaaUvPlVBuZoAYeQe2
	nfXoUod3vXvBKsxEeW6pvhweB+h0nTCGREILY4FVNCs4muNUvHDR/se1ZuRe8/KWgZ4=
X-Gm-Gg: ASbGnct/YJ4DQM0V0xmRLMhmxUPpRvtNSD5vaXxCCulU/+b0QAhNO+noNp2WQPr/aHx
	Ibfv8+PH4qwnjIMiUcS4CmSYiIY8e2ciYUgWfsLTDDNxLtQA8YQqWSg/hBcSvsT7M3JDsHZy/X0
	jRCK9YruYCht+WW0uWYkzfjtCX5Pq/DoxYyTprtcPBhFzVeR4rw3Nm9qJoFIB0XD4CmNqOIMRfU
	FGTizWH3+u4s/bb3UtkGl7tADJZOLai3QSLaH2eBPgOCe4u7f6DxInzU9d97OWxXpomnqWY8R0p
	FNmidn+aQ+BuHnzK3fBSQ/UBiHYNdJzAe4JMmIYvQbFWGzws7TCGrNBtPLPDlG44dpJGKozNP7N
	vLB3UDEk=
X-Google-Smtp-Source: AGHT+IGuARTYLyF3UiF9reCUirhd/Exv3gey0a/FHP4hXPUPwwAH7XeVaLmvzmzisoq7vXGGNYY6fw==
X-Received: by 2002:a05:6000:4205:b0:3a3:7be3:d0f3 with SMTP id ffacd0b85a97d-3a558820e34mr451650f8f.14.1749622456103;
        Tue, 10 Jun 2025 23:14:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:34 +0200
Subject: [PATCH v2 02/17] pinctrl: Allow compile testing for K210, TB10X
 and ZYNQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-2-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uGHDfIA31YKh5ahk8efaA6IVYuJLI6m+zDCouPPq644=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6g8xxyHU0HpiCDaPmzEcUGbG3i/Yo/YG0Wn
 7rcaYbUuOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeoAAKCRDBN2bmhouD
 15vZEACL9S/hnI46RCXgnSdsn6o+epweo7vg2Ve0a0tgPgDpJPr9sxin7UVOYpBd9VSMJJQoLLF
 aeqFMhIemW0RcumAWboyA4gfV7dVt4MPt/v++UUEhPUE9TwivxEkN5kMfkB1dRF4+MjSjHDuvGC
 ZPBUhFjQCXOgwCVHKydx8vmuJV0CXug08L0YllTPL8pXovkyewDPdTKqQaFhukVSfPcO9IOAgtx
 M5yXLQe29xMW0Qyyul/SVfUXoGYtMZqzVJ6W6dzSnw0YNlMlEQg2zyirVpJ5F+/OHhCzmyC/8hL
 vY3Rtcjw+MHY8cI42dcQDzeoAKALlg2/hy1crOMdKh8wSr6O6LFk7rAOTcWChL14XAoUvJpX+zd
 r0YhSuMLTab6mVHTRRgnXKL1v2XuGeY/7QwPQxo0jcTZpaoreoReVm+cJ1biQiLJhRB30IaCe1g
 tpwj/e5Occ6qRtXtGh73XlrINYyxw5OzGdzDUiTSx1Bd8fBfKqn1ojFrBZU6c0EfEOEodfM1L3V
 sIrLevCzW4HtOtGrGg1HFUXnHrJ5DdHAsk/NQrAi6Yy0jFf+hLnI1SRhJfuSoGrStvp5Z4M4RDJ
 lCsyjBjzLRgK6m8GXnTUqaoCeXd9zcxJxwOmrrtEsnEGDuREqGFpURGacr7KDtTH88JLMKCC9g1
 C5kgftvilxEQjiA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_231417_666787_B1CFF403 
X-CRM114-Status: GOOD (  10.67  )
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

Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
headers, thus can be compile tested for increased build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index eb1b37af81fb81175d22018cf4856bfafaea75db..9b93a11c5755d5e1b239b34d5d66d5717b281265 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -269,7 +269,8 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN_K210 && OF
+	depends on RISCV && SOC_CANAAN_K210 || COMPILE_TEST
+	depends on OF
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
@@ -554,8 +555,8 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_TB10X
-	bool
-	depends on OF && ARC_PLAT_TB10X
+	bool "Pinctrl for TB10X" if COMPILE_TEST
+	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIOLIB
 
 config PINCTRL_TPS6594
@@ -590,7 +591,7 @@ config PINCTRL_TH1520
 
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
-	depends on ARCH_ZYNQ
+	depends on ARCH_ZYNQ || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	help

-- 
2.45.2


