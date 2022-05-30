Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34364C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J/wNWtiLbAo0T/J/RQzZ1JV/7J0DhtMnQd1ofm/Jw+E=; b=p6S8b3B+Y7k4pJ
	GZAmDrE61Cl+TE3JzcgfWT5Ars3JwGKjrhxM0xYGGpDhD0VGwvLxid/JkDelWHA9pIHjhzp2GdLfb
	3b5Miy5R9YVjPAlSLhZrdutCsFK+Q5U1VXNER1/8JbDPBgYYn8AGFFHuA0mqoJQiWqCzTfSKtb6NC
	pYqSyVnluES0PUfpxV0rigupHiLnmq+wWlAL3f3iimgdVTGb/OG3OoEv4AnBWjX0cunPV6g49Q7MX
	XxlakCf+1Ea2AkZD/yoPSoMii7qkB2ojBTPAxYHcRLIolwPukw3koybT+Zauq3859MqSaeRV8F0ON
	bIWOn5b3ncOb6uoNdjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmLf-008H66-P5; Mon, 30 May 2022 20:50:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmLc-008H42-B9
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:50:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id q7so5135801wrg.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lLChvyS/A963A4FUBu+MX1MVuqX0L31WAxbAXk0Rco=;
        b=TbWWfG3mwDAj3SlGK80UuCpJ+MU0f/6ckruWH7QPFPzJCTSVxTMObr+5jdPopbqJlc
         m+Xe8iKMzLEPVeY40Ofg+nC0bMhyd3DI/UcEaV6u+W4DH1149GT2GUCTM5XiLrc5eDuZ
         K3MODHqwWUmOH3IsgR2EzmAOPbAdDybF0HU+yL2d66R2Kzf8+KVLa2DYp6t8hiOZsyhI
         oLc+YnVjoPtrWKRwVbTl456dj/Z/n0ZK80hy9nFJ1Ra2pkvzPxQAMZjee3tbPUWVwq+w
         jWymAdqKP8tTerCgrRRNkWONCAkck0LqyJ+Qy7Xrj6E2jfyUteHh0EVy/vO+YFEk2CmB
         PZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lLChvyS/A963A4FUBu+MX1MVuqX0L31WAxbAXk0Rco=;
        b=Mg4JvM/MVVMkH88RetizK2fz+RDCy6cV1zKwZSM9c/zh1Zoe515BV8u98RBji6E3Mj
         QeDo+7qouVS2exKiWukBEHfgktq0JtLKHlITlwX9T5yF1iEhgJviU3JpkC0oPkFx49Is
         BdO3tbkJDcAeIdMCmE57o30c4RZ5pKkOfDAiDxP1jWGSlQoBQ7d2TTPcM6EtbZU/6ZK8
         lFwQWj36lPj55tcvHxFhjaBgKA2li7EOXnl6fxo7O3ARiuL567P7VYH/eOhFfaagYcHZ
         qM4fy4AyvBiUJIBqGixVp6muXLB9GBy0li7zCHDKshh7sQchsFPOYFUP1mW9XxPKVCa6
         XY7Q==
X-Gm-Message-State: AOAM530FFcG0EsBYFQG3mAaPXrkS976Fask5DUzRvdV3Joa6ROp1KJ4s
	9aDmkxOWrMY6xhd9STEeK5cLYw==
X-Google-Smtp-Source: ABdhPJzI+EByJbFzqqyfHEexvTgYT9aG7LLERB46N3RzB/NvGbW2le+Yxe0x4SZCCWeuFEYWmA6dWQ==
X-Received: by 2002:a5d:5955:0:b0:20d:4b4:9879 with SMTP id e21-20020a5d5955000000b0020d04b49879mr46283608wri.550.1653943842941;
        Mon, 30 May 2022 13:50:42 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c19c700b003942a244f2bsm384976wmq.4.2022.05.30.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:50:42 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: pwm: add MT8365 SoC binding
Date: Mon, 30 May 2022 22:50:37 +0200
Message-Id: <20220530205038.917431-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_135044_449429_70F92023 
X-CRM114-Status: GOOD (  11.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: fix clock description (five -> three)

 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 25ed214473d7..ff792512399b 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -8,6 +8,7 @@ Required properties:
    - "mediatek,mt7628-pwm": found on mt7628 SoC.
    - "mediatek,mt7629-pwm": found on mt7629 SoC.
    - "mediatek,mt8183-pwm": found on mt8183 SoC.
+   - "mediatek,mt8365-pwm": found on mt8365 SoC.
    - "mediatek,mt8516-pwm": found on mt8516 SoC.
  - reg: physical base address and length of the controller's registers.
  - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
@@ -17,6 +18,7 @@ Required properties:
                 has no clocks
    - "top": the top clock generator
    - "main": clock used by the PWM core
+   - "pwm1-3": the three per PWM clocks for mt8365
    - "pwm1-8": the eight per PWM clocks for mt2712
    - "pwm1-6": the six per PWM clocks for mt7622
    - "pwm1-5": the five per PWM clocks for mt7623
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
