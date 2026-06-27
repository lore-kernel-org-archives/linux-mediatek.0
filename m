Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DC5C43211
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2026 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=; b=fHCql64HGv9jb8SsTjd3OZOSKL
	6kLrPowDCGgZu0kkMpO9txAcRWPz1+GI339ErbMVmLPr5tm4/YzbOcW6jxji4IX+VzhU4JIFst9lh
	KJ2fixJ69TF8v5E9hfytlJM8tahqLLGGveTnBUDfKXGYWRCVEGihXvjZ6OPbUUJqe0Z5FglqgYjcY
	mVX4afiqYjTJUx/4vc53DE271mLxia7qzP56ZnRTANBnCKr7NuWc7jWapIiFAagGfvAt7hzDhdfUo
	vUO+BWgvllcc2Lt0LYBt6So8vrgTaWY3XdtrLgc9TBGExjZZmOQ+qlXFgu3Osi3ZJU1yiwbtwy28S
	xL55H0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRw7-0000000CRLX-3sCU;
	Sat, 27 Jun 2026 12:15:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRw6-0000000CRK5-0210
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Jun 2026 12:15:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so16085335e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562500; x=1783167300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=U5+brozu/R7P/ii+dXA7MPiWppj/jXr6s1R0vDAxbxbdHbVFVHiqGB+yN5IKcH2siN
         KiXUuOyo8s6RYVW+NRVIySZsFf8PWYmJzNKNz5pt35xJiCJ4iBjGpLAw7khdWkzMpbR0
         ScHv92aNbsVLIq/EeqbioJMQGxC2jlYsbajrwhGJ67VzrraYEMYtIMzwAZrUwQONaobj
         oPOTMEJqaluch8PveaEAiuja8six9L1rZSDGE7OfGPprfbdL9SUonjjFNDQiO0dGXDlW
         Yx0bwUxLF7gcPb+ej7BlmbPgkcwe+yUnmLCA30rKlv4vDXkh6sd3W3xe8LKtiNAR0EHm
         nrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562500; x=1783167300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=DQGdsv2mqHu6cOx4pqAfFuc18eem9GxOfBSsCXjsxHNXtTsFmE9agsvb6RJOqEwsH6
         jrpjvM7auDEHCWv6fFb8Scliw0P8wC38T1SBy5HbLSghIQ/BWrbijM16798bNON8VLS1
         4gltzRt8utsHfmTeRObg+sWScThGk0pg+/oeW9S2jeQOH49zE92Hkq9Lxt+AR8j0/DBC
         8QWemBdqP8XtGj15y/V9UafsfPQQ72smU5PTHfPBlSOw+5vzSK1pW1CpXpxsfeExVPTR
         GmPIX4LgXLq/gCXQrN6n3DXgYxLwH+WDhGOa5V6vTYPptOMlxFSdk+9BkS8jQG0yH8Uc
         SZzg==
X-Forwarded-Encrypted: i=1; AFNElJ9Qj1+rHPot0q9F4l2CmN5t5tCZjYwiH6w0wDt4WTQaDAz51UQFdySsOeh9TeUSMVqse6p77gQKSAcADUg/5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbWHMOpTL5MO2lbzKFHgY3lRMITykBROZL5xNV8FBbbni/Ba9q
	2+Et61Ljjs2Evh/JuqS2te5J9/l16JuoDSxbQDiAFnfLmbAD1uaCnmcQ
X-Gm-Gg: AfdE7clQe6WU0csooJANdWkB2sKPFafgwGHJwb7JM+Wk7jQRaYCFolO97wKr2yfqbeG
	XEpARPwQ46Co8vEwZPHhGmXjuSs/zntzsWMz75n5fHDltgO4zdVx/h/+/W8XMbTXa4Gi+Q5Mp6x
	Y6b0w4gfuuAhObAlL1OF8itvERctn1NPAAMnuCgE5hBXqSzZozjqtvdgoXkcFDurB8iSCgek8QZ
	lT+A81UdaeBNwtRNRk9V4SNkM/oCXpVvd0l1QSLpI8Fm1ArHGY8/vD11qVRrgmVP3TUAlXBivvp
	juRVnxh/4LXOMObkeJkuk1boKmmRxBtFDRUGAYmgTO6VQ1Oecy8e1j7+k3NLdoiwRr+9wudAn00
	Kc3KneP3lmRIcsLOxss9E+3tmUiLYz7PrfNj4WVAkoSvifu5TtrtIsKsi8J799WCaAH6fadopX7
	eySv3RC5CdCUKhip4//aFN37xHdk2M8wMQqRxmZe4tBR/BRm5yuqOzmr9SU7yqdA==
X-Received: by 2002:a05:600c:3f06:b0:492:33a8:5499 with SMTP id 5b1f17b1804b1-492668858a8mr160407315e9.17.1782562499407;
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
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
Subject: [PATCH v3 0/4] CI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Sat, 27 Jun 2026 14:14:41 +0200
Message-ID: <20260627121450.3529133-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_051502_071845_1029C129 
X-CRM114-Status: GOOD (  15.09  )
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

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 104 ++++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 375 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


