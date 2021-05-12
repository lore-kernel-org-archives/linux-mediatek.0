Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22467C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:27:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8FD613AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E8FD613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gi0jJs63kiGZrC/QBATCM9ge80acj4VWOX/n8UJcs9A=; b=MK3bnPBIqgSvCQ8QkEAeFGrMX
	YYD4NMQ5Ruj00ksbMDd6aWEchSulorOUhmj8lP+r8k1EGorV6OLQOeshg5ZsX6cF6kBrM1A4Z+tyQ
	nJ1u0nRrECay/P1Rzu6IdSuP83KQGRqd86VQzQspZCQTxbKbgRpivTnxHgpXVb8bXXG153TVgquj2
	tCK1hfTD3tVrIxMSZA6fEEpIJzprBriIxsrglr6nm1SZ0W6IjScv0PKWRDOsHCkugLsVwfB+dKq6p
	PUfD+gnA/BoIQUlejT9eGUCHerixmXoU/7vPwMfsn3KKF08bSeAjwFniI3uXMXlI+RBcKx7hBXdWg
	2bZmqIL8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqlv-003BwU-Tr; Wed, 12 May 2021 15:27:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqlG-003Bne-Gy
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=; b=1Sdye6I/TZbMJFbGpbVbonwy3G
 S+/QmQVfZwAhF3Hri9yNBCU5ewc4KIN01s8c39bx3v3n07DO2/PsGfkNV7veVE/2jQ1NBNkVdp9h+
 1xzkTkip2MkCHKIOTAQWnRFZqI0NSIdxYuwHhXgYcL/5W/9nNoWtd0uiRY0pu9FPf4IsQDk25dYz8
 nwp6qytZpd4aFlThKFY08NrqEN1Hj1+ceSJe0zM7DevO7xS/jqzy6AyJicHDSctvgETau9S4nK2u7
 SZ00cxDxCbAfvOUpGHkZURq8tgLyEGicu3vGurwf0Vyz84lX8QXdH42/KcAvHlx+9KcAlJw6TIr7f
 eakyw4rg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqlD-00AW7h-TN
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:26:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id x8so1754831wrq.9
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
 b=rElwDa8Lrcm2kjcdcnyk3ukxfLOTiThQgebEnFQOeXEdOe3irtXS/3EEKwl1Dh3ar0
 aEk4Ciyj4q/bNzRAT9Bx2V44WzDgOR9SkqvieE2ZpPI5Ow1Bc1clLXs8x2G6riAOZ6o+
 lGTJhX9LzXyzSyDRYOrGlm9RpGFEscdpCjuXqU+Zfa6WA1NQCuIvHUwoN3v32FJpHk+v
 hJbeeIjTIfzj9fKTf7LlwHI8l/vumbcMXQcCqYbDBaWfW6d+MeRGwKPPH9BNhfo+3Agd
 2iMUa2jqW6N/GAmy+beWKyFvJqos1gKR/nqHlQQ4WnsUBvUM4K5EjIbVCy4boq1xo82s
 B1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
 b=MG6mXM/EfnptAkAVMe3PvywKbWjLMe7GwhSDuEOI2AW4JIQ0Z3WRvEC797P8EylNrO
 qQSkUnS+7qrcQyOXBM7PDjgAEaJ35gN6XQtkU2lb/lwKsMjVPNDFnXAJwM5UGlGU5dPI
 UxnC3E1qoXGYaNlk97qgB23J8kyS9d48BAG07HEgUyPT/teJ7a3rJShy5tptEvl/JA7p
 rVV0ljRhsUjnDts68sYmGvYTAQdtCNxPjoG8m70Aqde7+sERPxaPjWkJ0QceW0vbLw8D
 r3QgZkzNf4FxpKQgL3SpAIhPY0IQFkZ9GbTMMmFwHSHn2OlMEwLTc3S3hLVZbzHB3YO8
 W+bw==
X-Gm-Message-State: AOAM531GBm0FGIbvDUo+D618A4y/soGKtoqjywauqyQ952eOIMAOXQHG
 Y4z2hx0eRvyOKyRfu4V3DKiJJQ==
X-Google-Smtp-Source: ABdhPJyvnIsbHX1mOtVgeTVf2klh9fpVHpl9Y27iO4L5BVcpy8cfA9oNsTK0UIGbAHxoGx7lF/DdyQ==
X-Received: by 2002:a5d:4947:: with SMTP id r7mr45639060wrs.217.1620833214636; 
 Wed, 12 May 2021 08:26:54 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home
 (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
 by smtp.gmail.com with ESMTPSA id b7sm30931256wri.83.2021.05.12.08.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:26:54 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: input: mtk-pmic-keys: add MT6358 binding
 definition
Date: Wed, 12 May 2021 17:26:47 +0200
Message-Id: <20210512152648.39961-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512152648.39961-1-mkorpershoek@baylibre.com>
References: <20210512152648.39961-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_082655_970640_DD49E04A 
X-CRM114-Status: GOOD (  11.91  )
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
