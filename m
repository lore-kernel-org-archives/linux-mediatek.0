Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53C9C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:43:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E3646115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E3646115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+6PxEfiXhnPRvlHMXPMvm/k5FJdU4j1BFw0W/zAPNJA=; b=k83a/cOo0o7HueJrXv9o8QXHz
	6vh0aBABCavFocGXj57ZBSqLcZl9zOZreM72NmN8Vu4H/5hjDhqmCv3Ojez+HK+F/NZBqsXMDZfvk
	0d6dhCbiw2PRlg0VW2xzA6bOcYuCaTH6K6Sqjl2M/94Osb+fRzS7/13mPHiXj2Rn2QHAubkXPBSYy
	o/fuAmAZ1pYJfN8+Ov0nVPsaot1Hm1I92vJClfmZn4ajMCnIctIcFlrJ2iQOhsE8HmHQ3V0PbWyht
	KLVWOLlrGL5lm3PCvVX3y8moVAyDnrwhOXPrApV57eE38i+qEE0NmES81uhsOyOkHcIQz2z2dAB/+
	Sc3Tuxodg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRYq-002pHJ-0W; Fri, 16 Apr 2021 16:43:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWx-002ocO-10
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LjwezvR4WhTwoSsV7r7SDlHf748Qlz/vDJv9E/p5iNo=; b=RZGssu0JYxsmAQM6IrvMvODftQ
 rxRjUuzGI2FGJ9JPnGNAyDpANEgk5r1wj9Rkio3jEgC2P5xNrbaPCHY72F0ldw++xcxzuzEEYaOL9
 Yovg4moRZ0Y/zlNYkOiKwnJLpCkJXALjOtgnuvaqD6Ccxb2qCcIOim5ZB1UJ6Zovbk6ThXap+utuq
 He2hINb401d81Ka/gXwYrgZk3NCXbBJYlztLFub43WBgleyywRRp52YWFRbtIgv+uyfccCkHo93is
 ZLi8zojV3mQ3ELLIuyq7/N5jxQ5F41GSxP4i+2ZycoG9cUbUV1NHSi2ivFMLEzgatKs+VqfZwqAa/
 nOzz4VFQ==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWs-009Z0a-0B
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:41:17 +0000
Received: by mail-pj1-x1032.google.com with SMTP id nk8so1149981pjb.3
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LjwezvR4WhTwoSsV7r7SDlHf748Qlz/vDJv9E/p5iNo=;
 b=L+Rv5bsduDVJHnNX/CmKwXQE/TqxVziHthO1cXuOBavA0ou4lQSZyTCFpQrLqaWMCG
 9at/Ryc6w6YpYncud1juy+qCJF/DfocHd1CoDkz7BYkJ1cYDyA3DkPJobSWaXjv8xOd2
 4VGDcpv3NKYDoj6VHrfdjl/2jXY1QJHgR6xFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LjwezvR4WhTwoSsV7r7SDlHf748Qlz/vDJv9E/p5iNo=;
 b=CVK0udvwVu9HMTYYkMBqMmmawLJnxa/pCX4kYWU0y+49F8n0P5xWgki+WdU/M70my8
 TncaI9jPmz2NDZwUqviNz11TfuoWuoJk50RDd+xIb8PBp6qGxBbLrCP9UT/ESe/ik5DO
 ypD1hN5ocYApHg1cBRKiEdG5m4Ei2JFiBbrlGB3vg79fCYQTZ5oEL1QxF2hGSSzfDmbc
 0geV82jtgYvtz3K9Xoo+usUUiDzOQY4VWaPzTtxblNEn6gUfVd+KOa9XKj8+HArR/Hpc
 HJBQfr2ZD1A9WonykV2uSDOnU3i4wHcJCOx5Jo8b1gljugtdSNlmQkld2h3IR5jkw5JO
 kqnQ==
X-Gm-Message-State: AOAM532JmQzSYivVwzL/buty6XKwL4RHQmqcwDftt1YeY9AzPhsO0cAy
 tJ6WpevXTUJfkesNlZzuUp1hiA==
X-Google-Smtp-Source: ABdhPJxW6qNNapuuJvgzEcFO5CklUOMaE9Q2P+8Lpslk/P4K8FSEukUC3p0c9YuKuFPtphNsQ0Ut7g==
X-Received: by 2002:a17:90a:ab09:: with SMTP id
 m9mr11215881pjq.122.1618591272951; 
 Fri, 16 Apr 2021 09:41:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ccd5:218f:365:b90f])
 by smtp.gmail.com with ESMTPSA id g14sm6187186pjh.28.2021.04.16.09.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:41:12 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 8/8] arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
Date: Sat, 17 Apr 2021 00:40:55 +0800
Message-Id: <20210416164055.3223088-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416164055.3223088-1-hsinyi@chromium.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094114_059165_F3BEBF77 
X-CRM114-Status: GOOD (  12.34  )
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

Kenzo is known as Acer Chromebook 311.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile                |  1 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index b33d0bc58021..25770d83059d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
new file mode 100644
index 000000000000..6f1aa692753a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-juniper.dtsi"
+
+/ {
+	model = "Google kenzo sku17 board";
+	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
+};
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
