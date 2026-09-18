Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB684C982D9
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=; b=Ru9k6ZUB8DeBZob5HYDRt6vvn6
	niNvC+SrF/Wi1fMTDJq/34zfB0iaW7IzBUnJV5K7QrS0dyNdrtA2QgRbB3c80Nnkn0aVG484Eg22X
	Xaf30euRwBRULpDVPowxstEXJmGrXp7tXTemlODfCYOezz3HrZ+PW/NGf2J9C2GEiooCdQLBJgdgb
	LKgIodyk0jBsLGu1SKjHpL0BwJCmSVaylbtGITbnKZ7symHMkYtg7nuVPC4GnQli7qY2Nbof6EFnT
	sG2EK0HVwUoAYnpaN4yDWEsBc0Xw5LtcPjPTDgy2aRzHRxvPIBVqT+rqyjFtDVuqN7osUEHnyPjvh
	DLoLkVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OD5-0000000DIHg-1u6v;
	Fri, 18 Sep 2026 02:20:19 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OCy-0000000DIDE-2B5v
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 02:20:17 +0000
Received: by mail-oi2-x09.google.com with SMTP id 5614622812f47-4c9a4910efeso75151b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 19:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698011; x=1790302811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=XKr9tg39iIPjIpb0YylC0jpLwNN5LyfuanZY9Ub1ay20VaO/f5ooM294WroTns4gMd
         5HWGDaQvhYVhQT3s+nzwYWJvzT7UHHXqLI0nPqtluTOhNPE1Nx05oUHBGUyu0opBgdV8
         sVuecGikRHYzdPvqEwW7SgtzDUPLmg2jCIBGSC1ufunTkaUEH1fn/NwTdzX1JweZU2eg
         gkhhf8JtPix+Wgs2Oich3zpBQUsWSfoqKD4LbDxmlhTtktKPXTdteKn/BM4xc98Bqfye
         ObG5CmbXQPrAo0bCr2Q1+AnzksGdTpp1LhTYcOmHGOn+9dGDSfez07N5N/T+IDqUf2tZ
         VRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698011; x=1790302811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=KcS40W3Tulne5AB1NLa77kKDEgzY5BANeU+5ptwh9yCbQfiy+1vwUF8QPVm5S6u7qh
         tfRfuGtEsqA4Ltkjk3O5qiRMv3IT+Jx5DUvoL67yV4yJ/mGwbc8+qOGEk9ewXuySv40t
         b/RV82WxS4cYJw7IV4S0GlA1wr0djcoGabGTeSmCBhemQ0kQ3UTNG4wsB0kXsBUzoBwV
         IU3bbnqt/HaQkReuJsCbh360FPfr2SgsDqJCsYPc1oNcqzx+C0jG7Tah1lKG2EtRFqCw
         5IrNxOtpa/gycAWyEehsHC/jQY1lsfZUtZtIorMbzNoCXwVTTEuc6IK9dEWRDNhDqC6F
         AHTw==
X-Forwarded-Encrypted: i=1; AKwUvBzusrYZrPo3qF6RmlB+iBqMOomnuPONokO9C+qsMzRqL99WojtAT+pTCBhsLPlpOmvLillJoSm2k/BbJcqGjA==@lists.infradead.org
X-Gm-Message-State: AFuF++k/G5B2miHxX+qpKl53VTojwqlIgUCA0TtCIusX4RaVyIZp8ukR
	FLkx8HZsAUJq/60G0oHGDgoiMSuEDamyQ7lPVS+0cwesw3e5rcxNDnoh
X-Gm-Gg: AYBFou3d8kLspJAnQe4a6Ny/tALB2S+sdaaJacSTl4dZB+f+Y33mOpGKmi1MnVSWUxq
	myd3xlMDSmAC2jg3P6NAh17RmKOBVatNxKlUdj6CgVw6qw9EARt8KOwVCwkkwCuj/EEIIjRUnqK
	DZ82lApfzU84QT/L4vVV7y7T6xZk90MffNZUZ73WXHOzTu88VIduf42D99azCd8Ox6f6lmqXqZ8
	6v7aPrF8WVOLq6Bv/FseyyCwX1A0yaHXXxDojSjl+iYaw3BFhiC3syG0gzXu29sjmH03ulVzKRq
	46M4DIZ1MhQMFbJ29frDGqEDUk182lfnHQNcRsinEuTYeXlAJmBw22PpmmIUQ9RRcIFbSCh2NvY
	JeqJl6HfW9XDuCXfnXk1QJNa9KEbSrVbYdcwibfumsYGhkDXf51wNdFa+kUnLrkycNp2tP6s8be
	I334E5o+APapfYqlxKlatPUzyDo5iMtt81bmq5RUpgIlgZ1wtrB+FHKyhhwf8+Qnc6mg==
X-Received: by 2002:a05:6808:3094:b0:4c3:2e7:55bb with SMTP id 5614622812f47-4ccf977b99fmr1600319b6e.38.1789698011513;
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:50 -0500
Subject: [PATCH v2 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-1-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=miNvqU66NVjsZoTcnVnB/kgVEaxWAqjFh9azbHOFtnGSnkRq1eftd6rcrmBB+2/4rlXYfBEUw
 Zyvg/aMLPnkBOPbEyLLlzDeEXx4kS9ytIIdtF8pPiaejam11tPa+fMv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_192014_102298_2D9E958E 
X-CRM114-Status: GOOD (  14.54  )
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
index c2414447892c..41d7b3a67415 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16713,6 +16713,12 @@ S:	Maintained
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


