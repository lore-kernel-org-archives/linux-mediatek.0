Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19083CCD192
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzPhcfyTVed5i2/5J3fH5vGgzo/8dwaRQsCbVy8PMo4=; b=E9wendAlFDVGGXur102zF8RLt/
	jSKxK4qPgmseqJXi8+kEm2v06wf6RSKqpXYmhKQAuPIJG9HKFEzkXdsmfvSYO7yV/5hpMPHty9d2C
	Ly2kPGVxyFe3hs6A/MjVjd1z4aQAfMZFByCKLCtepd8pppjLlMicN7JRj1/L0fhQq+3W+x7p5EchP
	e4st0iErDAqkYTvQUqbHjTwINUCI90NShNwBLvJWRfteYKbU4ArhTHZrCyZbUDW+Q5RaxzIBDnuCW
	8ONpL6jlpIR0xgyxo1hWmkBOwzxz/cZ+thw0vl7/Pyrs2Ho7FAbw5J1GrZlK++4RGu+WzG9Ym0r7K
	A+/vxKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9239-00000001nB7-0KTF;
	Wed, 15 Oct 2025 14:00:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9236-00000001nAK-36U1;
	Wed, 15 Oct 2025 14:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 308EB625E2;
	Wed, 15 Oct 2025 14:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8C2C4CEF8;
	Wed, 15 Oct 2025 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760536815;
	bh=CFCf1jlvWWOR/a6zkgwqZYSPmfb3AShgDFzbIXQWQOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxRVPNxTJEZrwlxkuY1eKTFhrZhKXnwRscbJ7VUzY9GgzJ+PQebmlbNSTi15ZBt9U
	 xoDvIxMLiw6q1SUpss4Ae4UReY0SCbP3RUaDRJe4XhBemugb8m2gcy1+XWOpZW9zay
	 Ii2jX7rVmR1IV/0HIM+QPn3kmfdUdtAWHrr2a3jOwoTmp5rGalA8ADoLmYFd3I1INe
	 oTOS/zZBinBbqRbrOY3yrUE5Zj8KthPA7pGenTEKmJkRlmijzicanovCH69HkImXSh
	 0feFCF2t43Of1zEgQ3lFk8H2Q+Zh0KGLSH5v3m08GXkHyMKQQZzpODL6enQq/4jsGw
	 ST8ahiKMsFP3A==
Date: Wed, 15 Oct 2025 09:00:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, upstream@airoha.com,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: PCI: mediatek: Add support for
 Airoha AN7583
Message-ID: <176053681339.3300147.17032986972081820170.robh@kernel.org>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
 <20251012205900.5948-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012205900.5948-4-ansuelsmth@gmail.com>
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


On Sun, 12 Oct 2025 22:56:57 +0200, Christian Marangi wrote:
> Introduce Airoha AN7583 SoC compatible in mediatek PCIe controller
> binding.
> 
> Similar to GEN3, the Airoha AN7583 GEN2 PCIe controller require the
> PBUS csr property to permit the correct functionality of the PCIe
> controller.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/pci/mediatek-pcie.yaml           | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


