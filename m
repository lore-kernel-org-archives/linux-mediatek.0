Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91BFC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:09:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30756613DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30756613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zhsKMY9xuIiCkQkvw9T2uyj3S4IKIs37xMQp1We39wY=; b=LLEyTxW8SnSM/f9JbtVXf0To9
	5sEUgb3gE4UXjeeYnI97MACNjZW9wymdY0uymxzo035jkaIxhgywi9ooYDkgvLDe3grafvDhTFPFH
	zJn3RtEsomLCES+ieMZKUrpVOSeIcGh2Vfh+KTgdYHwbWvPacQyN0PXoOBNvhxqxH8yCOCieauazg
	qwgUyLx+1E0j+P3AKSbJ5qDEWO7LAHtizgl+cFKlbB+5YI244QRdc4u1KRxXmib75M1RifnxEO0vj
	DbMeda8bedutxu89L8YFaFJojirQkB/2EKWoyn1qcQn8RDW1JdD3UJT9kNisuw8PMOliep9rjP1nb
	7Acu6ZiRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8rd-00E40Q-HT; Wed, 21 Apr 2021 09:09:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oX-00E2y4-LH
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4Ntfb1UP9/jEh2M57HXjNuFQiWNlO95qklRJb1u95eE=; b=FkQ2Q0jXGEsnDQkd+j4AI9PIYw
 f9ZrwlZFwF+YAn/musF7+H/xp+fwDFmceU1+fchTEBkB+zeM+kpsAhcROXObVobCCWxqitrX0qefV
 NFz5nDzkHEqpKYQQr6Blrb9RYebgFsqDAGmVWdLleZ/yqZ5XxZdpHbK+iMgi4wcRnUxinuCXJ7vLG
 ixP59T1JX9wIPP2X9HQKibTLwAgzzE8SNaynjNpPA+MxkDMwJ8LjysCpjds0LDjBF48xMQ+i09rfZ
 J4+I2PHeQlycEnjGGK5YuCfu8mf45URhrL1M6irN7BaWuWj1bQkTV7RUHIUywzr2mtKNXdYq1DIQ7
 AHHmIdqQ==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oR-00Cjht-L9
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id h11so10492772pfn.0
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Ntfb1UP9/jEh2M57HXjNuFQiWNlO95qklRJb1u95eE=;
 b=B64eaEDxaZ8wAzxiRmBMsUlnaCxBSwC9OQJVw2Tc/wEatJeU6+90BoXUBgjwAP+WQE
 xH/+gairrnvVOSMs4xzR3MYZAdUk8FTAg70zebpOTnmFdk//2GCDPfvkgnOzvPM23css
 S6aAUCyIgcg8U5goTupklYruTEpFuVUhisbn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Ntfb1UP9/jEh2M57HXjNuFQiWNlO95qklRJb1u95eE=;
 b=GSEkBAp13Xj/Ew0fmR6V9ppnWMnCHbtnx0fivrwCl7mjk5BCtsLXFUKQbo5DLhOB9X
 MDxkb+u5Wa8F55UuV4ywY+Ut7ySdfGx+/zfCPb5GTGO9ExsnGNrOwEGsr77ihz+DF5JT
 AC4O7Kw0tLaQPmKToCHfKEGdu2zVCzgV1YocCjkYwvbxRwYnRVa8r7JkJmJMmzNERtZd
 yImd5YnmTibj4+MFGaxglLQ5rODUBVqFB/BLBkCLzAQ2x27Xd2hD0rb9WrY7x6R2Jvml
 Oyop2ldik8UyBueqbdn3a7Clgbn0W5LzC3GfnvTI7yHPg0gThaPh4pgmfqYqzMtGylvH
 dJjg==
X-Gm-Message-State: AOAM533aIckmIOkxiDu1cORyDhRH+sG/Fuc5UZN+7GqCseiZbvQ1FMo3
 jTEfPBuy+SC4uK3W0v/wCANgUQ==
X-Google-Smtp-Source: ABdhPJyxXvsbYpW4WSQe7zYkJOz7ef/sy2AATBkOUL3dNhla1WWczXgf96/PLKhLpBGThF8hkvC3IQ==
X-Received: by 2002:a05:6a00:be2:b029:258:834c:cdc9 with SMTP id
 x34-20020a056a000be2b0290258834ccdc9mr27147115pfu.54.1618995982850; 
 Wed, 21 Apr 2021 02:06:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:22 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 09/10] arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
Date: Wed, 21 Apr 2021 17:06:00 +0800
Message-Id: <20210421090601.730744-10-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020623_700290_A576DCC0 
X-CRM114-Status: GOOD (  13.04  )
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
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
