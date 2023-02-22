Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5205CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foDA/GXxUeG6qywVw7pPHlQfm+Orh3kvLzj/my6QoE8=; b=t32ywOKI/i3atB
	aq1LoObqtk1c+ZGIF2xTHXWEkfsoC0h1y+4MLhXLsspBbt5QRg2z9s/7ggaXU7zq0RFhDi9pZ3Vq0
	y2xzpYK+uToKmPu1hVNwffc6aOmChVSo1ZL+kmz4ID4EF6HCmFewFg9vrrR3nU/LVCUNx3AzS/jRH
	rYilu+S9MYG7nJuNAi4/uoyQWNvi6sjISwacpcNjAiENwwxygYTe1SoyOes5d6jy9K9XwcmMFAScU
	f5OehP42MiAKMqKJ22sVk0WmGLrnj7wEzKN98h+smL5Htkm0qidraN3CGNRrm5eVRJqMu8XyakJd7
	4howeZQ9qS802SsNUzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu29-00DThR-HC; Wed, 22 Feb 2023 18:40:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu25-00DTfQ-QE; Wed, 22 Feb 2023 18:40:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id t15so8859369wrz.7;
        Wed, 22 Feb 2023 10:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foDA/GXxUeG6qywVw7pPHlQfm+Orh3kvLzj/my6QoE8=;
        b=B9+WOGfkjvzGfunEXkLYy8KTjSrl99QhGvrJByDf0VqgZLm54rAB8+A9V8YhbSMxEv
         BBVeVV1Kk+uc/mDULVvKuDcXyq/JGZ14j1nhe6Fiqk4cjafKSUB3jOUazpz0YqspXaot
         o1vYvzu4/0RXvgATzshU0UETf2CZIIkkM2YOMMXZb/Y6z6pqxT5LKQYFNsfd3StDvWPI
         jIUEIwgzsmqfLOoEgnnRUMLE54hbtE/zjEspIUang04Lj4OZ+F+IwDpkUW6Xjxnzd/5k
         j8l4oMQcFZTAtrFtuzIXALV+kn6wQE+4Fi+ThhcG3XuAubClZdzey8Y7wEAnJJxKJdZx
         q9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foDA/GXxUeG6qywVw7pPHlQfm+Orh3kvLzj/my6QoE8=;
        b=Hdytpc0k4Hptwz01LFRc6XrKk6mgd6FaNpEyDTK7+zTaExNxzUxyqhDdBhZRMeZZMh
         8mFWPkw21XzkTOUB/SVGirBlSpnfCGLSCdwkmFDJ760jACtgchmq7akJw4l0LnzOXEh9
         NhEdel6TdLIHJvDZk3Qc06ezCW4N2MT4+IkK8g9HoPuMWQZwwz0ZFOaKUj3rDmDXd0ol
         pI7dtB2HR/lG+gCPMozjcs4lgUtz7s2lQZvjwyrdx+Mjpa4NmKMHVRplK4PpJRmMBS9F
         7eLox81yWt5R45xXVEdxZX3j7H0kPeDPPfWhr4VRl6SmaXML7T8nkFZ0KBtYe2MXiAYs
         JcWg==
X-Gm-Message-State: AO0yUKW/q7yGiO0zuSW8ZWGKzI/ZgDbvmp3S8qbQRGiUEsv48/WwKMSv
	xxj8S1kVuj2q8nY1SzATUuM=
X-Google-Smtp-Source: AK7set9VipcuXxYpnZ45Df1zEkwY+VzCevZIE9fa4nfCbZ7L/fI0ChM6/Zx2yWmI9RnPiMQlYfZ5Nw==
X-Received: by 2002:a5d:67cc:0:b0:2c5:6016:496 with SMTP id n12-20020a5d67cc000000b002c560160496mr8555585wrw.27.1677091199479;
        Wed, 22 Feb 2023 10:39:59 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:39:59 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 01/16] pinctrl: ralink: reintroduce ralink,rt2880-pinmux compatible string
Date: Wed, 22 Feb 2023 21:39:17 +0300
Message-Id: <20230222183932.33267-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104001_897682_40886A86 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There have been stable releases with the ralink,rt2880-pinmux compatible
string included. Having it removed breaks the ABI. Reintroduce it.

Fixes: e5981cd46183 ("pinctrl: ralink: add new compatible strings for each pinctrl subdriver")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
 drivers/pinctrl/ralink/pinctrl-mt7621.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt3883.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
index 4e8d26bb3430..06b86c726839 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
@@ -372,6 +372,7 @@ static int mt7620_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id mt7620_pinctrl_match[] = {
 	{ .compatible = "ralink,mt7620-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt7620_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7621.c b/drivers/pinctrl/ralink/pinctrl-mt7621.c
index eddc0ba6d468..fb5824922e78 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7621.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7621.c
@@ -97,6 +97,7 @@ static int mt7621_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id mt7621_pinctrl_match[] = {
 	{ .compatible = "ralink,mt7621-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt7621_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 3e2f1aaaf095..d7a65fcc7755 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -41,6 +41,7 @@ static int rt2880_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt2880_pinctrl_match[] = {
 	{ .compatible = "ralink,rt2880-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt2880_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index bdaee5ce1ee0..f6092c64383e 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -118,6 +118,7 @@ static int rt305x_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt305x_pinctrl_match[] = {
 	{ .compatible = "ralink,rt305x-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt305x_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt3883.c b/drivers/pinctrl/ralink/pinctrl-rt3883.c
index 392208662355..5f766d76bafa 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt3883.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt3883.c
@@ -88,6 +88,7 @@ static int rt3883_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt3883_pinctrl_match[] = {
 	{ .compatible = "ralink,rt3883-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt3883_pinctrl_match);
-- 
2.37.2


