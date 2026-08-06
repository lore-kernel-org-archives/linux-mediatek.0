Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E57FC56205
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=; b=Ca0xqJtyU0St0YtOz5iMRmQ03E
	N51u0MjLsMxLOOECo996+9UdBoVNy6/E3KZJ8ErHRcS1Yy7ZpWA3S1drExa+yFz2hRTZ8qidI+CBR
	myWRDsGXGOcD6vpI1ej97irlx/EHjmBjPtmY1OUydMQjXIrzPQ05KzLh09NU3ggPynBKl7lAAVBzH
	c2kzLA8QHizk7YMcuzODPb1DsY1qcI/EB1UByals33oFvmnUVSfElQH4fde66b6F+mt29gNUAgQyr
	uEjPRfkCbfrDaruXqjtSWURneU8eHzf224vUjGQUHBhUkiS14e0rtdvk913fbg1WQZ6nbKAAG6UyZ
	bZsYoF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Lo-00000006GPA-0qTv;
	Thu, 06 Aug 2026 16:53:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Ll-00000006GNn-2k3s
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 16:53:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f84023916so2207161f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 09:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786035224; x=1786640024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=;
        b=UBaM78OUBvEdnR8sL8bdtZf8p0U9MdOwoiCdhqm5wuYQ52UU+AHHjkW9OLeXiClSW0
         xw2VkDPHyC/dFYpk7yHPda1f6CWFAoGn2+B9G8/wlpzInt+bsua6eYuNFAzMynHjia08
         z5pAoC5PHQ1bJX2J852Xra3neAk0pZc6ztG4w8Kfk/LLYEtRNY90QRkiYWPvGvxQ3lV1
         pKTEydP/VzTJFKFalyLkY+Q1r+qI9JDCb8lMj/h0J3k/JfKK0e7X4Czyhb+V03Sk7OLA
         MzkyrrAyitXcIo2yL2Y8YkGgooUzAwJvpKJQfn3ZHtxU3ITR1gPrQaJIPNphJud5/Gpd
         l7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035224; x=1786640024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=;
        b=osceaYvZc3Ttfqcaoz3Rpej85OgEBzM3tf31sdnb4Gqt9aEVpUKzPoeo/3lQmDZORt
         rsG/NQTh8KInM6KxV3jQcF9tr3hQAeqEFObcUaMMUeIq3ZcWwsZFy+dyznKYhimaTeCr
         1dXJwBzULkZX9wSk8Xj8JRh3dp5rrEIo1HOE+5Lk02rACc/6NdpQQgB8EWEgs9pKksZY
         TSdY1fIXFHljFU5l3lwBOoTkNSvY96AIbHtLGr7Rxer6k//g44PiN7n3RBbBb9d+daWW
         QhvbWTGQVTyjlPhQiCKchZI8pJzn98vlJBFYJNdJQ5ciOeFRxRBTDlq5Vbx5xFhMS+qg
         YQgw==
X-Forwarded-Encrypted: i=1; AHgh+RrJEGgYi90hG5RxCBtTyhDUJ1lNIcNL5q/N+W6zS1SG+QqIm9rb+KVZ/26cWdhWuKDMtxez5IjZKJbdXSVuFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQR7qc8eKBR707jjPXhBuohq38gflq23LcrYD0fQB60LOA/EtA
	gKwiV+K625c5DNLDArXm6BPX6AZrCqBEzyt3f+/zjgAN1y7XI9/0ZQ26
X-Gm-Gg: AR+sD12f+Py5864e+8xqelHQtxeRJI2JDlujNU2R0BjB+2zd4vc9cHykbTb2JwtmBUb
	wGsxE4hKdfNysT2kVhTU5W02PLC+FhFHgfrLS/1kxRo3B+eM3AK+Nt9xv3jcp9Vgf7/5dN3VsZ0
	B9IzWqviijfOM2W7tE4F5Jj93Rtp1wjfSBpvgB7C2jEBUdV7PTAXNi4daJR8kXN/fiRwKc3tVvB
	y6rQF1aVetBRk5KDZSTGq+vmeOxo0oKewQkzkJNbuOGc5Lc2GCBOa4uVB4alvtC03/G4k+eCwTS
	v2pVpmDM7NrTUMI6nuG3bptsDg9uYsdQ8nTqfS2xGZGozk0wpJoF3E8EwZcSUn+gy1KKzjff5lh
	ODyB67vV7H6ZMp76TgJbQUz7ck5sbKWvBumOzdL8FJXq7+q/lgbkjjG0IbYH70WJ+hJOG0LT3S1
	K6uQqtqwLcKQ9Wj103tF4LzKeZ0Bp7N6eZ9s+WTV0jjGgPYBV2jftKYcf42j/FFZP3kAeC8GrWL
	Z2p1dLRangg8f2SKXCt2A6scozUeacbE99vw7b42XKnZgCNwljq0Ny4/6TjEKWK
X-Received: by 2002:a05:6000:2988:20b0:47f:eb80:ff42 with SMTP id ffacd0b85a97d-47fec4e2975mr23732729f8f.4.1786035223457;
        Thu, 06 Aug 2026 09:53:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ff79a7f07sm8070586f8f.8.2026.08.06.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:53:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Thu,  6 Aug 2026 18:53:30 +0200
Message-ID: <20260806165334.7328-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_095345_707348_0EE16C9A 
X-CRM114-Status: GOOD (  14.32  )
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

Changes v5:
- Address formal comments from Bjorn
- Drop clk patch (handled in separate series)
- Add reference to clk changes
Changes v4:
- Improve DT split patch (drop unneeded property)
- Handle power_down PERSTOUT
Changes v3:
- Add Ack from Krzysztof
- Improve commit description of PCIe patch
- Use pcie->num_lanes instead of possible uninit variable num_lanes
Changes v2:
- Address typo regs -> reg in Documentation
- Address typo lan -> lane in Documentation
- Apply a suggested fix from Airoha for PCIe MUX configuration
  before PHY init
- Parse secondary reg in probe
- Add missing reset_status handling for inverted bits
- Move SCU to local handling in power_up
- Add check for max num-lanes for EN7581

Christian Marangi (2):
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
 3 files changed, 338 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


