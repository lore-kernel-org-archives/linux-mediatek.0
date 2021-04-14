Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078C7C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D43613C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D43613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UDjU4IDUoLLEFCsfrUJ7z79jKSa7H3owNfsNzlYOw+U=; b=jTDGK7mjaQ6CJrCx6dl3C2WP9
	7MpuE//e90z+jqveSrACVODK8cGJEbGDfLTMbC8Z1j8ckQMM+9tTZFdaWoBZvcxVJci/widtGwf7k
	GaDXwMrLU+VIG2WdDo6Hr53ZaOHmdyOKorkEvI9yAlrrgf8W8ObqNxth7hVvjgJJn/leAhnffbXfv
	yHbXQxthSk96qXDrmkuIJw/qaMhHRMygrN8kWAjR5osUxvOrUrTGkF5e4z7s3LZMhPH4Z9dmrGA2m
	hmLigXuN0XCFoyc+Z3r1weXim1znaQNkrr64S1Fan7lDlMHpAi3NUt8g0AtzN9MSCwg02GF8AmUAn
	5ZCg/DjxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWb3C-00C0Y6-CD; Wed, 14 Apr 2021 08:39:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2V-00C0PI-FH
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 08:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=; b=rgLdC4QFi4lWO1oByxIlliIfuo
 lkIrg1uPvnUMMnzLGgxKXefUqp/sBdut8mjo8myTh7Qa7zaIn5vOD3X9+F2CtDjdOHZKuPWu6QNGd
 4sZ5hyiHe7bOjCY3HqsOeTvXr5+Y0ya4E+WpJEfxsI4UKV0W8AKsx1QrwUQwPvYzNFR2phkp50nh2
 E+mGb8wvwE6UNj+Ctnr8dCx1qr5MBUSty22K3g59TPmkIzQGBt9/ymTETBdXtb11LyFNYvlLmTfm0
 Fs1qPbJfA8ASPXGJ72c0ToAUn8K1GpHn6k8A5OYxyH2qVkWg5OPzNXNc2CXBgaRK7nmjkeoDO3C9m
 exqJdXVQ==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2S-007cLo-WF
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 08:38:22 +0000
Received: by mail-pg1-x52f.google.com with SMTP id l76so13893430pga.6
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
 b=R0Oru1OcUZBxs5N76VWsx4+y0qphIgDd3Khgl47MGvgDk1J0mcJujNHWcDbSHMw4vk
 retbPZHixrp0BJSeAXCiluZ9waJuMYWYhRNeOqx8VSPLeJ6oKNsH7jwVtxn3z+2Gi1LW
 ZAN+yoYP+K8ioD/XXhw+T0FlrkDDEFPdnwg88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
 b=gAZVY83Tu0j+WCkOkGfgLzbPdVxIh5pNX2WpcdozQjq5VDP2Y+qbS47v5eUq6+i0Z8
 AENFZ9pKgl5ifPAE3ZQ8nWZBVrWWK0Asd1pQzcbkMVSOURAAJtK5Rx6eWe5PIeKdu+ay
 JbapZrUqnRmBuqsNtqKGaQckwfnNUO9udohpCfrjUOLyPi91bsx+Df7HaLhDXIQMXu3O
 v/j6D9ELyeE2V6sLY11gnN1o2s3x9hqg39dR2QgOr5yqMFoeI3wTYM37VSokGlFmYnD5
 5SoJYJsUgq2owPHTLQAKi/RczXmM7zCZC47fe7Bzy6UqResWQDxHvzZDOVXSpsOyL6nI
 dUmg==
X-Gm-Message-State: AOAM533m+0iV6Gy1yVVewlBSnBsMbWwqtcclQbq9ksXfykpB67hlKwwy
 w0M5weG9ZCjycgN05zzyEh4Qrg==
X-Google-Smtp-Source: ABdhPJz8ts/rFcx+fO1sCnhZkR6UKWNkO2GMDiHGUXl3hfNTchm75W/OIyecWwcg+qif9NTMmXCj7g==
X-Received: by 2002:a63:4644:: with SMTP id v4mr4335415pgk.316.1618389499788; 
 Wed, 14 Apr 2021 01:38:19 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 01:38:19 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v18 2/5] dt-binding: i2c: mt65xx: add vbus-supply property
Date: Wed, 14 Apr 2021 16:38:06 +0800
Message-Id: <20210414083809.1932133-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_013821_041701_97E8540A 
X-CRM114-Status: GOOD (  10.59  )
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

Add vbus-supply property for mt65xx. The regulator can be passed into
core and turned off during suspend/sleep to reduce power consumption.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194fdd0cc..2c45647e9f0b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -32,6 +32,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
 
 Example:
 
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
