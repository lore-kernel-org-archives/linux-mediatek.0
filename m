Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E98C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnzZ3mVH80rTTFN4mmKfEKmsqs6Mvvf/rKk6UFaJvog=; b=TcnlApC3EqnY6YZSQeyx0iXKdp
	HCZYdUsCJUoAfktXsEgeT2mPlp9gEMVAgHvG8fGWG8jpdMtUxUgIWfPd4doXzIu5zHdkwy5ewuuNd
	DqXZrKyu1KXfUWQmonQfCPnWwupljcZh6CxOKw0n8Z9brW+w1uHBYZ5n7q3XJdkeu3w9f0sGwUJPQ
	oASZqCrZl4IJ0tpExgSM7oRf3dzHhg188hkmECskTwklmnx2B/6IGqXbcwJBXvfXFDYg0VVr4kmyO
	9vSnmKcOjldrlLZhN8u9dw21d7usxR/H2ku0KRjRFRSQOliESY5XFi/X9L12f6UWLZOfitLxFsCO2
	cOaZA1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzE-006u9Z-0k;
	Thu, 03 Aug 2023 07:43:08 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzA-006u68-1J
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:43:05 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-583f65806f8so6598457b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 00:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691048583; x=1691653383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnzZ3mVH80rTTFN4mmKfEKmsqs6Mvvf/rKk6UFaJvog=;
        b=YjgZrYrzrSWDTKHQbzvAl9fyP6k0Y2XLjBp7NBcToctpo8q7X00iDlGKSDLi/19g3D
         GNG/a/5ar6VjBdKrTVjMXKj9dHQjEE7EsDlL5tUkojNPVj8oCELo/8onbf/YnM3Tn4pu
         x3j0g9jhvSbVQo/FI4p6Ud4CmHDms6CiCOs64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048583; x=1691653383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnzZ3mVH80rTTFN4mmKfEKmsqs6Mvvf/rKk6UFaJvog=;
        b=AASEzmuEnX4WxtBznFFXG/0jxgsxXyynIJJZa4exgV+6yr39grgcnsZsUJyKMp6wnY
         XwoJSenxztam5fi7Fuq/PGWmQl2GjcZJ920wI3cnBtViqdDN1qTSnXQgCcNDRWNb+xHy
         u8Yh6NrY9GDS5OZklNekqwbbIlvXeliJ65PHjNXyzRzdHkt4DPZdBbY0/vu0yINSqjqI
         Kkl2bzPbDBgN6LbSohC8oq3/u0mr6eXjFjv3kL3uFxrFhvUGuQNjv+ezKS8UBHgDylO4
         lxPFcysUv2lAgQC7cKhLuq3ECy7ZmDtnQHvw5pdz0FFlIdHf05I3wIrUJBaeR5HcmNc1
         xG9g==
X-Gm-Message-State: ABy/qLaGmSOV7/ybMI1rDbJ9TuPErgJDMA2jyFh4x+uQGCWheY7ku6tO
	W6MmsGiHanJXk/CfvrTpf5j2fQ==
X-Google-Smtp-Source: APBJJlGxB/1X32tTrdlyPkNI+lx6FksiZGUPbX+vn+B/9U+9kI595eZfjC5HlvPRxIAHElcWNyE5DA==
X-Received: by 2002:a0d:d490:0:b0:585:fb08:157a with SMTP id w138-20020a0dd490000000b00585fb08157amr13328988ywd.50.1691048583049;
        Thu, 03 Aug 2023 00:43:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f3e:66ee:db46:473b])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a72cb00b00262d079720bsm2095753pjk.29.2023.08.03.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:43:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/9] mfd: mt6358: Add registers for MT6366 specific regulators
Date: Thu,  3 Aug 2023 15:42:40 +0800
Message-ID: <20230803074249.3065586-3-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230803074249.3065586-1-wenst@chromium.org>
References: <20230803074249.3065586-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004304_498086_6E8B8BA7 
X-CRM114-Status: GOOD (  12.65  )
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

The MT6366 PMIC, compared to the MT6358, does away with the VCAM*
regulators. Two regulators VM18 and VMDDR reuse their register space.
There's also a VSRAM type regulator VSRAM_CORE thats' split between
the VCAM* register space and other parts.

Add register address macros for these MT6366 specific regulators.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 include/linux/mfd/mt6358/registers.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 5ea2590be710..f4c321574da3 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -219,6 +219,7 @@
 #define MT6358_LDO_VCAMIO_CON1                0x1cbe
 #define MT6358_LDO_VCAMIO_CON2                0x1cc0
 #define MT6358_LDO_VCAMIO_CON3                0x1cc2
+
 #define MT6358_LDO_VMC_CON0                   0x1cc4
 #define MT6358_LDO_VMC_CON1                   0x1cd2
 #define MT6358_LDO_VMC_CON2                   0x1cd4
@@ -294,4 +295,21 @@
 #define MT6358_AUD_TOP_INT_CON0               0x2228
 #define MT6358_AUD_TOP_INT_STATUS0            0x2234
 
+/*
+ * MT6366 has no VCAM*, but has other regulators in its place. The names
+ * keep the MT6358 prefix for ease of use in the regulator driver.
+ */
+#define MT6358_LDO_VSRAM_CON5                 0x1bf8
+#define MT6358_LDO_VM18_CON0                  MT6358_LDO_VCAMA1_CON0
+#define MT6358_LDO_VM18_CON1                  MT6358_LDO_VCAMA1_CON1
+#define MT6358_LDO_VM18_CON2                  MT6358_LDO_VCAMA1_CON2
+#define MT6358_LDO_VMDDR_CON0                 MT6358_LDO_VCAMA2_CON0
+#define MT6358_LDO_VMDDR_CON1                 MT6358_LDO_VCAMA2_CON1
+#define MT6358_LDO_VMDDR_CON2                 MT6358_LDO_VCAMA2_CON2
+#define MT6358_LDO_VSRAM_CORE_CON0            MT6358_LDO_VCAMD_CON0
+#define MT6358_LDO_VSRAM_CORE_DBG0            0x1cb6
+#define MT6358_LDO_VSRAM_CORE_DBG1            0x1cb8
+#define MT6358_VM18_ANA_CON0                  MT6358_VCAMA1_ANA_CON0
+#define MT6358_VMDDR_ANA_CON0                 MT6358_VCAMD_ANA_CON0
+
 #endif /* __MFD_MT6358_REGISTERS_H__ */
-- 
2.41.0.585.gd2178a4bd4-goog


