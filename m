Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF18DC3814E
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 03:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5D4tI0AD6TKB5f8V0gI1Ny//6YFM3x96o/cMbfklP+8=; b=b7JNyjJn2ZsNBWQXxDWXV4MKvG
	e9GA2a/2t0L7euUsiFElH/mw6zm9oV/mTaSpH/hiO7ccvhflJDf1PpqEUZ6ruYQWBrkEiIJRW0+FS
	bQnALwqK38L6bMLVgayuEQ+Tc+1sjXv4bIySLQjaW+qPeSxS51nhOgn4yOXT2iVhZdZY04XhYCliN
	8ICKGbA26SYrf2lrLeXq+vKUXqOqsYZdejT0fwkkRe4R/vMP8Ziblgl2c1i7QqOCXhtpc3KR8oIDm
	AjR3MFtDRknSaymAb5FLl9ff4Nnqdyh9ilI+3NwJq7DsuPgioFJOzewVxIDoU0jisxsCpRld6CPVZ
	st3brqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPwVN-0000000HGHl-2XfA;
	Sat, 06 Jul 2024 03:54:33 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPwV8-0000000HGFa-1iGS;
	Sat, 06 Jul 2024 03:54:20 +0000
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-37636c3872bso9138285ab.3;
        Fri, 05 Jul 2024 20:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720238057; x=1720842857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D4tI0AD6TKB5f8V0gI1Ny//6YFM3x96o/cMbfklP+8=;
        b=cp/1q6zHyxFRH6rVFdE7FO38CMl1Ky8iF9PlR/R0BKoJUko8TAh4zBkORpuR5GXhzH
         rk5HKOhGI9LMiCW9w1EtwenpKKXeVBcyJw6C74EOGlNiMjo6N+pH+TwkdUyZdT5V6GbZ
         dngvrtqNrwUCD63aPaYcSSQU6Smid9Z9mZWEq15eymVr4+CKM9ViYeLYsOmo4i3AUEoO
         n89CGR521Z+2ojj0n/+epo7Y5Mcz8N1iqsmQ/M2dS3nK/penzvwAd7FTqlIkEMwcX4IL
         vvPvvmy9pPOJlnDEy14BdPk5ashHRFeflE7UiPZem1Y2VKN6IShZDm3R1Ax45oc0CS0B
         Am/w==
X-Forwarded-Encrypted: i=1; AJvYcCWAwGpAoAdwCRXYRTBIdAZ8+S/Q5g2fjsysE9DogRuBdHjIE0Q+dH2CGI3IDXFQjWxYI2eGWvDrKmb+i+PTdtXeCfyt0w1C4EFXeMOqgO41Tu/Cq2znJKA9gunfyww5/YWYy1u7HlchfqeM4U0YmvynKaWxTdAscj4=
X-Gm-Message-State: AOJu0YzFUcH1vibej/ydmlYf/zh7giEw/2KBznGBnbjB71e6xrj0y1mR
	yjoekt6mcsG5Vgl8UutLjQaV4G8o9huTSQAR94/DkKxlT77XLWAH
X-Google-Smtp-Source: AGHT+IFkmr6rOVVQ6tzIaz/yVRjICqptKhGOdC6MQB/5XVn5kCPoeWBDP61rz3vPYC4BMP0jc8MmoA==
X-Received: by 2002:a05:6e02:1ca5:b0:381:40be:4ce6 with SMTP id e9e14a558f8ab-38398a01bcbmr78518675ab.11.1720238057336;
        Fri, 05 Jul 2024 20:54:17 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b12e6712esm1565477b3a.25.2024.07.05.20.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 20:54:16 -0700 (PDT)
Date: Sat, 6 Jul 2024 12:54:15 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Will Deacon <will@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] PCI: controller: add missing MODULE_DESCRIPTION()
 macros
Message-ID: <20240706035415.GJ1195499@rocinante>
References: <20240626-md-drivers-pci-controller-v2-1-94c811db7a51@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-md-drivers-pci-controller-v2-1-94c811db7a51@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_205418_471360_63C9C140 
X-CRM114-Status: UNSURE (   6.88  )
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

> When ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/dwc/pci-exynos.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pci-host-generic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-altera.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-altera-msi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mediatek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mediatek-gen3.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/vmd.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-apple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mt7621.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.

Applied to misc, thank you!

[1/1] PCI: controller: Add missing MODULE_DESCRIPTION() macros
      https://git.kernel.org/pci/pci/c/df472e9b08e2

	Krzysztof

