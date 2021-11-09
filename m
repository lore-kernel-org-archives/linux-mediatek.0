Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FEF61107
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54FEF61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN/25/oFG79UXaEVxojYnUTNUGTEzqB3LOr12hY/Y7g=; b=bmRlNzAnNu8Q1A
	eBr8mSuvwxb4rHhIil69k9DHWNZeM55El2vv19CgcFnsNzkUmJhVTyMWmlsw4WyXWkwfbZiGD3O82
	WIxUu9DYBEU3+chxaqvqqaQToohCDWE0nJxCPDNlQ5V9Y52LQ9HEVWDNbEkTifHfuLTXMfpnYf5Po
	6dGSd/0WwN7NEgQvhn++xU926T5vABPpTnnPXIXMNQyhaGKlisuBYftVdtDNWGZuO3qTFlkiyLbEG
	orhXscnH8XPxcbSg2YfZUNHiKGUEx5kfueYqX+RDL8wvLeLdeeL1QDBbbAGX9q6GqUi+A3f1Vu2Rn
	638inOczjGKx1kEipExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJly-000i8l-6a; Tue, 09 Nov 2021 05:34:18 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJlP-000hvh-M5
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:33:45 +0000
Received: by mail-pg1-x52c.google.com with SMTP id q126so13487316pgq.13
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 21:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMyybJ8cedWreU7hFIqGdeFr06iYH5ttCqNwsXNo+Ug=;
 b=Rjqy8A05j0M8lY1753X7tvxL3vsHe15KIz7iG2Hfyfr82YRoOohLcUjfxYxd0oXUw9
 9tPWCSU0UkOIJ3Cx1UQXZgDOGs+P6jc/lMM6nkkK+9WmonEnrQ6aP9n1prpkbmAEnv1O
 bPzfgPGfoK7cJf2PEFNFs5wdlI468ppWPb2YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMyybJ8cedWreU7hFIqGdeFr06iYH5ttCqNwsXNo+Ug=;
 b=WIrVqHfG0757JaqNzl5u8nCQbwogEAAQ+mMqJNnOB2D9OcUWW5T0d8kSmwoDN2E4YA
 HFqMcZ0xyPLHYSpFtCVj7XFhsQyQKyVkthXjKYxZ3U+I/VSqq88k/97sepLX9bELEUPE
 p74tlQzTI3V6RzLJQiYivRvfQQlV8NLGkzurZX3zAqasKT4bdwbo7C280EvpLsSOFMdH
 C6rsaxloUQUB+sqNwZlMdbzu65/qDEyetchuLgZ4+2QHn2WI2u2kVPSp1TGZIEDf5Pct
 v9pRTjX4ebHzf09OSN+ACd/iwWtpMAFxoTteCJ0JAPdue1JVXZdL+1ucoDc6p0IWDwnF
 +SQQ==
X-Gm-Message-State: AOAM531/aiOI+DW5my3tSQXJitBZyywLSdonL5jCYkqvAkN6r2b9cqU0
 SRyZA/uoUaucI4JRPPQN2HEjQQ==
X-Google-Smtp-Source: ABdhPJx+p0hULM9LX+Onr/LXX7S/RnoOdGNU5QmYaxrxaGTQmyIApCS9EGwI+bAbVPcOgBgn+7foyw==
X-Received: by 2002:a62:cdca:0:b0:480:8a68:8b68 with SMTP id
 o193-20020a62cdca000000b004808a688b68mr71947275pfg.80.1636436022917; 
 Mon, 08 Nov 2021 21:33:42 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cc3e:b71b:e327:fb32])
 by smtp.gmail.com with ESMTPSA id w5sm13741479pgp.79.2021.11.08.21.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 21:33:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] arm64: dts: mt8183: Add kakadu sku22
Date: Tue,  9 Nov 2021 13:33:31 +0800
Message-Id: <20211109053334.1840273-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211109053334.1840273-1-hsinyi@chromium.org>
References: <20211109053334.1840273-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_213343_771979_CEACE6F3 
X-CRM114-Status: GOOD (  13.45  )
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

Kakadu sku22 is using mediatek,mt8183_mt6358_ts3a227_rt1015p audio codec

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8183-kukui-kakadu-sku22.dts    | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 9834bd659d1530..1613259b686576 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu-sku22.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts
new file mode 100644
index 00000000000000..3a724e6f915cd5
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kakadu.dtsi"
+#include "mt8183-kukui-audio-rt1015p.dtsi"
+
+/ {
+	model = "MediaTek kakadu board sku22";
+	compatible = "google,kakadu-rev3-sku22", "google,kakadu-rev2-sku22",
+		     "google,kakadu", "mediatek,mt8183";
+};
+
+&sound {
+	compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015p";
+};
+
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
