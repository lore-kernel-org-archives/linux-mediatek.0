Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93578C7EE25
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+xclHRJbfTaOco3ogcoYlZx1POsGrbKOC60b7YSguU=; b=tJhG7gi3ESs+x9by0l9WEpDTiq
	NcgM2NoTPR6AwGtFMNXcxltcjCdN9HYPhIelqvgSsNmg+pRIVGdyP8dTPE9uuyZVqP59qsdjY7dky
	L31IVIToevaQFLuntzpLuZdK9wrSnTpyAL83zwuK6VNyCq/hO2nyU/mXO85YlA1wK2ZQSLA6acIXS
	vPztKQQJFojAJ1GiqwIwu2MqIHJbsLdq6WPCsp2/w5aondF6WBoepGwo92vIiYNC09zRoxHewRQ9m
	pyqvsaJjMh86Vn2Llz2HJfJIzQMsMxLK7PlMqBzzHFN+64I0kf5oNcbUwzIc3NrnqAuIm0il04AU0
	tG9eQiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecF-003P2n-1F;
	Mon, 15 May 2023 20:16:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyec7-003OwQ-1K
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 20:16:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-643990c5319so9591460b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684181768; x=1686773768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+xclHRJbfTaOco3ogcoYlZx1POsGrbKOC60b7YSguU=;
        b=g36wlx4dAT/5M/at1hKyNtZto26zWfKQwhNbIbrF+H00O03nyEY6BiCUtUDqrcdMbq
         e7fz+6QIIokAKhGcCOG2WqzT4Luc93tGNTu737dq9vjufkb3y1jzvHWHWkE0QjekmU7p
         lApebxoBnaqlPNm5AlNHXeaQIEHLeKk+EJKHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684181768; x=1686773768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+xclHRJbfTaOco3ogcoYlZx1POsGrbKOC60b7YSguU=;
        b=A3LvH7gBaA0wlp1CJV9y/3dh6bO6qPOKnTRVXfCD3nlXwRBprvLq7oV/a3TM5HqAG9
         7nDpQ79+xLYnH70YUGkAoKRI69jri1WThFlZOxUXZVcWRJFhNdFeqgYUrQtEr/vBLvPv
         EWJoH5g6mY07hB3bJjf47af2ecvhgmcgEadt7gRlD9lsbP7Hd6jUafFvSSSMWBsxilju
         z2BUThITXg+AyiuIdv1SFt/8mbmjZT4Lhx/EFEQMnxC1JQLyfZvMlnKaQNU4TSws1e14
         ybHHrzpak7fipNrfxc3qWun9HNIO3o0f63n6QbOvt1Isri9w7JyssIVr72xEfQiM04Hs
         O44Q==
X-Gm-Message-State: AC+VfDwFgqgGR+igF6rFgBK6arBD/jVHrDlu5NxHRoRBltCeGpcgL2En
	5PcvleygV8q+bvP95XWarRHdOA==
X-Google-Smtp-Source: ACHHUZ5WhKqgoMTuex1L+d9MK/DlTrH0o+Ldk/9GGkvVe2VsoV5lyk+s+Rn1dX3B0wpYq4ALaKdvAA==
X-Received: by 2002:a05:6a00:10d3:b0:63b:5496:7afa with SMTP id d19-20020a056a0010d300b0063b54967afamr41742520pfu.11.1684181768187;
        Mon, 15 May 2023 13:16:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9f33:9d98:277a:d4cd])
        by smtp.gmail.com with ESMTPSA id a19-20020a62bd13000000b0063f0c9eadc7sm7981411pff.200.2023.05.15.13.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 13:16:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wenst@chromium.org,
	yidilin@chromium.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/ broken FW
Date: Mon, 15 May 2023 13:13:50 -0700
Message-ID: <20230515131353.v2.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230515131353.v2.cover@dianders>
References: <20230515131353.v2.cover@dianders>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_131611_454555_92143D45 
X-CRM114-Status: GOOD (  20.17  )
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
  'mediatek,broken-save-restore-fw' property. The kernel can use this
  to know not to enable certain features like "pseudo NMI". NOTE:
  device trees for Chromebooks are never baked into the firmware but
  are bundled with the kernel. A kernel will never be configured to
  use "pseudo NMIs" and be bundled with an old device tree.
* When we get a fixed firmware for one of these Chromebooks, it will
  patch the device tree to remove this property.

For some details, you can also see the public bug
<https://issuetracker.google.com/281831288>

Reviewed-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- "when CPUs are powered" => "when the GIC redistributors are..."
- mediatek,gicr-save-quirk => mediatek,broken-save-restore-fw

 .../bindings/interrupt-controller/arm,gic-v3.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index 92117261e1e1..39e64c7f6360 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -166,6 +166,12 @@ properties:
   resets:
     maxItems: 1
 
+  mediatek,broken-save-restore-fw:
+    type: boolean
+    description:
+      Asserts that the firmware on this device has issues saving and restoring
+      GICR registers when the GIC redistributors are powered off.
+
 dependencies:
   mbi-ranges: [ msi-controller ]
   msi-controller: [ mbi-ranges ]
-- 
2.40.1.606.ga4b1b128d6-goog


