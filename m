Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7583C43464
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7EC207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L0nAjndE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXV0r5uj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D7EC207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=215Cj1Kt/CdBxT55Xc8DDFahfev8DjiBLTylAWxOmlU=; b=L0nAjndENZcBHx0KNfoAaCdBhy
	au2UW/He5+R5uyffJhRLSaYuksnkYnLOXHIJHGfIHbr2ytRmZxlZR+ij5aSHHez7q4FpocslF0ueE
	swlak6pXN3zYzLDRNn9mni6h7qAJ3za2PbqlXdBQXgsGskk9+Ieh84d5BO/p2rILLr487Q6FeVx2F
	4HsJLU5bXdsCQ4kae1/wtLbp5Z4h/pYuSuKf6Dqv1i4OvDy72uvA1YZJq2tzsMtDn+bF3IAToPEAF
	LGn0xTpQQia4cFDKj+22cHVPT/Xp24vC2+j0SZT8rlRHwCUX2tg4u5p3bkt8Rf2SceRzdn1/C8EX1
	rVX51aEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJw2-0003DK-4P; Mon, 21 Sep 2020 11:24:42 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJvk-00036J-DO; Mon, 21 Sep 2020 11:24:26 +0000
Received: by mail-pg1-x529.google.com with SMTP id o25so3809378pgm.0;
 Mon, 21 Sep 2020 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QIq5NQbiNyJNm/We4OObc4q4pfsVdMirm2rHEjG4Osk=;
 b=ZXV0r5ujsfBgEEI1mQPi1uDFmiQWGZ2y6nflnAtdUj7oUDwMc01cIhgexwTptTXIb1
 DxnAnqtQa4C6Yx9AzxCUivwKU5bXaVy8YZ5U8ZJAipY6i8u2zTquar7Uyd+oqJkAWjdF
 oQm1+7bMKc4WZttqjl7tBUG/v98uYM/PmdCEvFvtM3jKUlyeE6YoiueH/YqE+KXyYthP
 hRS4wx8uNQxOH8N3AfJtumkQ7BlpOEY6SCJbTAUGq79LOKoDCF3pAyV/lFWKeyADZUPJ
 DvWlz2NAwvL8KfNFsREwIJpFcegfyhGClE9ShMZY+lZeFWh4aq8lltDck3XWCbTbpieh
 8g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QIq5NQbiNyJNm/We4OObc4q4pfsVdMirm2rHEjG4Osk=;
 b=cKxdkUowzaorIyq8w7l/v/BeokVYphGJwCVfbjJBiZTRS/7JcFnmJZm0Lrco9T6sXJ
 mxOOkphDz/gZcDBI789+aeN2AuJ2xbNKUvNlYeYNSS7MNKujCqwUMDywKtVTrEWa3win
 S6EDj/urmAy+wAg3NBDSV4thqf58i1OysHqq3bc2MVY2qDY5RUPmE16smCajyPO+B/vw
 CsWDcexg+ift0alTUuMjhx7GQhxg0PjxWDxqHwDqDYWbOT6WOiyLKWJFX0SY+QI06GT7
 XeF78yGkURynD45kEQ9J6khVvZoe7T8cYwJwudYarxV0hnUm7ZvBAatocSvyIY7uhmAn
 6oxw==
X-Gm-Message-State: AOAM532DbD2VLdySHILdH2ZQl1Hz0nv108SeZ7n4jK/ZhZ3tkn+6ADAN
 VDOtODKoIBG1Fhoi0wzGqiM=
X-Google-Smtp-Source: ABdhPJzpHl2i+Bs2FiYnb9x/88LedxgGsP9M0zGpxqxEF1D9DblywxDN8SqmtHED+a7Mw/T4Bm7zYw==
X-Received: by 2002:a17:902:9797:b029:d2:2a05:ceec with SMTP id
 q23-20020a1709029797b02900d22a05ceecmr2612801plp.4.1600687462135; 
 Mon, 21 Sep 2020 04:24:22 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:8024:8a0d:5d5f:6f8a:a2bd])
 by smtp.gmail.com with ESMTPSA id x7sm9978663pjv.16.2020.09.21.04.24.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 04:24:21 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 2/3] Documentation: ABI: testing: mt6360: Add ADC sysfs
 guideline
Date: Mon, 21 Sep 2020 19:24:01 +0800
Message-Id: <1600687442-23658-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600687442-23658-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600687442-23658-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_072424_501334_6A884B40 
X-CRM114-Status: GOOD (  14.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add ABI documentation for mt6360 ADC sysfs interfaces.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
new file mode 100644
index 0000000..e5a7b1c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
@@ -0,0 +1,78 @@
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage0_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 USBID ADC which connected to connector ID pin.
+		Calculating with scale and offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBUS ADC with lower accuracy(+-75mA)
+		higher measure range(1~22mV)
+		Calculating with scale and offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage2_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBUS ADC with higher accuracy(+-30mA)
+		lower measure range(1~9.76V)
+		Calculating with scale and offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage3_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VSYS ADC
+		Calculating with scale and offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBAT ADC
+		Calculating with scale and offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_current5_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IBUS ADC
+		Calculating with scale and offset returns voltage in uA
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_current6_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IBAT ADC
+		Calculating with scale and offset returns voltage in uA
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_current7_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 CHG_VDDP ADC
+		Calculating with scale and offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_temp8_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IC junction temperature
+		Calculating with scale and offset returns temperature in degree
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage9_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VREF_TS ADC
+		Calculating with scale and offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage10_raw
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 TS ADC
+		Calculating with scale and offset returns voltage in uV
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
