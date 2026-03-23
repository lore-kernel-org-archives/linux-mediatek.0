Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94316EC01D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BES/6S+FR0rtbZc5AfqWaDxxxXN5OopGJTgC05OH86E=; b=A8ntDhEQ5PB7U8rYsEYYVhB1vN
	IHN0fkIej7tL51PlucgVnGl5DgXFhElLG63eyxuV65SFTKp5/sUS1hSjWbrDeaGcbmOgU3ekDbckA
	BUPPZzpNZ1ouIo/LF+raI7L29WnaWosF0o9vMTQkwg7l9CGKdBAkkD2yUbuuYS9Mi4uos8ObYcoI0
	SWEivRefAyGenn+uTpCJO9a2Bm1tD6S5PH/ITub5wzfVNDb96pGxQ60Mix4y4tq2wEoMIjGy2EARc
	mXpMnCUU5m2QJjhXpnOIs67umSWt7K9c0DVA1Ez+yYXqJAvlMYhbb1s1BLwOePfcLM52w6/x547eN
	90ZuN2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4du4-0000000Gela-3svI;
	Mon, 23 Mar 2026 11:57:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4du2-0000000Gel6-0S4G;
	Mon, 23 Mar 2026 11:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7882642A04;
	Mon, 23 Mar 2026 11:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29D5C4CEF7;
	Mon, 23 Mar 2026 11:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774267021;
	bh=DJBlhP0sPpweiQuDqLTtyjJpn0MdAi/2iD60MXs0y5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAAKv8R4Lz0rzqQ4OGVro0zQA2x0DBMAlfMroPcLlhGFgPu2lm91exoRWUxsFF98G
	 SQlwMNtHTsrY67FWHWdC3QnpXzNU0ezSdx1N3AE8rzPMIqS7K9F6sdhwOix8tlQJ1K
	 P8Ai6Ht1ibU/RMSSgeZ30XIv0joT3M6RBamoD3U2Bqj1L4cT0XCWJJYzUzCPNVbQ5Z
	 cdq3BORt6qhIr1Z50iShYgYlA5K9VFT+6UxbQfYDUPi7tpBMtVc8+NJBraICmDWYMv
	 U3Oys6GMkUxsdmAQ0uFMm2Doz/2xUBI2tVlLlNRn3sHVWa8IQaIJp93FjHOCRztqAj
	 TAx/rjxkNSeQw==
Date: Mon, 23 Mar 2026 17:26:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Chen-Yu Tsai <wenst@chromium.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek-gen3: select PCI_PWRCTRL_GENERIC correctly
Message-ID: <wlu2o3hx6yvpzs54mxsf24gmqwwudkixx7aylv4dkey744yify@eufscwyqiyhk>
References: <20260323105520.461640-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323105520.461640-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_045702_168847_5A96CBA1 
X-CRM114-Status: GOOD (  18.79  )
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

On Mon, Mar 23, 2026 at 11:55:06AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The PCI_PWRCTRL_SLOT option was renamed to PCI_PWRCTRL_GENERIC, but a new
> user showed up using the old name, which caused a build failure when
> both conflicting patches are merged:
> 
> aarch64-linux-ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_remove':
> pcie-mediatek-gen3.c:(.text+0x137c): undefined reference to `pci_pwrctrl_power_off_devices'
> 
> Use the correct symbol as intended originally.
> 
> Fixes: ff124bbbca1d ("PCI/pwrctrl: generic: Rename pci-pwrctrl-slot as generic")
> Fixes: 073a7e1b7bcc ("PCI: mediatek-gen3: Integrate new pwrctrl API")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Bjorn, should I squash this fix with 073a7e1b7bcc so that pci/next will build
properly?

- Mani

> ---
>  drivers/pci/controller/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index e72ac6934379..686349e09cd3 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -222,7 +222,7 @@ config PCIE_MEDIATEK_GEN3
>  	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
>  	depends on PCI_MSI
>  	select IRQ_MSI_LIB
> -	select PCI_PWRCTRL_SLOT
> +	select PCI_PWRCTRL_GENERIC
>  	help
>  	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
>  	  This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
> -- 
> 2.39.5
> 

-- 
மணிவண்ணன் சதாசிவம்

