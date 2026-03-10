Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D845FCC9DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlvmKtnFIYNHHzbN7pOX0A8KbD9wMlYmNdVVBmFdBJc=; b=HFwUPotGzzOSBCxfTTG2E8aXry
	H/BEz0pWPnajvh+Xqc0lfklzXheh1ZuIshov7AUM0ETh0QJJR1EmKpoirwMgrwiUeD3vvlRO+QtOw
	oANl3R1ob+6xyzxjvwXyEGW/50PCWtRP7KbI/ZOTt+AQxwA7Ysw1GufyadSsxTB1YlgAHmmjZpUtb
	Nl6lmoSByiI8eD2WgjtAApfk4mPG8pi+/L6+Mp++muwve9GeitKIJdg96QoxTbhbZ/D9IuH2LMHfT
	1Az1KydcPEdIgbeQmBzgDjyEBE3f1tGAMkEyulHlN81Qq9+NfxNzXRXm90FoHRp5ZIgKZcY9QMLea
	BOUZxL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztFw-000000094Mm-2kRX;
	Tue, 10 Mar 2026 09:20:00 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztFt-000000094Ld-15G3
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:19:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8299f1ca86fso1836048b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134396; x=1773739196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlvmKtnFIYNHHzbN7pOX0A8KbD9wMlYmNdVVBmFdBJc=;
        b=epzzVwztqXp/TNXxk90VDW1uaeVnYmCzxJrj6lSd3tx6APfZCQQXUvw9MEGfyjo4K9
         kX0oCmrFXx2m2Pwt0cAmt02jEb1NQMfmJSwLFMLBzBMgc6IF6A4vPrf8WmMoQImQJ/Ny
         y5qhra8PYx2qRDAPh+CiIdhtwQtadxm09A+PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134396; x=1773739196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlvmKtnFIYNHHzbN7pOX0A8KbD9wMlYmNdVVBmFdBJc=;
        b=HzID7rVIU3PaTkpO79jmCThTYa4GZME+ySBEURHcU0DPVPTbrhIUWHymuaUPMQ06v2
         m6FQ04ijd5pqZLvv7DqZ8m7smOq12CuInEYHYtQrlip9f5GEI1Gu08LoP7TA5EyOCq5s
         HLiACrzFxnR5ZepcLFJiAHBBBDABfj9PjkKSuflwkldNZN9/jRmn3T28MMol+zszlgKh
         +hG9fFGwaqi8CtjONfTQGe9SObFKB3trv/JONKPWSTQfqO5NsIsrEBnRGu5MaFAj2Y9E
         9j8jHwZKdmkfN7HDNmeS1JF6UdgzQSzrqPpe12MOTVY3nAmmSqqJ5J1J63sw5mGXK8wL
         ErFA==
X-Forwarded-Encrypted: i=1; AJvYcCWQMd7vRGy8wmHVBrOGaiIUBFoE2y6gyPD46LZXhzs7SmnJ3VtzN9T6xiPEntENfDiM97Gjy4MrIPjyfcQ73Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPTWed1Qwe6sCLi/8DgAT9cP6TPGEjRsg8yBUgwqpwHent6joZ
	LOq4c6AiUeIb9zdbezXhUhfF56VPqcduakJEOlvoLdEtQIa1LjoQ85ZXobKOGfqpMw==
X-Gm-Gg: ATEYQzzStfOd9Gxq58r3YaVFPSHGx3Yt+7zhuy0sc3LsdW63D/9NHZRuzcz4lasPN+H
	BMG7K7rox+4FgrPH7OW6BTjLPM562hjvG9HRMsxIvLISJMhEghzqN1o1woXC3YpbDGYdSeA66rk
	uPiBpGo8KubdpLwvzbCuRtVkevq0njtBgIgg0p2z9hVz0E+wWzg5HypybsN3vEwVBj421KECQx0
	yB7x2hRdMPg+wuXqmBouamwTl2KhCnj2nD1fxqEA5jIfbjYwQXWc2zY4EyKi/SXiehXz2xjc8aC
	uedsssBiYo0tEgSHAh+5X5vL5mKP/8Sq0wd9ZtDd+zUsipTNKQ27hMJA1qUsMUGb1KNRIZl+jLQ
	A/DC701NrA5ww0Bfkxls8k3jYCHxCtJ7hlo6eI0GmHgSeImpxa5qrt9oI57uIKGICTARFkXJ5l3
	mry75H/fBO0C53jl/xX5UUq3zuVGK7ReNKEd+/g1y0pDQD5lgJnMlRiJLU/qA16Y4+WR6AX14C5
	FbSMRNRomlV7SxYhQo=
X-Received: by 2002:a05:6a00:3d13:b0:829:73f4:6ff with SMTP id d2e1a72fcca58-829a2f428ddmr13331441b3a.37.1773134395959;
        Tue, 10 Mar 2026 02:19:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:19:55 -0700 (PDT)
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
Subject: [PATCH v4 0/7] PCI: mediatek-gen3: add power control support
Date: Tue, 10 Mar 2026 17:19:39 +0800
Message-ID: <20260310091947.2742004-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_021957_363603_EFD734BC 
X-CRM114-Status: GOOD (  14.29  )
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

This is v4 of my MediaTek PCIe gen3 controller driver power control
support series.

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



Please have a look.


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
2.53.0.473.g4a7958ca14-goog


