Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2264EF532C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 00:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW//tTVcndjG7rANObrku1uf8/SpuJ+cu9fM8IhMTfs=; b=YX6PE82JacBtb4dE7PH+ZH44EQ
	Mo1FDDbSdZLNoytQCLmvULr7QwDqPZK4XIfkKxDkoYueT8r8zxXrWmZb6QpIq94IlL7pM9KiAW9ZK
	jbbJcLMPGuEol/Wb6aK/c1LHlpO1SpGQhGVUstpiYjPqO2Ydc15cfiduvjzOkaKQ9GNj7lvMVr5Cy
	kwEdtmTCV6d1K1JYcYhgXCmjEXthQn+pWmHS+HUmrTy6Lfm5gkmYlQF38CGY6u8h9c1gWiK+33DzA
	wqG71Utk37csRMd3VQ65ruXkuLcRUcIIdRlXyidDlHVTbKBU5tyWRCvsYG0u5rxLHe2lvs6mCbq1P
	fq+Ie/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pN5-00000000D7c-1VsW;
	Tue, 24 Mar 2026 00:11:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pN4-00000000D7H-0HCT;
	Tue, 24 Mar 2026 00:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B31D0600C4;
	Tue, 24 Mar 2026 00:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BE8C2BC9E;
	Tue, 24 Mar 2026 00:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311103;
	bh=Di5mcPNb0r2N+QWMH4UxyuhE6p8fkYgO2pkH90SHdT4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=f7r1JImQB/SRvnQqdQ62Ik0ATXOFu5eMEUFc4YTTBMHtSqYJ2gVutAKIN/VqjZyeF
	 P2sWCb8H6rrSfm5Knf95lClTIk/6qD2abXnr5aBhHVu/X67jk+7F9AYilQBE84u2yA
	 rT39OWjQR0xJvp7VaLbyF2OcpkWudRMK2uWc0MlRJDN9EvAQ0LyuFLkhCgUNPFBo/b
	 1oxbwvUphkldddonytnk1kx6CJ8qHHZnUTDKibToHOrTSl1x+lGlVT1gCXFfpcXSq7
	 SZtrQQi3Hgc7YNXvUJ+sD/K4XIhpBirnHXziunLrPKWxYxlEVUSz0YcQq0/YACipLq
	 qa0h0Sq6mV5BQ==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com, 
 amelie.delaunay@foss.st.com, Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <cover.1773885292.git.xiaopei01@kylinos.cn>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
Subject: Re: (subset) [PATCH v5 00/17] cleanup in spi by use
 devm_clk_get_enabled
Message-Id: <177429527684.757727.3178430227590182148.b4-ty@b4>
Date: Mon, 23 Mar 2026 19:47:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=2226; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Di5mcPNb0r2N+QWMH4UxyuhE6p8fkYgO2pkH90SHdT4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwda8CnOiOloYzFySgYbCE/6hff/7Co6oZovH/
 NYX07fdL5eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHWvAAKCRAk1otyXVSH
 0NvUB/4tGt133fOvYsd5ccQQIQOzVbVHSDtwT2WLeR3+X0YErOBbugNfEdY+SSuDTTx5dvleDwv
 RRu/m16aqCnbltqs+xqYo0EXuNKhb/EH7dIXDpbBvc/66u5FoNCTIqeF5Jfab/mZBDBQKddVugr
 5e0Weu5eT9FYS5UydoOJLtwKzXRKlT0OeLmLgYIV5CuL4HKShuJNQ4VHb1+VsVS74JesMhW3FZL
 e9cayQAVBijhwh//ogTcJasWpFIG0iF14Lf9dGiYeeZalKEWH9KveHB6VChUAjuE75JWrl/xt0a
 8vEuC/a9d+boVY7I08rDLiYeqO164RdPm5UbQvrxTWXR5C9G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 19 Mar 2026 10:03:56 +0800, Pei Xiao wrote:
> cleanup in spi by use devm_clk_get_enabled
> 
> I know that many old SPI drivers should not be modified for hardware
> stability and to reduce maintenance effort. But I can't help cleaning them
> up. To minimize the introduction of issues, I tried not to modify the
> timing of those hardware clock enables.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[02/17] spi: bcm63xx-hsspi: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/e532e21a246d
[03/17] spi: bcmbca-hsspi: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/8b237cb10e32
[09/17] spi: sifive: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/140039c23aca
[13/17] spi: stm32: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/7da637804805
[14/17] spi: sunplus-sp7021: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/ea0e916de134
[15/17] spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/fbf34af0c6eb
[16/17] spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/c9a4136c4746

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


