Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AAFC4451C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=; b=SghslPae6OWte3IRafGB5x+DKX
	8llvgXa76P3ANJsYtdhPKGkstjDOdezdrecCjfJRbHN5dqkQnPsrX6ps8KNnK0yaCpxIMCduxJzP/
	oJE8WJF5tqTW7B0fEOTMJ9AlMMqNxNpqOwXcYFmv/XoYfSpyVHLeoEMC2T5zZ+IBfq8E0xbGBHxu7
	Fr6vn9Dp3AsflpGpKnjaYiEW/aDRloDcVZtSoKSop/ZOYiMIaO/AcUy2M5EvmgoS/w0mMi7Hd97up
	nFyhb5ps4IlLTMANoE7txh+6UeYACGGbkzfRPVTEQ2sCSdnWo8pZUx7v00W+2tKIE7ClcaCZIEVjA
	XO7FF6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTp-00000001Jmq-49pY;
	Fri, 17 Jul 2026 06:55:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTl-00000001Jcu-1S1g
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-495437bb891so8433615e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271323; x=1784876123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=EWtFKS0lvarg2adMbzkkNS324U1TzdBxtes/OE9BKCD1W5zBAv5xvMlPdx5EmBoB/I
         6u06iAx2NtxRZOTTROJyiVTSTzcrQUPlX12Ju5iCWEP6PR/H3q3XIwZ/FgYAxiJn2G6O
         X7MqxgzER8jm5vQP6XXlqcSUohdNYuLyIq/PPPZVPcJMIzgcdO/0SynZXsP7YauQlQEB
         uKrGGoXWt775pY8mWKuFRRVqitSPGq08wt2fzTFPXiO/s6WIpTNs6AZQ5iUQhjjenO6g
         no48Koi8eXWmg5k0MNDabFMmvn1ZwcK8Fh567AgpCdt0+FBxF2up4eWcr6VCIOcYbOtT
         jhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271323; x=1784876123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=LVDp46t2LTiUnehpJ9SfXE8vAknfhw9oWFt4otc2ePvCCWanzxzrnV/fZ6LbJGoAjR
         ooIG3pG8+PyBcMRX/FOBz2cbW9eOUR/WDnbiV3nntmd5zV1oPA4yG8m1DPXe3AOqbYjA
         vaAxgrLjPKYTtWOFGoow0q1kNcTmu8VFvrvXQl8fFIAg5bftrN07GUFfgEI7g87LhpFl
         NRroYZT3iDO39mT4Pcvx6dkPTdFRyct/8K50j/k4vj7+HzS297meOL/6qQZ3U6FNXgL1
         ndCZHJPQ7y+bNe6kejClNeaqCx6y6NNBU8H4m/xi8FOQuszgxXJ/+/UCzKsMi7ABJdIV
         F/9g==
X-Forwarded-Encrypted: i=1; AHgh+RqAMRr0QaYH5V8auu1jUlsLFA0df3aLD7bUoCij8WKixvMhhYzQycedvcFqOa4CWAj6azHC76tovcWJUHzoEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxDR7cMjH6WGxg5uDi2b436P9GxfnXBJMV3TbsyQOHYHt4aTLx
	BUmmnXBi8lE37UzerDuJXJck0FD48eUIfvO20bv+TEkYQftYb2Tu/I/K
X-Gm-Gg: AfdE7cmKU9QxqS79Dt4GjWMVaNklSfYTUeNupRbefgZJMjTMuJM+U0JciTL5QBj5NUu
	aUZl3EswCUFh9N46PfA9eJmaTLRJj2O0BZYSWWUhteGtVFr6Pcrg//wRJbWyO7+8uZPUo2T5Q6y
	2rOtYXsnpgSKWjahOskVSD74/O5+GzflFUEQ1r+YfqfUtKDHUg8LhzZ+cJanRQ2fl/8gudQkMXg
	GaH9gYnpVXzX0RVUEZpO4ZWw+4CaWEkmHyfTNZRsA/+FPh/HFub0EBDewaG+vlYgo6jq6SF40Ix
	lUGn3VIEixX0e0korCOXHf0DTqYMLs+Y9xJAAH2G+yG8om8OMhqQbtLOHBLomMF6Y+S4llybfp/
	cKdLz2VzJp+ZPTPnFEUb2+ISg8HwP64Sq4CH0K0aNQ429odlBX+b4HzvlEyh7cllqm7sE7J5m01
	Pdifq6yCNxwCYTnm2tqM60oQe5FJFoCKSxoyaqmip66mb36cCHkz7yXRmew9sdBYRiJkhQIw==
X-Received: by 2002:a05:600c:a210:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-4954a341bcdmr7407915e9.18.1784271323320;
        Thu, 16 Jul 2026 23:55:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Fri, 17 Jul 2026 08:54:08 +0200
Message-ID: <20260717065448.1498335-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235525_397018_5D38DC34 
X-CRM114-Status: GOOD (  10.38  )
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

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..91c3e3931fa6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1415,6 +1415,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1571,6 +1572,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0


