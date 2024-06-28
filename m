Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40868C3064D
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81mUkYiykWWQQPyI87vNeQndr4PAnfQ/DFgOBM9dxes=; b=L1au5GIzCpb2loF+RbOertim7I
	qrmgUJhqB8h6A35dtvtgG3+lM3qCSjBM0gFp+rKUvC0y3P0LYbdWt6U3XYommGscURqE/r/iNSXi3
	QRV6UNzs7/tN54dsvCg8sZjy9YDjcmkBMZcvQ8ZVgQo13UfXvBr7ziTej+FIJzZ4ha5pxefqYGPrP
	g1ACvyJS5uNJzjq9l2vqkgB1rvDln0MWr+7SOXlGM9cuWwbC3WzaNIPZR9vpIzf8VTUZ9edOfJO1E
	qV8OSrahJ48TS9J/utJCJPTwj30JIINmANEtABoSMRAn5RXtqipCNq2nYrI650c7cWCabKuCQ2qAG
	iSorMIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCcr-0000000E1Oi-3NAs;
	Fri, 28 Jun 2024 14:30:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCci-0000000E1Kv-0chi;
	Fri, 28 Jun 2024 14:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8230BCE2099;
	Fri, 28 Jun 2024 14:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA49C116B1;
	Fri, 28 Jun 2024 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585042;
	bh=/WL5WbmLDaPp407+RLqwWYRH8m1SF1h+OQOP9m79KB4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DEm0dkE+IVL8XZqwhVZKkgj452jQQ2dECaYEWhMBWPpi2OZr35sYM4PD36/NzuSmp
	 0yGXa01DVFPklSoZpVWclyBcLG6f/AZlUwZFY5qfisr1/E6MSOQiv2Iu+n6OBT/g58
	 qboa/caSMXgXO3LNJsk+pHriJU0TPRPYHoJOVI6HVPGaL7gl5XwK+Zws+CH35SkZ6S
	 mHg6kSmwLJeNBcp7JxhUIcgcbE1ZdkmabBE7t8qdvonQ0VbJTZC37h0nc9XbOn45nb
	 vkD5jXc7ytZOgV9soLlR9WP2mWltpH00uCkrovYi+zsl3D+3M7gMGIqR2w30b/e8n9
	 UPDLPJ1bN3G6g==
From: Lee Jones <lee@kernel.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>, 
 "Zhu, Yi Xin" <Yixin.zhu@intel.com>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
Subject: Re: [PATCH v3 0/7] dt-bindings: mfd: syscon: Document more
 compatibles and require simpe-mfd description
Message-Id: <171958503719.3306667.9209937406996217499.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 15:30:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_073048_388775_52EB46D7 
X-CRM114-Status: UNSURE (   6.07  )
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

On Wed, 26 Jun 2024 12:09:09 +0200, Krzysztof Kozlowski wrote:
> Dependency
> ==========
> Rebased on Lee's MFD tree, because dependency is there already:
> https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
> 
> Merging
> =======
> Preferrably everything via MFD tree (file/context dependencies).
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: mfd: syscon: Drop hwlocks
      commit: 9e1d9c508ad657b8ca01d5faa5ad6412b5ed6848
[2/7] dt-bindings: soc: sprd: sc9863a-glbregs: Document SC9863A syscon
      commit: 375f375ce42f8700ebafb2271a826deb37355b9d
[3/7] dt-bindings: soc: intel: lgm-syscon: Move to dedicated schema
      commit: 473c6ff312f9cc7d69791843de42f090e84e0555
[4/7] dt-bindings: soc: microchip: sparx5-cpu-syscon: Move to dedicated schema
      commit: 4a3b558d40d18dbad4c6a58093e80b137ffec5ed
[5/7] dt-bindings: soc: ti: am654-serdes-ctrl: Move to dedicated schema
      commit: 662ffb5b0edcbc902bb3185512aa972e6b9e905b
[6/7] dt-bindings: mfd: syscon: Split and enforce documenting MFD children
      commit: 91d5927467b5dc7b87c0283721b3e0e64ed84a77
[7/7] dt-bindings: mfd: syscon: Add APM poweroff mailbox
      commit: 33c0e553c8c3cee355ea7bcd358d653b0f022b2d

--
Lee Jones [李琼斯]


