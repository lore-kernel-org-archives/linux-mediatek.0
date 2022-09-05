Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41692ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKwU5dcXIaZTyjqEFjCDgM3tWx5DZqGsmYBDKCs/GJ0=; b=URWozETuUMsfnToN8ycHN3nKK4
	YW19SIBHWheq0t16PiB3/hOjMK/O69wn7NWtL2ShB9YDAYfPvJca3MtZnDZ56faplud436POvZgsx
	vGewvSBi0UkT624BPfSdXA4ebGebMcEzzmRfDNQKTmXx6s0NTNnhIhA5gIQ1A9aNGO/6U0ZIp1u/s
	But7/BzIhLgSKJHGsENRBYHeKXQOBSuUIVqbNgSmKMSzuaL+ElY4KqhQtYqBeY0ytNgxqNdyacNTc
	MaTv6KJYVykNgjf2/B8ffp31AayY94i8eEXHAJOhu1A2XtmCubJDmA+9But5ffSKaxrcs+h5G/Tp3
	HsjcUkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGg6-008HU3-6X; Mon, 05 Sep 2022 18:18:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVEBg-0066Hp-0t; Mon, 05 Sep 2022 15:39:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D603B81158;
	Mon,  5 Sep 2022 15:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E30C4314B;
	Mon,  5 Sep 2022 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662392336;
	bh=BLZGHzBh5oYUyLXC7SF+E4GBdswvlK4T1kxFL5aA+CE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a8o6eMNWU3T1UHA1gu6f+bZ3Ryw5DsQc/qecNv3j4hVyvWtWwtt3Z800BAefUyT7d
	 KnQLoiWSrOvVMR9XYN5t2aWmJGIzHB/KjmrFdlnrPQTIaLkuhMZtRtYc4YTsrsfsiy
	 YFGcKmeU4S6kUmq2orrZVbneD6ilVTgWuZVcIjJ76leNX0OKUDsKrmpHmaAhCAUH+N
	 aLVi/i0zF6Xhei4lg5OElfbzwYXb7PKoq+krdVZdCUxnnJDEfsxG/96jNGYPb5jvUm
	 W/rp9I9Sxt21q2BoglpyyEdUTxuJAwAuGu7rvcwp6P47qDUFzJYh/Xm9R4XEWRpwG0
	 B6H2QbtuSmQvg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, Chunxu Li <chunxu.li@mediatek.com>, peter.ujfalusi@linux.intel.com
Cc: sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org, yc.hung@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com, linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20220903032151.13664-1-chunxu.li@mediatek.com>
References: <20220903032151.13664-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: Introduce function sof_of_machine_select
Message-Id: <166239233387.736206.8864417821862907650.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:38:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_083900_656953_186953E2 
X-CRM114-Status: GOOD (  12.79  )
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

On Sat, 3 Sep 2022 11:21:51 +0800, Chunxu Li wrote:
> From current design in sof_machine_check the SOF can only support
> ACPI type machine.
> 
> In sof_machine_check if there is no ACPI machine exist, the function
> will return -ENODEV directly, that's we don't expected if we do not
> base on ACPI machine.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Introduce function sof_of_machine_select
      commit: 354f6008b730a217a3e6ad982eda42e90e6f7473

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

