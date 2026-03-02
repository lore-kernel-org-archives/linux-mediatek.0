Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162D2D58E60
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KLxzGjkTXzvdIiBMe+u6W4iA0Yjyp+xEhOYadMTR7kw=; b=gjpW7NqCATbjCd1p0dNq3YE2xD
	wir56qH3GwhqMID2jJA5Ko/Ow0BhXnE+b8OyPhkjgMVLBbLoChAJuALZpVnWd0JvYGrBL+HvqBIw2
	cJeb2+wmwRthr/p7NUziy2FWLmLMKSW0m5SbLKNjp5MD9VU3xLlblBlFa71TQoL0rX9JUu7QHUBII
	+rg+VfJRqdEsuSTLU+eKM7URHkuAqjtt5u7a4N5Hf+Gz52XkTRqFwfmyvHWiZH8Qh9YvsAekNzhI6
	U4bu2cv0Y0oUpblOQJ7PQnphXXeYd0Z3XnT18JAM2MMQOkAHDp/J7OPW8IX6C67E3evpUJOqWr3JV
	y3N/7f4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsH-0000000CIel-2jJd;
	Mon, 02 Mar 2026 05:31:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsF-0000000CIeC-0gb5
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ae50a33ff8so3385175ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429477; x=1773034277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLxzGjkTXzvdIiBMe+u6W4iA0Yjyp+xEhOYadMTR7kw=;
        b=cZiqGmbA91yEa2KN7mjlROWnbT3emb0mNT1bXeB0dNx+W+qeesrTF/vFfWJDvxK9rZ
         0Tm4S6HX5SfpI266wfXExAXWFMQrtNAXTeYaALtCOeUGierh5iS3/qk9Iy1B8g1C1YzQ
         SEkyl5utuM82DRC0586KzJM/s9h/yYLyq3wU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429477; x=1773034277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLxzGjkTXzvdIiBMe+u6W4iA0Yjyp+xEhOYadMTR7kw=;
        b=sgwC4Vnl1PUcBZYtex4YiiXAijMylqUDBX0c7h9cpIFAegb2BK71rw5z7D/jZC8tf7
         oKqanHfmpu4KkOhFJ8zHLkDCm56KlsCKna9JUixjhPZDg7BAiRY8A0yjsfoujymip5vB
         g4bYTQJjHcQv1P5w4YubgmWUDrcpgpWhfcD5T/uBoMU7VjrtUAVurxeVRR5mC0VfIbHB
         IRWtaZ7i4z6GGcteWivNUL+ZN3Sx5eJuvTrM7kRPBYfoOdZoEzTSqMGEpbOBWF/DYMTu
         vfJBVAHwjIn8AbiUH551FyQG4UYJ2k45SElkfLh1SP6tCZcco+VOAZcy26EB+IYFvqlm
         W4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXoMAMATrx3TWNobEQygDClk7BZL8AogIbee09Cj+QMk4+59BsFr124HMLgATxNmn/xfwYIabcxcK1T6xEt0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmlBg2twAqerqaX+FcINJUr7c/1YhpNx5eEdcQzTWzjP6lKJf2
	A4sNtCjFjg6iGa4TDAShaXGv0bnkhVxr/rUfTf8eB5rBHTNqb1RecxQjzHu9foL9Nw==
X-Gm-Gg: ATEYQzyl9fRDkMQ0dsrVAXOS+8jMgetkjxHTx5ls3oi/ES/slNKXwcdpO/KpHVkAWDB
	lyam96GgjIllHIlw1XHSL8JNcjL8MXsSwBHx9lHgQlJqXj0qZxKa9HMcset8TxvdrJfQLG7CPHe
	JOESE83FNTjbFcM1itSZpmUgVEPmC6SkLtsEeZEvHVngvsV+FMIbQTWypCZMMIOu/L+dw/7n6J2
	BSFwCrzNoc+M36Ccf8gcmq8gTxk8wsCxinXmOPZdufhkQ0AOOc0dtEUbNAsfRaDIWvV/Mt3vpIZ
	DEGlp4XjWn5CGRzc9Uet+C4z08//a1WlFhJ4Z1vGMiw1Hbc2F6UQbqPEYwpeuKo9Ky1ZzvK62TR
	p0Mp4c8bPxSYS9btVvCl6Qbc8LZNhV5SPFDttDi1qqlZ1IfAKzKgZrLkfU46o7yZ0xnMUcVIbcF
	/v4mo7hqDApeDI6+OkFZQ+BecHKmCsYn8z1a3iHi9uxWiDlypMdCP9hV+6gG1AkT6jCh9iz8Kzg
	uZSMuxe
X-Received: by 2002:a17:903:1250:b0:2a7:cb46:706e with SMTP id d9443c01a7336-2ae2e47e0b7mr107177645ad.35.1772429477411;
        Sun, 01 Mar 2026 21:31:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:16 -0800 (PST)
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
Subject: [PATCH v3 0/7] PCI: mediatek-gen3: add power control support
Date: Mon,  2 Mar 2026 13:31:00 +0800
Message-ID: <20260302053109.1117091-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213119_348904_C723FBA4 
X-CRM114-Status: GOOD (  16.90  )
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

This is v3 of my MediaTek PCIe gen3 controller driver power control
support series.

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
 drivers/pci/controller/Kconfig                |   1 +
 drivers/pci/controller/pcie-mediatek-gen3.c   | 185 +++++++++++-------
 4 files changed, 184 insertions(+), 87 deletions(-)

-- 
2.53.0.473.g4a7958ca14-goog


