Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 02:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceFmBEehHLI+ITdAPlxa6x5ctDzSMQAGOAJN5msaS7Y=; b=Mk94o9j43NVfIaaKwvISkYxi2D
	k6wObmxvZzwsh5rxbwxU44UFtsJPMcPZ5fRHBI9MdsmcSA9TP88ovB2ibg1k6iRLwZaXTuaOjNU1d
	3ArCP4xvk9rYTlsJjvfq3PArRUuejjovvNb80zUIzSdj3Kj0ELQHgLE83kkMlUXeblWNcybM4Uxbb
	DR7eEQKxwwBwDTEhzTxDr0ARG51s/34RTOSva9+TIcDbD/JKQjwXTAdUro6TBzo+K1wIU8bV0vH3I
	18hWkdPgt0XTOocq+lzRnT7tYMXWKCFWWEJjygeCI4PaBoxo/b7jTZ9wMq7vgAVg0sOaKw8gEEs4F
	gdoMUXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwYS-008VXM-Rx; Mon, 21 Nov 2022 02:29:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwYR-008VWc-22
	for linux-mediatek@bombadil.infradead.org; Mon, 21 Nov 2022 02:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ceFmBEehHLI+ITdAPlxa6x5ctDzSMQAGOAJN5msaS7Y=; b=nb/QtH6YfhYrPHZT4gst8aAUOY
	JDS39snNtRrsB6Psy68mYhGRwOl9NtR7nL2phtOWMueDwV4ey59KJym7BIOOI4+vyD8UDbbr9ve3K
	hI3pbRWS3zyM1ayNPjebfjvc16VDg8dbqrOCE/0Hn8Ihugtn4ZYVPVYL00Rdrzjk9MD3W8LH4q6z6
	J7CT+A51bI57wYFpdplvl1LB1hPmBQT5D4/J86Zp5VxDo+HZjp4irltD6GYwq7FgUEjpWtOfIABl4
	BsBpMRRRYovx0b34ogNWvZSZLqzV0drUyU7qKauTEv61EieSyblXV6CnnlNIGomI0imqaGiuCqavc
	mg61fUjQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1k-002ybx-Ek
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:56:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id kt23so25339538ejc.7
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceFmBEehHLI+ITdAPlxa6x5ctDzSMQAGOAJN5msaS7Y=;
        b=ZuKr/0Zc29q+ZYF7gRE55Vbwj+z/hYLrFwmhPnFhQxvbUtoIUGYXO/jAAegCGo8Z2U
         At24z1lPg2jroJx0YN6UU0W3Nas9o9tdrUDN4tKP/drF/gavXWF3Q1ij/ACjI+yd1v59
         kGxTJh0yngyQ6tSXBMvPGXE79aLk03MEq58v5hbFoNW+Q6PY0fSJhls4R4pNAkS/7k29
         jJ7/sANZO9TvVJ9FfIefpTFUKskoS28yzqWuU0po2+JPUznsHDfwJe4TU3BTx8Q1y5mX
         u8+I7iyMtB07mcONXkN215YOmN14qLYw/rLzX16158JSw0nwu+zb/+Rp/Fbuw3UiDw0h
         3ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceFmBEehHLI+ITdAPlxa6x5ctDzSMQAGOAJN5msaS7Y=;
        b=HLZY07TcUtW2zB242GkSXpzVub3W4CETy1zGnOuev5wNQcYdJegOjMSEXJHZKbHd8v
         swIvXtM7w+TwI07tTEu0cGlacxgGK0QKk/afIUk5yn96rpnM2xG6M0D8TDZzxJjSs1r0
         y4BenUcXdvhYXhe+ub+UZPd2PasYPaodg50Pp8c27IDRfuC42GnOJqvE7rd8TNa0Zs7u
         /1n+1q1LloPkeOXnRm27tW+fn3NLzQaK8qXs5HXzXcn7jLU1GCAIeOuQvhJo9Ik7MQtY
         Viike5E8wjjYzzkpCBBCnI6bCrrdpiBKcMq0rN1d5uWZ2181jk/gczZ7wQkXirrzLINN
         yo9A==
X-Gm-Message-State: ANoB5pkVaZWpjtcZvDZLzp//56E3Nt47pKJcZ7wUK3EWY2KF5j+DZ8Kj
	+qXzlPTbZ8+snsiuQXpL7qNYFQ==
X-Google-Smtp-Source: AA0mqf6GyYZ2MDoz5DmOIUHPUfsFhTnyAk1GDDWwK4E8E+3sEktkUs6XwVC5a+TccSYHOAq2BHzuQA==
X-Received: by 2002:a17:906:1498:b0:73f:40a9:62ff with SMTP id x24-20020a170906149800b0073f40a962ffmr13976603ejc.678.1668995714821;
        Sun, 20 Nov 2022 17:55:14 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:14 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 9/9] dt-bindings: pinctrl: st,stm32: Remove the pins-are-numbered property
Date: Mon, 21 Nov 2022 02:54:51 +0100
Message-Id: <20221121015451.2471196-10-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_015516_851192_12907F94 
X-CRM114-Status: UNSURE (   6.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove the pins-are-numbered property from the STM32 DeviceTree schema

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 7c08d362132a4..dc111122ff5d2 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -34,7 +34,6 @@ properties:
     const: 1
 
   ranges: true
-  pins-are-numbered: true
   hwlocks: true
 
   interrupts:
@@ -219,7 +218,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x40020000 0x3000>;
-              pins-are-numbered;
 
               gpioa: gpio@0 {
                       gpio-controller;
@@ -237,7 +235,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x50020000 0x3000>;
-              pins-are-numbered;
 
               gpiob: gpio@1000 {
                       gpio-controller;
-- 
2.38.1


