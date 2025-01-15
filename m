Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A7FC02180
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sz8qYCut2vMXxqWmWVOJ5WSfbE/dmnJ2d6EiHkz1mpE=; b=TQMGwURXop6l9bTIv/GXo5VrSv
	b6U6P1SRAQqbhw4Z8xjB1a/s0NJu9BN4vNVBIIUb92jicbk2PG+SQfC0B+6gHVexvNcVJ+lR9p80G
	h6xjg/xvIp/CmPE62Q5kjtPwtg91RWgFiulvP+if4Ubh8+Xb9GiWVdkEeqLedQAVt8Xj/C1yJFYPw
	zNbWy+B8pNmGuiDcHxxPItj47qew1PGNrHl6YJVNa6NSskm8zQdAq8ewMzZ1vZmfvSNzxVXjD8pK4
	DvhlYfEPVVxot/bHf9Li2Du6YGTIr7pUjtLFIEmTn/sM80Fsycjd++I83RoP2stKG1qBEyrH7nHmP
	v6Em2rhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Pq-0000000Be4a-2a1C;
	Wed, 15 Jan 2025 11:18:30 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1M9-0000000BdPI-2sXD;
	Wed, 15 Jan 2025 11:14:43 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163dc5155fso119917935ad.0;
        Wed, 15 Jan 2025 03:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939681; x=1737544481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz8qYCut2vMXxqWmWVOJ5WSfbE/dmnJ2d6EiHkz1mpE=;
        b=eaHCwciVKfHCs9H1oV+gQAlLYqrNb50dE0DBYMpEO/46LzO6jTqB0PGd70dhqld7YU
         tUpA1Dl0fwmpbEAt+2Smq/y69pccNzOKyoD/Yy9TMTA84OeG4+3Vd2bE/BafnQoJVfQO
         NQ2693Za02pZRAf1AmtTh1PwVAijfudWvJhgmJ100TF3qii0WmmJklsIILtxOzlbUn67
         xiQkiwae5tYSsCHn3rSh5grzrt45xuLHXSJHAuj3aGUv5olhRUNcNsIsHnQWVqjkTt7i
         Ajm+FNmZ2w5TqZUCrHojomAVfB7tt1WVnVsaYWUIUybJEJkYqOCY46UQjvjEGvkBWQtE
         B/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjq1atxP7emMcaKxOWQbT4PLLTSrGM7PCdcs5IrvaaaM1TCu3584AR7VLNl6vqByFeG1LC0R6O0JiCWZW6OT9l@lists.infradead.org, AJvYcCWT1S8zNa57lnHLhQ5CZsu6FsOmj+akmAgxd4EwMQsr9jwnF43CmLVMegv5R0fIxpHduTPFIJgayN8O3kVBpC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgQxW2v6XsXGwZikbs7GSvJh8vodvvFfBGpg2g73OkFVVm9KZS
	QqvTsob8gzPm+Tm7XeCbdGo7/nDNXgHpghDKvM5ovRw4Je2LybBX
X-Gm-Gg: ASbGncvQP6UxUqdYWbEfnoN8HPQIyr873HWr4V9/q8M7vjC6qSO39WtnsuoUqQ/hUQd
	dFl6cE9ORWuKHaupmA0xA3GId4dlOHp6dAhymUhL2GEQ2zngJRZ94IYE4S3SCktQTPbsWUxDVgf
	YVs9Fifz1cWZeJ/TYW70RA2uFWzpo4yFWek0IiFzxkoRprMGjsYtdQTt4Wh/tDeLSMtlnpiB3Si
	rbHMCeERSJQ1xlnzv1AaKHlc0TXjSMU7wB7vwwo473V5WsP4KBJIDRjLXT5UYGmF0ZmSbjcd7G7
	pt8nBdIpNe515Ig=
X-Google-Smtp-Source: AGHT+IHBi1TpzbH8P/aWhdgwF4SFs6U00POoo7gCP6dZ7wsv46DHk24a0naYWm/T9JwxKv4fWUwHVA==
X-Received: by 2002:a17:90b:3bc3:b0:2ee:bbd8:2b9d with SMTP id 98e67ed59e1d1-2f548f75de6mr34988834a91.34.1736939680740;
        Wed, 15 Jan 2025 03:14:40 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7085261dcsm1908286a91.0.2025.01.15.03.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:14:40 -0800 (PST)
Date: Wed, 15 Jan 2025 20:14:38 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH v4] PCI: mediatek-gen3: Avoid PCIe resetting via PERST#
 for Airoha EN7581 SoC
Message-ID: <20250115111438.GB4176564@rocinante>
References: <20250109-pcie-en7581-rst-fix-v4-1-4a45c89fb143@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-pcie-en7581-rst-fix-v4-1-4a45c89fb143@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031441_872757_BD5F4A27 
X-CRM114-Status: UNSURE (   9.03  )
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

> Airoha EN7581 has a hw bug asserting/releasing PERST# signal causing
> occasional PCIe link down issues. In order to overcome the problem,
> PERST# signal is not asserted/released during device probe or
> suspend/resume phase and the PCIe block is reset using
> en7523_reset_assert() and en7581_pci_enable().
> 
> Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> specify per-SoC capabilities.

Applied to controller/mediatek for v6.14, thank you!

	Krzysztof

