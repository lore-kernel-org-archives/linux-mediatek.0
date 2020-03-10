Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D02C10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 13:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB8624649
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 13:47:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zw8Wk8HY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0Lf67OG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB8624649
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmYneUot9taBKuYAlEMqRgHYsCRmg3mHxUMc+qaSalk=; b=Zw8Wk8HY2iuiga
	9r1SvPEl1zQ1ks+vn0GhxPPhdvi1BuEXYwZba71ACcL3lXa7ueV4gRskdvB7pKhjPCcVI5ly6EPYy
	MmdzpPAx5dBPCitaYxbrc5MrzWwWzKJw8Ps/LmPYPBQYxoc27gpBDwS8cyQ/YdXD7vZy2kqH2rl9N
	hHvwzEmbDy8QbeyXxnKiFeJqrw/JXKGg5ejWfGPB0R9jP6OeMIUcheV4zlFmOAhypMqBEL+Y7yWwc
	0ZgiHcmwqOCFKIbDpVibYB3jMLMWA/NLPvtB6EQ+L+NqILIFH8hZjEwhcIpnhRHwpUed96+OGjP+M
	U/QK2JuShyUNu7VU6EEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBfEF-0005J5-L7; Tue, 10 Mar 2020 13:47:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBfD2-0004BN-PS
 for linux-mediatek@lists.infradead.org; Tue, 10 Mar 2020 13:46:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id a5so1480420wmb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2020 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcpWwT5ZMggrjSQT2EvWM0uaER77QpGrPnMzAFtSYRI=;
 b=O0Lf67OGqFwaUzOUsqZhpfQommqipqakOP9ukqiFMtg84raIJ1xhcu/+IgDx8RPV4K
 8sGGmwfwEyYWBBoLnALcEFHKAsJlvAR8AUBpDDqc1Lm9EUF3aj8f7fJiWrR5gjg7/gOq
 rdNrwGEwNZ8+iSNiWm7vrM5TV/rGUxpbIlBB19KI26agGyBQPCxL4shzzBLaVw8hvc6O
 yn46Z2IoT5cJV5/IuNrLSFADdgk4BeMcIJ4nrD5ct0TQkHaaqBx2pUE5uUWDhhhqIQ+S
 FZBv0A9zwwV1RIpj9EtiM8kK3u/WzWN55CqcszpUCNMng529s3Ad0kGSVdzklXIqn1VK
 dfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcpWwT5ZMggrjSQT2EvWM0uaER77QpGrPnMzAFtSYRI=;
 b=a2vAwk29ZJadQXjb1BjaZZEo2yZEt4CV145H5bQ1jSXAuQ7DjRLDqUg46VSS7YCT03
 rq5G1jo3zemhbCeQXypPermyPws6+2boPYhkzQq6bo3QF2OXuVCCFFiYEApWfTy+4MoN
 fAf3L5uzUjIoSBvu/dYqpr7uvEbU76VE3uDSnotCSRZGQfCdI2wD8p1fG0Gf3bfps1L5
 qJLLeimXG+Q61KGSmLbCp35Fo7CaNHzs8k3cCEIvwDG+pfwPPAJhgG1wtGOKIFoZ2UVt
 THUB7rxpp7DHH9qBD1wfTzjBLwrqzuWh5sCyzOUTjRQx/OT1fc7/isluabXl3Rc1OlIk
 +9og==
X-Gm-Message-State: ANhLgQ0s08Sm3e6Utny4hR1Fpf0B/KGiP7t6jXBcKezagGkzGjvTMbdj
 T0r6XgazqFsfWuKmNtmb2iU+0Q==
X-Google-Smtp-Source: ADFU+vstHBlerJtLLKmV0eIsOMnYH7m2KgACCake91JX7v1/q8QTpqLwfBfjOjRY02P/EWh99NEaCA==
X-Received: by 2002:a05:600c:22cd:: with SMTP id
 13mr2257121wmg.186.1583847971629; 
 Tue, 10 Mar 2020 06:46:11 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e50c:c780:9a1:8b61])
 by smtp.gmail.com with ESMTPSA id d63sm4074009wmd.44.2020.03.10.06.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:46:11 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
 gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: [v1 3/3] media: ov8856: Implement sensor module revision
 identification
Date: Tue, 10 Mar 2020 14:46:03 +0100
Message-Id: <20200310134603.30260-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310134603.30260-1-robert.foss@linaro.org>
References: <20200310134603.30260-1-robert.foss@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_064612_838028_D9F316C8 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: Robert Foss <robert.foss@linaro.org>, Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Query the sensor for its module revision, and compare it
to known revisions.
Currently only the '1B' revision has been added.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/i2c/ov8856.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 1769acdfaa44..48e8f4b997d6 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -34,6 +34,18 @@
 #define OV8856_MODE_STANDBY		0x00
 #define OV8856_MODE_STREAMING		0x01
 
+/* define 1B module revision */
+#define OV8856_1B_MODULE		0x02
+
+/* the OTP read-out buffer is at 0x7000 and 0xf is the offset
+ * of the byte in the OTP that means the module revision
+ */
+#define OV8856_MODULE_REVISION		0x700f
+#define OV8856_OTP_MODE_CTRL		0x3d84
+#define OV8856_OTP_LOAD_CTRL		0x3d81
+#define OV8856_OTP_MODE_AUTO		0x00
+#define OV8856_OTP_LOAD_CTRL_ENABLE	BIT(0)
+
 /* vertical-timings from sensor */
 #define OV8856_REG_VTS			0x380e
 #define OV8856_VTS_MAX			0x7fff
@@ -713,6 +725,25 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
 				OV8856_REG_VALUE_08BIT, pattern);
 }
 
+static int ov8856_check_revision(struct ov8856 *ov8856)
+{
+	int ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
+			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
+	if (ret)
+		return ret;
+
+	return ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
+				OV8856_REG_VALUE_08BIT,
+				OV8856_OTP_LOAD_CTRL_ENABLE);
+}
+
 static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8856 *ov8856 = container_of(ctrl->handler,
@@ -1145,6 +1176,23 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 		return -ENXIO;
 	}
 
+	/* check sensor hardware revision */
+	ret = ov8856_check_revision(ov8856);
+	if (ret) {
+		dev_err(&client->dev, "failed to check sensor revision");
+		return ret;
+	}
+
+	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
+		val,
+		val == OV8856_1B_MODULE ? "1B" : "unknown revision",
+		client->addr);
+
 	return 0;
 }
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
