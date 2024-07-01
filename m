Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49088C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/MT4gYkM7jRYnW3jSq4ERnRukVxWkl6BybVihQYmx6A=; b=HHNZozWyQRZcWJ
	dZFFYoK7L/cj824PR6D3Vf2oSXqlsgo/yhGChj0FNeCDDGmGHQPzsdI6wNsaCEfpeNEOPtnHJp4V1
	Coiwfw9/cBTK5hYH/Cath92vy5vZZV1+FGUkMpCPrM0Gb97sTgw0cvL08jTzsadGWusC89Iiqj9CW
	XVRnfcOLhvzjuVJ4OJG3fius4wt1iN/EYQrQs7u1ZMmYXt22LPo7tLKaFsrxsfYA4Uuv7WrA5JVYj
	a2BBoAbAdKlaVk+R9KSefnsRb/Nzf4Vg66DibX5bhtz0BtYIqlN5hkKAjXRUbymgpgYUVrhAElFbV
	p4n6Ce2MhSUuZqjvzoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sONXS-00000004m1V-1AyV;
	Mon, 01 Jul 2024 20:22:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sONXF-00000004lzA-2ve2;
	Mon, 01 Jul 2024 20:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1E93CE1674;
	Mon,  1 Jul 2024 20:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B37C116B1;
	Mon,  1 Jul 2024 20:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719865319;
	bh=pCuFXbF5W+x+VbGJfQJ3DgTrZxGZJSFeamHAW781fVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ji6vGm9XokU6rGwJfWNicX/kd1H8X+tuZXzdCteLvSAi/yec6vI6pJeC7pzUtZZqH
	 UndP7YHWcwvMvyo2wc8txQ0L4cjZmighNMwzhGkjr2RmoOGKusJR+S3P7w6awGgaoK
	 usxoQmRBEgsL5OS77aKeCpg0X40F+bmfBwmijvJ8WcWuI8Yo4K7/iV8zAguJlWBGub
	 l9LN2buBKtasPMIrV4tdqH230ZnYA2HA1tr2PuhBcxQK31mgD67GPS6pzX552Scfcy
	 I4zppGDlG5Z62Rm+MaIJoMpZRV1mqUVSrqM2Bnwweb707FikGRuPSS280yK1lAa/Sm
	 YETdLqoc9P1pQ==
Date: Mon, 1 Jul 2024 15:21:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20240701202156.GA15356@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27d28fabbf761e7a38bc6c8371234bf6a6462473.1719668763.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_132201_958235_FA97C3A6 
X-CRM114-Status: UNSURE (   9.60  )
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

On Sat, Jun 29, 2024 at 03:51:54PM +0200, Lorenzo Bianconi wrote:
> Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> PCIe controller driver.

> +/* PCIe reset line delay in ms */
> +#define PCIE_RESET_TIME_MS		100

Is this something required by the PCIe base spec, or is it specific to
EN7581?  Either way it would be nice to have a citation to the spec
(revision and section number).  If it's generic to PCIe, it should be
in drivers/pci/pci.h so other drivers can use the same thing.

