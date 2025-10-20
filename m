Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A5CCD193
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1J6WMqH03oILDs2/tT5ntrxwega9iCwgysVz89dOfmY=; b=AYD/tSbD1b84B5pPbGGNXilgAD
	Mex6jJ34QTKm7hdFdgo2kiP9g/OvY1cckl0JDkW9bSj7vrdG0cqDkeuYdCA/13Ba0UPdM9l1O2/AM
	Mja25C5bMrIVvH+5kkqHhEnHNFbkU9I542K7Xk7pv/8SNh9CXJ/Si65jTG/FURBSq0mUS6h67w8Z4
	NZasth0M5JY81euNK0OClQUqoTt1TsmLnm3D3FTNkLSgrFtnS7RvXf1Zst/UoHpk/g3u2KK9gE2Es
	ds++QBOZ/Bo3+Q7UhZod8dJQwyj+vI8ZgzMsPY1BCVcUn+PZckWWEqKXT7ae9MB+s0Te3oRsHMuV9
	tJWXrNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnj-0000000D0wx-0ZAv;
	Mon, 20 Oct 2025 11:11:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnf-0000000D0v0-3xPX
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Oct 2025 11:11:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47112a73785so31632245e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Oct 2025 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958698; x=1761563498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1J6WMqH03oILDs2/tT5ntrxwega9iCwgysVz89dOfmY=;
        b=ZLYu8JvTU93fzQUMwTdYx+LExfelYEFpDWwVuxnPv+QkLpoMIbVDs0XqpQgRd1r3Ma
         4WTFXVd5Ptyx9YOojUxLl0jNSa7N6mYsFu3JnkaEG4NFXLfFchpH03/jv03rN/Nfy69e
         v9lX641Qvgldf/k2kgkFTwMvSWkfevHirM8Bm4rI6SYj8btwzAAreOCbTx1JrSctE2Fr
         5X6I5YvZbxD17gEP0fxCSelpA9Q/ln6YUpz9tRp7KL0QnjeRHdvSJ9u98J4EjyqcBJJw
         ytoOrFkTM97spBG1aRufWxHis7UpB2GSKqO47BjxAe6eNHMDPsINdU9Dx3z9AyregJ1A
         ILVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958698; x=1761563498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J6WMqH03oILDs2/tT5ntrxwega9iCwgysVz89dOfmY=;
        b=e/ECS8MoUejWflYolOKmVN6Fd+DZtzKrNEQ5CrWzxLTBeRSLl+e5qBYEFfeMuKACGn
         4xZUpRSwylPSuMI3Mwv2xLM2c1yrKO1/HI8k4SgVJ09Aw2EVU+LGnGbYdwX/w9wxSDob
         G299JNdktm+i120DKQoix9PZFFA6h/q5/Y/GccZzWL2WAoyB2gouiVmqqWzv80y00peZ
         JkIaBoLbfy3GSXEHUJUsEhbOzOSRTl3RH2yVwFD1/rxW8cgNJ3ZJ2EDcQWWnt3Z1Fr0F
         ox66E48i4h8WfWnMQ2Umjk7LlyekEOMeR96DKaIskEGicjEmDq0YGg//QbAZ5cnYikGZ
         Euvg==
X-Forwarded-Encrypted: i=1; AJvYcCVLbGTcREvh7TsxTxXTSbGyIaG6RInp6dof6AgbCuBAeOD+qra1Z/Ma8E10qcLFxRBlY1EDVbpiHZvhqJM44Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwATvRTU+9D/uqCELJwDuQ2rEQyRqkC5l42YIgZIUtc1YB9GSHM
	BJmHJjMSbDT0zoZ/PPVIM6YyWAx7yjzVh94aDkb9QsVlEBEPoDYJC+Au
X-Gm-Gg: ASbGncsgU3wf4bby1JfZkdP4+v11j3UCTLtMzNeOpp6OxOPI+2PM407eREz+pOZeLit
	QwPmV6+UqkLjcKODsPneCSvW0UwaMRjO3/2fPaRjlA+FHA1Rxulz+pxGLcV/bRqwHbIGq2DVc8z
	hFX/tR7n9fkG2sG3I71C8vkDPOcBj/pVHSxEa8B95/3uSWtJrIxcXLVPz/fIx8EUgU5e7kWVbSZ
	qcmxJK0Agwj3yhIyZ3T1e3WyYIGr3tTBLxcP+SDJohZJ69dbnXZEP67HtqSnP3SaUg/CwKpERsT
	9r+2sUNW3QreJtIAGdYcoDSjNepoDi3nULscbGeNjkgAUYlfduuTwUngf/aK7HwlDwki+gDh2Hb
	H7GBrqI85C+0ZvTVCfzTPBG4zr7u7Czey4iUN8I5EqPQB3+Rh529Sj3Mop1MRyG74Cz3mw1nfOg
	RLplDrMd9wkQoT0HVGsrWXjR+13zzsgq1bsZYkC3ZTQdA=
X-Google-Smtp-Source: AGHT+IHVbG6TZHa2zycGcNFH3hDK5XZiaq2XHp38I80LU/N8i2ztgAzL/k/rCSUQlcdD5KrEG0KaOA==
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-4711791cadfmr110884785e9.32.1760958697834;
        Mon, 20 Oct 2025 04:11:37 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm12692219f8f.10.2025.10.20.04.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:11:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v6 0/5] PCI: mediatek: add support AN7583 + YAML rework
Date: Mon, 20 Oct 2025 13:11:04 +0200
Message-ID: <20251020111121.31779-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_041139_995590_6B07DE8C 
X-CRM114-Status: GOOD (  11.36  )
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

This little series convert the PCIe GEN2 Documentation to YAML schema
and adds support for Airoha AN7583 GEN2 PCIe Controller.

Changes v6:
- Flags -> quirks
- Align commit title to previous titles
- Drop redundant comment for PCIE_T_PVPERL_MS
- Drop DT merged patch
- Add Review tag from Rob
Changes v5:
- Drop redudant entry from AN7583 patch
- Fix YAML error for AN7583 patch (sorry)
Changes v4:
- Additional fix/improvement for YAML conversion
- Add review tag
- Fix wording on hifsys patch
- Rework PCI driver to flags and improve PBus logic
Changes v3:
- Rework patch 1 to drop syscon compatible
Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (5):
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: Convert bool to single quirks entry and bitmap
  PCI: mediatek: Use generic MACRO for TPVPERL delay
  PCI: mediatek: Add support for Airoha AN7583 SoC

 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 164 +++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ------------
 .../bindings/pci/mediatek-pcie.yaml           | 438 ++++++++++++++++++
 drivers/pci/controller/pcie-mediatek.c        | 113 +++--
 4 files changed, 683 insertions(+), 321 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


