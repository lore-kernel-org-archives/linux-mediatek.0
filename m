Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D248ECA5FA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=; b=BL+zg6kK0tzlv+2k94jcgC/+ai
	R75FbBBamqqIiF9TyTzFNPRKEq1UeRYKuHUmn6hYnClE8XxV0Tfhm8fgLHlkYdLojCwMU7/VPEuBg
	33sKb/cF4JYZDXAnjbYsyuGMf+030hH51TV8zEch7wa9EVvCrA+e3FXcpDHsITivCjgz3vDHZpm0D
	6HP+u8Q73jB0t2cw0XvjDTgx+D+0UQriHYYOp9DEXt/RGuHLoJHIV0B87f7f+wZgLJ6dcbzrLfG3n
	USmCsP1AifuyedjCAE8E655zYQoVaU0wGS5rlpR94pikIYGMmfhCzFejk5QYu7HywU+skcnWSyFMl
	7tqS/2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIQ0-00000001dQV-21aO;
	Mon, 28 Sep 2026 20:57:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIPz-00000001dOq-0AV2
	for linux-mediatek@bombadil.infradead.org;
	Mon, 28 Sep 2026 20:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=; b=SyjLdzaZBS6Sqn+0+QwLpboyO+
	WPPb1BVVUCb7K6W4t5OH3e0e1xEjkQecaeMOMyxoLVu87YqyE40cuUMPwwCOo4NtF9AyHL87rCBWM
	U72WRNSQWBdS9U0VaJ6SRJhpID8xEvGwhVNAWzHgltkaNsTpxoIKVh0OB5LH0m/M7Um9PrGBlit1K
	8ZEsQ8h6UrPke7hiLTQHTFoACK47m0iU+88zcYAIWp8RkHY9an8NoZ9kNvPDILXwiO5B3+0rAD/uP
	3qBJZ65pp1VKcNgU03VfFXgpyClTREu02dQ3HLJ592wL+epn8Kf1PLibv55Ta+3G/DaTnuKAaeR8T
	rLpsiFlw==;
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBIPi-00000001tqV-2Y1C
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 20:57:42 +0000
Received: by mail-qk2-x08.google.com with SMTP id d75a77b69052e-53333a2f1d3so5450341cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629048; x=1791233848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=UsOa+bOuQ432yEmf1qXpEuljj6WxMjTX/hp9UZdVVGWm1IvcXg4Z8jWeRjQw3LBndZ
         jd15nO6/OtMDY/ZkuBfvx6Ic1QVaEQDIUENRMMk45CBuO7mn9mjg5/hJE3FA1/+k9HfA
         lTfiFpxc2HMAoWjIARikJRoAGOxp/iMqMZY4QUi6u8ixqO7rN8nNlzBLCkrw38KiQbh8
         VXWl8wjP0xXaZ2MP5c5aAYz06AhpvGc+RZkNJ04I9trLSORc/nn6BwiaZJT6zujmqyg+
         irHiodb6tYTlC66pMCp919KGiLiMuPEB6iVSrX0hMrCRCFturOzD3VckPuAlOGC6wuz8
         oLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629048; x=1791233848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=w+RXKD1pwWqw6/sQm9boDzEzm4+ktrEQPGoS4wrc8vNwy46bKjA/RCoFV/7OLeGtlq
         I2b8yqtUuqUrwoCWaIWCuNMpVc37awt8OXOBMiGX9KaDdk1mfmVbpYH9yvWsMJwGaX9s
         DYKa0GtUD++/BRwr/wLXqnm/fqQRYOmUNUL/sI4ju5KWUV9DNtBDU0tePcknsTg1ffbz
         J0d2qRL9jeDrYDBVuQeEFXWS1miuLEZyQXO4qL1qMgQYby3xgNh8yA4nQPXUIkpMXQV6
         tzCSvwtZN5Af7bD/jAdc8y5PaymUiULrBbujCpD9uqJfBHAl1egUIrui4RlvRxYYBigB
         d24w==
X-Forwarded-Encrypted: i=1; AKwUvByWvV5Gj7lhwRrHobyNjc8ReXeLiaIB4sxIzxKAajUg6ydRcx29YdCs5fFvIDeKFNsIiHj3mjTkEKSSQtS5iA==@lists.infradead.org
X-Gm-Message-State: AFuF++nu4Em3bseU2lg8q9amzDH4bu+LSCqUEOtpqzTaAWEUoGV6NuGU
	Pm84durX9quwjW5fu/3wAwrxXApmtn1KNN5UoXjZsvf2qNtvTn0Vy6fv
X-Gm-Gg: AYBFou16z1xZz/Tt+a5mBAvX5micwV5UG4n6waww8NWKyF/yFjIQzXJ4Ggc8+xjtWRW
	JR3egeFw154UgQUmEeSGLABtLyTiNhJtHfTgrIXM9VHfge1CU8PsVgqHGkpZ6KdbPkV0bEIdkTZ
	BdhMH8Yhykxhu9Y47uKUmlnW5VE3fITLsaqcWhRTVbUURNOfzLPokhd6iO9RwKzeTy1KxvMQlT4
	rRMFBGpCnEdmvryltj9AhpGcWMoFSC1SEpQtfPsaV/riyv0vJp0hJgceq/rJVaUFziutVqR6vQF
	2xOLKOtsKP+j8D7ivjOV4FU9XPFgXLInNcJqBorLSTdUDzoYxpyrbjx9z0YQMO6MA9UIVfkFA9P
	/SnuBEChLZe6Mr9Chca257PKIp3OMLuLVXdmBSFP1pyR1yWoygX/+3/g84/oH/efDKTO8XcpZPc
	ICcOO1nA/aBbk4+SAftK8xGtM04Vw5S04A2RpV4UScQzKod9hp0E3zL37ZjKGcLFM6h+lXKG2j0
	y4jXSSpDuLNOWN0ibliyGJ1hX+Yg6kICBbU3tc3zJeqrmVKTVt9P6b+w+tCO2Y/7vAJKSTXTcw=
X-Received: by 2002:a05:622a:258d:b0:533:2daf:c0bc with SMTP id d75a77b69052e-53357e0f58bmr10788381cf.0.1790629048636;
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:19 -0500
Subject: [PATCH v4 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-1-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=2834;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3JnyJKWel3/w3iLfxdhp8EfzhB6f91NxerOyNOuEJFg=;
 b=mway+9YBw+26uBdu0PB7mYGQXaUGyQC3x7jQ8ufOCuQmaNxG0dcH0uwuFpe/vq3Gqb4sxO1sb
 8lrBzk4tK1SA9ZB6wmkNkdeNoWX2sQSqFh2yshcMGc2zdcb1kWiQ+rA
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_215732_044011_D3039C5A 
X-CRM114-Status: GOOD (  16.89  )
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

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Assisted-by: LLM
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..c8cef3bcb7de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16715,6 +16715,12 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0


