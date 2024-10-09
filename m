Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1224BCEDD8B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pRO3w4YRlqmMfGpXpUyDIJ6SqFok++X3OxqH0iM6VD0=; b=lRvr+ZlKb49lelYpNpsIBj5XLe
	DyJlIyfR9Rl0/WrwmCVHrFqhWCeTZFTUrbfqDgqkUhYef66KvOzyRxxhSp37x+gGIy3VH4DXMAiIs
	LY7kihQDtXypXLAL1spyGJXfalwptgRu8ZFN3zk/3iMs0H1sJS+Nlpm8gf0Fsb8IhZs3cA/aKM7aI
	NEwL8YEo9qJxJtmjsv54tPHvraPmlQpkD0GnG+r7GswXVuiBgJ/b4BNL6yJ9tOLHVYqFZoJrutUuV
	75XCNejhQPY7OJMEmW/a1ZJpAie0r9XcEBfK8sujVQ4u807AgMb3oVk5ipDXto8ODYaO9KfiKmye9
	wearjJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syVla-00000009CnE-3zex;
	Wed, 09 Oct 2024 12:26:11 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syVkB-00000009Cbr-0UVe
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 12:24:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e06acff261so4678243a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728476681; x=1729081481; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pRO3w4YRlqmMfGpXpUyDIJ6SqFok++X3OxqH0iM6VD0=;
        b=OOe19iCgrmA0KfH5feUYlW5n7vs7i1I2A4AL3sCSnTJbbkCl80MgBHsaJq2/KM3PJq
         RzKcegPa4WHD0oLB80jjzXQzNkUURUXfsjwgH21YdpmqoWoRkE5Uez9BFBKD5tLuZRLr
         jhIYb1xbrPjgwSxIuox56foogJZkDXWvdd1hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728476681; x=1729081481;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRO3w4YRlqmMfGpXpUyDIJ6SqFok++X3OxqH0iM6VD0=;
        b=q4XeKSuJ+DrvsZd+K7apQFtu6+CzNBhkzbb2wkRt7pZMd5hWix9UkSesJdyvhHpjKN
         5VdpiVRb/CRFx4iv7hQ9iiS1bg9XfvswP/y23tgpz1rBiHeGB6Ko61kXhwEoSJZ96rDj
         sW0KHItkSvDjyNhDYfWNHgDQI1tPfFXvh/4e5/nE7rEd3BxWXcaX32my3KXFuI2QJG7l
         lRxRO64groNTbqR8t1dKA/FahXsurj24hg7n4iENyB+LQNGp2kNCpobQAHC7Yuw81ckH
         MMshJsKMnWVsUK+a1lbDg/xvOAgoi5RZ93tWzvC6PrZeLb+3+PMC1YmfvZ5JYkDKdcuM
         mG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3xK/SUn8DoFlyUir4rAQqjfDZrrMQiD1qIi3ZCKdlUuRPeq4D+gsCo8gcLk8JOZTxnwVHz1ALeW0Tz3wS3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3eCVJPraG5sp6nHzhHz3wp16EOlBm/ZAXtyzERmZDB1XOykoA
	RPgQ/4GaDdIhXAoIWuTDjMzT7ZWHQXhDmgQW5NHXtsfIV90sluk4qrdmk9PHqQ==
X-Google-Smtp-Source: AGHT+IFR4YCq8o1WMj3ffJCtaQfwQjZYacyrIHuI3arITE/z1DIhbz2Woh4iMhd4PpzwQxl9pH5Aog==
X-Received: by 2002:a17:90a:b10a:b0:2e2:bb32:73e0 with SMTP id 98e67ed59e1d1-2e2bb327553mr757104a91.12.1728476681282;
        Wed, 09 Oct 2024 05:24:41 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:bfd7:eb4:8571:b3f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a584ea82sm1515960a91.33.2024.10.09.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:24:40 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 09 Oct 2024 20:24:37 +0800
Subject: [PATCH v3] arm64: dts: mt8183: set DMIC one-wire mode on Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-damu-v3-1-1294c8e16829@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAR2BmcC/z3MQQ6CMBCF4auQWTtmaGsEV9zDuCh0SmcBNYOgC
 eHuNi5cfsn73w4Lq/ACt2oH5U0WyXOBPVUwJD+PjBKKwZBxNVGLwU8rehtNtO7aOGqhTJ/KUT6
 /m/ujOGqe8JWU/T+mtibMM+NblHEzWKPpe0fh4u0Qm25IpZF1Omcd4Ti+yc870pkAAAA=
X-Change-ID: 20241009-damu-a3f2f3478409
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_052443_166472_AE710922 
X-CRM114-Status: GOOD (  10.28  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Sets DMIC one-wire mode on Damu.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Add missing Sign-off-by tag
- Link to v2: https://lore.kernel.org/r/20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org

Changes in v2:
- Add fixes tag 
- Link to v1: https://lore.kernel.org/r/20240910-one-wire-v1-1-d25486a6ba6d@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..06a689feff52945d141d196d439cba034f25fdf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -26,6 +26,10 @@ &touchscreen {
 	hid-descr-addr = <0x0001>;
 };
 
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241009-damu-a3f2f3478409

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


