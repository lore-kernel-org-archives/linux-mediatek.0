Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CFAC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:37:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE5E208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2WJjtz6t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW+2TlyI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE5E208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkftSVyCnB/VGVKThK1beHIWSi+n5+mB7NEXaudtyl8=; b=2WJjtz6tE97wEPqYl1t4qJ1wHJ
	3vLb5OQFAFLY5FTdUtvmFmeVTiFAzF2kdWumUuVqxAsLIwkM66jB+OTZ5N1QcvDJW7CDCdqbwo+y4
	EahceqJ0cz107yWjb3JhmxXL2jfhyWw26+33YesDQcT2X8Y3ecUNkLIXfKUkhUYKGuVL0a2zHmAsG
	nK19rA7iRnwH6kCimIAg0/kSr9UPd/Tno8CyFf5xRqcI1Hds9kG2teM0w9lhVhDztw9M21kB0QQ+7
	boiOnvBoLZXeGbgS0rGtbT83fSUext0UpEYV9DamBPN6c+XYXOVv3HvM1uojjpywDwoeQki2PayKX
	BmAcxwJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIEt0-0003qi-3x; Tue, 15 Sep 2020 17:36:58 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIEsR-0003gK-V0; Tue, 15 Sep 2020 17:36:27 +0000
Received: by mail-pj1-x1043.google.com with SMTP id md22so273588pjb.0;
 Tue, 15 Sep 2020 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2sltQ7OKUQCVV9G6bV9rSI99zwdlgVY44oFadVRn2CI=;
 b=eW+2TlyI52Z2+6zFckoS9vSKzJQkTC8U3eGSz6j9TYGbXFJOkHEAuoCYJGN3+JxY0b
 XoNwtfI6M8RaJU+B1imCAwaKqH11dmXfKa/Oqm1dQlrXOHdPzYDo6bo68WwB+k0FnHqa
 R0oLQ6al9qZvD/Zje34CJUuoihUl0SWdn+W77zqydjpQZHVkeB06LBgashDJxz1dKSw2
 lIsPy20LfMPxKqMoRp2Y8+EOgNbGd2mT6aDrtG/O7eOqHBs5wvejGjFetZ1YKpXoEmla
 4EHPv1mFhUKNjzpYTe+9/C/uMb67VGZ8w4gviB26VVe+xtJTaPX9Fk+3lDV86911mtpP
 Hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2sltQ7OKUQCVV9G6bV9rSI99zwdlgVY44oFadVRn2CI=;
 b=ujv9fwj3wtrll0+SO98qAwyzfvtVcJideF/JcqKokBwTmnbH1fBQ7m2gsO1o/R7NI7
 9AIddr1WQpA9wRuoYDxBG3RWZoxGWed/DPvfkTtoLe82OhHQl6Nu7qeAeepqkJq6pN2g
 YBojsNLYOch3S1t3fonBuoILWYDu6PCgJxeXhor3/CUPLzMNuBzcru0FbMeCN9fAQtd+
 dSe6IbsWPl2M2daTT/HBV8S+T6l7Ykb/NVUue/U3RCsaQTFDhoi5gt6Pq4xdrxFeTQOu
 Lro7ceg7EHBjqCEXGgRmC+wJ993AgDkyYJxBZ29m38A+ri4Cz0WskuVHhM8LwrHUrkly
 XcBw==
X-Gm-Message-State: AOAM532bHyXQngLj/kQfPOnXRdAlP7T0KvB0WNZleCq8uSj17D3rvWAS
 n/x7gciy2pLpWTD4H5P2wzs=
X-Google-Smtp-Source: ABdhPJxae65aUF7nfySsPxANLHHZDhUaN/afvD7KfK3E+LliiIToUIYO7E15PckHd4LN3F4q7vFYtg==
X-Received: by 2002:a17:90b:198:: with SMTP id
 t24mr407317pjs.107.1600191381819; 
 Tue, 15 Sep 2020 10:36:21 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id x3sm14025926pfq.49.2020.09.15.10.36.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 10:36:21 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 2/3] Documentation: ABI: testing: mt6360: Add ADC sysfs
 guideline
Date: Wed, 16 Sep 2020 01:36:08 +0800
Message-Id: <1600191369-28040-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_133625_372831_1FF98C8C 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: gene_chen@richtek.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add ABI documentation for mt6360 ADC sysfs interfaces.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
new file mode 100644
index 0000000..4b1c270
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
@@ -0,0 +1,83 @@
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_USBID_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 USBID ADC which connected to connector ID pin.
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VBUSDIV5_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBUS ADC with high accuracy
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VBUSDIV2_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBUS ADC with low accuracy
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VSYS_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VSYS ADC
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VBAT_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBAT ADC
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_current_IBUS_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IBUS ADC
+		Reading returns current in uA
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_current_IBAT_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IBAT ADC
+		Reading returns current in uA
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_CHG_VDDP_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 CHG_VDDP ADC
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_temp_TEMP_JC_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IC junction temperature
+		Reading returns temperature in degree
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VREF_TS_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VREF_TS ADC
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_TS_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 TS ADC
+		Reading returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/timestamp
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 timestamp
+		Reading returns current timestamp in ms
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
