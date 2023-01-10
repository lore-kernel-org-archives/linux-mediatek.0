Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751C1C54EBC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RZKGG1WZzbZG3eKxFkBZDY9293VFjXLTXFMuSP/PY4=; b=Z9meovoqsAR4ktFK/NvbyatEmV
	LKOiQnjGBktRf0KouvQKi7ReKIHHIewcmmOAtn+oY2EOFotd4HMj/WR8I6UTz6hp4xap6CVPbr1Mq
	BUczJ7Ufzi/aHKL7dRUp7IQME3JQ1h2BkU/BaPLhEykKbS/BByKYYw+wliYRL5PGBpo5fnwkox30y
	NZT+LN2ZeA9/pa6g9CeAO/1jFilB47upQrd5ZZSAmThv5NiT9dm0NL+pq+6Lx7agubjMLEuSGwrok
	WtdFqD/t7mZjxlx6gSPEp2G3DkOYbjCTLKMi/n42+B3varoqBm5FkqW36fPKfrqHCXKrA87K0jaHg
	Lz+6AKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHt2-007sOo-0G; Tue, 10 Jan 2023 16:54:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHso-007sM8-EM; Tue, 10 Jan 2023 16:53:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6C22ACE1876;
	Tue, 10 Jan 2023 16:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B11C433F1;
	Tue, 10 Jan 2023 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673369629;
	bh=SollqPHgY5I7lTwviKqNUa8+yrbzo1QLNEo3j1yUsrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pcx4YAWaJufTQxXy4GmIV8Y1noj4cbwA15h92+yCwAy6+iAD1g4NCRKi+Pc/MhOrA
	 9fZmAqK66hDCjjocSouT92wlgPUXT2FnN45SDl130vtR53DfSKC1oQEkT0Lx7E1SL1
	 ltLqOXveg2pUrYZePevnJZCfBbzXF9kpl0BYd47uoGh72YpWX86DYd0ZURIMAlMzGC
	 V8yVDpk/rzieN+Y7QR7ojyEB6u6BY/t2e41t2iEnUI/PFt4CbIk+sm+jdpd1KO99+1
	 TA1i1vL7vlBrlVJ3Bpm+HFBdpWcpCrAlBH+y7CN7NvNMBTM8gXCBdNIY7wXWVZeel0
	 OazQiUHiDX+Dw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chunxu Li <chunxu.li@mediatek.com>,
 Dan Carpenter <error27@gmail.com>, YC Hung <yc.hung@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20221222072150.10627-1-tinghan.shen@mediatek.com>
References: <20221222072150.10627-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v1 0/3] Add support of MediaTek mt8188 to SOF
Message-Id: <167336962456.1940041.13852570954333682480.b4-ty@kernel.org>
Date: Tue, 10 Jan 2023 16:53:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_085354_906366_1E16DAAF 
X-CRM114-Status: GOOD (  15.42  )
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

On Thu, 22 Dec 2022 15:21:47 +0800, Tinghan Shen wrote:
> Add support of MediaTek mt8188 SoC DSP to SOF.
> The sof driver patches in this series are taken from
> thesofproject/linux/tree/topic/sof-dev-rebase.
> 
> Tinghan Shen (3):
>   dt-bindings: dsp: mediatek: Add mt8188 dsp compatible
>   ASoC: SOF: mediatek: Support mt8188 platform
>   ASoC: SOF: mediatek: Provide debugfs_add_region_item ops for core
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: dsp: mediatek: Add mt8188 dsp compatible
      commit: e15ec6892832d586069ce575c222366b94ad6a5e
[2/3] ASoC: SOF: mediatek: Support mt8188 platform
      commit: 6b43538f0698695fba9aa0c0b29a80c555cf1b63
[3/3] ASoC: SOF: mediatek: Provide debugfs_add_region_item ops for core
      commit: 6fa8c0732bff8e0ab794736837b25dc7ac38cd54

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

