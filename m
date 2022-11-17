Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802F2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVFv0ZYWJm+czwpapzS3FVHb5/n9bwLJ9LGCNHM7+Zw=; b=T1rjyYAmcTH1TZ2/pBC5ewMuUA
	ed9QjxDyg+VewDYrapSK03On8mzfO5O51zaTi+x03qbmaatjH1wuh7/laiT6/KpJ/mc7n7p5tBYhh
	DsKuUMhpEpBVJFAUh5V7zcukaT5yYveEaSi+JW1MmiSNkOc5tQFZk0Q3nAeX5WEfkuQfunMfl5l1K
	P2CaR+51KQF51Ffr3WRDmqedt6Nw8YIELRgPT0Hc/WxrAlFOnpVjuC7gbOxtLWjxIP5Rj6+A3a309
	OgKVJQbtF+6eyuQfuw3cuBHcfcjg3JJ7iNN+IIQtgg57Eek/XBFpkEXpz8pwXJYjX+wU9WI6bQ/AP
	x2kX3lEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovnBU-000HlY-5A; Thu, 17 Nov 2022 22:16:36 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3O-00HU6X-1b
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 21:04:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id x102so4467033ede.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVFv0ZYWJm+czwpapzS3FVHb5/n9bwLJ9LGCNHM7+Zw=;
        b=i7k0OLXj2/WWwaBXCA/cEiGc9ExFDBEUZCK2EArBa6y/X36LkcG3I9Pp2OEeoGKUUB
         y+weSlCuEkx8c9+P3wA3a4zu1cBbaYKF6AsN/41zKTEnkHfQlWf3xDYUMiObfXxzj3Ey
         T/PRWyug4oTopCC4glQuRXcf/diBrM3aqYD1VZz80rg4PBQCC1xOO2KuN2TKQ8Kke5ET
         258pau0TJJsnT9IEyNSymedZDyG2ttkhAChnxzSZWft1549fFuvAyAky3qhptR26ydTv
         QhjYB4/ZXLm7ST0DsOD2SqBMntgWQvvztR0a08GLjNb+4WiMqJEUBGMH35SrRH0ZtEnz
         SZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVFv0ZYWJm+czwpapzS3FVHb5/n9bwLJ9LGCNHM7+Zw=;
        b=sgqDJIhEDr4K5uUOYVqFppv1+waGU1760MQA/6uG6FIbLKMHRbpEL0iqcxwiy6ONMI
         qLVJXIUKX0Xq3+ykb9TavFOztbKRSDUEXhPhCjpmtkTz9S/CTYraC7DbDYGndThYHsuF
         Y3gBsQvo4GJu6F0J05Mc3MegCuQ+XgzJjR/WMEklvpG9RaazKEGpsb7weeMHyCeYQTUY
         HHfe/usGkhcXzAMtMTe8GpG3+Vf7IkaV73aWblrVShlx8HPlaV5PKOgKhjVGJnYSckU7
         kmcTIRfJheEjqkgAv4CWw5We66x4yrYrWVuyVtQ/t1gHsLe/97S+BvMUWL1H0/aXKXAO
         gBrQ==
X-Gm-Message-State: ANoB5pmGlqGpUChy1pdC5lo3eLpuU2DsbHr0SUvDArz3DJSK92dk2o4C
	60n7Sh42xHLATzMjr843ieMsshRhb0UtiTfR
X-Google-Smtp-Source: AA0mqf5oFKvTzcnfw4MfXoII8BHLgmW+ZXKWvoseTaXfRamunlD79P0LrSuKRP+9Vq4JUoFdXfqfwg==
X-Received: by 2002:a50:ed0a:0:b0:468:ff2d:def8 with SMTP id j10-20020a50ed0a000000b00468ff2ddef8mr1330945eds.399.1668719046388;
        Thu, 17 Nov 2022 13:04:06 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b00461c6e8453dsm970807edt.23.2022.11.17.13.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:04:06 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogiocchino.delregno@collabora.com
Subject: [PATCH v3 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Thu, 17 Nov 2022 22:03:52 +0100
Message-Id: <20221117210356.3178578-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117210356.3178578-1-bero@baylibre.com>
References: <20221117210356.3178578-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_130410_122074_89133C0E 
X-CRM114-Status: UNSURE (   7.62  )
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

Document Mediatek mt8365-syscfg

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 1b01bd0104316..7beeb0abc4db0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -50,6 +50,7 @@ properties:
               - marvell,armada-3700-usb2-host-misc
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.38.1


