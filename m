Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB58BC7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuneEnNDhSvthWqPSInSzMIkBTeQOIGyzBCW/OBxn1k=; b=KNpT+CHa/+sHkf4v6UE5AgPUlD
	a1TNl88RQtjzDUt4HsW2fI9Z+1sEWpQhVFhwC99GFInug3FHgWm40GOozi4b1egPvYYujwxQ+aBJ/
	b38m9OZPFYRd08gzydLkGJnsNK1QeZUYgoVn4Y1TfOB950X2wbgvHVW5jBfAWwb1NmQ6mAcBkCWMi
	W/iHum9CxmCscXn4+BOaQM0JfblUPgP09j9chOLOu+A18/U84t5+5kVdD/+/KFBIzXWPwzB6iQNB3
	QDAlcOXqW3ibvVoegCIHMQb4tgVn9yg4BMoUu+8zi3vE5l0R1ZTGDwqeTJuBR0hRZcjFoWnMj+H5n
	GAVvFugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43Kn-00Em6Z-1i;
	Tue, 30 May 2023 17:40:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43Kk-00Em5S-0U;
	Tue, 30 May 2023 17:40:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83D7C62BF4;
	Tue, 30 May 2023 17:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4394C4339C;
	Tue, 30 May 2023 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685468432;
	bh=NWzyPIenxHpyYo1mucKzHij5CxtkM5ZDEfEPep5bjA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GH655kjgZ20iqGzNX8pQDiizWa1wpnlbzlPCqwtIKP/IyXqpI0iWjBiPe3Atr/A/E
	 GKYRZO1mS4riDqhFMWHTO4wp4gkHJ+1ZzgzL8u0kyQNc3FB64yA2oyKs6/6fZmEfjl
	 MwZByPDyJupnZuB71giHi/yt0qIxLlBP+96bZ/gjjVEi26cCzKuUmlfixG24JZcVfH
	 +Ru3vQOLyQji5bbiibOepQNMhdEqEXPaCAqkJwdfe8ANNlOLMS3WlKdwtpcJukczPv
	 oFUDTNIHHwCgwM+u7NRhxAdGYkt3YSR8KVKVxwy+CWTZeWwpP8vXU5KvfV8ykYzbgE
	 SO/xbqp98td5w==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com, 
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, tinghan.shen@mediatek.com, 
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230523025933.30494-1-trevor.wu@mediatek.com>
References: <20230523025933.30494-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: SOF: add mt8188 audio support
Message-Id: <168546842851.690777.4334822736947724679.b4-ty@kernel.org>
Date: Tue, 30 May 2023 18:40:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_104034_291378_59678B4E 
X-CRM114-Status: GOOD (  13.41  )
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

On Tue, 23 May 2023 10:59:31 +0800, Trevor Wu wrote:
> This series adds mt8188 audio support and dbg_dump callback for
> mt8186 and mt8188.
> 
> Changes since v1:
>   - fix typo
>   - adopt reviewer's suggestion
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: mediatek: add mt8188 audio support
      commit: 0f3d5585ad20a23bf70d09deae2e0d84e745055e
[2/2] ASoC: SOF: mediatek: add adsp debug dump
      (no commit info)

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


