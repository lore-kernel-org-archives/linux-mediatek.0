Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E372C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 10:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=; b=yzVokhDNe+Agu7+1gxEsh7akrl
	9vNC/BcJSD9YR1Nl7YjPOdrKv3odDMfV/LHlFvzRUc1pCxSTOhPgDHwcoGYjhUOssNVFdFrvj5mu9
	gznrGu773I0Oi2UE8qHEhoUMQpEwgNh+ZbHcvxDuhLuAcBvKLgtX3AawRbdpjHlBvlaVFQT+iBcha
	JRxjhOPjFa1jFlhdz7zk4sm2WS8HdEI10z6TsgBlX+5NrjCYiI3qlikhGmEWGtdyZsjUDQxnYNfJ3
	4SgIi76tqigv6zTPQRPcLOQ+GYEG4pWLvkSXpLb2APbG24+llLfbN4okN/8lfvmX9X9Eq+LyrGfuY
	t+ieFCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEFD-0000000CtHA-0hqV;
	Wed, 28 May 2025 10:42:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEu-0000000Cstc-14WU
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:42:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4cfa5c8ddso707334f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428946; x=1749033746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=AVyOQ3zjZXzBXNitxIlEdeAuM4z7uBq+SzSFfuRXB1otiHeVGvODRkHkDVQOlHloFU
         uAIuJrf/2ukzQlORIeR4ZVnu3xP3BBuY6Afh+4TtjSS5ajT4X8fC0Epv8LpMcK85EGsL
         Dai05AF4YFScilY8FjEBfztpbPNZQ3RECeK2uszm37Am2jnvIsOlz/ox9GQZZiBRmjpB
         a6Nv0GnRVIVB6tJDTH4fBKZILH17iBOG4oJwr1pIRJ3m30xwxHdA6ftmz8jd1cP4L5sy
         qpMwIxTEXy4ZzUDSlZDxzNjuX/m7cURe7n0yaljEWwXp4rb4YUQDM5IH8qVSq+lAVTij
         Ybhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428946; x=1749033746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=AsEKMi6SVemoWBveFq/PYcjMr21k4w/lmqr2yKr1HOF2x0wg0KcR+UN4NWLCoai92A
         R7uioGdXnuwxXdLwc7njyHbZuP3nfVcbYG1m+5/IA3dZEyievnpwTjpvfF4sAkeMpICA
         Gs2ddxA4VTzHKp2Q3MlA0TFD8c2vTHyzTpFx23W1pgoe/YQ3Dk/7lTR5XZnHmgR4TAxW
         TFEEYDiL+5uGVticnvJpd/KM/c6rJZPf/yvzPPM9pLD75xVmBhHxiS4XplzGUWvcCIAG
         YFLvOHPZC8+gAiPqrfPandGkd0KwtuDOXBqAzXsiBwWKq5uIDQUzRYkoB/RO4VDA/sgF
         CydQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRKa44T3QeixlnkDczTrnELrLZL/08iAlcHvBQjXDZthqkFYfR79tLLPl4U+h4CmmMLdAoqVzlHnhd7GPwgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyHCEZUYwtYcBJzz0XoccrfLntPrfiQA1zGpBg02qidJglB3Ph
	cO7/sbBIWvPvGMN6OBMM3IaR04Whp3oQWANSER17K8lK7hdDCM7Mqo/B1W8rsK3JPcY=
X-Gm-Gg: ASbGncuu/3yV/SYyfq/KVYHHdihubTaucUXAkATW3ALRHPIFpBYEOLEqLw+yP4YdnHd
	2EP6P+z0WoCTUAuxmjCbLpsLhKBbP4tuh+Pi68ao9V9FqeCaq+UpvXnc1JzyY15FCnpdpPJvW2/
	RYtXAiz2NtKRp0prqoH5o9Abr8dwds6ZR8/74M3SaXb3amp5IadX0FB+FJ3Dx2DaitIktRN+Gtl
	CTjLWBci02fvsBp/lE+vO5/Ikk9N3FxFkJOECAVyB0ihDCzFAzvun4q946aJT4dfRnDOAou1QeG
	uUvSsdHEEXDjlNvL/VPXA8HLjtc6/JqBEaMCjy16/hXCRL08rUbHD1PdfFglcAO4jUZQ6slqgyb
	w6/oFxQ==
X-Google-Smtp-Source: AGHT+IFNlq9KlCXRCQr1+6Ymqq9Ne7A6NiNU48Hh7WmaFcskniRj1xewpQQJ+ro3UTKAzWuWhYjH7g==
X-Received: by 2002:a05:6000:2408:b0:3a4:d0dc:184b with SMTP id ffacd0b85a97d-3a4d0dc1c54mr4702445f8f.6.1748428946040;
        Wed, 28 May 2025 03:42:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:13 +0200
Subject: [PATCH 17/17] rtc: stm32: Constify static 'pinctrl_desc'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-17-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhXAXetqzUvjtim1sn5fQnWeOfKvyrbA0k7X
 0F7r4JYgYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVwAKCRDBN2bmhouD
 1y5gEACCSmP7bayECWKFTkwRKQ26DxhFqjfLlRRjLxFm5/ZteZr52oR68NuAqE5Oteaw0uuTlF0
 AY7psL9i9caogUFyGEHFJLQoNlWHJx87dbPtNhMZbGpsCLwXVf9MNN9NM5+baphXdCKj68+Ffud
 mc+WQUO8p0rqIbRViIvXBJ6gAx6Ilh7Q8yFzuoVIEAV6I9BDpcBgRtB0mqwZfNT1P01nvvfn/HK
 0/jT3G9Vdnpc9i1iTCLhpNp/FZupziVL6jPzDf47eWUlT3HFPpaJJ0tYcLLFl85Bsb82X73rnKM
 UBkCUre2kyXNDYjCNKOoZChLO04ZipNp38cUsCGyMOFi677HtzDsxz1RSX5Rbcbla1EOnS+6Zi6
 wES2PU+vUxe+LvEjmBnfAnsp4Vv47qY8+rU+v+N/7L2UAOT/N9w0X38a93OxUVi8HaJ071gheJB
 QCoBqlVg7+rjFK0nodd/1cYnU618gnyxlmtSWGKEOE1t7M+ApTiup2lOqvjt5YqTWangb8P6mI4
 91zeGot+yAXPL2gIH1Z6qaPZGgJ8qD+xTXRdP2qbVHh+EYSYcb3iCINKLCkSmeAA113O5CegW0f
 2YlveQzrIRHcqQzevdatgXRW8aDA6/KL/GFs07DAXEI2lUdBp+jh/3BAyA2S//my1rkpdfbhzcL
 ONXQAendt+UGD9Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034231_168193_6FF9A0EC 
X-CRM114-Status: GOOD (  12.90  )
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


