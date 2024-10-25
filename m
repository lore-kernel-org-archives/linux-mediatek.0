Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9CCD0C5FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=; b=UU19mTiAp8DSlN
	uO/+2rrhhd0IUhOo86pMNdu70zo8eNq+QjuwQBkiJ6RdaNk5H9Ep2eFSjEt31UxKMl8b9XUG1YXHU
	EhFwmYVbXjOza4LgrURcA9w6O3F3TwGhCSeN5c0UqloSAAU8u0iySdmw7/3ba5BjngZdh8GxziQIU
	zMTCm6t5dgt9Uae+CQG00MvRXrcL9Yn/DKbgih+04IPnn8MXtC1zZrj5iEgSSvSpvkRf6HEn4JZOd
	3cV8a9Wc4BQyXJ6/ynOcCiV2XM8c6aIQBwgGcpPfyQ9lZQtiI32tKGg+7BkFIB8QkURK3mAVy9eXQ
	AQayP8WVvmD/kGQUdNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I2j-00000003RTs-3oK6;
	Fri, 25 Oct 2024 10:59:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HpV-00000003Ol6-3ReO
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 10:46:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso1296220a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853165; x=1730457965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=;
        b=amSRre08sgDKPMQlXE55J8yWiqxcWjPovXUCB2UrC2h04oF4yPbDOqtqQ/TjXhBeAp
         GT55HTtlec2hL808os/3K+5M/RtT2C80DBWqiFt7fVHb2ige4zSW4gdW8MHxrwMSEqFJ
         7K1YSHNThHH2DaWRl62BGO459FenfVdETnDss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853165; x=1730457965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=;
        b=p0z3SLlof3D1dYNlfPO3S3HmxpRRuBopCZtnVIKxEHW9MgfogH63S8KkLFr53Xc+2y
         dqRwLe4PlaWLZuJdGK1FC3Ni8auXhutEzIs0ZWu1Dd88FVLF+S8lr+7k1Yg2MxbpT9r0
         lqbwHtPrqW6qZH2Qf3zwFjVittjPSMgG8B9Cp5HE1FrJDCWucyJDFFIPNUhqQb5e+YTI
         9LGDH7vhNPGw+5cAW89tTS4OmAc1NRNGV73IiY0axw5AyK+KZ9qhGgImMIazCyvfFwy8
         /WeNSnCcl0egOPSP57TjurxsnmlZ7RGE2xvjAC19jRBnGQiEu2aUBBwXPRJNhHOFZrQC
         k+ww==
X-Forwarded-Encrypted: i=1; AJvYcCVuie2+KxVg0dQ/qC7+YWYbpTqed/Jhh918wYICdioP0CQWb4shTgI7Ah4BTdDRHFm1MdYnGy62EMt2RDySsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfTZnC6dObH19gWN2+79xUV4gBlkg6GDdZKaQnhjTTazZ4D/JR
	GrOe00QjmeNsx5bLNR3Xf0mLvRq8MEZFWcMkKvEDCicSCzLEXJjIBUfAfSsgOg==
X-Google-Smtp-Source: AGHT+IFS0h0JqPw1ebmNNkhQOl9Ys/JQ1lPG9I77D6EUM2T3OpCnZPEttx0nxdHn7SemMJj6wUzG/w==
X-Received: by 2002:a05:6a21:3a82:b0:1d2:f124:a1cb with SMTP id adf61e73a8af0-1d978aeacccmr9904743637.9.1729853165012;
        Fri, 25 Oct 2024 03:46:05 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:46:04 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI link node pattern
Date: Fri, 25 Oct 2024 18:44:42 +0800
Message-ID: <20241025104548.1220076-3-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025104548.1220076-1-fshao@chromium.org>
References: <20241025104548.1220076-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_034606_359743_EEC0587D 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The associated machine driver is not dependent on the format of DAI link
node names. This means we are allowed to use more descriptive names
instead of indices without impacting functionality.

Update the binding to accept arbitrary DAI link names with a "-dai-link"
suffix. This is the common pattern used by the target (MT8188) and other
(MT8195, MT8186 etc.) MediaTek-based Chromebooks.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 701cedfa38d2..2da34b66818f 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -40,7 +40,7 @@ properties:
       name defined in the machine driver.
 
 patternProperties:
-  "^dai-link-[0-9]+$":
+  ".*-dai-link$":
     type: object
     description:
       Container for dai-link level properties and CODEC sub-nodes.
@@ -112,7 +112,7 @@ examples:
             "Headphone", "Headphone L",
             "Headphone", "Headphone R",
             "AIN1", "Headset Mic";
-        dai-link-0 {
+        hdmi-dai-link {
             link-name = "ETDM3_OUT_BE";
             dai-format = "i2s";
             mediatek,clk-provider = "cpu";
-- 
2.47.0.163.g1226f6d8fa-goog


