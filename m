Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027AAC61CE7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 06:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=; b=jVegSoj9snO2mHHSktVvleVqYj
	3BuPnC3+Rb3wlhoVdfVj9rvvsalCfKd9NH7DLogrSBhXzOV3HATIYcKHEtzTBZqeWYBk4gNCNvbCv
	IwnVmMqJ5vGc8R5qtHgxnpmKrlZV61s8oPWXw+8A1yIYgUon53yfh1W8SgkuvsWtNXdpdlUvS+l+X
	s4Hf8s9IeMokRR0E1TUwVPy6v7awByok7N3jLXmhrVIhcvPAaBwZdPvCUrBbrBxge0JNpRN0Ub561
	Lb0gzt0bXV9xQhrT8NYaV7307Mvzm3VJpEGGfa2Tz5eusqp9wN1qSxdJjvnY37EV5YMF1SGD7hPkK
	y5wOCkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjm-00000008xBQ-3tgF;
	Wed, 11 Jun 2025 06:15:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjl-00000008x8u-0ySr
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=; b=Av7MvnsXy+dvgntuA7EaTil+1w
	HsTcFHSZgIhg+jPr4908AW6BlEG2T5CQ09HNNqQPE4jbemTzL18rBUFa4iCFdX2Aiol2S9Bs8oyxP
	vgqFNo4H3VaroeFTEdOJuaMrYsNtvTo8KFAuahRruHPlNDBVOlCt6KYsbgcSTYZlhaqM3KMDVcj/c
	mz2zN1Q+Z1Nb0Tcl5OUOMXu4ovm51EOGTB0CyGoAwImpJxfEZ/XT4hwMfpx0IwgYpdFHDZ9+8P/my
	FTsZ5RBzyfGREvzdLQe0tp5RI2O4iyzFOpEW4ZFizNK8odHx3AH/T8YzK5FNT6H83TvP77KqQmx4n
	cqJhjB/Q==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjj-000000027jD-1yYj
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 06:15:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32911f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 23:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622497; x=1750227297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=xz7tyYinAUq63LIeovROqsgoSUxO+7Zg0tBkSIPQvduu+9cEltRLQOHgprzNlyhQl/
         ULMyd3ZdyN//Hb6uTJPrTk4pWYtmVJMLH9+FJFusL5egp5lXQwJrgWTYaD6AeJaEtVcm
         M/Nf2py7KhG42/iVe6WW9UeHE6+Pb18z1qlYQiZx2Hcx+soEXC68EwS5k3rhyN+aEAR+
         NSQtNnYtpM395Isf/7DaymYbNP4HuvEkA5zetzkkXBX3RhjtwT4xVRBSlHEOr9MYTKse
         PRhTedlucZt8Z+TIgbwXTPyaeDpF8nfrKHde8grqMATtnN2wUsBTMkxkyXReahmmdovx
         878g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622497; x=1750227297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=a48lE4EoMqbdEFU78M7l3p+jqKl6dKYKXQ5Zwj44YtOUDPBrxt55RY8N6ZqQhFnqBg
         sG+LTHeDG+QZx95Fei8oLyHrSnWZ4/5w1kXmxVPzsI7IlvePRJNRqqXlcFxAvv9GKP37
         fS1D/6zq8ZUVf54dkNTRdcTA54Py1frUwB57SwTcoN7xDX8rHnCn/HmAqBcAIPAZAUZx
         lal+tMbleWd4ng5+x0cz8D8LAE9AcFPmzVi9401Ic8lqXhNtmxax2nHh2LWuj8aZKjBB
         9dUVgRXUUwtuQ6KXszgZBZSRv6dpbMnCRZVgH0nKKGTFWkdLY6TsHVgmhAm1x9Rm+XAJ
         8jOw==
X-Forwarded-Encrypted: i=1; AJvYcCXW5NVrcdF6/O7QxIn03RUqTa2uO6avL6+ZLZVPksyQa3+XznwJL8/Y9/Ckd876gYMunaQl0NkXmjgTkKOOeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq6DMJPL1UPiL3xRmuFlys/eKIvSvTDYuhtCZPq9qARdfQsHoq
	HHypz2S5+ZywNV9+7BAHwJpgwZEMAyGC6ZxH7BQUk9bGD8dvNlB7AFT+Ddv/1f48RBY=
X-Gm-Gg: ASbGncthmMu+vjv33ZrPYGUXWNVAcpbWRjCxC6vW+V3PnHTBfvyGhp7MMQceVFKsJ4d
	ehMBRuKG03UOnRT4Gls9Vr+72Z2OlSnohdocCJZqMtmBRqrmnZzYktkduPj0zoAZW8kjxWKLEPX
	ro7fE0pzTpqMFFdwCtScysXfCqYl/UP94aAEIyeso8Bhkowk08RaXZp/juhctBi6foLHmsEnAZj
	EgObntr6wgvcgJakfO33L/ud84SSE1p74sk6Uzj832kTCIIePmudNs0wzsWe5D0c4CItVY15tZ1
	KVbSn9pCI1GxtWWSaqMneb5pby+j8+1459FDN5yzLbGf11f8VaGfZXUda4VXrBV3mokRrE/g47o
	sOevF8fc=
X-Google-Smtp-Source: AGHT+IH0XZ1xTYWRRaO/KxoZgyHwo88VqXTdr3SM+3aZCDHpuiwknECFcoWGBMSsZB+S7AbudZJGmw==
X-Received: by 2002:a05:6000:40c9:b0:3a5:22bb:8b41 with SMTP id ffacd0b85a97d-3a5586c6283mr513239f8f.6.1749622496932;
        Tue, 10 Jun 2025 23:14:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:45 +0200
Subject: [PATCH v2 13/17] pinctrl: palmas: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-13-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dTmy1ylBupLBEHMWc/Z23V5px0USEJlmCJKSN1EAvfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6q4AzpL6d1wSLiktMd45hf80LKncfJThmGJ
 j9tWAIcbRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqgAKCRDBN2bmhouD
 1zW2D/9sgizTHa8UYpq5W08yfaWQQY5LIJPddSSvcnOBIPHSGldHl5KnuPm5CR7btgpemW+s5wk
 +B7d3ypQAREOql3KHh3KhN4AIXdCBqYRhiXPktlMuJullbPSpdfQwUDGPWbKkl5ZGYFsutt8LXO
 2oR/wII7OuWQyqXM+zszHSuArLZ91UWpjox09xD2BjvaZqbt4U7WBXnpdBM6EirqirObi7+Unmx
 vRD2aXkAFWnCt5fSmhwFsxQ87SO68h+yAaVnpgUVxzSeE5DSZaynVyvBTcjnMZ4pPo8j7uxX9ee
 Brc7ycoIJiDUuzzcHWIpF6ebtMZtGNyZWC79sMRgTW4btZZyj0A78+J7yoEX8MRDbdfBLYL+fv5
 SmdiydXrA1oaQHQbUJBiSlHx1gEFO4BiG4ZnAaNY5m3JU2P0un6OAzOE9a/dEOMpbHazykDXjD5
 jcyV8+Eh9nGCS8xrgB+uEOfLCMuG2/VXTxXBxhkRQj0uAjevYzMJm3kovLQh4nKH4talFCxMtLb
 aUDFOmzG/NXN1+jKrev2W+nylhYVoF2QCLptpuvwWkWS/XOJJ0xJpd0gJX+TtLSBwdgyXUDey9E
 CmgGts4sk2ZGmkIIwag50Rlholelm/UNtTVFHxIYfZjshyD22hdqRuS4j3hnI7uREsSTOniRjoR
 /5HfKm3NrrNXYxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071459_563846_4823618C 
X-CRM114-Status: GOOD (  12.98  )
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

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-palmas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 9e272f9deb4f8c49f91d2f09c2c100018a7617f8..d69f114e46426c345d9ffe7567a326eecdd91bb5 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -956,6 +956,8 @@ static struct pinctrl_desc palmas_pinctrl_desc = {
 	.pmxops = &palmas_pinmux_ops,
 	.confops = &palmas_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = palmas_pins_desc,
+	.npins = ARRAY_SIZE(palmas_pins_desc),
 };
 
 struct palmas_pinctrl_data {
@@ -1023,8 +1025,6 @@ static int palmas_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	palmas_pinctrl_desc.name = dev_name(&pdev->dev);
-	palmas_pinctrl_desc.pins = palmas_pins_desc;
-	palmas_pinctrl_desc.npins = ARRAY_SIZE(palmas_pins_desc);
 	pci->pctl = devm_pinctrl_register(&pdev->dev, &palmas_pinctrl_desc,
 					  pci);
 	if (IS_ERR(pci->pctl)) {

-- 
2.45.2


