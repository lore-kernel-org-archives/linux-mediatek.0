Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E442EFC5903
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gf3zJTvQLfTgX30VArKzadpRhj3Re5JYD2zOB+P9LVY=; b=F2etwbQIRydW8i37W6mhXeVgI0
	w3QaJGILNn672pNLquw/RsQYnM9rHBEx7brhb0S6QA4b14bcCEOA0X1Dcb2pCup8Gx3XJUBJR+ggS
	HPzL07XwmKwSfvlj7dyVfQsXYVVO1hrUiz7qSdqH3vdTkVhB9FYNbAThrpIK7xkiJgJxMaa83cx6V
	Yp5WDj7P1ZyVNpM48dDgX2tUaZoYNEEsHML4kcRnFdE1P7xL1a1tzHKd6my3rOx+0DNSjd6abIPiF
	GqCRoRZ8HJ3hqdM+L3XQvezsZRGBGJcd6Rxv4NaiDAf+1widWK/HG/36xV4f3uVBnLKcJOZnS6ple
	PdfQSnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5H-00000005b21-3DBZ;
	Thu, 26 Feb 2026 07:46:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5E-00000005b1Q-38uo
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:46:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2aad1bb5058so5372805ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092011; x=1772696811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gf3zJTvQLfTgX30VArKzadpRhj3Re5JYD2zOB+P9LVY=;
        b=X0V8DOWa+qhqVoOLQLZQQm5yG/UEDxzZmtqfViZzJWwvWOgdRNBCm2lefL1C4VXpc+
         JDGY9fuzRcg6AIewr6JiocAKwISajVpGwf7nRfb65K67MhwHXKF4OYy1dmKLG19hYXkF
         5md/c1BlUnPLRsoTC5NYvoDboaSCl2jaEAiCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092011; x=1772696811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3zJTvQLfTgX30VArKzadpRhj3Re5JYD2zOB+P9LVY=;
        b=xKE5c3cL4y4oAk5Mmvkwwj662BMjzn0Eev8a1axYcsIkM25AfbvPaxe6NKJuILK6oK
         QWe2Ecg5VJ3+86F6NQ6Kxm/oKELHpc34VIH7gDYhZSZQreNFqEOu2knQBuEEFBZslsZz
         oX+pw8tYVPS89ahCikHmrzhxats5sijXDZv2EWNste7xVVpKILHs+ZyyHAosfMUbUrm+
         zV2fT1iOHr9tySwYudS+qRDGIbke9LFy9j4wuoWKhhVEQKevmHs3eashKYIPzneoNfTU
         RUBhKCNOifs8bmi8mKP0vkKNnsUDvzOXF8ColvZ61ken4ocTATiYs3V74/Lfn6UqFlpF
         ooRg==
X-Forwarded-Encrypted: i=1; AJvYcCWKoZJkilodsxi49PwOjkIDG3Qeve6KK4Q1k8YUiRkY2Trf8X+iwhFh96wex6+aRY6RdUnoi9e/IqwMnCb3zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkZhZzsVbWBBMqtA/NVnNzUrVaEM5Dpf1mV9JVPKRjCpOE+qCg
	wH5xK+0aSJiMUeTGQY8Z6RLrKeVzX01qYp7IAvvene9QWWrpkE5C7KmI5Xq6zS6LLA==
X-Gm-Gg: ATEYQzy84nRwj8VJvEZblgp2c+iva9BlBPzQft6yGm0pY1oUj/RGVSGiEakCbprvibC
	X+/HPxLJg25kTwhz9PRJ6JUMkvCOnMGC/lpxTNU3ux7wq23jLR0waUOAhlZsWcszDwVGvFom/om
	hcIn1a+X2bok/qzExLL+FVTJKlEZ1dH8y1VID3Wz6CpefEu+50XzL53NnQ3yDNYenYbyHg7283b
	xxPGfw6MRTSX9qKtRn5NRNqdQHMJlnhy6/3zNAhAXGOCf+roLzCm+rHju2IUekrtczFPivJ7Uvg
	ECmhzUOIb/1U19cWGp+g0hQa6Mjx7kePuCLAZWyWuCjDwcpMUtSvCcPIIj43Tjq6QoaTNvi4nXT
	4arFWLmvM1iSkCULsDfXcsB5ffqGvOZ/TXKuDVFMFdNikP1788kdNuei5cKAIFYl8qlSzn8vIgh
	JSGFh+L8KxKlWvYZQtxMcT89KfIgRKgf18Xjh2EYSOLE+Diw1LXxjDxjSD3y5PqDsboh1XGdoVY
	cMYuELO
X-Received: by 2002:a17:903:90c:b0:2a7:3db0:6e1d with SMTP id d9443c01a7336-2ae022af72amr16230495ad.9.1772092011369;
        Wed, 25 Feb 2026 23:46:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:46:50 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] PCI: mediatek-gen3: add power control support
Date: Thu, 26 Feb 2026 15:45:16 +0800
Message-ID: <20260226074524.3808081-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234652_859902_0D24491C 
X-CRM114-Status: GOOD (  16.04  )
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

Hi folks,

This is v2 of my MediaTek PCIe gen3 controller driver power control
support series.

The only change is the commit message for patch 3 was rewritten.
Jianjun Wang was dropped from the recipients as the email was
bouncing.

This series adds power control support to the MediaTek PCIe gen3
controller driver. This allows proper modeling of WiFi and NVMe
adapters in the device tree and control over their power supplies.

Patch 1 through 4 are cleanups and minor improvements to the driver.

Patch 5 adds power control support using the new pwrctrl API to the
PCIe controller driver.

Patch 6 adds the WiFi and BT power supplies for the MT8195 Cherry design.
This is actually a M.2 E-key slot, but support for that is still WIP [1].
And even with it merged, support for the USB side still needs to be
figured out.

We can either merge this as is for now, and do another conversion later,
or just keep this one out. However this is still an improvement over
the current device tree, in which the power for the slot is always on
using a pinctrl setting.

Patch 7 adds the M.2 M-key NVMe slot found on MT8195 Dojo Chromebooks.
This change actually makes use of the M.2 pwrseq driver.


Please have a look.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-pci/20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com/

Chen-Yu Tsai (7):
  PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with
    dev_err_probe()
  PCI: mediatek-gen3: Add error path for probe and resume driver
    callbacks
  PCI: mediatek-gen3: Split out device power helpers
  PCI: mediatek-gen3: Disable device if further setup fails
  PCI: mediatek-gen3: Integrate new pwrctrl API
  arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power
    supplies
  arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot

 .../dts/mediatek/mt8195-cherry-dojo-r1.dts    |  38 ++++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  47 +++--
 drivers/pci/controller/pcie-mediatek-gen3.c   | 185 +++++++++++-------
 3 files changed, 183 insertions(+), 87 deletions(-)

-- 
2.53.0.414.gf7e9f6c205-goog


