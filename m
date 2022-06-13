Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBBFC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Y47W8GjGemFqrziLu2zTP0UDq7GiXBfSlIAWHRaqG4=; b=m7L50iChvEq6fJ
	uojcwkdN0UDkvciijInDAhdVqznQGWymVudaRX3yGesBrMwms/9MGj55ieVC85rq58f6QnF7hSXTL
	Pkl2Sbui56I0rC2AlhAgaBZtlxax/zdE2ChRbfcPW5wE7ErFpJn+qV/h3t3OZU2PADLoz3JV08th1
	5DkRaodu8l0zlnfxr/dxrr22FU/AA47AnXUEUtwaioIV48a3phFp8nb0iJeaGSYOazfBXQddbf74G
	y5eUtUPdqQfOWCpTvVLFe7tjYRAHCURtIeJpt1ZAmNk2wClMrkYd0/fwjsNkw3aHu0Q8oIqW6R5Ye
	60/UKQJNNHN3S2/oxIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i2g-0037dq-Uy; Mon, 13 Jun 2022 11:15:35 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i0S-0036SG-Qz; Mon, 13 Jun 2022 11:13:18 +0000
Received: by mail-pg1-x544.google.com with SMTP id 129so5257536pgc.2;
        Mon, 13 Jun 2022 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hf4jIbSC0d5YY8s9rqomM6DgVm8XNv+YrOYwUOgBoNA=;
        b=LXWqlDW2i8o2CD+D6fikYhundWq6bCB6giHGiPurlzrtGHlwsplK3mx8a1NdxqTICD
         wQUiqLRKDT8VJLctE8Qyo1+yYsGZFNdBFubmnLWippbPRgB6MF9yVDZQoRuKJIdueXwO
         FM0jRPYl1fOnL/6rWLdXogGSFa2a5FpcWfZvQwec1lfsdVIoykmgXW9fd6LWHSAckdDP
         uxwPG0WS7/ESWkyuaAWgiASgRQQTdn9KLVQX1N8MvZI5kykft1vw8fvoOyjrwfEHNHKq
         p+yMOHkQEeFAkgJboqBBrgVM9NFCYLmM+itqsX9KU3HC5HJKe4SKoCUiaIXnJh74LlB5
         p/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hf4jIbSC0d5YY8s9rqomM6DgVm8XNv+YrOYwUOgBoNA=;
        b=nfo2FUMvKUJmhOVYqPriV734IopxLAj2gadFSEiuSji5jvnQCQ1aizVuq7fY63JWOM
         SelJ0g4IMo00tdCZU5H08p4ZIUZJZkoilOOTPG23H3zJ6XhSrcBir0KU3OXYTrgjsQ4e
         t3S7FiDg7e0Hsipzs+satN7oKWZQlg1zm901GyJWFP/h0fr1LVV/fDPA8rDTmUmSI4i3
         7G47ou37NodwcRVfBBb82IkLrs+MieBSgWj7EfGomeOSlRyfLkbboKC96GNczRxA2qw9
         OoGQPKcv5c/jVbsP8O4uJ1q4bIM1INZGbYfsu/3mAETqz2nCvYIhfVg5BNSBTuAT0XDE
         pK6Q==
X-Gm-Message-State: AOAM533qMbGwgXc6NgMg2qnMydbbzPMcUqjp8RF8VISWTHLxAlcMW0U7
	fMxadJ1pnefjM9gnd2D7ZQ4=
X-Google-Smtp-Source: ABdhPJy91L1cAhQPwaeU8vYLmrVlKb6COYEVKqbPaII+8J9gUc3Xz+wkNkvJMcJwWCAFDLtI1fb5tQ==
X-Received: by 2002:a05:6a00:18a9:b0:51b:f63b:6f7c with SMTP id x41-20020a056a0018a900b0051bf63b6f7cmr47127824pfh.49.1655118796098;
        Mon, 13 Jun 2022 04:13:16 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net. [42.72.115.109])
        by smtp.gmail.com with ESMTPSA id g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:13:15 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	matthias.bgg@gmail.com,
	lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	ChiaEn Wu <chiaen_wu@richtek.com>
Subject: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC sysfs guideline
Date: Mon, 13 Jun 2022 19:11:38 +0800
Message-Id: <20220613111146.25221-8-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_041316_895512_308353A3 
X-CRM114-Status: GOOD (  10.23  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
new file mode 100644
index 000000000000..039b3381176a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
@@ -0,0 +1,36 @@
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage0_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
+		higher measure range(1~22V)
+		Calculating with scale returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 VBUS ADC with higher accuracy(+-30mA)
+		lower measure range(1~9.76V)
+		Calculating with scale offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 TS_BAT ADC
+		Calculating with scale returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage7_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 CHG_VDDP ADC
+		Calculating with scale returns voltage in mV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_temp8_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 IC junction temperature
+		Calculating with scale and offset returns temperature in degree
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
