Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBCEC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 08:09:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5DD222E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 08:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rBCi1U/3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3q4WYBX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA5DD222E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=215Cj1Kt/CdBxT55Xc8DDFahfev8DjiBLTylAWxOmlU=; b=rBCi1U/39ffcfuTzNftcm4qvx5
	Ojh+m3PTczMqtWxS/IxS5TtlIBycj/H4unmfLpSDptGbl3IdSbUX586agK+x5HIbcKBJAOGkEvMe7
	0pgc4Atbv20C9o7oo6+tHN4kEylvU+pIXRRcLueMWvvsW7CC08v89EddpQRX8JnJy9VaCNZtrQ/6n
	rHI8zg4E3RRMLtVQ7UFa535lRZ666+aHZ/nZEjA63FGryhbqyXcp/C8k84w+NBnWcShHC5YrKO9Z/
	oIUK9XnEaqbFsdcyp60GVb8WMPdP8/Bh0uQceGF79g/C1E9tvHatGx23QJmtJvXWepH6eGp2ZaTX5
	rn8kiL0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUmhR-0005I1-BL; Tue, 20 Oct 2020 08:08:53 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUmhL-0005Fc-1L; Tue, 20 Oct 2020 08:08:48 +0000
Received: by mail-pg1-x52c.google.com with SMTP id h6so619090pgk.4;
 Tue, 20 Oct 2020 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QIq5NQbiNyJNm/We4OObc4q4pfsVdMirm2rHEjG4Osk=;
 b=r3q4WYBXqjYqIQt7imcslM6KvEym12F1IyuoKZjmDVOl2IKrLOeNDdL+26hswkpVJi
 QTJ5aIjpkzLjkXBpsmAlhtrOaTxwOrI6pREAhyXTH9+++2EefUDoYW4Zjm5BgssjOlza
 /fCQSc+ouAW+HTvX5JswVnA5eFeGQZkkXuSEqPDuqly2KvtWmQuH3BV/oWrxjOccdEKH
 AoZVkiUkPy7p3is3jEgIZSUdBBje7v4XGLHg6D4Q4AK6kYXFrrRN2GFUUIV3a95mSyIC
 +x3V6HfRpP2w90MYpjTaRgUhcoIUcup6XWVLJ3Du7VHoPAGq9u2dZCUq7OAd+Eo4qL2Q
 zZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QIq5NQbiNyJNm/We4OObc4q4pfsVdMirm2rHEjG4Osk=;
 b=fs5a9d5M3bg2BbTjk1I7CRF+hVEl+21NRDp1Q3lGlUKO39/ya+/urASO5XteKA5gTO
 K4Cyhk7/x/7TBUPDtTAc9wD8NBmS7tG2dEaab7g0OKQ5Z6w26MB6lrecHguUrXCX5RO5
 gOg+fad92yN7NK/LzuNRwvmHSj3uu56CrErrWrxCcoBoe2wAkU18VPjQo64H+ixqPQas
 y556IK/Ot5hZ8bHrN7bzKm/Zr/qcOKgdjeNw5FZx0MjwRTwww9lVwSWKQl6shswlMUgh
 QC0MQ5T1/3Gtncf8K8x8ndgPzAza/67/G/pdS6rxrT/aNeH12+PpkWNic1F9YJb5nIF6
 L7Tw==
X-Gm-Message-State: AOAM533ksTKJQ4JuPR5uAqOYA+q8WW+bisG0kKfaapXCE/1JrAKRyKB0
 5mkRwCINO3j3kP08YHL3Evw=
X-Google-Smtp-Source: ABdhPJxGqymkIvPAHuZa2q3G9rP0P3v1Eq3DXNisPTkZU7yAKX9m/0/stwCYzs7WR6KIpC89TA7g8g==
X-Received: by 2002:aa7:9299:0:b029:156:5edc:a506 with SMTP id
 j25-20020aa792990000b02901565edca506mr22385pfa.52.1603181324717; 
 Tue, 20 Oct 2020 01:08:44 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:477:195c:4b74:c749:e0fe:9e69])
 by smtp.gmail.com with ESMTPSA id 17sm1347270pfi.55.2020.10.20.01.08.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 01:08:44 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v7 2/3] Documentation: ABI: testing: mt6360: Add ADC sysfs
 guideline
Date: Tue, 20 Oct 2020 16:07:46 +0800
Message-Id: <1603181267-15610-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_040847_383045_3A2CAF0A 
X-CRM114-Status: GOOD (  14.90  )
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
