Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AB9C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413146142B
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413146142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gi0jJs63kiGZrC/QBATCM9ge80acj4VWOX/n8UJcs9A=; b=GmHzReBPhNE48V
	8rgwrriUmw6fZX3K3w59GixsBCg5cFJVPv0KISxnV2KqWoNX5GO03Y3sCSN/Gjcqy++KgwhLpYjGM
	zFtk78TmCzcZ5QnHOLPOE8gtFkpBmFlqUQUd/50kCEnSXuypqrlZCRjOSKfMfgF//ow/69pBnxHxN
	YTd0SzP7cGrZZnLjMItR5mXfWN0B1A39dzfKy7PQsdHpLmN37PzcZafMDOv3UO5MXgCc+oIrWWaKA
	86nYet/6d8xXpoogvv9koNd1yCJNmbTi1/t4balgUbjgUzoni0cXIqO3FaPx2bkDmxC2b3qzDIoti
	wEKkFHR+p+goYIFD5Zwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJSQ-0039Bc-Qj; Fri, 02 Jul 2021 13:43:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJS2-00392E-4f
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 13:43:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso6447489wmj.0
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 06:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
 b=cDfr1NhQHx+he4+TgITm2BjN8MbmS2ZamBiuVsRrRnghInJTxPq5GVK7592n3bMasM
 Gwt19Fm9bD6lKrUrLAbkoNsPO2e3K6qaODEPEfRFgOvV8tWWbdsexZ2N/uUBRr+siLCl
 WO3j5j9yvB2OxqcHcCjxTbW3pqqjWyr9BuPdNtWaFMNIL4QXBUqV4fUz18Wo6cd7fits
 DFtLGE6KXnN++YkAkAvgOFB17NeNptuQjy0KH9Z+Reetr6CFMnhI7LVOXdE7Xdey9JRv
 affpusSNYDn/3E2TE3wdm/r7p3168EFhTG4o3rCRawEFHA3f1Fd01n25IZSFHgJ/Isz1
 QXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
 b=gkgy7tw59j580vLKVJfaHhsi1uxoVXzKuZMT1zXm4dgZQl3bL/5rQZNjVRv5+R0DB5
 AuqddJhoirldF3a+l61mfZoHyFD4EtA0daQ91nVb8d1kO02PUyFyDY+3QIq9n8S3J0cq
 VRgJUgDKM97KjL0RMo2OuSb6iGWrZpZX7a53utBsd9wBTu8N2ZBCNxUXHVZrV/6/D5os
 DPLoewsXJbkXBjuVPj3JoovE2du1hzFeHb5A5pseVwQcKukc6jWk1Qm93Qo04T7qBY+d
 dZatWUXl60xHIRK6NMok9CdDRb/mUpDwXhpBl47aVD06C82QmySO94cuzKMDTtPdOu/M
 013g==
X-Gm-Message-State: AOAM5324c9bGTfYom3DaYLiGMYhepTuCWxMyNatjw0TLrskribOcMWRi
 bmLsYFJYOXzuUly6x7okvwpYFw==
X-Google-Smtp-Source: ABdhPJzQFXRzS5N554NDfExUbHLoRNV22Hjo5b5QbL+c0xKE76ZXSzmuNLVKNHtW5oiQNSxHSQYGxQ==
X-Received: by 2002:a1c:7204:: with SMTP id n4mr16962591wmc.7.1625233404663;
 Fri, 02 Jul 2021 06:43:24 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
 by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:43:24 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: input: mtk-pmic-keys: add MT6358 binding
 definition
Date: Fri,  2 Jul 2021 15:43:08 +0200
Message-Id: <20210702134310.3451560-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_064326_207752_469B501C 
X-CRM114-Status: GOOD (  12.39  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
