Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5D2FD064D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAbJYo/U6V0Uh0aXX9z/yqJ0AbZ9jHrEzuo7YucNVOg=; b=B0xgLsTF/0W6uHKuDCuEkRXo69
	Z3UzFIlUo3S3meTQL2oAzEy97NxTmCQdUZI2xBJYbcYoTyMSpv2nPXVzBW6JDM8cDp+Nt8/fkxb5g
	RBwJpEo8f0fF2jjvFaKl87wQUEh+nUxZWog2uG+8VGjqn1/x/xs90Bl/v/3pmP2qlHSb1XwB7+L11
	rrB2v0bcOnH/qomFr6GwlcOJKMx2BE6iKG6Hj9VlMyIaajqbedMawD33750AcOnTVHfUmmLfkwM5/
	564HDT7ncfCQLaHGHoMLKHAWKLjl7bNw/w/TmVWh2igamKuLAhtLR3uLi9ffZs1BphE/jkFSXVTVn
	5SLmQxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN5-0000000B5Lg-0JDj;
	Wed, 11 Mar 2026 07:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN1-0000000B5KH-3Xc0
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 07:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CAbJYo/U6V0Uh0aXX9z/yqJ0AbZ9jHrEzuo7YucNVOg=; b=fZVucbQ1TmQvAuXhiIlhshvcFG
	b+70/sUgCmkiibudl3eQrAm4caBb5lOt17knj3WvWd1DO6sFMjhEojfSlvshnNTWmKW9WMZnJ3THc
	n0P2SOQUUlaLYSwi/vlnKxHqKNLB7eMNyYJKSE/VJC7FMe5pfva76jRMAUR4gw3KoZHVXL8WPf7fL
	7b+yTg3nQBkrQ2uqD3mNZWbECYPE5Ev5xgmun6Pm3YeyaPUaHsqC5vxkFKdbeiOVtGNLtusGdxYxS
	+guIcLdTLCaqkAQqvhwHwn2fYIaKwAdHTG1KFSf2Ghl7xvbmCWjwyCKv2/d1riOksXMWK6Xzi4i23
	abYg+OlQ==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EMy-0000000GIyu-2QJZ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:52:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3598cab697eso448422a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215558; x=1773820358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CAbJYo/U6V0Uh0aXX9z/yqJ0AbZ9jHrEzuo7YucNVOg=;
        b=Fy0vLjaAEkAhAfvwQ8Xf26Oj55ESaFOwh1HZ1j6ZuFzD8F2YS9NYzg+TJHxF4lU5Kk
         izymQ9Bf293DkW9gIxNLgJMx1F40c+aHTAcFXV1r3AfKlbzmjSbN7n75cQVpYTti/9ub
         bISkEsrC3UgwK2nHGGLPCxIkEXRvYQ/CQnB9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215558; x=1773820358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAbJYo/U6V0Uh0aXX9z/yqJ0AbZ9jHrEzuo7YucNVOg=;
        b=pHUU2c23UZ8JU6a9pdiBTdg015GaIkFJuT2a4X+Jc07R8C9BbCCPoQREqjDrq1psHw
         8lCRWfMc9uLnWqlPddjPlSu2G/njX/UzgrTSorkXjV3vPqXW4zZ2iqjRumFa6w8TPoV0
         hie33y09HrtShTYwqD1U1eBEnh71imudRKdCk253xuzLinJzniCdgrc65fozaVcWjKAT
         Pk8lqeytVejGSo+CG9HrtlrcpIksnH9aEE6CBVnHymo9X7lb4nSAQJJ8aHf76XqrCgti
         tz9RIAlINhNnlTcAo9piCY5Geixok1oElCg64h+5wk6UKwXw/N54lajxJCsrytZatJB9
         BJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc80CyYUm3Cx5RAlPPf2R60Dh69RzSvIhxKJH+9YOoy9dDJJCj5f3q6Gj9y0EfjektPEuNeGQSne24yMkRkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcfILmsOcO52WVoJL7LCLk6JTTbrv7saHB2QybJyeW5ORvylET
	C80Qe7qO3hjqInXSeIkm9E0weU3l67mOO61bxjmKvAXRSpTBRU1lilv83/z1R/3DyQ==
X-Gm-Gg: ATEYQzyi4D4PULQ6/WcOWLYR4bZ8wKpi6D7q4sbQG9Hnow7oZhHqwvFc8la+hnPByMv
	UXtxmhjjgibQp1y0HnoXjKMeyoEMHi4EE4jfj1WDjZnwbzsTlA1d1sFPsVQzbZxDtreKYNblKrE
	tI/bdAb2k3gR9mhU/hJGqPJ+wkDPckGKG3iC1u5a1kK6VVbkQ7MOCKXmeEg++u72V7Uywxm5kVV
	uC98N4msLSvbQpAqieqG7u0m5ZcGgDPZtlLLyNoXvGuxjHL2WG3A+7uX1KxfyZRonsGzLcPMuGt
	jSDPCFcwvqS0p7tUj0+EcOCzpSS29wQxUNGoZrt2K/5/hQkPp8wek2ZOxlS+Tjs4hnQOGNK0ac1
	rbimnAXcOA/rF4Q4C0GukIO0josHfiOVoCYq3lkRdLTSefArAAp1i3zRaX5z9/GoIL8exYMEPHo
	vY2zrJMqU1WbKM2fwFSGpIZ7SgzUf9N3DHqugJ6TXB00hsnz+kYretJcM99pbZURoRl45q3S2DW
	u+mzt9P
X-Received: by 2002:a17:90b:3911:b0:359:8a78:5696 with SMTP id 98e67ed59e1d1-35a02690dd5mr1357506a91.1.1773215558073;
        Wed, 11 Mar 2026 00:52:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:52:37 -0700 (PDT)
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
Subject: [PATCH v5 0/7] PCI: mediatek-gen3: add power control support
Date: Wed, 11 Mar 2026 15:52:15 +0800
Message-ID: <20260311075223.3303497-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075240_798067_87B20774 
X-CRM114-Status: GOOD (  14.13  )
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

This is v5 of my MediaTek PCIe gen3 controller driver power control
support series.

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


