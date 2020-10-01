Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B616C4741F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A01A20738
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOfqXS/G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQHAXcrz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A01A20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=215Cj1Kt/CdBxT55Xc8DDFahfev8DjiBLTylAWxOmlU=; b=BOfqXS/GWlChpLGbV2UOajt7/K
	jGNUBBobeD3hsHYXru9KCmNDQItdrBngJrQsTSfHXg5S/FgbiZYwwT1t9JO0Ej+/KOaVCYxoifTQS
	pMKv5ojOJTtMu9L4g94jZ/+y6ZD75jcQjgetBLeWy82VoeyN/3bXU98bJ+DDsNoNa7jRvSDTBLs7e
	CnWsALBPlcXc0wnSKJhiRBJNxx0cofQZDnw5Pi62jw4my7S4Ys+TytzUYFMJFmDzmn3ouFlp09Cqu
	bcU8xKDo4ms99r9826QLHAH43Vv9mNmBvWnLOUNGQpFkLJI5ioGj1vdxgj5p28NsFcmWbbRADA9C5
	LlZ2/AWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXso-00026k-LA; Wed, 30 Sep 2020 08:54:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXsi-00021z-VS; Wed, 30 Sep 2020 08:54:38 +0000
Received: by mail-pj1-x1031.google.com with SMTP id h23so554136pjv.5;
 Wed, 30 Sep 2020 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QIq5NQbiNyJNm/We4OObc4q4pfsVdMirm2rHEjG4Osk=;
 b=OQHAXcrzd8LKG1J6V1impLCbnRaHVbL7qYR9d0/Mjrf7JE9uHlsFYPaTmKzK8OIKvM
 wvUb4Cmh68mHeOonPe9bveNFrdQwLizIWVEjCZ/4TwEMBXc6I9ScHlEHz/gqcpannNrk
 TRUMf3q/dye/fK+nwktRIXM0JlPX9Q70emD2qqryaMfurw37lD09/ZV3HPGUtMmo/yo9
 hyZ8TgvIjpta4z8KQE0RfGrdFJ3sgh6nsnvBOwhUsWtwTOiISze954p2k16e7y1Xwvjk
 yrcmcSwJrQFTAdzET3OijUlQFvu/gxYLuM8B11c6hA67ehbelvLGuVlLVlC7SPWRD8YA
 KPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QIq5NQbiNyJNm/We4OObc4q4pfsVdMirm2rHEjG4Osk=;
 b=mrVb13v8Rz9aw2nAFiWm9X4Bqci7nTrHa02qQcAjJ7f+g0xVVk0658KHDj094L4Xck
 BdyKEXuVm57tBGt7VXa1x1O5UdKXfksuMqnARDAqjeMI05xoCvrlGR25IEnu6etpOx3x
 sUM/UmVmyFBWZQw1/AHCzsbQqMZMjiuS8MhIUN9tq383E1rz77ShVroIQVoQqwvvQ6d7
 /9NQzuFr8eNvylcscRGbFWcfyOo+O2yx6OkgZ0KP8C0lDloca2P2tA6Ih+S3fapCZabx
 h7QJeLPU23fzIFYoW3sEl8e1NuJWksHlxQVbvkhgw0oGiY90MjI+8Ss77n9vi0Z65nsk
 R/0A==
X-Gm-Message-State: AOAM531yO0lRc2zv6F7wRo6wvWuAVJjo+2HjipfMbg2PgheETeFLI46i
 PoNiwHNOfvbnoSeET8DLVQk=
X-Google-Smtp-Source: ABdhPJzctE4GAO7LVQF9oT1VdZhbDQAE3QngFnCJUtR2LAD1TOD4k2Tc5042Jx4xKxcErQJhkUiHXQ==
X-Received: by 2002:a17:902:9a8d:b029:d2:4ef:a1fb with SMTP id
 w13-20020a1709029a8db02900d204efa1fbmr1545988plp.4.1601456074097; 
 Wed, 30 Sep 2020 01:54:34 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56b:d17:8c76:3dc4:5429:d7e4])
 by smtp.gmail.com with ESMTPSA id
 x13sm1513938pff.152.2020.09.30.01.54.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:54:33 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v6 2/3] Documentation: ABI: testing: mt6360: Add ADC sysfs
 guideline
Date: Thu,  1 Oct 2020 16:54:07 +0800
Message-Id: <1601542448-7433-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_045437_062123_BF8756E5 
X-CRM114-Status: GOOD (  14.21  )
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
