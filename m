Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF70C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8Q+tBaaYskzauPjWFnHayDJlvaj5LMUfZeaf2NrQbQ=; b=LSvdaf68R6s/duLUQE94lHyK7q
	RldTFYaHuBe6sTYrK/34t9IjLnJNp6QSz0LZfTm//Wzz26PH/bL2FDu1p0EE3a46qCwGQhYgHrCIC
	HiypY0xIhvCqRsAyGjuNf2XeGEvayOYTO+l+yitpTKB9uJ0OEFuGv3Bl37SKJnhI7jrCyn6UhscdD
	owpaCEsZuc0v15aOHCFkq9X/VEJ9jKl3zgf+ibvfCJ55JFaX0cjspc4l/ykXRQW/OiGhXjAQ0NzMf
	OQt5lAa/8U+VN2mZdTl62YltcUTYevUkmbuzCGm5i2LSXJKlWHZhJkkmAE6Ol3aKn/GxG2vMX8PrT
	DqZ2SimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERZ-00A89H-0Z;
	Thu, 11 May 2023 22:07:25 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERU-00A864-2C
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:07:22 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5304d0d1eddso1861731a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683842839; x=1686434839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8Q+tBaaYskzauPjWFnHayDJlvaj5LMUfZeaf2NrQbQ=;
        b=jO3XvKkwtvxNz993+Li+17L6pa4w/TVRvEMY4tUBXUiXVgPBB5uE1U72Py0ADFowqw
         4UhdzKHqnYW3oIJhRX6Ezvcu9lKjTsfbJHjTMphXNHjJgnIFfy0PwACd0pi08JOHNN5O
         k+3Cb/D+sfCroFVfwv7zboAl4BRPgefSneMLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842839; x=1686434839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8Q+tBaaYskzauPjWFnHayDJlvaj5LMUfZeaf2NrQbQ=;
        b=E+lcMi4x4uWPlscUuK2x7K0bd6YSNawFt7DYhBkqf123VuTJ0HgOKBygQA1pGeSB8G
         DHUbJ+kxmeB6kCYbMEW5cxrl/xYsgRZkPjNmSPCtWWE2+YBJ8xsHtZsWng7U0E12Q0lo
         /PcjHjw77oo3qpZmtqIcbCvJnau7D6svRNVIHWKq0M3EhiL0b/DoNZPgw2xGUy2i0nqU
         3vqE5rzo0joJSfVaCNlYhQCIKvDKKzO10V7a2qEP2z8VN/IQVKJl0ZXrN6aCLnVGTSUD
         VVJMDUUCkb0n/QR8jeFBML09mTQG8x26LA66CKKVXglrXQIGRiVb91myXFKW7PkjQGNx
         qMIg==
X-Gm-Message-State: AC+VfDy8hJ8FntLnvpls1e46ggHba7bCu94FaEcLbJeEl38T5lP3Rc98
	aJUAjqm9UR+GobhbCe7OqcxJpA==
X-Google-Smtp-Source: ACHHUZ69G7krdwEzUJkF+GCEatd/o1CBrA0/WhHGMcIG6ybMy7MqBpZJm1nTPpJLTV07Tq+WcxoYhA==
X-Received: by 2002:a17:90b:234f:b0:250:2d63:7b79 with SMTP id ms15-20020a17090b234f00b002502d637b79mr23492520pjb.43.1683842839570;
        Thu, 11 May 2023 15:07:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b96a:d776:ee3:e572])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm17589457pjp.39.2023.05.11.15.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:07:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	yidilin@chromium.org,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/ broken FW
Date: Thu, 11 May 2023 15:05:35 -0700
Message-ID: <20230511150539.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_150720_721341_22BD0DC6 
X-CRM114-Status: GOOD (  19.27  )
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

When trying to turn on the "pseudo NMI" kernel feature in Linux, it
was discovered that all Mediatek-based Chromebooks that ever shipped
(at least ones with GICv3) had a firmware bug where they wouldn't save
certain GIC "GICR" registers properly. If a processor ever entered a
suspend/idle mode where the GICR registers lost state then they'd be
reset to their default state.

As a result of the bug, if you try to enable "pseudo NMIs" on the
affected devices then certain interrupts will unexpectedly get
promoted to be "pseudo NMIs" and cause crashes / freezes / general
mayhem.

ChromeOS is looking to start turning on "pseudo NMIs" in production to
make crash reports more actionable. To do so, we will release firmware
updates for at least some of the affected Mediatek Chromebooks.
However, even when we update the firmware of a Chromebook it's always
possible that a user will end up booting with old firmware. We need to
be able to detect when we're running with firmware that will crash and
burn if pseudo NMIs are enabled.

The current plan is:
* Update the device trees of all affected Chromebooks to include the
  'mediatek,gicr-save-quirk' property. The kernel can use this to know
  not to enable certain features like "pseudo NMI". NOTE: device trees
  for Chromebooks are never baked into the firmware but are bundled
  with the kernel. A kernel will never be configured to use "pseudo
  NMIs" and be bundled with an old device tree.
* When we get a fixed firmware for one of these Chromebooks, it will
  patch the device tree to remove this property.

For some details, you can also see the public bug
<https://issuetracker.google.com/281831288>

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/interrupt-controller/arm,gic-v3.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index 92117261e1e1..8c251caae537 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -166,6 +166,12 @@ properties:
   resets:
     maxItems: 1
 
+  mediatek,gicr-save-quirk:
+    type: boolean
+    description:
+      Asserts that the firmware on this device has issues saving and restoring
+      GICR registers when CPUs are powered off.
+
 dependencies:
   mbi-ranges: [ msi-controller ]
   msi-controller: [ mbi-ranges ]
-- 
2.40.1.606.ga4b1b128d6-goog


