Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5538EF532D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HD8JQDMMlIkIx7EMUgVU1ftXT6MPWyC1lmhtj8DtsUY=; b=FI78QkvT2ayj2rQ/Ft5fijLG9k
	MAbH4i/pj6sT0bUh+OUxUqrLI/SPywB/eTvLL7BPYoJMDLgqwhb6qFKvn4R+w5cVUfoHYe/42JbIj
	/r1r7K0A0AgsUmQVdo8tzaAdGZWWZJIe+dJdKUEiq5uADoo5Pf+BGZhAnqwvmnYDxBj4yic6Ghy/l
	Duj0cEtoOyUES3NukftAqlMVeKEEfGcTwFCvO7Lvu8B3ijTl+oKqooUxBFWJDEJ7bsm4Zt02wiT3Q
	TD17CWkNqtJGp0lKhKMBxSN7mZHMw6oJ2cxJ/Rb4wjX3no5j5A0uvYsfzzx68DrcRJAyz5O0IVrX+
	XtWud99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBa-00000000ZrQ-2KOc;
	Tue, 24 Mar 2026 05:20:14 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBY-00000000Zqg-2pNZ
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so2008100a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329611; x=1774934411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HD8JQDMMlIkIx7EMUgVU1ftXT6MPWyC1lmhtj8DtsUY=;
        b=mjO55cVwwxYOWkxM4L/3Egh8xuvaC91Pc5/za0GDlGlFYUfrG857+4CA02oEAMQ6pz
         Cs4MunRklkwJKIE0M7tDZ2qjSFLkW+WF+Fd90UJqVvdpfsE2HcjDfYVKf4KrNiZNKFRB
         /WCA0/lQ8p3pbCK62gmanZUeN9HS4dnDcoKjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329611; x=1774934411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD8JQDMMlIkIx7EMUgVU1ftXT6MPWyC1lmhtj8DtsUY=;
        b=aWPCsmMVttkWysJCaT9i961veVoVStkH8njgqouH9BAIJi8H4SYW0F5F6j3Hf0l1oF
         tzgfl84pGceqQh31uqTjzDOL+P7hVGN5nTGx+H+jL3BGCx/KsLU9jnIVk6s1nDM7Z5Gc
         oqzBs30dnxn23zU1eUQ2qtb0w0rOi7B2Okw246LEg3hAzVQne85tdvXNUb49UnkT35fW
         3Wc9M2p6g9vzM44m+JR4XMcJH01W1ZGgd/0lYKDyHkPj+SDEZjN5l96XCiRkZiBJnEk7
         Dhz4FLn3ZecxPAdnJk3x0Bc3bZzVjqCPWs2Hsp7s4hGUP+NxgDsk8EMoqpsJYM9pMLV0
         LZnA==
X-Forwarded-Encrypted: i=1; AJvYcCWonPf/7VWiaGRjJSpgb4tngTAz7E/lIJJVOAkuUmBAAE+2vMZeRLB8NKZ9WM9EzmrANKIpHCmMGaGtbwCjrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/gwSGVM9BshTlDMwK0O+HvF15utel2zwx+69OLvaCMH4JyfXj
	+lfzFt/4zn/BNYEfvg6AgMaKe8FH3k94oD0GUwLHAJZFR1QaZVZKVBovwDLgL+3p7w==
X-Gm-Gg: ATEYQzx8mE/KpD5LNbJCj19ZwZPd3XS4p+wciToNJ8rt23GJj+lllBvsZUJnLMCWycK
	llZAlceeIJ2bGoz9PPpD+wx/ASoEW6fIvXBeGLrJFF36jyWY2ZqWcWe1NZQ6lWDBF7TBxkRrwXL
	dzKiQALZUP/4p5B3qHyDIWa+LMSMjwgxNZ8aRC9pBiVvGYp2qX0q4SXnkKyfn2e9TKwHpjl6jqx
	alFf7YQwAuSpV5ANfb/yW9gTNxoDl9hfVfY+LvVTgDeI6doDSe/gJce8NwKaasrGwhwQ+pSsyWL
	r4w8jch6HQ66rwDOC5sKLJGaHqiltLvBdvZpImRxrXZVW5gsUlIlh0EhO0FiUn6vgopmI02scKA
	GquXgkQpD7blbwmczVIkk4x9/6ao5/eTWqhmTj2QYK3H3m2RsDpTaztfdZ5GFzGRMYBn6LsXGyS
	mZIbQIimSDQE4W2eee/+0VrfGPgk/3ZOeZOVknlJBNjE4G9LBtzSe1W4cPYG3yVzhtvakiuRvkr
	sMd3aHf
X-Received: by 2002:a17:90b:4acb:b0:35b:8d89:7198 with SMTP id 98e67ed59e1d1-35bd2be6debmr14451421a91.11.1774329611552;
        Mon, 23 Mar 2026 22:20:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:11 -0700 (PDT)
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
Subject: [PATCH v6 0/7] PCI: mediatek-gen3: add power control support
Date: Tue, 24 Mar 2026 13:19:52 +0800
Message-ID: <20260324052002.4072430-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222012_771296_94C889AE 
X-CRM114-Status: GOOD (  15.38  )
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

This is v6 of my MediaTek PCIe gen3 controller driver power control
support series. This series is based on next-20260323, with the
commit a2b2ca0c2477 ("Merge branch 'pci/controller/mediatek-gen3'")
reverted to drop the older version.

This series is ready to be merged. Please drop the older version and use
this one instead.

Changes since v5:
- Link to v5: https://lore.kernel.org/all/20260311075223.3303497-1-wenst@chromium.org/
- Adapt to PCI_PWRCTRL_SLOT -> PCI_PWRCTRL_GENERIC Kconfig symbol name change

Changes since v4:
- Link to v4: https://lore.kernel.org/all/20260310091947.2742004-1-wenst@chromium.org/
- Patch 1
  - Expanded tabs in commit message
- Patch 5
  - s/mtk_pcie_device_power_(up|down)/mtk_pcie_devices_power_(up|down)/
- Patch 6
  - Adapted to mtk_pcie_devices_power_down() name change
- Patch 7
  - Fixed label typo causing build break
  - Replaced "exploded" with "populated" in commit message, and added
    more explanation about what "populated onto the mainboard" means.

Changes since v3:
- Link to v3: https://lore.kernel.org/all/20260302053109.1117091-1-wenst@chromium.org/
- Added two patches to move kernel setup code before controller setup
  code, and controller setup code before device setup code, as requested
  by Bjorn
- Dropped dts patches as they are already merged

I kept all the existing reviewed-by tags, since the changes to the
existing patches aren't that big.

Changes since v2:
- Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-wenst@chromium.org/
- Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existing
  examples

I do wonder why the existing ones don't select PCI_PWRCTRL instead.
As there are multiple providers, and now even the M.2 power sequencing
driver, I think either we enable the common ones by default, or let
the user pick and choose.

Changes since v1:
- Link to v1: https://lore.kernel.org/all/20260224071258.2654521-1-wenst@chromium.org/
- commit message for patch 3 was rewritten
Jianjun Wang was dropped from the recipients as the email was
bouncing.

This series adds power control support to the MediaTek PCIe gen3
controller driver. This allows proper modeling of WiFi and NVMe
adapters in the device tree and control over their power supplies.

Patch 1 through 6 are cleanups and minor improvements to the driver.

Patch 7 adds power control support using the new pwrctrl API to the
PCIe controller driver.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-pci/20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com/

Chen-Yu Tsai (7):
  PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with
    dev_err_probe()
  PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out of mtk_pcie_setup()
  PCI: mediatek-gen3: Move controller setup steps before PERST# control
  PCI: mediatek-gen3: Add error path for resume driver callbacks
  PCI: mediatek-gen3: Split out device power helpers
  PCI: mediatek-gen3: Disable device if further setup fails
  PCI: mediatek-gen3: Integrate new pwrctrl API

 drivers/pci/controller/Kconfig              |   1 +
 drivers/pci/controller/pcie-mediatek-gen3.c | 223 +++++++++++---------
 2 files changed, 129 insertions(+), 95 deletions(-)

-- 
2.53.0.983.g0bb29b3bc5-goog


