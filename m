Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01262C55174
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d3K5hA7CaLdIJbg5AimV7fCZLWk9OkFDdwcvRXHBYow=; b=RiguhM4IKuIRfirs8qe9APC9Xn
	4usQirW7iV2o46oRl13n19yyaJN5t0tVGeGV80Be82UAGzLh8XnBbUfMBM8PIgB5h1p92ZzUHhmgJ
	e11MdOahJ1BmzPatCoz7axezjAW2uVnONjG4ugO2Ivp1/sWOsfDrbCkGXeZXuLKRNMLH4Ypn171cq
	4th56Av75pKRp9VtxM8FXILmCRnJvO3V6WGKTbRjtscGrbHSfzsvU+6HzaTP4arV6YB9ghfzHfA/J
	BRonpGeCn6ZhORFRzGcj6xcAIx6vFRJ7H0dlZWuJi5utcr/3iR9X3dEiuTeML4wzIWMI8KHkR5XsD
	rA/PVQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXCG-00000003XrD-3EnI;
	Wed, 05 Aug 2026 08:41:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXCE-00000003Xqc-1BmN
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 08:41:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f703a9d05so437345f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2026 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785919312; x=1786524112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3K5hA7CaLdIJbg5AimV7fCZLWk9OkFDdwcvRXHBYow=;
        b=WmnMsJ8xH4yOJO6jq+Comiga/+puV5Xu0Kc5dCD1HjYNmZSOobtTJqcRkwQXVtjjJS
         CSlVuQJnPBqt8iA4rRWusvxc0nZDHD5nT+XtHco0sgT+hMPlUf/mlX60YD6Io03hgwxs
         YV0QjAF+Dmf/wV7HQOdD/RhED7FY7ToHdE79REhu5U3/wqyyydbIbD84z+EdD9bK5YXL
         4J2Rdx3iooeunpt55I8hl1QqVzyHIeEFwnwzzWrMU6I3fv1rQ32ZcmqeZEuviv2BPRaj
         indtg7llQQ0AF8Q38Dzjyqx5OPfUFePSY6BAMGG2WpRCmiWUFtuUvSR+qIRkPZvwP9zw
         qlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919312; x=1786524112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3K5hA7CaLdIJbg5AimV7fCZLWk9OkFDdwcvRXHBYow=;
        b=AogWGduz1RWpZ+rE/L0sm7ky0QSZ0vpHfJ/UKdPTcjfuHMElrrSiQxg3urxwSPNmll
         C5um1ggUOQ5I6U6yqPmlX3aWiTswZI+pUZZde+Q3uBsbTFiim5qzSIjwbCMCIwPtK0ng
         qZ6y4PNklz0KqVjiG4Qqf/ex2r4kdo3E1NPVVk5Cx/rhbAyLdZWhA94tcLISL5gPunPR
         2TcCJf+xFg/hOfnT9B5S664IoB8thuN7kPwQHRpTBy4CXjKiovnI5tnw7qhGa/bpHSNz
         yTCsRNERU3cMq3GuTDnIaz3k7nkmlsHkwfkuyNavxRM54Z4OoUc5m8WNUIqN+XmqxFKS
         hN7w==
X-Forwarded-Encrypted: i=1; AHgh+RrpV3wwbmM8l0QwhQPzmuGkTtnEoW/M5QlMFg1TvJ5rzSkUzyDfKZdIAv/alL//cU32M3Yb0wL0Q/+HIkFaPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFBVhDYQDxOiFR6ngGmeW7xV9UWYMai+zoNn5Z3ztAHeZ8x52p
	hPlx7bPcqJJbHa/ejYS1S0fcc83etzGVEJtlmN2aCvf1FJASt5VUg+Eh
X-Gm-Gg: AR+sD126VK4eWm5/qfGQNfsM37L78eRyEqUYGX0KioENnew2EsPqc7SiSrufSzOmXgr
	CWBQMeBCa6WNS10RgDY/EukSf736EshjOaBx3v6YJZhuHQCOp0/D7rPT2FoYN+WveQiEiaRzOTN
	mXRGwJrSY2q2k3lmx/un8T6YX6zNBWgklfKHNFnKmCbf5onKwX2DYrwwMW0yS7NNYZZsEdeI3ew
	FCQPk3NAQx0ZIBwbcC/rYIGiBGTfM7PEzKe6XvBaJHeVl7JUsrqmK1PtIA95tqrXMLSKbDcUQ1s
	lbTEHI/EOuIMz+2hjokLaH2a46B+Uxa8YrqGpPnhlLHcvdOTlFLNqAmbkSY1657BZn6HXG/4Llg
	ZwIGiOaOFp0iuLe9Wf/+NGORkrN9O6ucu+zFj3zO6SS6CKRHKY9RXkrOcIS2Y01Jfa12XRs8K2V
	nodpKgI7LWvU2mlg0yBLk0i7mhfGkmUXlbd8MzhSISf5cT7mHq6kOQdIuWgr0HKWhoUt9TUfW8E
	9Q/cuPOeEu6deycbWPcd1Kr6FPiIKSvoDwSRf+/yuguw04ksX7t3g==
X-Received: by 2002:adf:ea89:0:b0:47f:9751:cb3d with SMTP id ffacd0b85a97d-47fec4f229bmr6673348f8f.8.1785919311697;
        Wed, 05 Aug 2026 01:41:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfe5b1bsm6278770f8f.12.2026.08.05.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:41:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: fix wrong value for PCIe reset pin
Date: Wed,  5 Aug 2026 10:41:41 +0200
Message-ID: <20260805084143.3901-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_014154_347816_E3CB41F6 
X-CRM114-Status: GOOD (  10.94  )
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

The PCIe reset pin actually require the bit to be set as 0 to work as PCIe
reset pin. When the bit is set as 1, then the PCIe reset pin act as a GPIO
for GPIO44, GPIO45 and GPIO46.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..6409572c0a4b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1412,7 +1412,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1421,7 +1421,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1430,7 +1430,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
-- 
2.53.0


