Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F97C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1WoXll1oXrslYI1Yn5mwpAY+zNYeA1ArYFtm8lqmcs=; b=AGuwGgsPCq8Hle1Xz4wYCbpnrN
	Lx1vTh5htJTi3IK4vwKky0rm+7s+BIUuE2FTUtDmx/BwDAPrphxfn8EIuMTKkE2RdtkGm61bvPZed
	weETlojXboro5gybvV6M/KtKjLea2UHNpeZXByD4BPLRZaU0M6T0vwJ0GqHGa7+Lo1vfYvt+obj44
	dTxCKyxhbA5I/nAM4zosyL9uj2kaz4hQAsvzx8GrFDW8oKfw8+WqO6nP5SpaTH7NmngdphwNpd4ZO
	ofZPa6q5n9qOMOwv69dgFPvhZ7RpfTXhpFeu7+KiNmtA/bGZavRl/RceQxksrSQGTnvmnQd+QfV0F
	du1E8uaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHtB-007sRx-1y; Tue, 10 Jan 2023 16:54:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHsq-007sMh-5h; Tue, 10 Jan 2023 16:53:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AECFE614F3;
	Tue, 10 Jan 2023 16:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB35C433D2;
	Tue, 10 Jan 2023 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673369635;
	bh=8bYl3EkgXZRUNK57wCietLLP/Pf13l89ULpfbcWOHK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gBiuoUKO6JWztiz5PI24eupTdl7muvcNZ3jI5I9CvnpdFIAQDT8S+a6MtCnBc3Ung
	 pA0Dgx/N+lA/9VnhCWbCCcHG1z+klgeLBfaTHZWWSQHzHZ7UOKL6uVimN+VpF4Sxih
	 Zb3qXdFOL7Ns7AqDIbdcQkhtZCo6W1OvvmgmrdAT7CZlA/WjVqbinrq5kwy63i37Pe
	 JmP9Wg8YRgx1uFVx42IlO0VOCD9i6wC+Tdf95H8OFFVpxlM8cKtZGzYdjTy4nYxw4c
	 tQH8AZUILD3s3QhalfwdMLW9iVI0mma8o3K3VdzMD8UdEDJTXSAaebjLKCYVn6vADk
	 ZKqmaxgw9LVBg==
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
 Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>,
 YC Hung <yc.hung@mediatek.com>, Wan Jiabing <wanjiabing@vivo.com>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20230110084312.12953-1-tinghan.shen@mediatek.com>
References: <20230110084312.12953-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2 0/3] Add support of MediaTek mt8188 to SOF
Message-Id: <167336962989.1940041.17948802979012631387.b4-ty@kernel.org>
Date: Tue, 10 Jan 2023 16:53:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_085356_317477_7E492E29 
X-CRM114-Status: GOOD (  15.87  )
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

On Tue, 10 Jan 2023 16:43:09 +0800, Tinghan Shen wrote:
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

