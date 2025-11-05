Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A67CCFA04
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 06:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5H6EdMxDpSqpmsIQ4cEg0ZlQTdzaOtsaMR+Q6cSWnBg=; b=AqWSrAd+hHGdkmyZhWWXJzS7dg
	YDbaJGStYrEqzRm+VfIZTkw/ingLxrYanFk9Y9/EyA/R9IEoleN3y89I22YrlIrJmPfTTdsIrVgd+
	ehsRzLnCDXWzrBIiWglCNiMuxnAMz4hzPvUi2Aabw78JfNq//spcQRdS1S+WAf3aOQpTB0+d0zYUx
	VSOxGE4fpO/gJy9gqPoNRRVJ8Sg7SU0akiGNvsriEaTKkSQ0oZey2VsrPNHiBcw9/aP9dOFLi78KO
	V9/aqOyOvcCfrm3UYcOs+e7VsDqef3i2Xa7u86LycNbV+h8SgTv5MXefjuFJED1JB9oAFw/ND7eR7
	/yiWO0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGX0X-0000000D4f4-3y3r;
	Wed, 05 Nov 2025 06:28:37 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGX0U-0000000D4ej-49od
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 06:28:36 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-33292adb180so6753021a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Nov 2025 22:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762324114; x=1762928914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5H6EdMxDpSqpmsIQ4cEg0ZlQTdzaOtsaMR+Q6cSWnBg=;
        b=fjly57ClYsKbDJH0Zvj53/w4eCX1jzG2UMFW5tgQnoaLFLCrKRhzQMCoIiv7FzSMii
         kZAS81FKR/60O+B4LSd1J+kMk3G2mtz16mUg8zIaLJ1NyPHQurGt0W1xhCsvvpTurC9/
         ArrMUa4YYbMqPxsswt0j0qIi3eI4YFnMDeDN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762324114; x=1762928914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H6EdMxDpSqpmsIQ4cEg0ZlQTdzaOtsaMR+Q6cSWnBg=;
        b=N/N2PtwPYI2sxgN2fAPAW4BDBTxz5z5acqTKYcpkXcExN9fuRD8BxvXTcKYaJeKwPF
         4ejmG5JUCDlNoT33j0i3i+iC4FZYSbp/iZZM3gSc5iV6K6OVNbjEfyQSDm8afHK5Nk1x
         Ht0oCVI1H+bzuaT4xjEVhXn8qEgM0znkA6FDfK3/MRqpBR6SsW8yBHEw3eKCT/WcxV9P
         phAumBDtBbJLIYvDGeY9g1eZHhXNaqqc1EU10OcvpMlXFHO3NOqsf0bPlfai41XbYVyU
         XiVbMa03uNYygUxQ0nuf70IHZmi77/5r1me4BxSSQHOyy11wmDylM7BmAoNrNG4D0aIj
         wD4g==
X-Forwarded-Encrypted: i=1; AJvYcCU7WTiFg/J7a72OIqaQb3hS7NgqkEuC0IQ8z+Atqm9Cofgx74exSsx7ptWngaFOIz0/hNWc67LMbzscLsuLMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz22VHOn5SeU9jq0Kj44cdqrgmNEU5vRwadqwe4fgL5SHEkKCV+
	KZHXMWTbeONm9LXYbdJECvL05NlLFE6dKhAEAXEqTQ6GJS3/T1y9z78/aUau/Js9LXgkbIKDZDj
	9jPs=
X-Gm-Gg: ASbGncsBYDkd0GsvcIipA5r9DumxzQogSzAXTzgmmW62UOo4FlVerfBVSUbZ17g6Jim
	IzWefPJ+4bbhfDz9LkDVPbSKROUgta8oPw8BwlCoWMA6KW9qghiAGe1OBvzw6CxWzj5AGXnlqJa
	akYhbsJCLI/3nGw/InBQ1c/Lk5uXC4lY/NaFFCjf7Bfm3fJdD98WWJnhuyrjD7uN0m4zaQt/he5
	ffxY/BFYaD3SpKzocuAaePCCZxLlUr9Evh3rx3vey1B6JDleudStT5wT9v1yWxzdB/OmDjF4Q8M
	3dQ5DWwAHgn0EGvu+S6BsmrUMAHpBqoXCcze583TRUU9cV0bjOc2CgDcy/sTV4o4ag46Gs6Yv4u
	/ody6PYbiL1vcAHQy23DxHzq1Rirr8v4u6/7ttRP6+XreMz3LYeTLF5eT7X1R4tJjiB1OvgsmC9
	gJugUpf/U0WzEMrGJliOaJrw3IOxH2pQIgdrzQrycPldG1ED0vCiP7Y2OrFB00tFjw0TGn
X-Google-Smtp-Source: AGHT+IHcxT8eopl534bKfusC4Hown9kjuaRa6MI3B1tgGIQ3dMjZZ/a/cIEyK3gcb84dHOtYByhoug==
X-Received: by 2002:a17:902:f542:b0:295:2d2c:1ba6 with SMTP id d9443c01a7336-2962ae10211mr34787125ad.36.1762324113674;
        Tue, 04 Nov 2025 22:28:33 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c3d3:7b72:a22e:7adf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296019bb9d3sm48438615ad.50.2025.11.04.22.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 22:28:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
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
Subject: [PATCH] PCI: mediatek-gen3: Ignore link up timeout
Date: Wed,  5 Nov 2025 14:28:14 +0800
Message-ID: <20251105062815.966716-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.2.1026.g39e6a42477-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_222835_087696_D86DF149 
X-CRM114-Status: GOOD (  18.58  )
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

As mentioned in commit 886a9c134755 ("PCI: dwc: Move link handling into
common code") come up later" in the code, it is possible for link up to
occur later:

  Let's standardize this to succeed as there are usecases where devices
  (and the link) appear later even without hotplug. For example, a
  reconfigured FPGA device.

Another case for this is the new PCIe power control stuff. The power
control mechanism only gets triggered in the PCI core after the driver
calls into pci_host_probe(). The power control framework then triggers
a bus rescan. In most driver implementations, this sequence happens
after link training. If the driver errors out when link training times
out, it will never get to the point where the device gets turned on.

Ignore the link up timeout, and lower the error message down to a
warning.

This makes PCIe devices that have not-always-on power rails work.
However there may be some reversal of PCIe power sequencing, since now
the PERST# and clocks are enabled in the driver, while the power is
applied afterwards.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
The change works to get my PCIe WiFi device working, but I wonder if
the driver should expose more fine grained controls for the link clock
and PERST# (when it is owned by the controller and not just a GPIO) to
the power control framework. This applies not just to this driver.

The PCI standard says that PERST# should hold the device in reset until
the power rails are valid or stable, i.e. at their designated voltages.
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..5bdb312c9f9b 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -504,10 +504,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		ltssm_index = PCIE_LTSSM_STATE(val);
 		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
 			      "Unknown state" : ltssm_str[ltssm_index];
-		dev_err(pcie->dev,
-			"PCIe link down, current LTSSM state: %s (%#x)\n",
-			ltssm_state, val);
-		return err;
+		dev_warn(pcie->dev,
+			 "PCIe link down, current LTSSM state: %s (%#x)\n",
+			 ltssm_state, val);
+
+		/*
+		 * Ignore the timeout, as the link may come up later,
+		 * such as when the PCI power control enables power to the
+		 * device, at which point it triggers a rescan.
+		 */
 	}
 
 	mtk_pcie_enable_msi(pcie);
-- 
2.51.2.1026.g39e6a42477-goog


