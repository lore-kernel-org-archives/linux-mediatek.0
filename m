Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB57C25B78
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlO9hOsvvWncarTJ6TVIoeOrJIY+No0MzifzoPhfPog=; b=kQFSvJDC88lpai6wmiS+RaNUBT
	IZHoRB4jlcRqxReoBFzWxdp4eLRFddcpYvAlNbFSZLHKkCgva+eN8VRgfj+Ulz8lLygWY5Kr1VYbM
	oP9yCeXAuy+iJy64+rtTSMD2HH3PwoKO51GCxwpPApHDCrPMrdwRdFWCq+eig+jCht4b2MeUPkFQE
	SxwYAwaHBTbKjldOdZZQHH68qVZgju/taQRkxjjGQMD+Ke/uo3GZ/sqvUw5R3Z71NWtO/YV/zYgtQ
	UlUnO3Wfa65UqRlgU+KarX1ZnTqU2tXFVmXLTdRcVU+d6mz1S/XBhvaApkSf7JZWjxyYhT0GMBQWt
	GgTSwQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vmM-00000007fGF-2hXW;
	Fri, 17 May 2024 11:29:38 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vmJ-00000007fFR-2MoF
	for linux-mediatek@lists.infradead.org;
	Fri, 17 May 2024 11:29:37 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so3334615ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 May 2024 04:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715945373; x=1716550173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlO9hOsvvWncarTJ6TVIoeOrJIY+No0MzifzoPhfPog=;
        b=BiOIactxCUIC+KlQwG6SBEWx146G9p7gJ0djmRtSNbK3psEa75gU1EGekcvXH+y05t
         zFfuwbK4g+ZSWaq6e7tMA62c4hPuNILoZP64MSqF1oyhXj2952PmaAF77x5zuWp1M5Pu
         IbNqoGGgQ0PLcaIlHZXHSLRmTttRLyYR27Bm3K2nos08rdto+uWm6+dyxZYA9P2ZW0RF
         UMvKoycXJccfOlMOuS6ptNLnZONqrV+XGvTsS5H3qZ4CVZtieKeNMKPmrfdQ58XhVLt3
         Hh2/i+Vj5yoEsD+hUXtseS8Nfy2sqALD5P5szoLfHPYrvWtsn8lF8z5WFw3+nPjPEDMO
         cMFg==
X-Forwarded-Encrypted: i=1; AJvYcCWk4M7uHbNvIDyAkLD1i2I96hVy+/zV7VslHVxFu8SWiwBMZhCPm3VQ9bCG3Zv7fSs57ChleHd3DNhZ8z2aVL5w+k75nI3v5zPCNXXJ/P+K58QH
X-Gm-Message-State: AOJu0Yxd3DObvAzzCw3dK0neuNDIV6XiPVm3XmfikqnD0q5mVaxIPa9x
	0iWqGTfjyGaIZpvR2fnrZtCeM7YqjpEaJ/6hKfvyGVg4a2sRdhsuXnGwy8XD
X-Google-Smtp-Source: AGHT+IFXEv9ghbQqSRx2esLmvtTnthat8U/buSvB+ab+E7flOcpeqYIcoK+QbYJeauvapLTXM3Ua+w==
X-Received: by 2002:a17:903:22ce:b0:1eb:904:dfd7 with SMTP id d9443c01a7336-1eef9f34562mr409147175ad.2.1715945373309;
        Fri, 17 May 2024 04:29:33 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c03b2afsm155146735ad.230.2024.05.17.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:29:31 -0700 (PDT)
Date: Fri, 17 May 2024 20:29:29 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org,
	robh@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: mt7621: Fix possible string truncation in snprintf
Message-ID: <20240517112929.GZ202520@rocinante>
References: <20240111082704.2259450-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111082704.2259450-1-sergio.paracuellos@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_042935_624634_3D50B926 
X-CRM114-Status: UNSURE (   7.67  )
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

> The following warning appears when driver is compiled with W=1.
> 
> CC      drivers/pci/controller/pcie-mt7621.o
> drivers/pci/controller/pcie-mt7621.c: In function ‘mt7621_pcie_probe’:
> drivers/pci/controller/pcie-mt7621.c:228:49: error: ‘snprintf’ output may
> be truncated before the last format character [-Werror=format-truncation=]
> 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>     |                                                 ^
> drivers/pci/controller/pcie-mt7621.c:228:9: note: ‘snprintf’ output between
> 10 and 11 bytes into a destination of size 10
> 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>     |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Clean this up increasing destination buffer one byte.

Applied to controller/mt7621, thank you!

[1/1] PCI: mt7621: Fix string truncation in mt7621_pcie_parse_port()
      https://git.kernel.org/pci/pci/c/fd6eb49a84a8

	Krzysztof

