Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F150EC02183
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 11:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWwH1bDPMW4sIvL8kmJCxcSzCH8Ejrs1sg9Vv46J164=; b=MUVbJUfRRD+x04Dreg6bvWOVHx
	xdaJu1BnVWykOX46J0ZaQORmUgcckFLv8Ra/vsTs29Nu6nrrTRJLA/GG/0G/S6O7MJOWqC3NWvHni
	UqsSjleAPY0qjvhjuiXOTVed3p1Yi7DRyWRLqvXXe7vhb8L1iezQbYp3UdihRjBze/JSOukSxSzgF
	BT7Cyp6baH9IczlzdjxOSv9furJN8poy3QcZ2uDlveNUJnlS7dVRX3oIQgpqEM4WZa2kn23PiEEWq
	BuxVLrk+ZAkfecXQEIATT0e+4EVg+S3YP7odqWclF8BCq1EwyFhkNylS313mCNqrm3tTeUpNGIRBd
	ISXQ4Iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1MB-0000000BdQ3-05TB;
	Wed, 15 Jan 2025 11:14:43 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Jw-0000000BcWz-1J6z;
	Wed, 15 Jan 2025 11:12:25 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21669fd5c7cso119710035ad.3;
        Wed, 15 Jan 2025 03:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939543; x=1737544343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWwH1bDPMW4sIvL8kmJCxcSzCH8Ejrs1sg9Vv46J164=;
        b=tyd0GR5CuMV4P/ZdCdSRVO2E2H5m/9KCjge2AF/nO+sHQHMmR9gS0fmDZsX4hZP72j
         L8Si1MLklDnpRAQsy2WBKs9jXt2HfN0iX4Fgew7r5XU+r30VJ8yw5Id9bCR93dzQf7KP
         g7eaNovCbF7FVMaWF0iLQkSxYX4TFM4BYpX6SwaDH7H9uLOFoqmnU0KZooOW053n1alc
         EAusKP0SCpxA304sR615w2kAzWLAABJ+fnT1oAFG1CpRAcqPuGbts53wimUEdlzmU4G9
         cNlkeR1bGkyDFW4yEZ5LgXSGWySjaqssjNXjz/xgzmZnbeetAvP5ebwr97GA6DhodlTe
         WorQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8ARiWmnFsnb8o5OpAVWg3TdLnV4St3tm0zczze279s1UBT8phvp8Hl1d5s/vARCwr3hY5IdMI2Lb2TGl9FnM=@lists.infradead.org, AJvYcCVf4PsvqOJsAgPeGsGsiXH5fexEQXXh3d8fbJ0M1IxyrtfeoNU4BgLsHqiD2tzRm+OueM6sVQHwKvcnZHQaqFFo@lists.infradead.org
X-Gm-Message-State: AOJu0YxTYAuhMFih/lT5MjmcH+0rLdZ492Nno4q9keGwIN0Jbebtv66S
	eMjepyjJwiBhx8RvN0jX91zMAsTg+Xs8/TeQPCueMRogHVzNOy1g
X-Gm-Gg: ASbGncubXYgdiroKY5SGJu7L+CvwZKXgnsm0pijyguH8vcjWPSqleTfcA/S8WFNscuW
	BS/Eb5a+eahN7gTFc8Hb9j4IGPYVMVUzENYKXNM2WL01VcOxPef4//zhI3VjJTBYOhvNGJUosI1
	9xGDgbaf+8cdAMRUDT7W9w94zWrtYJk/96l6M/ENTMbhWZvj7HOjm3wERZzYJ02Yd4IlxDmJpzH
	tnLw95DMYRH3KkwGjWMAORJTN8NYZgf28CuI2aT6LZznnjXfUlz3nkiyiinw1Jv0ZPys4X9qj9x
	FyHA+M2HMC43iT0=
X-Google-Smtp-Source: AGHT+IHFoca7ZCISTDX0mGzInAWIQ58L8qkZmkBMA3Zf+oFefoTlL/1UC9F+En3y5YImzKRbiXnU4Q==
X-Received: by 2002:a05:6a21:a4a:b0:1e1:c8f5:19ee with SMTP id adf61e73a8af0-1e88cfe2ce4mr44391726637.25.1736939543365;
        Wed, 15 Jan 2025 03:12:23 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31902b137bsm9540020a12.35.2025.01.15.03.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:12:22 -0800 (PST)
Date: Wed, 15 Jan 2025 20:12:20 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 0/5] PCI: mediatek-gen3: mtk_pcie_en7581_power_up()
 code
Message-ID: <20250115111220.GA4176564@rocinante>
References: <20250108-pcie-en7581-fixes-v6-0-21ac939a3b9b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-pcie-en7581-fixes-v6-0-21ac939a3b9b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031224_345228_F6CDB7CC 
X-CRM114-Status: UNSURE (   9.98  )
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

Hello,

> Minor fixes and code refactoring in mtk_pcie_en7581_power_up() routine
> 
> Changes in v6:
> - remove mac_rst support for EN7581 since it is not needed by the SoC
> - fix typos
> - Link to v5: https://lore.kernel.org/r/20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org

Applied to controller/mediatek for v6.14, thank you!

	Krzysztof

