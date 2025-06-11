Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F719C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=; b=09JdRAbN/Lse8vGZRydPymrDLV
	8eDjpkQQp/4wpdkpyPlumM+7czsZB8VBkRgiQgoBZ8ufHCfJTkr0y8u+RkrhE6Ev9V2MpV8xga00P
	tJqE7gJWcgjAayFQg/oI6nhBIpO+stB+SAaZoJKaRa8ZT5u1qBm2PkWmC+rOyF0HiZyiwLHBi5/Sc
	4ErXDBsEKZhlKGflUNXMhuhSy1GzL4pWbde761plUG/u0F761k1jCBoA1H68ia5UkyenxRCr/8qmI
	HxZ459VPh7z+6UqzZ+PediWPp8+6PJtu3p9f34qZWOEP0pOOI/dxIx/BslIZUADuT7afar+hdOcge
	geFoVaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFog-000000095ZF-44MB;
	Wed, 11 Jun 2025 07:24:10 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjw-00000008xLd-0cNc
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 06:15:13 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e62619afso22996f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 23:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622510; x=1750227310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=KZFdIrru004Br/L58wCfrSyFbiOk3CpANEALxKnLMf4M5PgRBYLrpa/0mQtgLIm3bq
         sAZguOoX1xAZH9lOE6vHnkcTfBBTCEPINlGDLP9qFBU29TR7cvHavRmAVbBS7MdI9Ec/
         Ds/0cnH99MT8AKGdf0Al7iEioDI74Sgh5LyQTHaB/denmYCFQl9iI8aAaMt4UFraYLxi
         wO9hIl0wCV855EhpOxFbnK2ASHl7xyIMjJwuWYXogqtn+Rdh6YkFe6JjqwgOWALDnRvq
         euRhf77LkFYMKirKh6qYvnWTF+gEZmmPufQHj755MXLEoQVEtpYdxWkSdWp+IHwZH/TK
         4yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622510; x=1750227310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=Xidw90ZIam7XGPuLTEDV1/DGRKUIUg9rMR823yblQ79eUkiNKVpl7ThyO6MwBpHmWE
         lWBvdRcNghnNuirIlRJ+syBByF7QxkE9mt1a99Jl2cyFZssHlnteeRrqO43nciT0+F7g
         yBecmYDKQm7/I5Ugle+hB8OV8fU72ZFhJBjSrkqmkbXJEsoi+3m1Gu8reqdHG9gGP1W4
         UdFFTezOmWJP44PEALZBU+P1HL+VKdnpSKeVS08SZUn6jGSrtZX2TP7QjURrOTNdRMsy
         Bo/7a4oAwFi8al4YZ9BSDO9JYKce5nzq1491zQPSGvSUx6jN31kLXuwLAVRXjZ4X+d4p
         d26g==
X-Forwarded-Encrypted: i=1; AJvYcCUhEvkOVae9Z2hFwYcDP5GJIIICUznyTUiXYvnojQPAUzondd8JQSFFrya6HlNRRo/X+DEzWc8vg9fgBQQt4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZioM+TZaqVkWs/Prm9gPfS98feFs84RmqvKdlGGDFOaLqaTtN
	2cANtbxfEl+ZJ3SHN89Arh/qm6UnDJek6bPPAtGrczENsffVqn2QxeoPXG7mdlN4ky0=
X-Gm-Gg: ASbGncu0L2sgn5OjSwkgRRcupTr7wGNR3T/GFDUOw+7N1aTb+tImjeFs8CVAkviqHNm
	d9jw33UBUqQAr9D/oQjIVqEYnvNwprKrB+WGUVADmHvmS2Uqpq6kjTc4G8XTPp+GuRprh0Lyxm6
	S8wZQki8pHiRHbLsYFeDXiYUhDtNUwPeGHsXISZpTdbUHwQ6ctM0RAw92CmhbDrHiDMNOsoQAWU
	hBEoelTldr8Zuva6FHkZt3tGtlCDt0ddkU4KEV47OfmO1ioMQpquo0/LCsaf0Tf/YVREKd8uFb5
	QGn/oKe27QBduYx5xXpQIXtkQAgKAQwBmtzj/4eM3iVzmnouW7F8JOPy3PqciS5BgLC0wlkKhwX
	SP6flE8L2dV9fYJr8Rw==
X-Google-Smtp-Source: AGHT+IE7ZMpyUDf4YrNSUvsjoRE3vjRVPb6bVXPGoeL9ls3/WZGat0okcbwks4ptZKut2a4VQEsADA==
X-Received: by 2002:a05:6000:18a5:b0:3a4:e667:923d with SMTP id ffacd0b85a97d-3a5586cbaafmr541720f8f.7.1749622510208;
        Tue, 10 Jun 2025 23:15:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:15:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:49 +0200
Subject: [PATCH v2 17/17] rtc: stm32: Constify static 'pinctrl_desc'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-17-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6t5SafcpPp5dX+SCVOeGb2hFRBkfuLb14pw
 s7c8HNmfV+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkerQAKCRDBN2bmhouD
 11knD/9M3DV/vwXFJpNByYjPAAfPbQYiYkwFNYQHUnPzXNhKs/vugtZWoOplA3JWYFVV83HKQP7
 uw3WamLIyTbIQRBTc1s5kYotDILFcXtEuSZn9ut+zGmEtrMVigSPDvqgokfS+ZQSs6dQPF5ZJv7
 +aqYtV+yIAgCJ5de6A8vYZsWp6UYmn51U4Y4R/OX8UM6fxzj+bbMuXr73AsweooW/WYTwxs0tGQ
 u8J/Ig7SVBkSMfYTdGAi2fabtexF7dXOeVyVlmbn9PdktSW/PsChHgaxt74g8YGyq8RAVS7G3oy
 Wb5YIe+nXI8oxp2pRHHcp/1xme8/Dq/OHlHDjYlqltkPGqKUpbDCTqOMbfwl+oqk832IU9YSTYE
 6qMWelzKCzuphqYOP+gk02SE2WKQ5xuQ3kLSCC2YtcSwoP3/V85G4qFLQm2dXZHHW1lAjFiMdL4
 k6iyeo+At8cXPMKvUYLbuCfzKzXpCJ1F45XL0v4mlYrRtXqlWYkAdPq93S3x5jij462AEvNwTz4
 G6DrpD8SbLh/EnkF2C3h7fpu++EsQsj3fXVaN5uHzzibtagMfWEF/xN9Li05E8PYsIhiqmrijA/
 blAWty+7bSqiSP1NbqhzH0zmIcCtAbAzmN9j6DHNVcQq5mzCAKwkNBKtxMNJ2suuFDzyHqWvfGI
 a63Jhr46asoT94w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_231512_196734_5D6B204D 
X-CRM114-Status: GOOD (  13.07  )
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

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch depends on this series - const in pinctrl core. Please ack and
this should go via pinctrl tree.
---
 drivers/rtc/rtc-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index ef8fb88aab48a0edad19ae5872421815aa04fe46..d4ebf3eb54aa9e91c8e9f8254f571c53794192fd 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -393,7 +393,7 @@ static const struct pinmux_ops stm32_rtc_pinmux_ops = {
 	.strict			= true,
 };
 
-static struct pinctrl_desc stm32_rtc_pdesc = {
+static const struct pinctrl_desc stm32_rtc_pdesc = {
 	.name = DRIVER_NAME,
 	.pins = stm32_rtc_pinctrl_pins,
 	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),

-- 
2.45.2


