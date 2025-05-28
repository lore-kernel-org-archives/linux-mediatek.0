Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEA8C5AD49
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eqWfvPKnGs6dEV8KWDXklpALBHd/Gw82aMk/cyVxWg=; b=pa5suIR8ouj1EtVnsnVTuNr8km
	1/arFJ4NXFz0uQwZBfsBlz3UCI506PCcgstmu1BYdod/qVDrXLDFJ0ZrEBDZ/Ii7jirOhX9YhD4Ko
	a5H+6BNtSiq1Ei4WThJ7JT7uMCRrZpfZbc2lwpF0kiSFnloy88P5A3dQJl+kt0rE/Ri1oKvDt+dRC
	mX3hlCzctZX1QXAWfA3xiP1xpbgXc/hU8XYxrL8WDFncpHN2LklIIRvBk9GO/GTMID2XUlOEJO1yF
	i67Gbh5k3zPq//q5x/FWaaK+caQEGpV+GZjSucP1GVO0kyNxwSp7X5GqI5P1Yci1zgxZKGeD1dGLq
	sfK1fKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEj-0000000CskH-2esZ;
	Wed, 28 May 2025 10:42:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEN-0000000CsMG-2Hh3
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:42:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-442f4d40152so5987325e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428914; x=1749033714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eqWfvPKnGs6dEV8KWDXklpALBHd/Gw82aMk/cyVxWg=;
        b=otxbDRaCObJF7Q8Lr1ot7kTThvqk6FGOwcJQYdywSw1RrteTnPum+JaVsr3a7UPRZL
         7ziv+QEeOZTZTjHL0caoq+N8ilniQKOewn/2ezZlBAP02mUTroiY4ocC3trOVWV8nB5+
         z0uHDsPtZfuIJGSvZYSZxaRX+swFKyoxdisrUH02P/evgbJJ1+3EK0l6bmgIVWH922Di
         6Vqya1UoStQMlBiyct3ZK5X16fdRGIEcE9ekWkh2X2BdbDLC3bBkpXfOMmuyUOyoX6Oy
         b/+xx1tjMEzW5sZQ1qzThcUf2MkQGyGxhtbyzgjHrbquHuzuRtcWae9gRglXZs/AlJwM
         y64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428914; x=1749033714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eqWfvPKnGs6dEV8KWDXklpALBHd/Gw82aMk/cyVxWg=;
        b=R90UZuDjlzHJ5mJQaQIzb7P+ipFNnLK97XVeHlV2IE/9N0G9a0bfFI9E4LwHv8tiXn
         aDHjUOGvE6QUuV92vwv61C5o3DJvKYXBNuybWHM+jdWflaPph4RO0OUpZ3eWXDsco+bT
         Y6NT2guj3TQxV+D8lX73EqkKSlazheEtedV4HM5gDzxpPq4fs/UCeERREx6jyCn4GmmI
         +8JmAcnHa4eqW63LKyZU5tm9KqiF7lHHI9qpL7gvcdV8Fj1O/ueX6oIaIkWc91BZ8lQI
         Qd8qmNmDtCF9QwXaeaB9A6Q/CQ/JrnCBdfputD9y/6oQNUHCD3aQBMAbBTvQzD9qoqwM
         vEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE0Lz6Pkn3EMCFb5Lv0237Bt9eYim5TKV4AvXjhlyOQA8QBJSmkrVarh9QZTbc9JsLbAeBs3w8VWID5O+71Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz94BVz0nnNdJMayX5ZI9S3GYckPgD4egGQqXnbh76HQ5XQwcdO
	bzg1AvJl39PbSy+Mx4LFuOOB1qtcuCP67wm7cyBeqnjIIY2FzbTW9TntlTBD41fbNjk=
X-Gm-Gg: ASbGncsc1dhtEmUj70epbCg0f16L4tBmIujmSwAGUeUL5Uf2cU5/DLdRHY41DmKmqi2
	fwFL+g5BazFkaOxX3nq8AI8fAfLB/mUWeM3ngDEmVsuB/8cVV7DbXPe5BksFK2XECblZsfZidgu
	4DgQIlQUpvz0iyZz7E5u2Bce1SoQuuqYwqt54r+xwVOEMOF+lk9GWSdERfY8WH0NfGjW5Q+MV/F
	G6BdCbXpAN0xe9BH/rAyVbByGiskFoUWHjgFEq99uDhpZJQCWNKpM4AjTu+lsgQ+xMO1b6i/16G
	uKh7szMxG9RFXinNVdQy+TwrdY4l+iVJdel3YCoWuNP8aWKzNfaV7V2vlZkHqanQZw9lTTE=
X-Google-Smtp-Source: AGHT+IHqXCD2Zw01Rwu6Y3SAvsPyX9CqAzleS6jGDMZtlcG8vOZNw6N59XBM2abO07C+micSLyXkEw==
X-Received: by 2002:a05:600c:3c96:b0:442:fac9:5e2f with SMTP id 5b1f17b1804b1-44c91cc3bc4mr57701585e9.2.1748428914050;
        Wed, 28 May 2025 03:41:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:03 +0200
Subject: [PATCH 07/17] pinctrl: bcm: Constify static 'pinctrl_desc'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-7-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ABHNDkrQtwVI0zXe6lhvrQu7yt9ZZOAkqbbG+yTdfqk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhOkNkLKO2b0zaSv6TMTVNLJbk5UgYW6TFwg
 jxSUj1tHraJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTgAKCRDBN2bmhouD
 11tIEACA1WGvClNApJH2VgRBIboy0fFx1D+Y+FmGZZOWF2Lr82rwxR+M2b748c5TlSo9L++jcYr
 ZIR9lt4fSg+Yq5PmKkMDS5q4/ycD2Gcrmt5FcuzV3FHj/sG2BsZ4jRCEU2k0iCiKO2X1G5tK6zW
 cPFXEwBw4P08YI7Nu2Ke8Li1A5AQfcSHEssreNopxfynn3hcgemwVvxqcrgTgn7LKeyty9xxRFf
 Kn4F8QcbHnhFHps9umRJISETKamqcHenUST3DXcgLh47hR495Vcu58lodmhE2bAmutSDn5thYfe
 DoO8QFiiJskkUniuoDUTujIX6m6u+A6gWbXWz6beprpg3Xf05DIvGAxvrQw5iCf4HEKY+m10FEY
 43eDfDRbqF3WlANoUSuRFJNxtdKy/sbJjlSx/hgmTrohMHQuWXOua6jZ+L5S0pD+1WTBkGWJ+X1
 xFECehBz9isI0FWdgZrOiu7VDyAyjj+5nFjPqGNf1RCGXB4e9CQ3Wk3tawW1XnuZjfYNJxyX9LL
 wGPxw86wuE4eFNLbtUC/wyhkH0OYnduQDq8aidt0TCaFCrmsSv6hkV0VKDTnjl7D4cOaPPst08d
 I6jHmNloifkKQPK0TtV1VNakHBf8aR1kzbxtqVvWqR2c/B8gIYE1dpqeAFLbE4Pxl+6pc4QiYJN
 MPOQPOjSdZQleng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034155_622502_09695D14 
X-CRM114-Status: GOOD (  12.71  )
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
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index f190e0997f1fa9fe8bf07fc3ae5700bc721e1651..12f7a253ea4d5bd0af5dbabc320fc2df32172e4f 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -456,7 +456,7 @@ static const struct pinmux_ops bcm4908_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc bcm4908_pinctrl_desc = {
+static const struct pinctrl_desc bcm4908_pinctrl_desc = {
 	.name = "bcm4908-pinctrl",
 	.pctlops = &bcm4908_pinctrl_ops,
 	.pmxops = &bcm4908_pinctrl_pmxops,
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 6bb2b461950bef5c420f1b250d48fcf6e907b98f..03bd01b4a945adf72445576a8a111f3c0637e095 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -192,7 +192,7 @@ static const struct pinmux_ops ns_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc ns_pinctrl_desc = {
+static const struct pinctrl_desc ns_pinctrl_desc = {
 	.name = "pinctrl-ns",
 	.pctlops = &ns_pinctrl_ops,
 	.pmxops = &ns_pinctrl_pmxops,

-- 
2.45.2


