Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC18ACDE00E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=; b=n1uuaisxpuU6kiBrwKxxXyyVny
	xkhNae4pJYVgz69ljR+pFhMMI5nppdrtXrZYWV3sysdAG6MugffZ+phUTQkz4yM/ilwmKFWBsYvCH
	t8kSx1qrIo7RIWjSiQRJGKazQJdHtM48Ffpqt9v+7vua7Yb6xI6DoJETQUbSUGKByMGlVT81n9HSc
	NFYd8H+6pU8u2HhJ3ki7j2srwjX/kMaf46hdsijCla5ahAnkkiHB+DtlQDBvp8KTusv1ac6yKP7cN
	k00gqoDo9BrPSNs5qRX1OW6+3ymMF2j2FMBB8Vldvnil/7GRYty+gPzEQiEej7qY1g8lZ/ovxiYa4
	y+Ec811g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5B-00000009tdX-3wKj;
	Thu, 25 Jun 2026 21:58:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs59-00000009tcF-1Oxu
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45fd464d51fso119199f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424677; x=1783029477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=g15WMTvmk+wBHH5yOqKthlUVbmJpOyaSK0mW4joJUCOMra4uPNXVSszsaaZIfmqC5/
         h1zk7qjrTPibzRtsFFU11uRPK1WB6h9i0XYGRm4fnuFIttDJMA/dNKliJC4qk+B8KV9Y
         eCdB0SHHT/y4Q74Dm9Aj8Kuy6y5PX0Y+Cs2ZaruLNpi6zfqXZHhaZ0+QTWQ7ribwkYJf
         mueiLleyCzTkk6SJU4eCSmKQTAs8dvZuSijykA//S3uhOYPZ71x7a6aF9cV2Iwtp+0G9
         9g3N++0V2pVgaOhg/CnI4uXQTfxy5KoDQZnzc9KQMN/xV5lPdVrC4kkSRS6zqUqYhk63
         vl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424677; x=1783029477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=BEhINUuFJi+xsVkusLu+veFcy8710xh2V7m8xzLwyyz4NG3b9tzcgozw1SXne8cf70
         zZu54QmPwT68eBeX6ARPIy4pCVkNbU5RJrM9hxrJI9mMNSah6duQCzpy0qzEVOv0omzY
         UH/eWoNQJYf1KWROH43VaZOQ5TMgzczi84R9Zc3ylej/CDoOao9IgmZsSd+zIYjrve9W
         3+Gpcgp4ZG5L6RNee/udM+A1yvaZdCdelBQfTU4GnXWWkq0hWCB9anWuaZNMDZ4+mjth
         3wDXHjIW8yPKbEi7kRV280HO1I3TLdEo6ukd3H6ZTUXp4N1zOspVXa3jKXM/KtDIX4Ea
         NOkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VBlHXYfP8Yr3YUghkNzZXSxTKivhFueImx3uqtuJPEnLUBPVQh/zM9b81Qu7we0QH9MnMLXyGZow1UNxijg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMuus85hnDt5Ln4cCNQgquuAxfof5YZWGvRiyWkkGB06JWrYcb
	K7GmSRNFZ9hVM+/W76aQeWV0G379czEPR7CnLt5o0oauVA/7uYN2BPVn
X-Gm-Gg: AfdE7cnsyMUdEOzSepoQ5yV6pB+byigx6DUfUIn0WpTWXYBjmrot8X4aU0vSljcc1ri
	xG12sV5uul6tL3X9/JEHshVLBu082/5ZJLTt9YMbHxBuM3Nm/x0RdwDttWLP+rSljpX1q6X0wFY
	Nk/60nQ96wrbEguiIIlci0PGxXVRudRtkfX8Qa9hoHHsdW1rRDHnjR0dBAL7wnbT26ymMScRU+S
	r4jJPNSqfOR+NjwYN668Y3/12iB9QYC3ad42arliHWo9/S7D6HVAgghNw1Ic1cJudx4gMJwWuea
	n1rr6r4YAdKAMf/if7fAi+atoY1R3Xfssi8rTso0Jb61RLUMwIgLXEePcXEQfy3ZpcYpAzeyYK7
	XftfRIXsNHjHxBFptHtX6deV5qirk4LpVlevNgnfx2NyD4jl0juTCutaPxm2NJsiYSFMUOzHi8g
	tmX8XCCHqutguryw9NPRMPyxLmOEpg0gQtE74d5Q/subf1WIEfh3wzvPJbO0VFwSejFO+Fsy97p
	F80T2F6UUMT
X-Received: by 2002:a05:600c:4353:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-49266893383mr39799415e9.26.1782424676723;
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Thu, 25 Jun 2026 23:57:33 +0200
Message-ID: <20260625215741.3253212-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145759_412828_07F82C7B 
X-CRM114-Status: GOOD (  14.40  )
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

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  27 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   |  98 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 358 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


