Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2467C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:37:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C0765159
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C0765159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z8KOr7dSjt74ajZRfuoj1DASwOr0mW2FpBKKbZ69qaE=; b=o6rzK/sM+Dmn5dkml8a+v2NPW
	FM6cczWGLd8iSBZlzC2d+HI4gkKMkW6LZ6ns/fGCq9LXzAgpRo+7H4NRtUlAdAjOQMxfs4l+h0Rrg
	4UxJHKgQVI1y1WmujbGBkn9vM49fCkc2nOfdR7PHg96dzRuYMmCaCuOSetwY7F4ugQLNStZK2rj3r
	7RwyI68B3zhuj6Ki9/mdoVaXa7BYc9aG155DbQiFZKRgZHMXjZspTXE8qqaO+ZNfZtdCYqa+NN++1
	5ctdhpKFJxHFp0sAKZwloJRef14t+tsTc+tUvQv57C+d6nAezZaOn8wYIo5mj7uJla/gA9+j927lS
	iizgQ2wdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ7dO-00F7Py-PK; Mon, 08 Mar 2021 04:36:46 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ7cz-00F7E8-56
 for linux-mediatek@lists.infradead.org; Mon, 08 Mar 2021 04:36:24 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2385209pjv.1
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Mar 2021 20:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FHYldnLHVjUCtTPUMHFVsgGiL0sQpC3TJ8ogHG6aen8=;
 b=kf5mR4d+LR5JbmXKw7GBAbezQrJuBbdr23XLj7F4h0q19tZUWG1P3AbEmDtzUGrnZZ
 QIPpIARW/MuIw3pbo79B7vjypi5C1e/tuJuU40TMB7Z3pesGzJWkJjAohZ2KJdLH+7eK
 x5rimKui7iYlNXUZegTL0pvXUDliEdJbc8fIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHYldnLHVjUCtTPUMHFVsgGiL0sQpC3TJ8ogHG6aen8=;
 b=D15I4KwzmvQvyU/anB89S0VI3PHrQmRuNm0Wllw5XQfyWBRGpF7xST8UeAm+3gfXl8
 khB5mMW+SeofjsQQ0bBbH7aCJdYQGx1zblq96/L/3W3J9mERfOoIBnwbfMji5ZS4hijh
 ASfD64TLfOdG91nU/nTb4oxLExERb91mNGCQtvbbqJhBEokHBoY2QRczCzQsN71i/0Wg
 39ZVFGFYxu7xk4CQqNdLGBvPVk49cPEZ3B4BB42O9bqw1QSlLZYLlzfBoRFdvN58nsD7
 ukL6nR/Nn3VliIfeSdMhhK+bSBVpiNXsTVkB48cNFE0qP8BXfdzBSQUo/qrzD+1no3l+
 bHWA==
X-Gm-Message-State: AOAM530oxUPI7w3Wz2qZ50JdSPYLswGsk6nLYeFK1QYt/ip/Tf1JSrnP
 S93vyxQPhzpg8UIoegQo0Qpg6A==
X-Google-Smtp-Source: ABdhPJxfM03eVHY5cSuqb4Q3jnfIMSUxwGHkcMGr83Img4syS9OwBsVqxPVXEldm7tF596anODr1XA==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr22232876pju.118.1615178176205; 
 Sun, 07 Mar 2021 20:36:16 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5da1:da1b:5bcf:2d46])
 by smtp.gmail.com with ESMTPSA id q2sm8191562pfu.215.2021.03.07.20.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 20:36:15 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v16 1/2] dt-binding: i2c: add bus-supply property
Date: Mon,  8 Mar 2021 12:36:06 +0800
Message-Id: <20210308043607.957156-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210308043607.957156-1-hsinyi@chromium.org>
References: <20210308043607.957156-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_043621_371112_200F9BE1 
X-CRM114-Status: GOOD (  10.83  )
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

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

In some platforms, they disable the power-supply of i2c due
to power consumption reduction. This patch add bus-supply property.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index df41f72afc87..88972bd62ce1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -130,6 +130,9 @@ wants to support one of the below features, it should adapt these bindings.
 - wakeup-source
 	device can be used as a wakeup source.
 
+- bus-supply
+	phandle to the regulator that provides power to SCL/SDA.
+
 Binding may contain optional "interrupts" property, describing interrupts
 used by the device. I2C core will assign "irq" interrupt (or the very first
 interrupt if not using interrupt names) as primary interrupt for the slave.
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
