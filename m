Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3041BC433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:07:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31DF2074D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/ntqmev";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7JfQloK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31DF2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxnBinH5WVGpJy5K4KSyg6stt6SrvMKMd1B+OJIdG5I=; b=R/ntqmevNzP1MxxcHuDMABGxYR
	lK0dYtsHEWtpG56K5M1WK9o1uOfXpZ1oZcB5pwxTEEfY1BkJX4ncMWgs2zllwCMxR2XU8jpWgwKVE
	d2yNRI+h+KYQYHpZyOU2an0CjnA5IBv+gk6Qixr1V3SOQIeVZQ55JX2C07EGb6T2mfRg5ZkGep1PS
	tfqaLTTU5FtTr9M7ixSUg3pc+WCVMrV9cSsG2YFtlrYi20H3mYO7RBK/FxOMK5noo6rgoK1vF1Sch
	ILPwxaHI2zpfS2IOzxLwAQFCHmLX6/VrbiiIalREkzFIavSNnAgRc/OGFZmK+M7Qa6ZUteNnqtmNw
	Sdb2//Tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA8Rq-00064G-3r; Mon, 24 Aug 2020 09:07:26 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA8RL-0005nR-Mr; Mon, 24 Aug 2020 09:06:56 +0000
Received: by mail-pf1-x442.google.com with SMTP id m71so4500277pfd.1;
 Mon, 24 Aug 2020 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kUkHyWifMBTnLUKfuOlzPEWC4L6WTYZmfRcQtW7YpF0=;
 b=Z7JfQloKaTjiT0H4ASAyjMkzOVg0yvKyOhrTwAaHBfJbVfCJcgfcC/td6BJwaNPz4C
 ff9ViiFoPralIJ8iinxqg7EGJesq/N2dB6tFIsnDAyq1IwXuvT2ySJe6YoK0eLBEko46
 0gfp6pg5DKGU5U+h2TigbaH1m/PVqGMqTfJSkcgUAduItvIzaIFLJ9uX00Yh2EHCHyBh
 YcrWAACm2yCl8VSUoxJh+oo406KRROv9VENVUPjD/59wOX2eXxvtyBY80Y7yo6BqS4t1
 fbMGY+0drYrqVOB04LqRnl/lgluQ/L7NZMK1/3dMZH0sBEJwYUeuJh0342DPyCrTr+I2
 kjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kUkHyWifMBTnLUKfuOlzPEWC4L6WTYZmfRcQtW7YpF0=;
 b=SRfRIS/BOm/ElNVHy4Ef23XINdu8Gw16jUvSfTFaXdKV42iq6ozzP92oVQpzPTNriB
 5pRzWpV9vOOummbTipVB9DtIRaxJzJ8sjGep5EStD/+uQMBwmQZwh5DJQ1Qv7cvGjchv
 QiPTpRfKO1xbUg/OBqYU73okMfSfofaBUGPmKalPPZ+EuVp8PN/SNLW/jjqBxuSuLMi/
 424oKFMtwZ6e/PjOFQScZtwflPFBix4FXUI1UQBDsrSs08sqllBNI54ORNhn3o5G3Cec
 uWuRNaq+TSYnbYWdB6AwavrLXw7f6PWiMlJIxctJuwnb/ka7rdlOBPvbxd0QK6uA+nw8
 L68w==
X-Gm-Message-State: AOAM531NSTHJUDy9z9vTwvbcmy6b7/y0WL3HobWgTFpABhY8u59jeflo
 2QgNqM7XN/K1yU6OjDSPoOw=
X-Google-Smtp-Source: ABdhPJw14xcNmXa1rR9IVlAIv+z1Xu6egOA/ZqBXZ3+NIiQOsygfcNGkj27A9h4zWhIQbWn+tiZxpQ==
X-Received: by 2002:a63:5c08:: with SMTP id q8mr2956738pgb.222.1598260013533; 
 Mon, 24 Aug 2020 02:06:53 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:484:931d:1b34:35e8:fe10:8c7a])
 by smtp.gmail.com with ESMTPSA id c20sm9220988pjv.31.2020.08.24.02.06.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2020 02:06:53 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v3 2/2] Documentation: ABI: testing: mt6360: Add ADC sysfs
 guideline
Date: Mon, 24 Aug 2020 17:06:25 +0800
Message-Id: <1598259985-12517-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598259985-12517-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1598259985-12517-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_050655_861227_0EE41CE2 
X-CRM114-Status: GOOD (  13.63  )
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
index 0000000..9dab17e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
@@ -0,0 +1,83 @@
+What:		/sys/bus/iio/devices/iio:deviceX/usbid_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 USBID ADC
+		Reading returns current voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/vbusdiv5_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBUS ADC with high accuracy
+		Reading returns current voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/vbusdiv2_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBUS ADC with low accuracy
+		Reading returns current voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/vsys_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VSYS ADC
+		Reading returns current voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/vbat_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VBAT ADC
+		Reading returns current voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/ibus_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IBUS ADC
+		Reading returns current in uA
+
+What:		/sys/bus/iio/devices/iio:deviceX/ibat_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IBAT ADC
+		Reading returns current in uA
+
+What:		/sys/bus/iio/devices/iio:deviceX/chg_vddp_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 CHG_VDDP ADC
+		Reading returns current voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/temp_jc_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 IC junction temperature
+		Reading returns current temperature in degree
+
+What:		/sys/bus/iio/devices/iio:deviceX/vref_ts_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 VREF_TS ADC
+		Reading returns current voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/ts_input
+KernelVersion:	5.8.0
+Contact:	gene_chen@richtek.com
+Description:
+		Indicated MT6360 TS ADC
+		Reading returns current voltage in uV
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
