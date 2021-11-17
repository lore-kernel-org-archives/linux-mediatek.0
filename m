Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A0EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 22:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8987D61B5F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 22:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8987D61B5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDczDaiHVADvrumkQLd6L2lUe9sWBT9kBnzHnpOz+qE=; b=WDTKoUh6Np9g3m
	9IJLG4IdnRbJKyDuRDf5Jq+fAQfZxBdPMXiQ9POM7HHveG92ywZD6q2/Ai5uRnLf6znj0/JA1NVpO
	UoJXSVx99NFpZjowAJ2tjkzTOPwrYaCR7CnPF1mDzdutYkY0reZ6CMhxzYjGTh7yuTr+meupcP2o8
	2m4VCB9VFFxuhn7A7/Y4lULAV0t9XmntbOiu/JgbyzLcVab09Me+bb4n2sABO4Mh9H8Mzu/hkndYS
	QE1x81mhm31HvMU5BG3F8+Nca8aIYizSdl/Q6SCZdaxhmKspcAUtu+GVWWDgv4FzCC8L4z9XVcdEV
	z+IvqQRl3sSrwnYWfxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnTWc-006Tf4-Kn; Wed, 17 Nov 2021 22:35:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnTSm-006SpO-MB
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 22:31:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FC9C61B5F;
 Wed, 17 Nov 2021 22:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188291;
 bh=0EBn4iFas/lVt0Plr8qx6oSNvIZ4IcS+xI8hMFa4Mu8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=i93whKvlivBz1M3F37Lm2fKtFcC/L3usl/3SoZR5qIISZp0IZLXlSVwKP5U69V7vt
 9Fnrim3Io2Ri3J8PgEAaGY+kz1egw3swHcvZ29vzLK39OrA6mMvEPUS+8M2/aoU5KD
 SbQD1kCbxMJ75FxITmFrng+GoxCslLNJmKooNzN65+xIIetVPA8bIh3jCGZbX9MKfV
 Sc0Oa3PLP0Fb112VxoTS+vNhhhq0MPTlsSR8bSKme7h+XLMyk1LcN7mXngoLaWeAXb
 FHOktjxeBs162nyB1EqA0UvMnm7v9WD3NUDqn69c/bZV2r7Ewla0ZJE+TJlHkmLl+T
 rnzIbUfAiwtgA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 daniel.baluta@gmail.com, lgirdwood@gmail.com, yc.hung@mediatek.com,
 AjitKumar.Pandey@amd.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, Balakishore.pati@amd.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, Julian.Schroeder@amd.com
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 00/21] ASoC: SOF: Platform updates for AMD and Mediatek
Message-Id: <163718828906.136850.1487051712790530066.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:29 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_143132_809410_D235B80A 
X-CRM114-Status: GOOD (  14.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 17 Nov 2021 11:37:13 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> This patchseries adds Renoir ACP HW support and Mediatek MT8195
> platform.
> 
> Notes:
> - I first send the meditatek support in a previous emails but it failed
>   to apply because there are some dependencies on AMD patches related to
>   DAI ids.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/21] ASoC: SOF: amd: Add Renoir ACP HW support
        commit: 846aef1d7cc05651e27c17c3b4e2b5ce5cdec97b
[02/21] ASoC: SOF: amd: Add helper callbacks for ACP's DMA configuration
        commit: 0e44572a28a49109eae23af1545c658b86c4bf00
[03/21] ASoC: SOF: amd: Add fw loader and renoir dsp ops to load firmware
        commit: 7e51a9e38ab204eba2844b8773486392d7444435
[04/21] ASoC: SOF: amd: Add IPC support for ACP IP block
        commit: 738a2b5e2cc9fd63d48faac11c8d60a5a2313a9d
[05/21] ASoC: SOF: amd: Add dai driver dsp ops callback for Renoir
        commit: bda93076d184ad80a8cab09bf29ace7692de18f7
[06/21] ASoC: SOF: amd: Add PCM stream callback for Renoir dai's
        commit: e8afccf8fb75bae9c3292a0e51593af92839415e
[07/21] ASoC: amd: Add module to determine ACP configuration
        commit: f1bdd8d385a803565024c8feeedc17bf86aac4f5
[08/21] ASoC: SOF: amd: Add machine driver dsp ops for Renoir platform
        commit: 11ddd4e371810017faf7ff7cb2349f321e50d1d3
[09/21] ASoC: SOF: amd: Add Renoir PCI driver interface
        commit: ec25a3b14261fcb05568a1fec15ca68152e9d208
[10/21] ASoC: amd: acp-config: Remove legacy acpi based machine struct
        commit: 63fba90fc88b6cee9f8bead761a419169ecda6cc
[11/21] ASoC: SOF: topology: Add support for AMD ACP DAIs
        commit: efb931cdc4b94a0f7ed17a76844f08cef1bdffe5
[12/21] ASoC: SOF: amd: Add trace logger support
        commit: 4627421fb883928af5220c66a304bed1f9b77e8d
[13/21] ASoC: SOF: amd: Add support for SOF firmware authentication
        commit: f063eba3e7a6aeec8e2abb00469e70c51432453b
[14/21] ASoC: SOF: mediatek: Add mt8195 hardware support
        (no commit info)
[15/21] ASoC: SOF: tokens: add token for Mediatek AFE
        (no commit info)
[16/21] ASoC: SOF: topology: Add support for Mediatek AFE DAI
        (no commit info)
[17/21] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware
        (no commit info)
[18/21] ASoC: SOF: Add mt8195 device descriptor
        (no commit info)
[19/21] ASoC: SOF: mediatek: Add dai driver dsp ops callback for mt8195
        (no commit info)
[20/21] ASoC: SOF: mediatek: Add mt8195 dsp clock support
        (no commit info)
[21/21] ASoC: SOF: mediatek: Add DSP system PM callback for mt8195
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
