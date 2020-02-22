Return-Path: <SRS0=+7pC=4K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625B8C35666
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 16:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13815206ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 16:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WfAsgS8a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKfgDHPA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13815206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nqRr52CD3BO1Po75ntTuxUAQAjlIHuEkg2HfQdj7AZo=; b=WfAsgS8aHzyvX3XwDEkLb8gQMA
	o9Xw5MeyjDzwQZkmYgwMBiOPZP7VI6no3s8P21aPcaMGZT2cXMskHDtJQrBxAW3ZDwVAo151NnF+G
	4yuzOBGifciUyGd03yzN7ontzXZPY2vic17KHkCyaYf9qrUjO3oqxmN5pkmFIGDEpG2CNDyEAkZh0
	z5lJXQSPHKNLSRu7WJ/tn/NH0oESvuzJznDAZhOIb85kyXZesSwm7X60tEiNo9AAilDPA2norSwb0
	oybTYM7kJ7sAwUzU4eobx0+2JFBRN/AA6YU0qmWcNU03tIhstsc78nMDPp448obT91nt4GZMvLLCH
	J2W76CPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5XbY-0001eK-2z; Sat, 22 Feb 2020 16:26:12 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Xah-0000k8-Iq
 for linux-mediatek@lists.infradead.org; Sat, 22 Feb 2020 16:25:21 +0000
Received: by mail-pg1-x544.google.com with SMTP id j15so2637310pgm.6
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Feb 2020 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QZ0XPHrkGczK68VTqBdi2gga5qCDB/xbspdRfUcWe3Y=;
 b=JKfgDHPAPplpi8yLoQ8LrU7FuYC9H2z0fll1FQAjYKjGMPvnAfFGzgdvzd1dv7nKHB
 qqTnBKegtVbF51wnpByFo6AesU6BZu6o8rqRedDZLOan/KiLvEOqnU+P5BOBNYVaE0h0
 KJnwe/gQX5wvwIK53GfBCUJsE0DtaDLmAJ/ywAYNTAwMHfZXFTnUFtkfeZlT3+LCK/R8
 fRGsx8iFnxhuJU9Z/YbQV+PpT6hnsZVZ9BRjT/2WpCsCkORzG3l5taWKnxL5bkWBtrTm
 6poQqzAdbu3cpi9SZ+IXeRex5Enravo9BgL36LxQFLIr1sQpc/I+hsiwinLvmh4Jbm8t
 RONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QZ0XPHrkGczK68VTqBdi2gga5qCDB/xbspdRfUcWe3Y=;
 b=cHLfa7zPm4E6ZoG3U67CrbphjhX163fQqDjsO3IZlYNKq7r0PQAJu9wY3Et4KAK1cY
 bOjqGLNvcqzWFyFbBraaZqDYaFV1iuOb7YDN1FaAsYwGoZSz7kFrdiXB8Nov4vE61KjX
 spBfOsxDvCEbQ3dEKn8HrI4BSN50a9z77uZFwicjAeFtyEP4oaSM/8hkvU8QS0ouxAS1
 VrPYS4CtFqHKhVL09aykLjI7EpBuexdCeMVbNEynaaCLGlkkIW57UZxm2B6/Zibd9oCj
 XiwNyFwGDrMRGLLQnGdOwtMXEdp4w7XAayIBJ6GWwAI4eW9ZLx63jtFo/H7sx+twUrwN
 cm+g==
X-Gm-Message-State: APjAAAWanTsv1TSTeTYSS3htOm4the3vtYlO7doumYMrfdnS700Ug5tr
 1RNLjV1nK02+8JAfgstGRmmP
X-Google-Smtp-Source: APXvYqwCNJokm7CWkuaJXTaW+Sp3pmLJBq34ZkBB8dcrtjSvqVAQjQaPEdtOdsgpQnUPlTarUqq3TA==
X-Received: by 2002:aa7:8bcd:: with SMTP id s13mr44039192pfd.234.1582388717854; 
 Sat, 22 Feb 2020 08:25:17 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:801:b38c:89e8:305c:23c4:b77f])
 by smtp.gmail.com with ESMTPSA id q17sm6851296pfg.123.2020.02.22.08.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 08:25:17 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH 3/4] arm64: dts: mediatek: Enable I2C support for 96Boards X20
 Development board
Date: Sat, 22 Feb 2020 21:54:43 +0530
Message-Id: <20200222162444.11590-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
References: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_082519_755661_A26047AB 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 adamboardman@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are 7 I2C ports used on this board. Hence, enable all of them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../boot/dts/mediatek/mt6797-x20-dev.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts b/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
index 13939d55b85b..eff9e8dbd076 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
@@ -28,6 +28,55 @@
 	};
 };
 
+/* HDMI */
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_a>;
+	status = "okay";
+};
+
+/* HS - I2C2 */
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins_a>;
+	status = "okay";
+};
+
+/* HS - I2C3 */
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins_a>;
+	status = "okay";
+};
+
+/* LS - I2C0 */
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_a>;
+	status = "okay";
+};
+
+/* LS - I2C1 */
+&i2c5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins_a>;
+	status = "okay";
+};
+
+/* POWER_VPROC */
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6_pins_a>;
+	status = "okay";
+};
+
+/* FAN53555 */
+&i2c7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c7_pins_a>;
+	status = "okay";
+};
+
 &uart1 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
