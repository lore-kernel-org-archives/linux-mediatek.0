Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F43CFD2F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Nov 2025 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9Xpv6HLbKfRD2AJdRu+MP/oGHQl4a0L1PL4mC2lUcI=; b=QCY19bEb8ae595o4wk1xQVa3Qb
	HUX73TXkdg89mQK8KQ5SkKS9QiScntWR/2FB/PsALEprkbGFLl5p156/DW0H7CxQ6Y7Dbf6kAhrT1
	o91LsD4nWzHrjYsA2PfzXoputJaIKOXWAp+IclD5339ur6dwr952/c1ZatkXCJYDfKp/bP5P6h6hf
	fa9nkog6nTF9AEARuYMYGtKge8xddt1JZmFsP+8tbMLu3kZnkFmHcl2ifrjoy1vG8849y4UBzsW+t
	c/d5oLozEFS5LuBE6jANDUgT7rmWgnFuCv/QO6MCL4oG8iMZSEsI/qN2n5c5PlrFaBF/RerD11mMy
	CLi3sfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgCF-0000000H2Ce-1eR6;
	Thu, 27 Nov 2025 17:54:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgCD-0000000H2C0-1irM;
	Thu, 27 Nov 2025 17:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78FC960172;
	Thu, 27 Nov 2025 17:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962D8C4CEF8;
	Thu, 27 Nov 2025 17:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764266060;
	bh=7ymQ4nasa/Y4u+AtiT0d04YzvAbGRGb9jcNryy56N9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I7YjLAkehefh6Z7MmTFOrCN6M/dHA2iqG4jnWrALU44EtNwFYRtdCDE/leBTiK5FV
	 OdbZGdfmdqW/1fl/0MehcfizKWdQOhuUADfmz6+TcD8WNT8IseDvA25b9JkpGswDIb
	 zdRfPXZHIrfmUuhHmCLaLIL+RE4AzglGNC0qK2h/X2Eafi7RGHUCLVFJUNurxl5jRp
	 e8yTM6hDX2mr5CZUEtJEVXdB0nMGJa7yUU8LeqRdg0q2MuoMcIFlD96Ga6kVGNpul4
	 mdOFuRWnsJ28X6qO28lBWjGYTyN+YBe+ydKWnBeS6JnCjzqH3RneWTishXCSsmr6/U
	 FIcLgb8RmOEWw==
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
In-Reply-To: <20251125234047.1101985-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251125234047.1101985-1-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: (subset) [PATCH v6 0/3] spi: airoha: add support of en7523 SoC
 (for 6.19)
Message-Id: <176426605736.114355.13405079869808770716.b4-ty@kernel.org>
Date: Thu, 27 Nov 2025 17:54:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Wed, 26 Nov 2025 02:40:44 +0300, Mikhail Kshevetskiy wrote:
> Airoha EN7523 snfi controller almost identical to AN7581 one, so the same
> driver can be used. The only known difference appears in the very specific
> boot conditions, when attached serial console force EN7523 SoC boots
> in undocumented (reserved) mode. In this mode dma reading of the flash
> works incorrectly.
> 
> This patch series:
>  * add support of EN7523 SoC
>  * add spinand node to en7523 dts (so spinand flash finally becomes usable)
>  * updates dt-bindings to mark driver as compatible with en7523
>  * disable dma usage to prevent possible data damage if booting in
>    reserved mode was detected.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was short to GND
      commit: 061795b345aff371df8f71d54ae7c7dc8ae630d0
[2/3] dt-bindings: spi: airoha: add compatible for EN7523
      commit: de59a8a3a1aab3a6608777f62fa098b5abb2704a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


