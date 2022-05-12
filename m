Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E66C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4MTG08XkN3nvL5Axpvo3wz3odCV4pxVqx29fzBhErI=; b=YBtFbRBnfbDN+M
	7sTcmariU7nuMPdapFcoyqfgOKdwqPQrNHT7zQ7MykJbtiSnm8ep5bUYt6GhLKx7D7bDdg/cqDZb7
	nNQs3nY54/taaXT+vJHce/KB9gmyn+Gbfhs2xaYE8cWk6/frx46eLHS6OFKWXRYx9KcSEVe10RLlw
	ToSpTAMjkVwFJvCJFMzhYOb4yufxKYUyZoKWLOqtDeog3DaeKWybuIZxyt7xELTK/7DrYbvnheAVT
	BiyWaqefJLxzqu5vcf38DZaotKUT/r4e5rQ54AzjfohtvccdWyBhNTlvqKtZbaL18dlpV1YHABJXP
	xnR7yPo0lTty1WYda/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np8uL-00C5l2-86; Thu, 12 May 2022 13:31:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7s4-00BmJQ-4P
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 12:24:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso5038176wmh.2
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/vo83decuajkRrKEOpC1GzPZTUXB5e+eKL6t2IioWU=;
 b=qrZVmCr4+Kam5J5VAbk3WUFfCf19Xux9cw0bcqcO04gU3ydSFxVkqFQf+wrCt3IH8n
 q/IU6+KUbiEQe0Omod83VJY4kdbiut8tJZOZ1NGloiTo4jbupWjISwtFa6nAlWQZPv1j
 /paqUE5V13OzgyVhBWVHCPVJm5OHtbCsU7Y9OtFPtkXxA5h1WdyDtdHevW49DI6SHUvf
 d8Dnz5cVV8Kvb4EykZBVWMcK6c/3igHe3lBxdFrBDF78G3hyh3fh6N6jbDrMYHz3AZlb
 wnzIj0YDS8eu05D0a6PYEgIeIQDvkT08/d7Jkw6JqVAp93r7AeiTYICwOe5HT8n7Q0S9
 K6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/vo83decuajkRrKEOpC1GzPZTUXB5e+eKL6t2IioWU=;
 b=QhqDqdA2cTxMnjIU7V56WI51zmAS+Jki9Dn86WSKWOaUwV+BMjnMJQJBD87UPfyx8t
 Bwq0FMkbKKwbaU9kVgT/O0tfTuZbAkCEOtZ4pmxCB/V4ycR90eLLp3GcOu2jRC8s130y
 yO2xGGVcSDa3H/E0r/zjaTxuiomCWwqIIqKjze/4FT+bBBOiChjcgGBSt2dhIGOY6nBq
 5a8qTxzjfR/L0KEt8vZITExitbIgwnJsI6pC17ta9lZvSZUg+h/Se9BIRUnMTmKJJjMP
 T7J9Ps81T7YsnYYMo3jX6okOS7eSlQaDYsVJmKeD/yV/etCg94f6nc9hvYwPPkPo2nm4
 fG7g==
X-Gm-Message-State: AOAM533p5Mz/T41CT91HHX39w/DuXMauqP/iTISS/ZB0HYt+L0Oeoe/V
 vTPmJW2XYXsjdqQYHBlrkY2+6Q==
X-Google-Smtp-Source: ABdhPJyriTjj+xEsQg0Rd8dZU3OKFWfF/Q7++pVpnNRF2car0YMBp3BYa8rH7qnU6+ejyHZQ7w1hOw==
X-Received: by 2002:a05:600c:1e89:b0:394:9587:cbe0 with SMTP id
 be9-20020a05600c1e8900b003949587cbe0mr9917994wmb.89.1652358281444; 
 Thu, 12 May 2022 05:24:41 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm3047819wmi.9.2022.05.12.05.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:24:41 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Subject: [PATCH v6 4/7] dt-bindings: thermal: Add binding document for mt8195
 thermal controller
Date: Thu, 12 May 2022 14:24:30 +0200
Message-Id: <20220512122433.1399802-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512122433.1399802-1-abailon@baylibre.com>
References: <20220512122433.1399802-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052444_207613_C7B2779D 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, rui.zhang@intel.com,
 ben.tseng@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds binding document for mt8195 thermal controller.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../devicetree/bindings/thermal/mediatek-thermal-lvts.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
index 69ffe7b14c21..2e1ae00d4fd1 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
@@ -12,7 +12,11 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt6873-lvts
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt6873-lvts
+              - mediatek,mt8195-lvts
 
   reg:
     maxItems: 1
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
