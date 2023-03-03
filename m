Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2385BC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfPgYFPRX/XPtEQf9GsJM1HQG3J7uORukGi3HA1Sn78=; b=kZLYDpPFwQNVEx
	vY7wKWjuYIvNyrQ82AGlYVdZ2AArGtcczfKUTHANmEsDZxxRC0i9FhckPEV88Qxo9Ry1F4pKhsSi0
	M1ove/y2x51aqTSgpU38RR5oU2XPxjEYjbzDhvH0uAGaShX8F9K3k4mQzSPSL8t+/+BVOVeq34jim
	uPI5P/LbpViaxkZDkh8NwQSQO/cTyKEx5r860TYS/7pJpvQLiA4+hpphi3YYm9hSJYT4D7czHXn1p
	UK4kfilMiboI/5IkOMHP6bA6kutn+n9zmeT51v4tATnzLD8LtHnqldEqhY4V7WlTa77H3yrDs3KUZ
	3Vb+WlN0dwNmv9Kha7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJP-003qoL-1L; Fri, 03 Mar 2023 00:30:15 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJ8-003qfK-88; Fri, 03 Mar 2023 00:29:59 +0000
Received: by mail-lj1-x22a.google.com with SMTP id by8so753645ljb.7;
        Thu, 02 Mar 2023 16:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfPgYFPRX/XPtEQf9GsJM1HQG3J7uORukGi3HA1Sn78=;
        b=qRpHStGtdyvSG6C/rpq/wn+qRE1V0RfdCPT1TMSerFLQjDQOxoT9T/klmPdGtNEc+0
         z57A/CItw+EluhWzWFGBiCL6waEFZff2uXARAJoJhwWhrRhzpIblrhsg5KkY4wtxDaM5
         GXHFOh2Ms0rsveAJzyJ1Nl7f4iAy5Sq9iM86r9JfM9lQv10SDvdeNIxUgRMUUdgr1TXJ
         IamFI9FbzCIRXr8HdtcjN9D68llLY38mOVn8T6ktRAS1OA+dlynmbULrVmBH3eeN3Q7i
         wfHaU5PolU5EEcbFHwa0Ja+3radf0s+9c+xZsBx2/Xmc/6x5pryIdcQF9ihQkNJ+JtQR
         VPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfPgYFPRX/XPtEQf9GsJM1HQG3J7uORukGi3HA1Sn78=;
        b=AD8zkkbRyu5SLXqup2nZY9hr6oaOmBt4/JfQ8mNnNzXurveGs+q0idRMRcJB8Aim42
         6IcjlJjHq/yxdX9VL4vcpoopgBzqqzXIPjebsE0YF0TeRuC8qULaYJ6wXt/bY3ZZ/+YB
         dHylff00Jaf79nJtqE+4JWizbS9pHHhbbq+dE652Hnq1QDq/++UyLoAv/1SoiBL9aYna
         JAsvlWVjb6CX9Jc0ZneU0CSAJ3Mq34yKJKJhc4Zxthp2Yz+r+S7svZxqpEYAR0FrDEcU
         irtyNn+eDUztzbMSVByX05K5V1OPti4sP3vOS52bkcEAA4WX2acQyfpZ3XoZplLX4IcZ
         xK9g==
X-Gm-Message-State: AO0yUKWeVfnyVyV+f3qQx+2mJVuERbv3WMVMNJ4ExrCgG0Q/aAJtzaob
	hvY4ZBOBnZziH3FKydnTf+c=
X-Google-Smtp-Source: AK7set8yp4m8XhWqhNfPwz4Sh+24IUYWozDUsslzM6BkeOtlhGN4gt1okfhLATRbHujUT+K6+ZPItw==
X-Received: by 2002:a2e:7c05:0:b0:295:a969:d225 with SMTP id x5-20020a2e7c05000000b00295a969d225mr3636320ljc.1.1677803395571;
        Thu, 02 Mar 2023 16:29:55 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:29:55 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 02/20] pinctrl: ralink: {mt7620,mt7621}: add new mediatek compatible strings
Date: Fri,  3 Mar 2023 03:28:31 +0300
Message-Id: <20230303002850.51858-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_162958_331764_F07B3717 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

This platform from Ralink was acquired by MediaTek in 2011. Then, MediaTek
introduced these SoCs which utilise this platform. Add new compatible
strings to address the incorrect naming.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
 drivers/pinctrl/ralink/pinctrl-mt7621.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
index 06b86c726839..88b0c6a4ee18 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
@@ -371,6 +371,7 @@ static int mt7620_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mt7620_pinctrl_match[] = {
+	{ .compatible = "mediatek,mt7620-pinctrl" },
 	{ .compatible = "ralink,mt7620-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7621.c b/drivers/pinctrl/ralink/pinctrl-mt7621.c
index fb5824922e78..2128a94f6d1b 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7621.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7621.c
@@ -96,6 +96,7 @@ static int mt7621_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mt7621_pinctrl_match[] = {
+	{ .compatible = "mediatek,mt7621-pinctrl" },
 	{ .compatible = "ralink,mt7621-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
-- 
2.37.2


