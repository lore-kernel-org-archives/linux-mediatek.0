Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ADCC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A7g7qS50UKBu2Vs5SDgCbvvncurtSr/U44kFCGPI8Y=; b=fCxL0sUe2fVLe/stOHH2TSbPft
	w5BdpgVK2tfqN7iPIti3+/eBqQklo1/Y5ANb7I7qXcfzjIqzMDzgutvjfUe2+1gy6a05SE00fmZsj
	7ixhg1a7sUsYNfWEE/1oZznnyzLRKVjsWLYh9rexaK6xr+Itw2g9OOct6QQ8Khh8+DHDjk7NmM+Vh
	vMTPydiXOWxcCHMy+jI3YDzKnJfaQVdB2/mJlw2r3gy+pnISOyZilujkxvUHLKYVBergncdKtpzS2
	1nd/pddFQv+FkyyiwhjU8dlVHDpXyvYID2/TBl01aYgGXltDngNt4MzCrpAs5qcz9BuBSCGibV7he
	3wJF+tpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvf7f-00000003PqK-14MX;
	Sat, 13 Apr 2024 15:16:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvf7V-00000003Pia-2JQW
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Apr 2024 15:16:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so2657913a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Apr 2024 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713021403; x=1713626203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A7g7qS50UKBu2Vs5SDgCbvvncurtSr/U44kFCGPI8Y=;
        b=WRsNS7x9GEUWtulglHZBX+RA5LSgS9rEP178eVpTnYCbNfjVWEJJkeE4rS4VjYLTDR
         dmrTzjd0bUGyuTgLnWDqyIFzELRpesfj+7jFARDBB2GwR3iXJOIs7Yi0IgBkUkgDBH14
         qMlwdr0yIm21k3jUWJxBPINvMMwbHuvRPWWsaoKXoFaK/x991+tfy5ZTk1SUC4crDTLC
         nPqyK/+V9ap9AiCkhE+1WapU8nxzcwV36CHMECKk2LbunBSd7RFmxww1xP6S4Jl6+Aoo
         P4H4isu3szN/zUCcd7Tii3/ewJ4nA2kFsa1Sd+IRYZ6o5EcCx1M/e7Sthiu+46rtu7NH
         eIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713021403; x=1713626203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A7g7qS50UKBu2Vs5SDgCbvvncurtSr/U44kFCGPI8Y=;
        b=xIRxOCd0K0/KYHAD/PSq/1PJei2UNaDVGV68zYNv6lFMckB8PXjS0IRGGoXXluHoYk
         lWgTQKhmY4u3/yh2YYxElXvBy31tLC3+y+Ldm7oqYqTrQVfN164XWTVtj+7UlIEXm+8X
         rOUj8TVfyss4Ur1VBrw8ObeZYCzRFND6/xiRJRCQ9GCUrgf0ZFt5cLosz9Pl2RKQDzUA
         EzKH6XUQn0PZmDJGElg6+p4Sr73G3+4WxKy6JyzLKaYPlMvoLlkXI9mpndLbpkIPxm1X
         xF0bxh1M2bcSYVmynuGiaKG3+U4E+3UkbdGuDn4/+6Sf2+gLYPmh48sdF4Vl33Mprn+7
         9kJw==
X-Forwarded-Encrypted: i=1; AJvYcCWqyUISHQwh4zg32hzWkUHvmRtd9xQLwg8ZZYF8tDVHKzaf9+8JlgX1I2TvmjAoCFwYDAgoGgTfneOOa4L3Qlb6+blguOeBEGB7pwTPBccsHnPr
X-Gm-Message-State: AOJu0YxD4N46kxV/9deXIQyYA+y/xjcdKred0zwRFZQT3YN97bDuABRY
	aHcOEl1uGAQypdT4/IU7XyWNvRaxl5YWeDxXEIuamkoBJmuIhvc6zenLFQTUW1s=
X-Google-Smtp-Source: AGHT+IEmo2EuLsiQvKf6UbS7ue4IQL/YRmJZHSgoqwKXTxi3PpsLAoyXQzBVJzA9zQct8EPeoVHm3g==
X-Received: by 2002:a17:906:36d6:b0:a51:d7f3:324b with SMTP id b22-20020a17090636d600b00a51d7f3324bmr3318859ejc.66.1713021403232;
        Sat, 13 Apr 2024 08:16:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id kj15-20020a170907764f00b00a51a60bf400sm3104956ejc.76.2024.04.13.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 08:16:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/4] dt-bindings: PCI: mediatek,mt7621: add missing child node reg
Date: Sat, 13 Apr 2024 17:16:15 +0200
Message-Id: <20240413151617.35630-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
References: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_081645_884118_2085D505 
X-CRM114-Status: GOOD (  10.45  )
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

MT7621 PCI host bridge has children which are PCI root ports.  The
children have "reg" property, but do not explicitly define it.  Instead
they rely on pci-bus.yaml schema, but that one has "reg" without any
constraints.

Define the "reg" for the children, so the binding will be more specific
and later will allow dropping reference to deprecated pci-bus.yaml
schema.

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Correct commit msg (root port).

Changes in v2:
1. Add tags.
---
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index e63e6458cea8..61d027239910 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -36,6 +36,9 @@ patternProperties:
     $ref: /schemas/pci/pci-bus.yaml#
 
     properties:
+      reg:
+        maxItems: 1
+
       resets:
         maxItems: 1
 
-- 
2.34.1


