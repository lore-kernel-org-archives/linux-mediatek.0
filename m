Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC14CC02190
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Feb 2025 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BPX7pHqpPuTdZgj18/s2TtkdyjPHl+P21V8OABSkto4=; b=A4kV+E5qhVi+ru
	sw1qRcY6i7cgqaoXcRwrf1+ozJO9M0wS6Fm1s3gHW1RXwhb0bSSSMhrrIEjZFNQLVUNn5NGnqvH8Q
	YjGY43OiI50rcgjustxV1z1YY66n+dxv1cOTDciQQiZtuotfiL3GVKuMGF4f9KzucoLEe6BlpIFTC
	5Naz6j448dGMODoyhHNNG0CbVSf3rjU/nAyp0rVnDPX0/Dcw2eIPpLXECWzUxznxXuOON0SLSNvWe
	SjGAXav5tkspA/Fq5h+iEtMRsE6g2eb73UBgKbimxjR8I/VSnG9GW2TmNVltJ9nvvF/OO6velHK9d
	Vxg4K8PagI8d37QS/gNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teflN-0000000E6wQ-3ggC;
	Sun, 02 Feb 2025 19:36:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tefk2-0000000E6lg-2lQk;
	Sun, 02 Feb 2025 19:34:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9E38A40121;
	Sun,  2 Feb 2025 19:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CEAC4CED1;
	Sun,  2 Feb 2025 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738524888;
	bh=VU3MpY2cs9ONxFsQvcQxPlZZBeM5MNvxJnjXLfM6uPI=;
	h=From:Subject:Date:To:Cc:From;
	b=QDaxBCD9ZM7SbL8t17Uud1wE8t6v3PCBm/LJg6J/wt/BmHTTlpMtvcM2s3+LNa+K9
	 U9BueRbmaHwuUGI5FD35yt9eJePOYE+X8QKHsAsOonoteYuWF/7R8xnAdVBXk/1OtW
	 Ry61jiG+irUCGmc0b+Iv67M3KmAS85zCSRr253z/ed7WzvMUrGpShfTHbwbG19Ae6B
	 RYC6FUDM+D1NRQQgQcvmzAAdCFQNowgDOCfE1SaHxW/Z2Sm+tiUCvHd5aJMDYJkS8a
	 Xvv/B7l+fVKZGILX1lKVmNkYAhb5YtVXa0240y1Zh2ec6jSffZqwGAuT89IqsBV7C4
	 xlWawkG2B4HOA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 0/2] PCI: mediatek-gen3: Set PBUS_CSR regs for Airoha
 EN7581 SoC.
Date: Sun, 02 Feb 2025 20:34:22 +0100
Message-Id: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7In2cC/x3MQQoCMQxA0auUrCfQRovVqwyzmMZUs6mlQRGG3
 t3i8i3+P8Ckqxjc3AFdPmr6qhO0OODnXh+Cep8G8hQ9+YBSLzEFbKyCLb8N2TqWK59LSiwxn2C
 mrUvR73+7bmP8AFZFZr9mAAAA
X-Change-ID: 20250201-en7581-pcie-pbus-csr-f9c4f88ce5b3
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_113450_786169_41383D90 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

Configure PBus base address and address mask to allow the hw to detect
if a given address is on PCIE0, PCIE1 or PCIE2.
Introduce mediatek,pbus-csr phandle property.

Changes in v2:
- Introduce mediatek,pbus-csr phandle property
- Drop patch 1/2 in v1
- Do not hard-code compatible sting in the driver and use phandle
  instead

---
Lorenzo Bianconi (2):
      dt-bindings: PCI: mediatek-gen3: Add mediatek,pbus-csr phandle property
      PCI: mediatek-gen3: Configure PBUS_CSR registers for EN7581 SoC

 .../bindings/pci/mediatek-pcie-gen3.yaml           | 12 +++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c        | 30 +++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)
---
base-commit: 647d69605c70368d54fc012fce8a43e8e5955b04
change-id: 20250201-en7581-pcie-pbus-csr-f9c4f88ce5b3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


