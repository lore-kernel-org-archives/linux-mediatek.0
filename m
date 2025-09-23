Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D8CCAC5A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 19:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlIfyIuKUfu0Giv/t2LPO4IvsJ2XIyV5+eVLug5OMo8=; b=CkfW7AoQgeCLRewHpePrMaHdHR
	Od4NdJAI+BEAdJ7/62rooobt2IlFq2FLeTXu2EzSyRWxNF7lB4xRZyJjcSZxDOxLnOAjdmZrnawqC
	0JYiql/96IOTLyUL3bld+PxcRqQoBR5R1dN0W0UORCK2Jw9INGiVczdKlsQCTlmpt4NqaRiX24Q9L
	ZWyib+tPB2oPOSvCHT9IAGO1ntS1uERDzf559r935oWSdFe+PP6zsA2fR1a+C35mrz4IkKTfOrzgc
	1B6V4nBayeFqRgPqKP7cmoRcxkwSbzUIgmjah8uSRxwW0dlNJ7t9RIKyZsS0/NtmRa+TEls+x8C1T
	cUUYAvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MI-0000000EchH-0Hyd;
	Tue, 23 Sep 2025 19:07:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18ME-0000000Ecfe-2bca
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 19:07:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45ed646b656so52269585e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654441; x=1759259241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlIfyIuKUfu0Giv/t2LPO4IvsJ2XIyV5+eVLug5OMo8=;
        b=maCh6nqOOuVKVD10GTgQlFn+HvNcZ2u+8TTNZR24nh1Ey8FEf3qH9V0sU7zmG5kDRB
         SAsQMG1g6/Bh5UZlC9QcNFb6d/tDBDLQjOX7nOw3cGbW78+qKb13jfRwz7+n5zUG237q
         r2w1sXKBglcpibhK2eKNsSdbSwRjWpy+fClemexX/Mc95H5OtCEvhyaCK4LsOYSkaMEi
         Ad6UZqg1GHk/hf9TAK4Cs3Y+FSRvwju/ta3Fs1A8SV7Ss2OitnO8OKknGSJWkTt1/h/K
         jhnsjHDBOEe5mVSz0qW6j7rukJrVoFbVWErZ+azxN/qqCwdz8CtDEWoOe32lUMWZEDqq
         JXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654441; x=1759259241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlIfyIuKUfu0Giv/t2LPO4IvsJ2XIyV5+eVLug5OMo8=;
        b=EuxHc2+D/I4I0pMIp1dZgBrYE0vFE35Bvq6aCazZwQID1fwykBXuYyAPyraX/+b7zs
         6/k7RftR1k/TkbzVI3Jg2ckAHeGajIlD5euHamo6szSaV+kzDgk98I2pAM8Wo4nvVzaf
         DgQKck02CgoDNZKjz/q5FCO0Yn0Km1lyGfREWzGo2fBvv5/rwr+Wq5oha9d5hplY+wNx
         caP9TBUc4FLINbqbLiqLIfBFALyJmdCZiOHEPssEBWTvGtP3EDyvoLy8yEp17ejNs3Ev
         +3REkQumo7vQe+MuYtzsh89gcoHfSLJZjBkH+WTUWmXXdZitozjMyjQHp/WxInBWcdXg
         2SEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbTQJaQleuPRMlKSvzbhja9v3EUFPGPlFl6thz/YvKKp27VX6Tpms3sWnN/ZMQRD0Jq4Awq+BGdpxGQYWDOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGAcrAlc+PWmGlJkzRGEg3fAGJo6hbcGYzCC9VFiMQ22uUiTkL
	CYyUFxlLTJeO7AlJQBTTFMzYc6Q3HOPUHuaQggrWdQSsE7XhIZN+pjA+
X-Gm-Gg: ASbGncs//JrX7tV1J313DntdMqDb2ESh7zlG76OMBUi02oTL4JPKTi8O65wqBtFBQig
	JoX6DMczysfEty1ejfIBJBaT9fpfoez0QsMrX9fRPobQS4jyR65AVTqDkoh1AD7Boxr4SQMHBIc
	YA7CI2gtmueYdhLn9rOZkl5FHtSnyuJN2o59/l6cIjnlVscoiQefi2Ov0AXxzE7sn4ZcMcsXOca
	dhf/9wkOcANj8qn3KS+fQPlk2BDY1sccDjBkRBIQKVlfnCNwFjxf+8SF61elfhGxsC/2XylaYEQ
	fPmfWP2WxfVt4UFAUUW3f2Ao5VivJ5H4BD4I91YMp1OkYjghwVC6KhRqRmfgtoks5nvxRhd/BHq
	kXH7w876lqYVSoiWfMWbXUI7v/FakRLex8vxUUsZdU9DfyfSO7yxubEsmOmTwE66l0mmqfA4=
X-Google-Smtp-Source: AGHT+IFoxRtCJp+VI5Tw8FmClZ4lUAsWofpK0fvdL3jcvd8nDXAM5pqPxbH7pHIHEhBDKvkDPaydXg==
X-Received: by 2002:a05:600c:45d4:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-46e1d98004emr43610015e9.9.1758654440543;
        Tue, 23 Sep 2025 12:07:20 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-464f0d8a2bfsm265240915e9.2.2025.09.23.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:07:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] PCI: mediatek-gen3: add support for Airoha AN7583 SoC
Date: Tue, 23 Sep 2025 21:07:00 +0200
Message-ID: <20250923190711.23304-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923190711.23304-1-ansuelsmth@gmail.com>
References: <20250923190711.23304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120722_678553_6953C8B7 
X-CRM114-Status: GOOD (  12.42  )
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

Add support for Airoha AN7583 SoC that implement the same logic of
Airoha EN7581 with the only difference that only 1 PCIe line is
supported (for GEN3).

A dedicated compatible is defined with the pdata struct with the 1 reset
line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Fix alphabetical order

 drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..6e68ed75b564 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1360,7 +1360,17 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 	.flags = SKIP_PCIE_RSTB,
 };
 
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_an7583 = {
+	.power_up = mtk_pcie_en7581_power_up,
+	.phy_resets = {
+		.id[0] = "phy-lane0",
+		.num_resets = 1,
+	},
+	.flags = SKIP_PCIE_RSTB,
+};
+
 static const struct of_device_id mtk_pcie_of_match[] = {
+	{ .compatible = "airoha,an7583-pcie-gen3", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
 	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
-- 
2.51.0


