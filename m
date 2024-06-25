Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6543C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icMvAg4c6bNY/rf99cc9BncjclZPqQZOxvpxxVi/efY=; b=cACi3v2RcHst/NeKeem7uwplL4
	pjilx3+Qtbhl9K9u0B+NWC21ZfnSf9+mT/ophnJCWplvb00VVzg5Fsx9EQs95wpEjRnrtjSYDWTFU
	OhFMrU+Vu+/an9Nd0otPIb5QIF7oj21Fzbc2A8PrXa0ao8DL62f/OfgTuqa9dr4alxkgKG4lRafD2
	p3IFw3AmOBjl40RJaccXN2E0XNgs6XhQKb+bKCck1ePD3utysXNE9BpWnVtLDBUw88tH3cCxf4VtH
	0s3b8805c3QxO1fVW1rMlgnSX6rE2WgkQxfmKKW4ClWYNbcsrTuctLDSibsyIA/eP5pyY4Xl5jMp8
	+efS+zOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMBCe-000000049lL-2CCR;
	Tue, 25 Jun 2024 18:47:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMBCW-000000049jh-1I11;
	Tue, 25 Jun 2024 18:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 21204CE19AE;
	Tue, 25 Jun 2024 18:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAE5C32789;
	Tue, 25 Jun 2024 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719341249;
	bh=bhr8nFnDL7/6wv7wSLgjf2kIbx/heqwxBGqRTTkrtqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KLXfD3xd6uJZwws+dSetGUwBCfzNfuucKdITXlxBeyaD2HCrIC4ZOGFEfbd4206z8
	 Lzqy8T8vlQY6Cls/b7CS3aajnGLSBgvUWUsou8b1OkmIT6KiyRRmSsnzyRhbkdcLrR
	 5rth+FbTad5uuWBp811dQhihLAT+gA1A11qD1jA/MtzQFyJ2zFtAsr54VAtaWSIRds
	 jvEfBEwfFmBUJhajF+qY+E2RzrrInzbJPHgL9H73p1f0MyJZgTc0a7jvlm42aiUsEu
	 MJx73xiozDPEBVNioSJL8+QsvC6lnInoPM0P61F2rgFHeXQGLKyYJzeWNCmIsxx2C/
	 zb7i2hgzq8X6Q==
From: Mark Brown <broonie@kernel.org>
To: djakov@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, lgirdwood@gmail.com, gustavoars@kernel.org, 
 henryc.chen@mediatek.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com, 
 Kees Cook <kees@kernel.org>
In-Reply-To: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and
 Regulator knobs
Message-Id: <171934124556.1173981.12014605377517424760.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 19:47:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_114732_564076_E9045528 
X-CRM114-Status: GOOD (  11.68  )
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

On Mon, 10 Jun 2024 10:57:28 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v6:
>  - Fixed build with clang (thanks Nathan!)
>  - Removed unused mtk_rmw() macro in mtk-dvfsrc.c
>  - Added MODULE_DESCRIPTION() to mtk-dvfsrc-regulator.c
> 
> Changes in v5:
>  - Fixed Kconfig dependencies in interconnect
>  - Fixed module build for dvfsrc and interconnect
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/7] dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
      commit: b147ae7ae5141cb10c520d372ecabb2c520210c4
[5/7] regulator: Remove mtk-dvfsrc-regulator.c
      commit: cd102850e32c145661c6a0640dc6c5feba11af72
[6/7] regulator: Add refactored mtk-dvfsrc-regulator driver
      commit: d2ea920a4092b3c0a6a004b93ce198ca37455d90

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


