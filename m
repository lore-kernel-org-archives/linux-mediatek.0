Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ED3C677C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 06:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=; b=Ny+RUn+ubl1EgeCr28+yH+oYf6
	CrddzHspB3xIt8fX269AVAKZuavAkEvRyLyZZWzss6iaa3F6gIhhLm7XZAi8/koLFbsaD6LVC0yN6
	cXbG5+JTfJUJ+QmQP8QJKfpIEa20vSfIvZr1yoW80A/l3Nr0pbO6EcRFjest+uHhur+muvvhM8seE
	TacMSxKcoL9WgmBWH2Ei8OyBEAdz8HGKV8Ufg43LmOH1gdKACIZnj58pXcLlg6wEEp7oUlG9clSEf
	cXj9sphEizVdeeXskzHj4F2fZ7Wgpe9v/OmBMhvVr9j0LBuhuHyYyzvMxIezu/wwFj4PXeIBgz8Gl
	LlodLvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjp-00000008xEX-2D3X;
	Wed, 11 Jun 2025 06:15:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjo-00000008xBx-03Pa
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=; b=iMcMf/o1DxC2E5/A8qpabJC6wA
	aiz8y9pTn5J370gBQb2TJ2D4abmhpAq2VISkvhmQEpIMGdu5A51xhuRN9cp1XLDhC8AipksGj0B3K
	VA6hcn4+DzdIvaDRyetoVgubJhvh2wLc5Umdq/l3CrXRRkCdQr4nCW+QYSq8RsBXWsZmVOI9HOugJ
	fzVZ1QxkTHOflHHKEjRrr6vnl+7eJnjG3K4eg5Knk8wU5qWNxxv9kmMl7x73mvc6/odeofMQ+u6g0
	wYdc0D8BB8REOgK1tacF2Gp1y6EP2DiTcniGf4Oo8a9LEued8ajW3jLf6hrZm6UYyyfCBV9+IJbgw
	zt1eh1/A==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjm-000000027kE-0fJQ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 06:15:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a524caf77eso25264f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 23:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622500; x=1750227300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=;
        b=cZHPkHjev763FK5K2CWhCRDMBVrF/wTFiRAk0YUZVcPzYlQo9LEDVZKRtVrURHvzf6
         YQ+nsw2RHMWvbD2AOFMHxiP5mMSg1JVFCDFvqTOWqJEtp3jZoDfwmTYjylkZn5Mnx00i
         7ad+p7J2fpr1S0NzTT/QAx1sXIUhYQvvqIyMmmXABR6Uj72bzO3xu5tXsqFDq75/4+Np
         17ma9GKuKoi1F3sxvof7P/9fjaUOHAiVVNAuMIACtnD4eJQG7v0kWEn7wiXGjsTL0Ucw
         qY34aBy8+m5jgN5K6JYW9cxlqtxPe6rW03657S8nqzx+QM/zIMUWo3svmMJFqms0z7H1
         uImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622500; x=1750227300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=;
        b=oU80SlEYqGzZ7n4ZJcP10I+Ky5Tmrjt4VqegENObbDH7em+l705RyPbTkelxMHkh3A
         Qp2s+ADB/fRBjSY4+emDGoFyXJaKGWCe2qyK2EGQWAw847w4MmXvI5BnwQ7zWLTQQIxi
         5TrgdzGsp7OOexXjAy7UvpTfrhkXNKYUc4NIyZSGWpk4PUGpasXZexl9T3qgRC2fkyEq
         0s7ofKVB/4QDAfR6Dk8PGokEPpF0TE0ZoSivClycW/APsGCKjF6Ns2e75uarW78lOdJ7
         lDZAN1aiwo5JEUZLoCrmWmtENV8a9sHF3vOib3Y91HaSiEv+YEViGljBdACU8vr3NpWy
         VciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnSwIf/PIbSQ1YInH6E4sYCNAieF++ec6iypEOmGBplpXa460HVO79tIgDkZMKaE0pdSniI51zCN1YfmAzbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3l1tmHCV2/I+0iYbV0CluCW8MC73HIXa7/bMs/GW2rtdl9lY
	GK3VNM2NG22/Ne6hcLRBwC2HALvUg5ELOGZBLSoGJeN75EnrbYqW/1Q6BhOFTnAZeVM=
X-Gm-Gg: ASbGncvMFStBPjfRtEzjpDVbCGiHFbdQ5Mypra0agxSD1SIENHIFxtoL9ECKDIkBoep
	Ee8HCRGfb7czxfC3qp1tzrdnyv2jVUnf8HP6QjtE5t8KOEKQ0FFHnK5DHaKb9lHp/mJ8sX7iF8Y
	lJ54zEytllLS1jjmUFX/MCm9R1+EJBQt+00QtnLspVx0n9hdNjEPKHGa1j8kEJ2pQS7ReJlS0M8
	QgkgKGLn4y28h3zgLRN6oiVqSJlEydPhxzl1knXXr+EiDJ0JOZilBLnABWG3tBN6+OEzAS15XLU
	mRV+Sgxw1dOfs1XyjUHlacgMp/YszM8OYy40dLWTfABfWl1ZF7xVU4js6Av2t6eSgngrkD/Ohjn
	+n/w/Px0=
X-Google-Smtp-Source: AGHT+IF+8CuDuQ4kf6mSJfvCZWVF2nwaA+1YTCjzunNZUTEkAuuOsBPS39QliHzSk5Dki6Jz/oOC5g==
X-Received: by 2002:a05:6000:2303:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3a5586cba07mr495450f8f.7.1749622499974;
        Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:46 +0200
Subject: [PATCH v2 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-14-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+flFdO+wB1jUsuwdikr4oTVuYRRszXJESkvc2OSpc4Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6rDKvTnvN7uWrkaR38SoKZ0JyrYcQvhwNCm
 /Q2Dq83gq6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqwAKCRDBN2bmhouD
 14FeD/4ieFxDBp2aYLDtBNbnYfL2Cs+jpT6Ln8r5h8k7iHk7UFGxh34/qOVxHUd1z1j+6DSnp0k
 Ke/5Mro6a+xzalY4l7ACNl9imdQ2c1Gzag+tWv72+5bvxiGqP8bZqL0Jw0w0zL6sWtytvSfKqWO
 BGkf3r1wHCuVlIPAta/4/+GAbC20Gbc2yR+46ZTzVjBSbDxXW/1q9H0GZebt08ZazmjdzHE/iwQ
 yOIIz88jzvOLYWHjKSWOL9LVDAK3GfiN7ClK0jGoNFuFmO2a1M4sBDhcX1nN4xbAmki3aupM8VD
 Tbp64fJQ896BpCzX2DnW2WqwdYVIVxtQhOvao+W/kMTC/vQc7fZdCPminzsgcFpdUsZcDW2G926
 JLDEoqmjl02ySwXcMvRRMfWxQMIzssWYFwDj6Nh2J6pmtzUPPdgn9YfXzP3DVD+YWq0Pm/AM4yP
 dlmgwSbCV3chOEk9k2nb8UY+TUCRLUDb7xXTAxI+ozgWRWv1brSG/BEZtSHbO2rZA7payHinZB5
 KN6dtKpxFObljSM+pANXsnq2vMRtRUfm/WYw/vNvczM7tfhsCOgw9BUrYElrlhYMcw9LcmSOP7j
 iaQdnaIObg7tji/TYEvlN7XdOkUPn6SjarApXOtiu6bjHdimu695XgL8gl39wSEZZH7kmPQj7NA
 W7xp+qiZCZd9aTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071502_282976_8BDA0013 
X-CRM114-Status: GOOD (  12.66  )
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index d442d4f9981c908389407275522b936dbce294d3..fb874867dbfb9877b012988543ecbfd1bfb11270 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {
 	.pmxops = &rzn1_pmx_ops,
 	.confops = &rzn1_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = rzn1_pins,
+	.npins = ARRAY_SIZE(rzn1_pins),
 };
 
 static int rzn1_pinctrl_parse_groups(struct device_node *np,
@@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
-	rzn1_pinctrl_desc.pins = rzn1_pins;
-	rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
 
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {

-- 
2.45.2


