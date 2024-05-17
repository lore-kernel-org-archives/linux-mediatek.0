Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E26C25B78
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ep6WjZ/XECenrwVHNZ6CdFGyjtlB5or+xofNQVT1ak=; b=45R4VY30ktY9mBgEILz+lW9Eid
	x4qCAefah5Um3W/9URnOIp3qtu0KywouV93NfEOKxm852KtoaXXoaBpbKeaxMh8RC3NGL8LDKlvlV
	zEhuqpJ/1QikD/raDc/6B+Q0j4RCqjy5OpdT4ERt1ozIfXe5zUAPu+d3wueyYRUTqfeeKUJMmZoR/
	XV0j06p8tF93uUb0dipr+LRgfL1cimJ4a2y85eXU32ODtjuCkZB4CdGCwSeCjgJVymjEJbkoL0rT5
	eu7Ru5APxcY98tPEdOji2huFfmZy0aqKBi+EPO/r/yV4v9zpmdLLnC6+ojXrHXBVj4lv+X9KDnCTb
	r24Vbk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7v1s-00000007YAY-43eE;
	Fri, 17 May 2024 10:41:36 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7v1n-00000007Y7o-1KJR;
	Fri, 17 May 2024 10:41:32 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5b27ad74c40so3968eaf.3;
        Fri, 17 May 2024 03:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715942489; x=1716547289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ep6WjZ/XECenrwVHNZ6CdFGyjtlB5or+xofNQVT1ak=;
        b=e0tS8KlJ8wPbiurnxAeBZETotP8Lufy9o8k+9KD56raLNAL2uHApAZ0W8fdJlvJwvx
         kPN+1OvKz2uOHpQvDMfFhjMxtleVGQMIPaoFhi1YXQZRvhq68/V2VrJ75i6JqrQHSdAH
         u2IV4LGKKBYsjIVA4PTb6Vo+uW8Js+ENXkQ76j1f+WsCIHpOHIdzFn8hDA0HTHfiQ1Ko
         RU+GwMejcnHyDGb+VJ/eb81FSyfERIR7mwCDnfjrXrbZWlN8uh/col/HXWxivnEfYJ7c
         zGMw3toNU0aoa8cpY1lJAIIB6VWno/OdCG40l65A+8XSYUIVkGwT10lqa0W8VcywLEgv
         y3NA==
X-Forwarded-Encrypted: i=1; AJvYcCVq/C15+22hFLo5BP3MvpuOQ/60Bmg5Lcd0OcGiXGxb2Nv/2NbQITIpFqvzVv14nw+hgUdjv5Si8SPmc7ENd+tX/hib8jCCNyQQoopUNbNjo/j/PEeJ8Zs9fteQX0zGvXoSXkJ9T3ydcKJENll4kl1rWsL548Kw/+vu6PCoDrP2dlxOQgPkF/mVBuOsEIrr7m/wPJEuob0jdxkQzWrilKcy8vFCAreUNyOHj5076UsyN4CDkPlU1zUhNPctEXoiouC3vQ==
X-Gm-Message-State: AOJu0YzUmgD/cigsVjQ02LEMwPHAJC+EnVVkxc2SlJ5Jvm4RrUCoxbEY
	HlJH76rtuvhLemCMFSLmTsWD3BLSccgCYtMt1Yn+bGCY0jR3gGxM
X-Google-Smtp-Source: AGHT+IHryVBDZpZ02HKgPHTEO7zKqNKHDK8Mg2XTift9Qc3NF8SYMoDnU3GekdswLqk1/o4nC69OcQ==
X-Received: by 2002:a05:6358:c005:b0:18a:78c2:7ccf with SMTP id e5c5f4694b2df-193bb628645mr2477851655d.13.1715942489450;
        Fri, 17 May 2024 03:41:29 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-658764fda40sm3257811a12.5.2024.05.17.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 03:41:28 -0700 (PDT)
Date: Fri, 17 May 2024 19:41:25 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: PCI: cdns,cdns-pcie-host: drop
 redundant msi-parent and pci-bus.yaml
Message-ID: <20240517104125.GJ202520@rocinante>
References: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_034131_375544_E829D46A 
X-CRM114-Status: UNSURE (   8.33  )
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

> The binding reference common cdns-pcie-host.yaml, which already defines
> msi-parent and has a reference to pci-bus.yaml schema.  Drop redundant
> pieces here to make it a bit smaller.

Applied to dt-bindings, thank you!

[01/04] dt-bindings: PCI: cdns,cdns-pcie-host: Drop redundant msi-parent and pci-bus.yaml
        https://git.kernel.org/pci/pci/c/51ef0538d4e1
[02/04] dt-bindings: PCI: mediatek,mt7621: Add missing child node reg
        https://git.kernel.org/pci/pci/c/36fbed38549c
[03/04] dt-bindings: PCI: host-bridges: Switch from deprecated pci-bus.yaml
        https://git.kernel.org/pci/pci/c/5db62b7d3c37
[04/04] dt-bindings: PCI: mediatek,mt7621-pcie: Switch from deprecated pci-bus.yaml
        https://git.kernel.org/pci/pci/c/d3fa4be9033b

	Krzysztof

