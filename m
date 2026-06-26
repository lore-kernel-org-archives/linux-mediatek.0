Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD694CDE00E
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=; b=v+0uNAc+YMkS5wXr/CizRxdf3Y
	rLXdxrRLItY0tU3lO5+YxB1OyDA6gBZzpN5EVG6gJfFDHKjPgCtQBseWDvPhPAd4RJRkTjz4iaegM
	1Km66jm2uvLm66W55KbaoowAEuYNazuq1pyu3kW5SUmbiopaOUzrjhpO/m/KqaHk17hJgnmyg5Rc+
	sCr0kPw0gWy8MzVdQOriptILde1lQaN64IP5J/q5ikF1vY8xPzDGSR+ElyakRCgoQoB9j7wnjH5Ak
	Et/d1UowqBziVgmxDQE8ozKXFHkwSkgj0ryyHQ6oRU5k+dO2Q4ViVaCm0lZ//ehGmV0NmoUmxVTrO
	DNwJe1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2ju-0000000AxfQ-2uCO;
	Fri, 26 Jun 2026 09:20:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2js-0000000AxeL-1eRt
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 09:20:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-46cacc39191so204798f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465642; x=1783070442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=Ht07P0fm2OldG91ho1r1Fa55hG+N8zO1HiASIf2oCNH8qg6wyAJt/vyAI+mnq8jwiE
         y7v+IEH6ce2GPdidSSUSpsURp0RtYc9PKCgRvs8Mv1pFtr0zYrTRmdxEopnsOt1XTIU4
         gEC93X30ZdgKF5EEcxh6Le6lJqOZDdmEXSLXHxdn/v1LuM1T+J7Y8BAvSJyCXWG8SWIz
         X4Vta5evrI65tR+gWabevs1z0aK9Hescn6s1btaY+k7FMXN1mYZKrQMRcKLCmZskJXi+
         VLJMyFvOb+ZIoYUgPF7nKGJAtFu/fTfGvWZDJwoxpyvFJDOyq/dej57ZV9Fi8Jkwmyk6
         PJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465642; x=1783070442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=K22+AtNqyRW2X2sBlkEKVinpoyUGXjJ1jxmZ+HTcOFEOvp1L5Wh3PBNz3MkR/OAT1D
         7nOnlHGMp0AY9l+58lcBs5m0nFVu9RVmrl6ahikPZgk7xXwThKSj45mLmAexG7Yw5uzm
         CC2lwol2pqlHiDl4C2LcBAsB6EXl//i2Liggv/CNkehjpxouEOm1dInYCxegIqrWLrJO
         w+Wjn0+7gWuLxcdw6l/OjT6w+3fRTSa4PvTCrI6husmjmZlEl1j7W1oCrsEve5FI6xNi
         6K5s0K7fOyHT2sNhVbTlus1TWhhNvNniUKf/j0X1NLnHrlk5vfhtpvB7uruZ+UO8Lsj2
         1xNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtkiFbvPvsfFqUc7kkDaqBQNIS14kajH58T2RPo6rA/s+nQjGA/KYeTCijTRT4jdrNQRIPb15OW/6EGiEqOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/w49Lndeeq+0xpD6hA9R64LHbtYsjemBGFAlGy4O5YIzmLGaB
	ZdXnJgJOidpvC8Pvjb/MP98x14hsW2JFcUpTs6l0QN8Wi+Nix1MsKETM
X-Gm-Gg: AfdE7cnegzOqn1eBsIQzUyKj7KOwMeq4gJWTChWUc4FrIxd4INNjGs195ot7QFfhJlN
	TQ3hFONclJYH+lY/2ydi6d0Gox77GPS0fh0OcYxG3xwYbcWi5HB5e03SVNEn+XArNvBZffKdpcs
	afzzZ5+6LTWdgsMJQ56HGvkI5/btntWu0MZj4QgeIak2FPC34K9g2p2c1AK25/dINfhOq0x8wz4
	cHXZxDMF8Mtpzl6jeLWIgwmMrsvPBO6S330pQMLePDFYO6i05hwkr0wZJHFBKjyZFn9CO4FxAFT
	CweMXeY1yfUbjkxuSZrCTx+Q1kvPm1tvNE1/XSA2NgRCYaWsQH3klMmvifMD7D/sQmFS13oxCRR
	z/b6UYiBUoplmHTsz1veWsLHUx7ZXcZhUBWrbw98Wu8Wx93KaPETZYriF3ZIPkpW1nAxzoDz7GF
	a8OYUYK4S0VNM3i9wOEyKvG5ReWYgfkMfmhNAj6nDV9DVLh0Su5QJHOyT0LuS9HKrErO2K5kbD8
	X0l7svdSMpY
X-Received: by 2002:a05:6000:18a9:b0:461:a15a:4160 with SMTP id ffacd0b85a97d-46da8c5fcb6mr10187397f8f.13.1782465642257;
        Fri, 26 Jun 2026 02:20:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Fri, 26 Jun 2026 11:20:24 +0200
Message-ID: <20260626092029.3525264-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022044_454517_FCA32E5E 
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

This small series introduce support for 2-lanes mode for Airoha AN7581
SoC. This is needed for correctly functionality of Eagle WiFi Card
normally attached to this SoC that require a 2-line PCIe card to
correctly work (and give the proper performance)

The first 2 patch address a limitation of the PCIe implementation
where the PERSTOUT reset were indirectly asserted and deasserted
all at the same time (for all the 3 PCIe card) with PCIe
enable and disable.
The 2 patch address this and introduce correct reset to control
reset line for the relevant PCIe line.

The last 2 patch add additional logic and support to assert
and deassert the PERSTOUT and also apply the required configuration
for 2-lanes mode.

2-lanes mode is implemented in DT by adding the required property
and by defining the "num-lanes" to 2.

Changes v2:
- Address typo regs -> reg in Documentation
- Address typo lan -> lane in Documentation
- Apply a suggested fix from Airoha for PCIe MUX configuration
  before PHY init
- Parse secondary reg in probe
- Add missing reset_status handling for inverted bits
- Move SCU to local handling in power_up
- Add check for max num-lanes for EN7581

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 101 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 370 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


