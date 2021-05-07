Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1C3C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:15:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D7461468
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D7461468
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kt8udRmXOx9FXmOE00uN9tP1XFTxFOh4ZpmPVLKbZHs=; b=pcQu8xr+jvYC/SOEsQdRlmkWY
	ZCStQzkEyznVsRNwcxdJSFnFvtIU997tq8yNHxVcMM9nYzZCBw3l+kz1uZnCKBWv0Md7edvoRq8FJ
	mXABJMihftSijzX0yprDp6mr8rLAAdKmMy8w9rNZTlrZim8kU+B0+zV3wLJtBPShci+zSh5c3s+68
	EPw3dAOFalPwrJNv+mQ2Rlqjhe4tLqLHO4CEp3qttEHwWViT/R0XkwP5L46Y0qS5GOmDbqAk6WItV
	chh0ambVQ+w9sSCOSoRn8/dt7uHGnwCpWJkwnI/5sDxaIemRBR3whtJBfJO0Bex+Z/Y+qmx/eKA6x
	FgerzRGzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0JY-0077tr-M6; Fri, 07 May 2021 13:14:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0JA-0077px-6F
 for linux-mediatek@desiato.infradead.org; Fri, 07 May 2021 13:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Z5uRcm+z5t4aeBxWsSjq74fZr3pDWXQjhRR69I0+uIA=; b=bKQzb+dzAxlJ+33vwfsIXQK+3l
 9OkDWcCIrwBp4ZSR1nsRpyoX30f1htVTvXeXg88qUaqmPmh5w0V9SEGgsPpUlWAHRRj2cBmSg9cJ6
 qA6Q7dyysPiCynMhVJzdD+4pfLByGFUv4rqUUJDjWh1B7muCdpVxhz24oMbOE78mjH+OwzK/nadDi
 8u3I1EI3GeIG2d4LnIDHSd5FQxdfkmk0FW2vJFZ85pfhuLf0/Iv98gyuiDzI5lK1+hVtXXWasZi4E
 8D457FMXl4Thvx244ASryFy3Y7TUgjEWVhyOnQ4jw+cxusKmMX4Eebcx+ReB4iECndZHv8QQ+fAQy
 XAW6fDhA==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0J7-006sYC-Pm
 for linux-mediatek@lists.infradead.org; Fri, 07 May 2021 13:14:19 +0000
Received: by mail-pg1-x532.google.com with SMTP id p12so7101419pgj.10
 for <linux-mediatek@lists.infradead.org>; Fri, 07 May 2021 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z5uRcm+z5t4aeBxWsSjq74fZr3pDWXQjhRR69I0+uIA=;
 b=H3z2qCoLD7IfYuyroPiDy5fAoe2wbDqn1Vnl1mTG/23sUSa0pIb0dBthqVqkDnwxv5
 +gkIBUv8mIFN5pvK/ryk7yl35ZYzq+8nnwQcXY1Bpe0XvVy4vkIQdRhY7J5N1+YssF8D
 5HxJZYjzDawin42Sq91HpOpWvSq7lxCu0Nmcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5uRcm+z5t4aeBxWsSjq74fZr3pDWXQjhRR69I0+uIA=;
 b=Kq45p4qttc1suuY0kGrhYSJHYhbVGVdP1W1aIWKfmNgRcItASTFgj/FpCNzZaDRTCR
 neztlhQRPPVVbdyMkRtaDh0HTw5W96QKXBoy/3RRKANoaSuLL21e7xR8QWD89X3+dIqh
 KKK0yw7bxMf03FlHhyeVJYZh3ZB40o9X5xDfrLsZnu8+tlSxDa8zG7Ea96ybX0RnsbeW
 A/sPzwiDDbTqIVJYtu7WWlw4/ortjC0C41fRvAkkkHwjByhT+0RYrCLm0hOpEzhntUqF
 puBbo7x6aHi8qZmUNzaCDH2y++j68zhDlPJmraNl7DTEC3JeYkn/+FC4bNIQNu0SkwBK
 G+eg==
X-Gm-Message-State: AOAM5335kKZi2BHM5bHXuXiHPZ/v61SG/qjCZASbwbZUQULxZCdssGL9
 OECw4y+LWeqgU1MgMiX5C1SBRA==
X-Google-Smtp-Source: ABdhPJwXgl15gc0vRklpyyJcdK2f9/dPf52EGEjnqBHI+xiQ73HrxYgQkGwIjLYder7XGpt9XbxDYQ==
X-Received: by 2002:a62:3106:0:b029:25c:cd66:3be1 with SMTP id
 x6-20020a6231060000b029025ccd663be1mr10438925pfx.29.1620393257211; 
 Fri, 07 May 2021 06:14:17 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:711f:8553:a124:a19])
 by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 06:14:16 -0700 (PDT)
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
Subject: [PATCH v21 2/5] dt-binding: i2c: mt65xx: add vbus-supply property
Date: Fri,  7 May 2021 21:14:03 +0800
Message-Id: <20210507131406.2224177-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_061417_852794_B1BF2357 
X-CRM114-Status: GOOD (  10.40  )
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
Acked-by: Rob Herring <robh@kernel.org>
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
2.31.1.607.g51e8a6a459-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
