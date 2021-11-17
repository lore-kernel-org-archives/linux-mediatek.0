Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 07:22:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447B861B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 07:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 447B861B08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4t2sJz2ES/nZGwUS80uDqctrM+cSbwyw5UNbvlqW+qw=; b=rWGp/eaWScAgoG
	XOhiMcul2aPciHrsMiLWol3EBzCgJh3hjbqmWZ+OUFdYr2vhxL/20xDksyDTg9Jw59ZXhff/fLVh1
	ZypzyXDHkqgfHKKWR9fBCf1W5jQyqDT08UkvknIay8MfhAKsYW+44RYH3D1P2dfSi7L6VIRIq2coT
	AvFxthrdHaNvxleM0b18JNcXyBT/4ZA9Y9uwyyAXQgdBLNvkvvHC9sTJ42bkKLgSQAaygMKyp+6RU
	CV0rooWUkn8VeJ49rzD7KdcONyfXvRvgOfKgseD7hV6bQ+pK+7I0bP5Smn4+kfgl1SYvHRZIB1vrR
	RbQrjkBjqZpKflY7A/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFHN-003ksH-Og; Wed, 17 Nov 2021 07:22:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFGr-003kg6-Ge; Wed, 17 Nov 2021 07:22:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so1772450pjb.4; 
 Tue, 16 Nov 2021 23:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=7jRgBWTRy1eLb6DRqg23yOdyOHyiRAeibkRflYaMCB0=;
 b=X2XhAkOQ6fIdWuQf0YFcTjb8AQJO2IJThIq97n19kyy6wUbIn7VdonBtNj6HBSFxJV
 ORh46IwC+kXXqvCnmFFzUtlimHlFDFMxZVtqUNkqbRYJH5g9D8zEn+lWSG4stWQoEKmx
 GTbevLFWcFTIKtLEYSdqcWa1td3nT/neMp7EfAOdpC258jCV7HeNN2tqpRnfMl1LmnH2
 h5mBeBULZ4/feLG+pBpX7j/kFVQ2FIVLyB7OmU5SGU4577FlpLRJRMdC4yvZgy2rFcrF
 l5SZvs4YmTJq6PjCC6oAFCUPm51KXIc5I/qucAUzpYHZzTYMoiLQPt+AHYtSWJWhaRhr
 cTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7jRgBWTRy1eLb6DRqg23yOdyOHyiRAeibkRflYaMCB0=;
 b=E+tBHokZbuN1mtgKFkTqpR5S45r4VRqv7mzHa52b045JojM0OfsH279zgoqT5HijKq
 etWs7wq6KYYsJTa0EYkUs8Bp6kS9J7+1DOi25OQTdo3iR8aU/0470HMK7x4dStm/uboH
 E4U3tbv2iCHPNZWR/Y1xo+ciO2WpCbfCD09VLQ9HwQuHhgZU1vBh2WAt7W0Z3Ox4F689
 4sU143ltOQ707OIfBDRnJ5TQrL9VymQUtEDGlJ/QIoCwGhWi/uITTzftPHaiIjO6dhul
 5Mkl3FMeLJgC0/w+IYxF/MUyIs7YLngA8tIY4jDRMe8RCCr+805ZWBphGPe9oi8ZRWMY
 /hrA==
X-Gm-Message-State: AOAM531ncKZFYKnvGDFlC7GF/6frlYFQyPmXVS13Or7t+iyOfob4tCCF
 EAwbz7VebSa+iB/ZwxhFjNBaTI4bUC0=
X-Google-Smtp-Source: ABdhPJzvfQBytyPSPR+HGwlMO6bXHPwbmKUSuv3ywsWOEwC9hwenFulm7iIIC+WawwzXU2Y+GZTyvQ==
X-Received: by 2002:a17:903:18d:b0:142:8ab:d11f with SMTP id
 z13-20020a170903018d00b0014208abd11fmr52691800plg.47.1637133735254; 
 Tue, 16 Nov 2021 23:22:15 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:488:df8b:ccd3:9aaa:2280:e065])
 by smtp.gmail.com with ESMTPSA id k91sm4445325pja.19.2021.11.16.23.22.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Nov 2021 23:22:14 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: pavel@ucw.cz, robh+dt@kernel.org, matthias.bgg@gmail.com,
 gene.chen.richtek@gmail.com
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, wilma.wu@mediatek.com,
 benjamin.chao@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH] dt-bindings: leds: Replace moonlight with indicator in mt6360
 example
Date: Wed, 17 Nov 2021 15:22:06 +0800
Message-Id: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_232217_622158_68CD6F32 
X-CRM114-Status: GOOD (  12.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Replace moonlight with indicator in mt6360 example to prevent the below
build error:

Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114.24-25
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385:
Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
Error 1

Link: https://lore.kernel.org/lkml/CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com/
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi, Gene:

I saw you have removed LED_FUNCTION_MOONLIGHT in v14.
But you may forget to remove it from the binding example.

Please help to review this change.
---
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
index 2353155..b2fe6eb 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -133,7 +133,7 @@ examples:
      };
      led@3 {
        reg = <3>;
-       function = LED_FUNCTION_MOONLIGHT;
+       function = LED_FUNCTION_INDICATOR;
        color = <LED_COLOR_ID_WHITE>;
        led-max-microamp = <150000>;
      };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
